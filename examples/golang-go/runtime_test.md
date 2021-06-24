# Package runtime_test

## Index

* [Constants](#const)
    * [const InfCallstackSource](#InfCallstackSource)
    * [const N](#N)
    * [const autotmpTypeSource](#autotmpTypeSource)
    * [const backtraceSource](#backtraceSource)
    * [const constsSource](#constsSource)
    * [const expectedLldbOutput](#expectedLldbOutput)
    * [const hashSize](#hashSize)
    * [const helloSource](#helloSource)
    * [const intSize](#intSize)
    * [const lldbHelloSource](#lldbHelloSource)
    * [const lldbScriptSource](#lldbScriptSource)
    * [const objsize](#objsize)
    * [const panicSource](#panicSource)
    * [const size](#size)
    * [const sizeNoStack](#sizeNoStack)
    * [const typePointer](#typePointer)
    * [const typeScalar](#typeScalar)
* [Variables](#var)
    * [var BoolSink](#BoolSink)
    * [var Foo1](#Foo1)
    * [var Foo2](#Foo2)
    * [var One](#One)
    * [var SinkIntPointerSlice](#SinkIntPointerSlice)
    * [var SinkIntSlice](#SinkIntSlice)
    * [var a](#a)
    * [var alwaysFalse](#alwaysFalse)
    * [var arenaCollisionSink](#arenaCollisionSink)
    * [var arrayLit](#arrayLit)
    * [var atoi32tests](#atoi32tests)
    * [var atoi64tests](#atoi64tests)
    * [var blackhole](#blackhole)
    * [var bssBigStruct](#bssBigStruct)
    * [var bssEface](#bssEface)
    * [var bssIface](#bssIface)
    * [var bssPtr](#bssPtr)
    * [var bssPtrScalar](#bssPtrScalar)
    * [var bssScalarPtr](#bssScalarPtr)
    * [var bssSlice](#bssSlice)
    * [var bssString](#bssString)
    * [var bufSizes](#bufSizes)
    * [var bufSizesOverlap](#bufSizesOverlap)
    * [var compLit](#compLit)
    * [var concurrentMapTest](#concurrentMapTest)
    * [var dataBigStruct](#dataBigStruct)
    * [var dataEface](#dataEface)
    * [var dataIface](#dataIface)
    * [var dataPtr](#dataPtr)
    * [var dataPtrScalar](#dataPtrScalar)
    * [var dataScalarPtr](#dataScalarPtr)
    * [var dataSlice](#dataSlice)
    * [var dataString](#dataString)
    * [var dummy](#dummy)
    * [var dummyTimeHistogram](#dummyTimeHistogram)
    * [var e](#e)
    * [var e_](#e_)
    * [var efaceCmp1](#efaceCmp1)
    * [var efaceCmp2](#efaceCmp2)
    * [var eight8](#eight8)
    * [var eight8I](#eight8I)
    * [var errf](#errf)
    * [var escapeMe](#escapeMe)
    * [var escapeString](#escapeString)
    * [var faultAddrs](#faultAddrs)
    * [var firstLine](#firstLine)
    * [var flagQuick](#flagQuick)
    * [var gcinfoSink](#gcinfoSink)
    * [var glob](#glob)
    * [var global](#global)
    * [var globint1](#globint1)
    * [var globint2](#globint2)
    * [var globint3](#globint3)
    * [var globstruct](#globstruct)
    * [var hintGreaterThan8](#hintGreaterThan8)
    * [var hintLessThan8](#hintLessThan8)
    * [var hugeSink](#hugeSink)
    * [var i1](#i1)
    * [var i2](#i2)
    * [var infoEface](#infoEface)
    * [var infoIface](#infoIface)
    * [var infoPtr](#infoPtr)
    * [var infoPtr10](#infoPtr10)
    * [var infoPtrScalar](#infoPtrScalar)
    * [var infoScalarPtr](#infoScalarPtr)
    * [var infoScalarPtr4](#infoScalarPtr4)
    * [var infoSlice](#infoSlice)
    * [var infoString](#infoString)
    * [var intLit](#intLit)
    * [var l38](#l38)
    * [var l39](#l39)
    * [var l40](#l40)
    * [var lineVar1](#lineVar1)
    * [var lineVar2a](#lineVar2a)
    * [var lineVar2b](#lineVar2b)
    * [var list](#list)
    * [var lldbPath](#lldbPath)
    * [var mallocSink](#mallocSink)
    * [var mapBucketTests](#mapBucketTests)
    * [var mapLit](#mapLit)
    * [var mapSink](#mapSink)
    * [var n](#n)
    * [var nerr](#nerr)
    * [var nzbig](#nzbig)
    * [var nzslice](#nzslice)
    * [var nzstr](#nzstr)
    * [var ok](#ok)
    * [var one16](#one16)
    * [var one32](#one32)
    * [var one64](#one64)
    * [var padData](#padData)
    * [var pointerClassData](#pointerClassData)
    * [var pointerClassSink](#pointerClassSink)
    * [var preempt](#preempt)
    * [var result](#result)
    * [var s](#s)
    * [var s1Ptr](#s1Ptr)
    * [var s2Ptr](#s2Ptr)
    * [var s3Ptr](#s3Ptr)
    * [var s4Ptr](#s4Ptr)
    * [var sByte](#sByte)
    * [var saveInt](#saveInt)
    * [var sigquit](#sigquit)
    * [var sink](#sink)
    * [var sink32](#sink32)
    * [var sinkAppend](#sinkAppend)
    * [var sinkInt](#sinkInt)
    * [var sliceLit](#sliceLit)
    * [var ss](#ss)
    * [var ssglobal](#ssglobal)
    * [var stop](#stop)
    * [var stress](#stress)
    * [var stringdata](#stringdata)
    * [var sysNanosleep](#sysNanosleep)
    * [var testMemStatsCount](#testMemStatsCount)
    * [var testNonEscapingMapVariable](#testNonEscapingMapVariable)
    * [var testTracebackArgsBuf](#testTracebackArgsBuf)
    * [var testprog](#testprog)
    * [var thousand16](#thousand16)
    * [var thousand32](#thousand32)
    * [var thousand64](#thousand64)
    * [var tinyByteSink](#tinyByteSink)
    * [var tinyObj12Sink](#tinyObj12Sink)
    * [var tinyUint32Sink](#tinyUint32Sink)
    * [var tl](#tl)
    * [var tm](#tm)
    * [var toRemove](#toRemove)
    * [var ts](#ts)
    * [var wg](#wg)
    * [var workSink](#workSink)
    * [var x](#x)
    * [var xsglobal](#xsglobal)
    * [var yes](#yes)
    * [var zero16](#zero16)
    * [var zero16I](#zero16I)
    * [var zero32](#zero32)
    * [var zero32I](#zero32I)
    * [var zero64](#zero64)
    * [var zero64I](#zero64I)
    * [var zerobig](#zerobig)
    * [var zeroslice](#zeroslice)
    * [var zerosliceI](#zerosliceI)
    * [var zerostr](#zerostr)
    * [var zerostrI](#zerostrI)
* [Types](#type)
    * [type BigKey [3]int64](#BigKey)
    * [type BigStruct struct](#BigStruct)
    * [type BigVal [3]int64](#BigVal)
    * [type BytesKey struct](#BytesKey)
        * [func (k *BytesKey) bits() int](#BytesKey.bits)
        * [func (k *BytesKey) clear()](#BytesKey.clear)
        * [func (k *BytesKey) flipBit(i int)](#BytesKey.flipBit)
        * [func (k *BytesKey) hash() uintptr](#BytesKey.hash)
        * [func (k *BytesKey) name() string](#BytesKey.name)
        * [func (k *BytesKey) random(r *rand.Rand)](#BytesKey.random)
    * [type ComplexAlgKey struct](#ComplexAlgKey)
    * [type EfaceKey struct](#EfaceKey)
        * [func (k *EfaceKey) bits() int](#EfaceKey.bits)
        * [func (k *EfaceKey) clear()](#EfaceKey.clear)
        * [func (k *EfaceKey) flipBit(i int)](#EfaceKey.flipBit)
        * [func (k *EfaceKey) hash() uintptr](#EfaceKey.hash)
        * [func (k *EfaceKey) name() string](#EfaceKey.name)
        * [func (k *EfaceKey) random(r *rand.Rand)](#EfaceKey.random)
    * [type FloatInt struct](#FloatInt)
    * [type HashSet struct](#HashSet)
        * [func newHashSet() *HashSet](#newHashSet)
        * [func (s *HashSet) add(h uintptr)](#HashSet.add)
        * [func (s *HashSet) addB(x []byte)](#HashSet.addB)
        * [func (s *HashSet) addS(x string)](#HashSet.addS)
        * [func (s *HashSet) addS_seed(x string, seed uintptr)](#HashSet.addS_seed)
        * [func (s *HashSet) check(t *testing.T)](#HashSet.check)
    * [type I interface](#I)
    * [type I1 interface](#I1)
    * [type I2 interface](#I2)
    * [type Iface interface](#Iface)
    * [type IfaceImpl int](#IfaceImpl)
        * [func (IfaceImpl) f()](#IfaceImpl.f)
    * [type IfaceKey struct](#IfaceKey)
        * [func (k *IfaceKey) bits() int](#IfaceKey.bits)
        * [func (k *IfaceKey) clear()](#IfaceKey.clear)
        * [func (k *IfaceKey) flipBit(i int)](#IfaceKey.flipBit)
        * [func (k *IfaceKey) hash() uintptr](#IfaceKey.hash)
        * [func (k *IfaceKey) name() string](#IfaceKey.name)
        * [func (k *IfaceKey) random(r *rand.Rand)](#IfaceKey.random)
    * [type Int32Key struct](#Int32Key)
        * [func (k *Int32Key) bits() int](#Int32Key.bits)
        * [func (k *Int32Key) clear()](#Int32Key.clear)
        * [func (k *Int32Key) flipBit(i int)](#Int32Key.flipBit)
        * [func (k *Int32Key) hash() uintptr](#Int32Key.hash)
        * [func (k *Int32Key) name() string](#Int32Key.name)
        * [func (k *Int32Key) random(r *rand.Rand)](#Int32Key.random)
    * [type Int64Key struct](#Int64Key)
        * [func (k *Int64Key) bits() int](#Int64Key.bits)
        * [func (k *Int64Key) clear()](#Int64Key.clear)
        * [func (k *Int64Key) flipBit(i int)](#Int64Key.flipBit)
        * [func (k *Int64Key) hash() uintptr](#Int64Key.hash)
        * [func (k *Int64Key) name() string](#Int64Key.name)
        * [func (k *Int64Key) random(r *rand.Rand)](#Int64Key.random)
    * [type Key interface](#Key)
    * [type LargeStruct struct](#LargeStruct)
    * [type Matrix [][]float64](#Matrix)
        * [func makeMatrix(n int) Matrix](#makeMatrix)
    * [type MyNode struct](#MyNode)
        * [func toMyNode(node *LFNode) *MyNode](#toMyNode)
    * [type Node1 struct](#Node1)
    * [type Node1024 struct](#Node1024)
    * [type Node124 struct](#Node124)
    * [type Node126 struct](#Node126)
    * [type Node128 struct](#Node128)
    * [type Node130 struct](#Node130)
    * [type Node64 struct](#Node64)
    * [type Node64Dead struct](#Node64Dead)
    * [type Node8 struct](#Node8)
    * [type Object1 struct](#Object1)
    * [type Object2 struct](#Object2)
    * [type Ptr struct](#Ptr)
    * [type PtrScalar struct](#PtrScalar)
    * [type ScalarPtr struct](#ScalarPtr)
    * [type T16 uint16](#T16)
        * [func (T16) Method1()](#T16.Method1)
    * [type T32 uint32](#T32)
        * [func (T32) Method1()](#T32.Method1)
    * [type T64 uint64](#T64)
        * [func (T64) Method1()](#T64.Method1)
    * [type T8 uint8](#T8)
        * [func (T8) Method1()](#T8.Method1)
    * [type TL [2]uintptr](#TL)
        * [func (TL) Method1()](#TL.Method1)
        * [func (TL) Method2()](#TL.Method2)
    * [type TM uintptr](#TM)
        * [func (TM) Method1()](#TM.Method1)
        * [func (TM) Method2()](#TM.Method2)
    * [type TS uint16](#TS)
        * [func (TS) Method1()](#TS.Method1)
        * [func (TS) Method2()](#TS.Method2)
    * [type Tint int](#Tint)
        * [func (t *Tint) m()](#Tint.m)
    * [type Tinter interface](#Tinter)
    * [type Tintptr *int](#Tintptr)
    * [type Tslice []byte](#Tslice)
        * [func (Tslice) Method1()](#Tslice.Method1)
    * [type Tstr string](#Tstr)
        * [func (Tstr) Method1()](#Tstr.Method1)
    * [type acLink struct](#acLink)
    * [type atoi32Test struct](#atoi32Test)
    * [type atoi64Test struct](#atoi64Test)
    * [type bigBuf [4096]byte](#bigBuf)
    * [type bigStruct struct](#bigStruct)
    * [type bigValue struct](#bigValue)
    * [type buildexe struct](#buildexe)
    * [type canString int](#canString)
        * [func (c canString) String() string](#canString.String)
    * [type chunk [17]byte](#chunk)
    * [type containsBigStruct struct](#containsBigStruct)
        * [func sideeffect2(in containsBigStruct) containsBigStruct](#sideeffect2)
    * [type empty struct{}](#empty)
    * [type fInter uint64](#fInter)
        * [func (x fInter) F()](#fInter.F)
    * [type fakeTimeFrame struct](#fakeTimeFrame)
    * [type foo struct{}](#foo)
        * [func (f *foo) method1()](#foo.method1)
        * [func (f *foo) method2()](#foo.method2)
    * [type myError struct{}](#myError)
        * [func (myError) Error() string](#myError.Error)
    * [type nonSSAable [128]byte](#nonSSAable)
        * [func mknonSSAable() nonSSAable](#mknonSSAable)
    * [type obj12 struct](#obj12)
    * [type objtype [320]byte](#objtype)
        * [func adjStringChunk() (string, *objtype)](#adjStringChunk)
    * [type point struct](#point)
        * [func (p *point) negate()](#point.negate)
    * [type response struct{}](#response)
        * [func doRequest(useSelect bool) (*response, error)](#doRequest)
    * [type struct0 struct{}](#struct0)
    * [type struct24 struct](#struct24)
    * [type struct32 struct](#struct32)
    * [type struct40 struct](#struct40)
    * [type structWithMethod struct{}](#structWithMethod)
        * [func (s structWithMethod) caller() string](#structWithMethod.caller)
        * [func (s structWithMethod) callers() []uintptr](#structWithMethod.callers)
        * [func (s structWithMethod) nop()](#structWithMethod.nop)
        * [func (s structWithMethod) stack() string](#structWithMethod.stack)
    * [type xtreeNode struct](#xtreeNode)
        * [func makeTree(d int) *xtreeNode](#makeTree)
* [Functions](#func)
    * [func BenchmarkAlignedLoad(b *testing.B)](#BenchmarkAlignedLoad)
    * [func BenchmarkAllocation(b *testing.B)](#BenchmarkAllocation)
    * [func BenchmarkAppend(b *testing.B)](#BenchmarkAppend)
    * [func BenchmarkAppendGrowByte(b *testing.B)](#BenchmarkAppendGrowByte)
    * [func BenchmarkAppendGrowString(b *testing.B)](#BenchmarkAppendGrowString)
    * [func BenchmarkAppendInPlace(b *testing.B)](#BenchmarkAppendInPlace)
    * [func BenchmarkAppendSlice(b *testing.B)](#BenchmarkAppendSlice)
    * [func BenchmarkAppendSliceLarge(b *testing.B)](#BenchmarkAppendSliceLarge)
    * [func BenchmarkAppendSpecialCase(b *testing.B)](#BenchmarkAppendSpecialCase)
    * [func BenchmarkAppendStr(b *testing.B)](#BenchmarkAppendStr)
    * [func BenchmarkArrayEqual(b *testing.B)](#BenchmarkArrayEqual)
    * [func BenchmarkAssertE2E(b *testing.B)](#BenchmarkAssertE2E)
    * [func BenchmarkAssertE2E2(b *testing.B)](#BenchmarkAssertE2E2)
    * [func BenchmarkAssertE2E2Blank(b *testing.B)](#BenchmarkAssertE2E2Blank)
    * [func BenchmarkAssertE2I(b *testing.B)](#BenchmarkAssertE2I)
    * [func BenchmarkAssertE2T(b *testing.B)](#BenchmarkAssertE2T)
    * [func BenchmarkAssertE2T2(b *testing.B)](#BenchmarkAssertE2T2)
    * [func BenchmarkAssertE2T2Blank(b *testing.B)](#BenchmarkAssertE2T2Blank)
    * [func BenchmarkAssertE2TLarge(b *testing.B)](#BenchmarkAssertE2TLarge)
    * [func BenchmarkAssertI2E(b *testing.B)](#BenchmarkAssertI2E)
    * [func BenchmarkAssertI2E2(b *testing.B)](#BenchmarkAssertI2E2)
    * [func BenchmarkAssertI2E2Blank(b *testing.B)](#BenchmarkAssertI2E2Blank)
    * [func BenchmarkAssertI2I(b *testing.B)](#BenchmarkAssertI2I)
    * [func BenchmarkAssertI2T(b *testing.B)](#BenchmarkAssertI2T)
    * [func BenchmarkBigKeyMap(b *testing.B)](#BenchmarkBigKeyMap)
    * [func BenchmarkBigValMap(b *testing.B)](#BenchmarkBigValMap)
    * [func BenchmarkBulkWriteBarrier(b *testing.B)](#BenchmarkBulkWriteBarrier)
    * [func BenchmarkCallClosure(b *testing.B)](#BenchmarkCallClosure)
    * [func BenchmarkCallClosure1(b *testing.B)](#BenchmarkCallClosure1)
    * [func BenchmarkCallClosure2(b *testing.B)](#BenchmarkCallClosure2)
    * [func BenchmarkCallClosure3(b *testing.B)](#BenchmarkCallClosure3)
    * [func BenchmarkCallClosure4(b *testing.B)](#BenchmarkCallClosure4)
    * [func BenchmarkChanClosed(b *testing.B)](#BenchmarkChanClosed)
    * [func BenchmarkChanContended(b *testing.B)](#BenchmarkChanContended)
    * [func BenchmarkChanCreation(b *testing.B)](#BenchmarkChanCreation)
    * [func BenchmarkChanNonblocking(b *testing.B)](#BenchmarkChanNonblocking)
    * [func BenchmarkChanPopular(b *testing.B)](#BenchmarkChanPopular)
    * [func BenchmarkChanProdCons0(b *testing.B)](#BenchmarkChanProdCons0)
    * [func BenchmarkChanProdCons10(b *testing.B)](#BenchmarkChanProdCons10)
    * [func BenchmarkChanProdCons100(b *testing.B)](#BenchmarkChanProdCons100)
    * [func BenchmarkChanProdConsWork0(b *testing.B)](#BenchmarkChanProdConsWork0)
    * [func BenchmarkChanProdConsWork10(b *testing.B)](#BenchmarkChanProdConsWork10)
    * [func BenchmarkChanProdConsWork100(b *testing.B)](#BenchmarkChanProdConsWork100)
    * [func BenchmarkChanSem(b *testing.B)](#BenchmarkChanSem)
    * [func BenchmarkChanSync(b *testing.B)](#BenchmarkChanSync)
    * [func BenchmarkChanSyncWork(b *testing.B)](#BenchmarkChanSyncWork)
    * [func BenchmarkChanUncontended(b *testing.B)](#BenchmarkChanUncontended)
    * [func BenchmarkClearFat1024(b *testing.B)](#BenchmarkClearFat1024)
    * [func BenchmarkClearFat12(b *testing.B)](#BenchmarkClearFat12)
    * [func BenchmarkClearFat128(b *testing.B)](#BenchmarkClearFat128)
    * [func BenchmarkClearFat16(b *testing.B)](#BenchmarkClearFat16)
    * [func BenchmarkClearFat24(b *testing.B)](#BenchmarkClearFat24)
    * [func BenchmarkClearFat256(b *testing.B)](#BenchmarkClearFat256)
    * [func BenchmarkClearFat32(b *testing.B)](#BenchmarkClearFat32)
    * [func BenchmarkClearFat40(b *testing.B)](#BenchmarkClearFat40)
    * [func BenchmarkClearFat48(b *testing.B)](#BenchmarkClearFat48)
    * [func BenchmarkClearFat512(b *testing.B)](#BenchmarkClearFat512)
    * [func BenchmarkClearFat56(b *testing.B)](#BenchmarkClearFat56)
    * [func BenchmarkClearFat64(b *testing.B)](#BenchmarkClearFat64)
    * [func BenchmarkClearFat8(b *testing.B)](#BenchmarkClearFat8)
    * [func BenchmarkClosureCall(b *testing.B)](#BenchmarkClosureCall)
    * [func BenchmarkCompareStringBig(b *testing.B)](#BenchmarkCompareStringBig)
    * [func BenchmarkCompareStringBigUnaligned(b *testing.B)](#BenchmarkCompareStringBigUnaligned)
    * [func BenchmarkCompareStringDifferentLength(b *testing.B)](#BenchmarkCompareStringDifferentLength)
    * [func BenchmarkCompareStringEqual(b *testing.B)](#BenchmarkCompareStringEqual)
    * [func BenchmarkCompareStringIdentical(b *testing.B)](#BenchmarkCompareStringIdentical)
    * [func BenchmarkCompareStringSameLength(b *testing.B)](#BenchmarkCompareStringSameLength)
    * [func BenchmarkComplex128DivDisInf(b *testing.B)](#BenchmarkComplex128DivDisInf)
    * [func BenchmarkComplex128DivDisNaN(b *testing.B)](#BenchmarkComplex128DivDisNaN)
    * [func BenchmarkComplex128DivNisInf(b *testing.B)](#BenchmarkComplex128DivNisInf)
    * [func BenchmarkComplex128DivNisNaN(b *testing.B)](#BenchmarkComplex128DivNisNaN)
    * [func BenchmarkComplex128DivNormal(b *testing.B)](#BenchmarkComplex128DivNormal)
    * [func BenchmarkComplexAlgMap(b *testing.B)](#BenchmarkComplexAlgMap)
    * [func BenchmarkConcatStringAndBytes(b *testing.B)](#BenchmarkConcatStringAndBytes)
    * [func BenchmarkConvI2E(b *testing.B)](#BenchmarkConvI2E)
    * [func BenchmarkConvI2I(b *testing.B)](#BenchmarkConvI2I)
    * [func BenchmarkConvT2EByteSized(b *testing.B)](#BenchmarkConvT2EByteSized)
    * [func BenchmarkConvT2ELarge(b *testing.B)](#BenchmarkConvT2ELarge)
    * [func BenchmarkConvT2ESmall(b *testing.B)](#BenchmarkConvT2ESmall)
    * [func BenchmarkConvT2EUintptr(b *testing.B)](#BenchmarkConvT2EUintptr)
    * [func BenchmarkConvT2Ezero(b *testing.B)](#BenchmarkConvT2Ezero)
    * [func BenchmarkConvT2ILarge(b *testing.B)](#BenchmarkConvT2ILarge)
    * [func BenchmarkConvT2ISmall(b *testing.B)](#BenchmarkConvT2ISmall)
    * [func BenchmarkConvT2IUintptr(b *testing.B)](#BenchmarkConvT2IUintptr)
    * [func BenchmarkCopy(b *testing.B)](#BenchmarkCopy)
    * [func BenchmarkCopyFat1024(b *testing.B)](#BenchmarkCopyFat1024)
    * [func BenchmarkCopyFat12(b *testing.B)](#BenchmarkCopyFat12)
    * [func BenchmarkCopyFat128(b *testing.B)](#BenchmarkCopyFat128)
    * [func BenchmarkCopyFat16(b *testing.B)](#BenchmarkCopyFat16)
    * [func BenchmarkCopyFat24(b *testing.B)](#BenchmarkCopyFat24)
    * [func BenchmarkCopyFat256(b *testing.B)](#BenchmarkCopyFat256)
    * [func BenchmarkCopyFat32(b *testing.B)](#BenchmarkCopyFat32)
    * [func BenchmarkCopyFat512(b *testing.B)](#BenchmarkCopyFat512)
    * [func BenchmarkCopyFat520(b *testing.B)](#BenchmarkCopyFat520)
    * [func BenchmarkCopyFat64(b *testing.B)](#BenchmarkCopyFat64)
    * [func BenchmarkCopyFat8(b *testing.B)](#BenchmarkCopyFat8)
    * [func BenchmarkCreateGoroutines(b *testing.B)](#BenchmarkCreateGoroutines)
    * [func BenchmarkCreateGoroutinesCapture(b *testing.B)](#BenchmarkCreateGoroutinesCapture)
    * [func BenchmarkCreateGoroutinesParallel(b *testing.B)](#BenchmarkCreateGoroutinesParallel)
    * [func BenchmarkCreateGoroutinesSingle(b *testing.B)](#BenchmarkCreateGoroutinesSingle)
    * [func BenchmarkDefer(b *testing.B)](#BenchmarkDefer)
    * [func BenchmarkDefer10(b *testing.B)](#BenchmarkDefer10)
    * [func BenchmarkDeferMany(b *testing.B)](#BenchmarkDeferMany)
    * [func BenchmarkEfaceCmpDiff(b *testing.B)](#BenchmarkEfaceCmpDiff)
    * [func BenchmarkEfaceCmpDiffIndirect(b *testing.B)](#BenchmarkEfaceCmpDiffIndirect)
    * [func BenchmarkEqEfaceConcrete(b *testing.B)](#BenchmarkEqEfaceConcrete)
    * [func BenchmarkEqIfaceConcrete(b *testing.B)](#BenchmarkEqIfaceConcrete)
    * [func BenchmarkExtendSlice(b *testing.B)](#BenchmarkExtendSlice)
    * [func BenchmarkFastrand(b *testing.B)](#BenchmarkFastrand)
    * [func BenchmarkFastrandHashiter(b *testing.B)](#BenchmarkFastrandHashiter)
    * [func BenchmarkFastrandn(b *testing.B)](#BenchmarkFastrandn)
    * [func BenchmarkFinalizer(b *testing.B)](#BenchmarkFinalizer)
    * [func BenchmarkFinalizerRun(b *testing.B)](#BenchmarkFinalizerRun)
    * [func BenchmarkFindBitRange64(b *testing.B)](#BenchmarkFindBitRange64)
    * [func BenchmarkGoMapClear(b *testing.B)](#BenchmarkGoMapClear)
    * [func BenchmarkGoMemclr(b *testing.B)](#BenchmarkGoMemclr)
    * [func BenchmarkGoroutineBlocking(b *testing.B)](#BenchmarkGoroutineBlocking)
    * [func BenchmarkGoroutineForRange(b *testing.B)](#BenchmarkGoroutineForRange)
    * [func BenchmarkGoroutineIdle(b *testing.B)](#BenchmarkGoroutineIdle)
    * [func BenchmarkGoroutineSelect(b *testing.B)](#BenchmarkGoroutineSelect)
    * [func BenchmarkGrowSlice(b *testing.B)](#BenchmarkGrowSlice)
    * [func BenchmarkHash1024(b *testing.B)](#BenchmarkHash1024)
    * [func BenchmarkHash16(b *testing.B)](#BenchmarkHash16)
    * [func BenchmarkHash5(b *testing.B)](#BenchmarkHash5)
    * [func BenchmarkHash64(b *testing.B)](#BenchmarkHash64)
    * [func BenchmarkHash65536(b *testing.B)](#BenchmarkHash65536)
    * [func BenchmarkHashBytesSpeed(b *testing.B)](#BenchmarkHashBytesSpeed)
    * [func BenchmarkHashInt32Speed(b *testing.B)](#BenchmarkHashInt32Speed)
    * [func BenchmarkHashInt64Speed(b *testing.B)](#BenchmarkHashInt64Speed)
    * [func BenchmarkHashStringArraySpeed(b *testing.B)](#BenchmarkHashStringArraySpeed)
    * [func BenchmarkHashStringSpeed(b *testing.B)](#BenchmarkHashStringSpeed)
    * [func BenchmarkIfaceCmp100(b *testing.B)](#BenchmarkIfaceCmp100)
    * [func BenchmarkIfaceCmpNil100(b *testing.B)](#BenchmarkIfaceCmpNil100)
    * [func BenchmarkIntMap(b *testing.B)](#BenchmarkIntMap)
    * [func BenchmarkIssue18740(b *testing.B)](#BenchmarkIssue18740)
    * [func BenchmarkMSpanCountAlloc(b *testing.B)](#BenchmarkMSpanCountAlloc)
    * [func BenchmarkMakeChan(b *testing.B)](#BenchmarkMakeChan)
    * [func BenchmarkMakeMap(b *testing.B)](#BenchmarkMakeMap)
    * [func BenchmarkMakeSlice(b *testing.B)](#BenchmarkMakeSlice)
    * [func BenchmarkMakeSliceCopy(b *testing.B)](#BenchmarkMakeSliceCopy)
    * [func BenchmarkMalloc16(b *testing.B)](#BenchmarkMalloc16)
    * [func BenchmarkMalloc8(b *testing.B)](#BenchmarkMalloc8)
    * [func BenchmarkMallocLargeStruct(b *testing.B)](#BenchmarkMallocLargeStruct)
    * [func BenchmarkMallocTypeInfo16(b *testing.B)](#BenchmarkMallocTypeInfo16)
    * [func BenchmarkMallocTypeInfo8(b *testing.B)](#BenchmarkMallocTypeInfo8)
    * [func BenchmarkMapAppendAssign(b *testing.B)](#BenchmarkMapAppendAssign)
    * [func BenchmarkMapAssign(b *testing.B)](#BenchmarkMapAssign)
    * [func BenchmarkMapCycle(b *testing.B)](#BenchmarkMapCycle)
    * [func BenchmarkMapDelete(b *testing.B)](#BenchmarkMapDelete)
    * [func BenchmarkMapFirst(b *testing.B)](#BenchmarkMapFirst)
    * [func BenchmarkMapInterfacePtr(b *testing.B)](#BenchmarkMapInterfacePtr)
    * [func BenchmarkMapInterfaceString(b *testing.B)](#BenchmarkMapInterfaceString)
    * [func BenchmarkMapIter(b *testing.B)](#BenchmarkMapIter)
    * [func BenchmarkMapIterEmpty(b *testing.B)](#BenchmarkMapIterEmpty)
    * [func BenchmarkMapLast(b *testing.B)](#BenchmarkMapLast)
    * [func BenchmarkMapMid(b *testing.B)](#BenchmarkMapMid)
    * [func BenchmarkMapOperatorAssign(b *testing.B)](#BenchmarkMapOperatorAssign)
    * [func BenchmarkMapPop100(b *testing.B)](#BenchmarkMapPop100)
    * [func BenchmarkMapPop1000(b *testing.B)](#BenchmarkMapPop1000)
    * [func BenchmarkMapPop10000(b *testing.B)](#BenchmarkMapPop10000)
    * [func BenchmarkMapPopulate(b *testing.B)](#BenchmarkMapPopulate)
    * [func BenchmarkMapStringConversion(b *testing.B)](#BenchmarkMapStringConversion)
    * [func BenchmarkMapStringKeysEight_16(b *testing.B)](#BenchmarkMapStringKeysEight_16)
    * [func BenchmarkMapStringKeysEight_1M(b *testing.B)](#BenchmarkMapStringKeysEight_1M)
    * [func BenchmarkMapStringKeysEight_32(b *testing.B)](#BenchmarkMapStringKeysEight_32)
    * [func BenchmarkMapStringKeysEight_64(b *testing.B)](#BenchmarkMapStringKeysEight_64)
    * [func BenchmarkMatmult(b *testing.B)](#BenchmarkMatmult)
    * [func BenchmarkMegEmptyMap(b *testing.B)](#BenchmarkMegEmptyMap)
    * [func BenchmarkMegEqMap(b *testing.B)](#BenchmarkMegEqMap)
    * [func BenchmarkMegMap(b *testing.B)](#BenchmarkMegMap)
    * [func BenchmarkMegOneMap(b *testing.B)](#BenchmarkMegOneMap)
    * [func BenchmarkMemclr(b *testing.B)](#BenchmarkMemclr)
    * [func BenchmarkMemmove(b *testing.B)](#BenchmarkMemmove)
    * [func BenchmarkMemmoveOverlap(b *testing.B)](#BenchmarkMemmoveOverlap)
    * [func BenchmarkMemmoveUnalignedDst(b *testing.B)](#BenchmarkMemmoveUnalignedDst)
    * [func BenchmarkMemmoveUnalignedDstOverlap(b *testing.B)](#BenchmarkMemmoveUnalignedDstOverlap)
    * [func BenchmarkMemmoveUnalignedSrc(b *testing.B)](#BenchmarkMemmoveUnalignedSrc)
    * [func BenchmarkMemmoveUnalignedSrcOverlap(b *testing.B)](#BenchmarkMemmoveUnalignedSrcOverlap)
    * [func BenchmarkNeEfaceConcrete(b *testing.B)](#BenchmarkNeEfaceConcrete)
    * [func BenchmarkNeIfaceConcrete(b *testing.B)](#BenchmarkNeIfaceConcrete)
    * [func BenchmarkNetpollBreak(b *testing.B)](#BenchmarkNetpollBreak)
    * [func BenchmarkNewEmptyMap(b *testing.B)](#BenchmarkNewEmptyMap)
    * [func BenchmarkNewEmptyMapHintGreaterThan8(b *testing.B)](#BenchmarkNewEmptyMapHintGreaterThan8)
    * [func BenchmarkNewEmptyMapHintLessThan8(b *testing.B)](#BenchmarkNewEmptyMapHintLessThan8)
    * [func BenchmarkNewSmallMap(b *testing.B)](#BenchmarkNewSmallMap)
    * [func BenchmarkPallocBitsSummarize(b *testing.B)](#BenchmarkPallocBitsSummarize)
    * [func BenchmarkPanicRecover(b *testing.B)](#BenchmarkPanicRecover)
    * [func BenchmarkPingPongHog(b *testing.B)](#BenchmarkPingPongHog)
    * [func BenchmarkRWMutexUncontended(b *testing.B)](#BenchmarkRWMutexUncontended)
    * [func BenchmarkRWMutexWorkWrite10(b *testing.B)](#BenchmarkRWMutexWorkWrite10)
    * [func BenchmarkRWMutexWorkWrite100(b *testing.B)](#BenchmarkRWMutexWorkWrite100)
    * [func BenchmarkRWMutexWrite10(b *testing.B)](#BenchmarkRWMutexWrite10)
    * [func BenchmarkRWMutexWrite100(b *testing.B)](#BenchmarkRWMutexWrite100)
    * [func BenchmarkReadMemStats(b *testing.B)](#BenchmarkReadMemStats)
    * [func BenchmarkReadMemStatsLatency(b *testing.B)](#BenchmarkReadMemStatsLatency)
    * [func BenchmarkReadMetricsLatency(b *testing.B)](#BenchmarkReadMetricsLatency)
    * [func BenchmarkRepeatedLookupStrMapKey1M(b *testing.B)](#BenchmarkRepeatedLookupStrMapKey1M)
    * [func BenchmarkRepeatedLookupStrMapKey32(b *testing.B)](#BenchmarkRepeatedLookupStrMapKey32)
    * [func BenchmarkRuneCount(b *testing.B)](#BenchmarkRuneCount)
    * [func BenchmarkRuneIterate(b *testing.B)](#BenchmarkRuneIterate)
    * [func BenchmarkSameLengthMap(b *testing.B)](#BenchmarkSameLengthMap)
    * [func BenchmarkScanStackNoLocals(b *testing.B)](#BenchmarkScanStackNoLocals)
    * [func BenchmarkSelectAsyncContended(b *testing.B)](#BenchmarkSelectAsyncContended)
    * [func BenchmarkSelectNonblock(b *testing.B)](#BenchmarkSelectNonblock)
    * [func BenchmarkSelectProdCons(b *testing.B)](#BenchmarkSelectProdCons)
    * [func BenchmarkSelectSyncContended(b *testing.B)](#BenchmarkSelectSyncContended)
    * [func BenchmarkSelectUncontended(b *testing.B)](#BenchmarkSelectUncontended)
    * [func BenchmarkSetTypeNode1(b *testing.B)](#BenchmarkSetTypeNode1)
    * [func BenchmarkSetTypeNode1024(b *testing.B)](#BenchmarkSetTypeNode1024)
    * [func BenchmarkSetTypeNode1024Slice(b *testing.B)](#BenchmarkSetTypeNode1024Slice)
    * [func BenchmarkSetTypeNode124(b *testing.B)](#BenchmarkSetTypeNode124)
    * [func BenchmarkSetTypeNode124Slice(b *testing.B)](#BenchmarkSetTypeNode124Slice)
    * [func BenchmarkSetTypeNode126(b *testing.B)](#BenchmarkSetTypeNode126)
    * [func BenchmarkSetTypeNode126Slice(b *testing.B)](#BenchmarkSetTypeNode126Slice)
    * [func BenchmarkSetTypeNode128(b *testing.B)](#BenchmarkSetTypeNode128)
    * [func BenchmarkSetTypeNode128Slice(b *testing.B)](#BenchmarkSetTypeNode128Slice)
    * [func BenchmarkSetTypeNode130(b *testing.B)](#BenchmarkSetTypeNode130)
    * [func BenchmarkSetTypeNode130Slice(b *testing.B)](#BenchmarkSetTypeNode130Slice)
    * [func BenchmarkSetTypeNode1Slice(b *testing.B)](#BenchmarkSetTypeNode1Slice)
    * [func BenchmarkSetTypeNode64(b *testing.B)](#BenchmarkSetTypeNode64)
    * [func BenchmarkSetTypeNode64Dead(b *testing.B)](#BenchmarkSetTypeNode64Dead)
    * [func BenchmarkSetTypeNode64DeadSlice(b *testing.B)](#BenchmarkSetTypeNode64DeadSlice)
    * [func BenchmarkSetTypeNode64Slice(b *testing.B)](#BenchmarkSetTypeNode64Slice)
    * [func BenchmarkSetTypeNode8(b *testing.B)](#BenchmarkSetTypeNode8)
    * [func BenchmarkSetTypeNode8Slice(b *testing.B)](#BenchmarkSetTypeNode8Slice)
    * [func BenchmarkSetTypePtr(b *testing.B)](#BenchmarkSetTypePtr)
    * [func BenchmarkSetTypePtr126(b *testing.B)](#BenchmarkSetTypePtr126)
    * [func BenchmarkSetTypePtr128(b *testing.B)](#BenchmarkSetTypePtr128)
    * [func BenchmarkSetTypePtr16(b *testing.B)](#BenchmarkSetTypePtr16)
    * [func BenchmarkSetTypePtr32(b *testing.B)](#BenchmarkSetTypePtr32)
    * [func BenchmarkSetTypePtr64(b *testing.B)](#BenchmarkSetTypePtr64)
    * [func BenchmarkSetTypePtr8(b *testing.B)](#BenchmarkSetTypePtr8)
    * [func BenchmarkSetTypePtrSlice(b *testing.B)](#BenchmarkSetTypePtrSlice)
    * [func BenchmarkSliceByteToString(b *testing.B)](#BenchmarkSliceByteToString)
    * [func BenchmarkSmallKeyMap(b *testing.B)](#BenchmarkSmallKeyMap)
    * [func BenchmarkSmallStrMap(b *testing.B)](#BenchmarkSmallStrMap)
    * [func BenchmarkStackCopy(b *testing.B)](#BenchmarkStackCopy)
    * [func BenchmarkStackCopyNoCache(b *testing.B)](#BenchmarkStackCopyNoCache)
    * [func BenchmarkStackCopyPtr(b *testing.B)](#BenchmarkStackCopyPtr)
    * [func BenchmarkStackGrowth(b *testing.B)](#BenchmarkStackGrowth)
    * [func BenchmarkStackGrowthDeep(b *testing.B)](#BenchmarkStackGrowthDeep)
    * [func BenchmarkSyscall(b *testing.B)](#BenchmarkSyscall)
    * [func BenchmarkSyscallExcess(b *testing.B)](#BenchmarkSyscallExcess)
    * [func BenchmarkSyscallExcessWork(b *testing.B)](#BenchmarkSyscallExcessWork)
    * [func BenchmarkSyscallWork(b *testing.B)](#BenchmarkSyscallWork)
    * [func BenchmarkUnalignedLoad(b *testing.B)](#BenchmarkUnalignedLoad)
    * [func BenchmarkWakeupParallelSpinning(b *testing.B)](#BenchmarkWakeupParallelSpinning)
    * [func BenchmarkWakeupParallelSyscall(b *testing.B)](#BenchmarkWakeupParallelSyscall)
    * [func BenchmarkWriteBarrier(b *testing.B)](#BenchmarkWriteBarrier)
    * [func ExampleFrames()](#ExampleFrames)
    * [func HammerRWMutex(gomaxprocs, numReaders, num_iterations int)](#HammerRWMutex)
    * [func TestAbort(t *testing.T)](#TestAbort)
    * [func TestAbortedPanic(t *testing.T)](#TestAbortedPanic)
    * [func TestAddrRangesAdd(t *testing.T)](#TestAddrRangesAdd)
    * [func TestAddrRangesFindSucc(t *testing.T)](#TestAddrRangesFindSucc)
    * [func TestAlias(t *testing.T)](#TestAlias)
    * [func TestAppendGrowth(t *testing.T)](#TestAppendGrowth)
    * [func TestAppendOverlap(t *testing.T)](#TestAppendOverlap)
    * [func TestAppendSliceGrowth(t *testing.T)](#TestAppendSliceGrowth)
    * [func TestArenaCollision(t *testing.T)](#TestArenaCollision)
    * [func TestArrayHash(t *testing.T)](#TestArrayHash)
    * [func TestAsyncPreempt(t *testing.T)](#TestAsyncPreempt)
    * [func TestAtoi(t *testing.T)](#TestAtoi)
    * [func TestAtoi32(t *testing.T)](#TestAtoi32)
    * [func TestBadOpen(t *testing.T)](#TestBadOpen)
    * [func TestBadTraceback(t *testing.T)](#TestBadTraceback)
    * [func TestBigGOMAXPROCS(t *testing.T)](#TestBigGOMAXPROCS)
    * [func TestBigItems(t *testing.T)](#TestBigItems)
    * [func TestBigStackCallbackCgo(t *testing.T)](#TestBigStackCallbackCgo)
    * [func TestBlockLocked(t *testing.T)](#TestBlockLocked)
    * [func TestBreakpoint(t *testing.T)](#TestBreakpoint)
    * [func TestCaller(t *testing.T)](#TestCaller)
    * [func TestCallers(t *testing.T)](#TestCallers)
    * [func TestCallersAbortedPanic(t *testing.T)](#TestCallersAbortedPanic)
    * [func TestCallersAbortedPanic2(t *testing.T)](#TestCallersAbortedPanic2)
    * [func TestCallersAfterRecovery(t *testing.T)](#TestCallersAfterRecovery)
    * [func TestCallersDeferNilFuncPanic(t *testing.T)](#TestCallersDeferNilFuncPanic)
    * [func TestCallersDeferNilFuncPanicWithLoop(t *testing.T)](#TestCallersDeferNilFuncPanicWithLoop)
    * [func TestCallersDivZeroPanic(t *testing.T)](#TestCallersDivZeroPanic)
    * [func TestCallersDoublePanic(t *testing.T)](#TestCallersDoublePanic)
    * [func TestCallersFromWrapper(t *testing.T)](#TestCallersFromWrapper)
    * [func TestCallersNilPointerPanic(t *testing.T)](#TestCallersNilPointerPanic)
    * [func TestCallersPanic(t *testing.T)](#TestCallersPanic)
    * [func TestCatchPanic(t *testing.T)](#TestCatchPanic)
    * [func TestCgoCCodeSIGPROF(t *testing.T)](#TestCgoCCodeSIGPROF)
    * [func TestCgoCallbackGC(t *testing.T)](#TestCgoCallbackGC)
    * [func TestCgoCheckBytes(t *testing.T)](#TestCgoCheckBytes)
    * [func TestCgoCrashHandler(t *testing.T)](#TestCgoCrashHandler)
    * [func TestCgoCrashTraceback(t *testing.T)](#TestCgoCrashTraceback)
    * [func TestCgoCrashTracebackGo(t *testing.T)](#TestCgoCrashTracebackGo)
    * [func TestCgoDLLImports(t *testing.T)](#TestCgoDLLImports)
    * [func TestCgoExecSignalMask(t *testing.T)](#TestCgoExecSignalMask)
    * [func TestCgoExternalThreadPanic(t *testing.T)](#TestCgoExternalThreadPanic)
    * [func TestCgoExternalThreadSIGPROF(t *testing.T)](#TestCgoExternalThreadSIGPROF)
    * [func TestCgoExternalThreadSignal(t *testing.T)](#TestCgoExternalThreadSignal)
    * [func TestCgoLockOSThreadExit(t *testing.T)](#TestCgoLockOSThreadExit)
    * [func TestCgoNumGoroutine(t *testing.T)](#TestCgoNumGoroutine)
    * [func TestCgoPanicDeadlock(t *testing.T)](#TestCgoPanicDeadlock)
    * [func TestCgoPprof(t *testing.T)](#TestCgoPprof)
    * [func TestCgoPprofPIE(t *testing.T)](#TestCgoPprofPIE)
    * [func TestCgoPprofThread(t *testing.T)](#TestCgoPprofThread)
    * [func TestCgoPprofThreadNoTraceback(t *testing.T)](#TestCgoPprofThreadNoTraceback)
    * [func TestCgoSignalDeadlock(t *testing.T)](#TestCgoSignalDeadlock)
    * [func TestCgoTraceback(t *testing.T)](#TestCgoTraceback)
    * [func TestCgoTracebackContext(t *testing.T)](#TestCgoTracebackContext)
    * [func TestCgoTracebackSigpanic(t *testing.T)](#TestCgoTracebackSigpanic)
    * [func TestChan(t *testing.T)](#TestChan)
    * [func TestChanSendBarrier(t *testing.T)](#TestChanSendBarrier)
    * [func TestChanSendInterface(t *testing.T)](#TestChanSendInterface)
    * [func TestChanSendSelectBarrier(t *testing.T)](#TestChanSendSelectBarrier)
    * [func TestCheckPtr(t *testing.T)](#TestCheckPtr)
    * [func TestCmpIfaceConcreteAlloc(t *testing.T)](#TestCmpIfaceConcreteAlloc)
    * [func TestCollisions(t *testing.T)](#TestCollisions)
    * [func TestCompareTempString(t *testing.T)](#TestCompareTempString)
    * [func TestConcurrentMapIterateWrite(t *testing.T)](#TestConcurrentMapIterateWrite)
    * [func TestConcurrentMapReadWrite(t *testing.T)](#TestConcurrentMapReadWrite)
    * [func TestConcurrentMapWrites(t *testing.T)](#TestConcurrentMapWrites)
    * [func TestConcurrentReadsAfterGrowth(t *testing.T)](#TestConcurrentReadsAfterGrowth)
    * [func TestConcurrentReadsAfterGrowthReflect(t *testing.T)](#TestConcurrentReadsAfterGrowthReflect)
    * [func TestConditionalDefers(t *testing.T)](#TestConditionalDefers)
    * [func TestCrashDumpsAllThreads(t *testing.T)](#TestCrashDumpsAllThreads)
    * [func TestCrashHandler(t *testing.T)](#TestCrashHandler)
    * [func TestDebugLog(t *testing.T)](#TestDebugLog)
    * [func TestDebugLogInterleaving(t *testing.T)](#TestDebugLogInterleaving)
    * [func TestDebugLogLongString(t *testing.T)](#TestDebugLogLongString)
    * [func TestDebugLogSym(t *testing.T)](#TestDebugLogSym)
    * [func TestDebugLogTypes(t *testing.T)](#TestDebugLogTypes)
    * [func TestDebugLogWraparound(t *testing.T)](#TestDebugLogWraparound)
    * [func TestDeferDeleteSlow(t *testing.T)](#TestDeferDeleteSlow)
    * [func TestDeferForFuncWithNoExit(t *testing.T)](#TestDeferForFuncWithNoExit)
    * [func TestDeferHeapAndStack(t *testing.T)](#TestDeferHeapAndStack)
    * [func TestDeferKeepAlive(t *testing.T)](#TestDeferKeepAlive)
    * [func TestDeferLeafSigpanic(t *testing.T)](#TestDeferLeafSigpanic)
    * [func TestDeferLiveness(t *testing.T)](#TestDeferLiveness)
    * [func TestDeferPtrs(t *testing.T)](#TestDeferPtrs)
    * [func TestDeferPtrsGoexit(t *testing.T)](#TestDeferPtrsGoexit)
    * [func TestDeferPtrsPanic(t *testing.T)](#TestDeferPtrsPanic)
    * [func TestDeferWithRepeatedRepanics(t *testing.T)](#TestDeferWithRepeatedRepanics)
    * [func TestDisappearingDefer(t *testing.T)](#TestDisappearingDefer)
    * [func TestDoublePanic(t *testing.T)](#TestDoublePanic)
    * [func TestEINTR(t *testing.T)](#TestEINTR)
    * [func TestEmptyKeyAndValue(t *testing.T)](#TestEmptyKeyAndValue)
    * [func TestEmptySlice(t *testing.T)](#TestEmptySlice)
    * [func TestEmptyString(t *testing.T)](#TestEmptyString)
    * [func TestEnsureDropM(t *testing.T)](#TestEnsureDropM)
    * [func TestEqString(t *testing.T)](#TestEqString)
    * [func TestFakeTime(t *testing.T)](#TestFakeTime)
    * [func TestFastLog2(t *testing.T)](#TestFastLog2)
    * [func TestFillAligned(t *testing.T)](#TestFillAligned)
    * [func TestFinalizerInterfaceBig(t *testing.T)](#TestFinalizerInterfaceBig)
    * [func TestFinalizerOnGlobal(t *testing.T)](#TestFinalizerOnGlobal)
    * [func TestFinalizerType(t *testing.T)](#TestFinalizerType)
    * [func TestFinalizerZeroSizedStruct(t *testing.T)](#TestFinalizerZeroSizedStruct)
    * [func TestFindBitRange64(t *testing.T)](#TestFindBitRange64)
    * [func TestFixedGOROOT(t *testing.T)](#TestFixedGOROOT)
    * [func TestFloat64(t *testing.T)](#TestFloat64)
    * [func TestFunctionAlignmentTraceback(t *testing.T)](#TestFunctionAlignmentTraceback)
    * [func TestG0StackOverflow(t *testing.T)](#TestG0StackOverflow)
    * [func TestGCFairness(t *testing.T)](#TestGCFairness)
    * [func TestGCFairness2(t *testing.T)](#TestGCFairness2)
    * [func TestGCInfo(t *testing.T)](#TestGCInfo)
    * [func TestGCTestIsReachable(t *testing.T)](#TestGCTestIsReachable)
    * [func TestGCTestMoveStackOnNextCall(t *testing.T)](#TestGCTestMoveStackOnNextCall)
    * [func TestGCTestMoveStackRepeatedly(t *testing.T)](#TestGCTestMoveStackRepeatedly)
    * [func TestGCTestPointerClass(t *testing.T)](#TestGCTestPointerClass)
    * [func TestGcArraySlice(t *testing.T)](#TestGcArraySlice)
    * [func TestGcDeepNesting(t *testing.T)](#TestGcDeepNesting)
    * [func TestGcLastTime(t *testing.T)](#TestGcLastTime)
    * [func TestGcMapIndirection(t *testing.T)](#TestGcMapIndirection)
    * [func TestGcRescan(t *testing.T)](#TestGcRescan)
    * [func TestGcSys(t *testing.T)](#TestGcSys)
    * [func TestGcZombieReporting(t *testing.T)](#TestGcZombieReporting)
    * [func TestGdbAutotmpTypes(t *testing.T)](#TestGdbAutotmpTypes)
    * [func TestGdbBacktrace(t *testing.T)](#TestGdbBacktrace)
    * [func TestGdbConst(t *testing.T)](#TestGdbConst)
    * [func TestGdbInfCallstack(t *testing.T)](#TestGdbInfCallstack)
    * [func TestGdbPanic(t *testing.T)](#TestGdbPanic)
    * [func TestGdbPython(t *testing.T)](#TestGdbPython)
    * [func TestGdbPythonCgo(t *testing.T)](#TestGdbPythonCgo)
    * [func TestGetgThreadSwitch(t *testing.T)](#TestGetgThreadSwitch)
    * [func TestGoNil(t *testing.T)](#TestGoNil)
    * [func TestGoexitCrash(t *testing.T)](#TestGoexitCrash)
    * [func TestGoexitDeadlock(t *testing.T)](#TestGoexitDeadlock)
    * [func TestGoexitDefer(t *testing.T)](#TestGoexitDefer)
    * [func TestGoexitInPanic(t *testing.T)](#TestGoexitInPanic)
    * [func TestGoroutineParallelism(t *testing.T)](#TestGoroutineParallelism)
    * [func TestGoroutineParallelism2(t *testing.T)](#TestGoroutineParallelism2)
    * [func TestGoroutineProfile(t *testing.T)](#TestGoroutineProfile)
    * [func TestGoroutineProfileTrivial(t *testing.T)](#TestGoroutineProfileTrivial)
    * [func TestGrowWithNaN(t *testing.T)](#TestGrowWithNaN)
    * [func TestGrowWithNegativeZero(t *testing.T)](#TestGrowWithNegativeZero)
    * [func TestHmapSize(t *testing.T)](#TestHmapSize)
    * [func TestHugeGCInfo(t *testing.T)](#TestHugeGCInfo)
    * [func TestIgnoreBogusMapHint(t *testing.T)](#TestIgnoreBogusMapHint)
    * [func TestIncrementAfterBulkClearKeyStringValueInt(t *testing.T)](#TestIncrementAfterBulkClearKeyStringValueInt)
    * [func TestIncrementAfterDeleteKeyStringValueInt(t *testing.T)](#TestIncrementAfterDeleteKeyStringValueInt)
    * [func TestIncrementAfterDeleteKeyValueString(t *testing.T)](#TestIncrementAfterDeleteKeyValueString)
    * [func TestIncrementAfterDeleteValueInt(t *testing.T)](#TestIncrementAfterDeleteValueInt)
    * [func TestIncrementAfterDeleteValueInt32(t *testing.T)](#TestIncrementAfterDeleteValueInt32)
    * [func TestIncrementAfterDeleteValueInt64(t *testing.T)](#TestIncrementAfterDeleteValueInt64)
    * [func TestInitDeadlock(t *testing.T)](#TestInitDeadlock)
    * [func TestIntString(t *testing.T)](#TestIntString)
    * [func TestIntStringAllocs(t *testing.T)](#TestIntStringAllocs)
    * [func TestIssue37688(t *testing.T)](#TestIssue37688)
    * [func TestIssue43921(t *testing.T)](#TestIssue43921)
    * [func TestIterGrowAndDelete(t *testing.T)](#TestIterGrowAndDelete)
    * [func TestIterGrowWithGC(t *testing.T)](#TestIterGrowWithGC)
    * [func TestLFStack(t *testing.T)](#TestLFStack)
    * [func TestLFStackStress(t *testing.T)](#TestLFStackStress)
    * [func TestLargeStringConcat(t *testing.T)](#TestLargeStringConcat)
    * [func TestLineNumber(t *testing.T)](#TestLineNumber)
    * [func TestLldbPython(t *testing.T)](#TestLldbPython)
    * [func TestLockOSThreadAvoidsStatePropagation(t *testing.T)](#TestLockOSThreadAvoidsStatePropagation)
    * [func TestLockOSThreadExit(t *testing.T)](#TestLockOSThreadExit)
    * [func TestLockOSThreadNesting(t *testing.T)](#TestLockOSThreadNesting)
    * [func TestLockOSThreadTemplateThreadRace(t *testing.T)](#TestLockOSThreadTemplateThreadRace)
    * [func TestLockRankPartialOrder(t *testing.T)](#TestLockRankPartialOrder)
    * [func TestLockRankPartialOrderSortedEntries(t *testing.T)](#TestLockRankPartialOrderSortedEntries)
    * [func TestLockedDeadlock(t *testing.T)](#TestLockedDeadlock)
    * [func TestLockedDeadlock2(t *testing.T)](#TestLockedDeadlock2)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestMainGoroutineID(t *testing.T)](#TestMainGoroutineID)
    * [func TestMallocBitsPopcntRange(t *testing.T)](#TestMallocBitsPopcntRange)
    * [func TestMapAppendAssignment(t *testing.T)](#TestMapAppendAssignment)
    * [func TestMapAssignmentNan(t *testing.T)](#TestMapAssignmentNan)
    * [func TestMapBuckets(t *testing.T)](#TestMapBuckets)
    * [func TestMapHugeZero(t *testing.T)](#TestMapHugeZero)
    * [func TestMapInterfaceKey(t *testing.T)](#TestMapInterfaceKey)
    * [func TestMapIterOrder(t *testing.T)](#TestMapIterOrder)
    * [func TestMapLargeKeyNoPointer(t *testing.T)](#TestMapLargeKeyNoPointer)
    * [func TestMapLargeValNoPointer(t *testing.T)](#TestMapLargeValNoPointer)
    * [func TestMapNanGrowIterator(t *testing.T)](#TestMapNanGrowIterator)
    * [func TestMapOperatorAssignment(t *testing.T)](#TestMapOperatorAssignment)
    * [func TestMapOperatorAssignmentNan(t *testing.T)](#TestMapOperatorAssignmentNan)
    * [func TestMapSparseIterOrder(t *testing.T)](#TestMapSparseIterOrder)
    * [func TestMapStringBytesLookup(t *testing.T)](#TestMapStringBytesLookup)
    * [func TestMapTombstones(t *testing.T)](#TestMapTombstones)
    * [func TestMemHash32Equality(t *testing.T)](#TestMemHash32Equality)
    * [func TestMemHash64Equality(t *testing.T)](#TestMemHash64Equality)
    * [func TestMemPprof(t *testing.T)](#TestMemPprof)
    * [func TestMemStats(t *testing.T)](#TestMemStats)
    * [func TestMemclr(t *testing.T)](#TestMemclr)
    * [func TestMemmove(t *testing.T)](#TestMemmove)
    * [func TestMemmoveAlias(t *testing.T)](#TestMemmoveAlias)
    * [func TestMemmoveAtomicity(t *testing.T)](#TestMemmoveAtomicity)
    * [func TestMemmoveLarge0x180000(t *testing.T)](#TestMemmoveLarge0x180000)
    * [func TestMemmoveOverlapLarge0x120000(t *testing.T)](#TestMemmoveOverlapLarge0x120000)
    * [func TestMmapErrorSign(t *testing.T)](#TestMmapErrorSign)
    * [func TestMultiConsumer(t *testing.T)](#TestMultiConsumer)
    * [func TestNeedmDeadlock(t *testing.T)](#TestNeedmDeadlock)
    * [func TestNegativeZero(t *testing.T)](#TestNegativeZero)
    * [func TestNetpollBreak(t *testing.T)](#TestNetpollBreak)
    * [func TestNetpollDeadlock(t *testing.T)](#TestNetpollDeadlock)
    * [func TestNilName(t *testing.T)](#TestNilName)
    * [func TestNoHelperGoroutines(t *testing.T)](#TestNoHelperGoroutines)
    * [func TestNoShrinkStackWhileParking(t *testing.T)](#TestNoShrinkStackWhileParking)
    * [func TestNonEscapingConvT2E(t *testing.T)](#TestNonEscapingConvT2E)
    * [func TestNonEscapingConvT2I(t *testing.T)](#TestNonEscapingConvT2I)
    * [func TestNonEscapingMap(t *testing.T)](#TestNonEscapingMap)
    * [func TestNonOpenAndOpenDefers(t *testing.T)](#TestNonOpenAndOpenDefers)
    * [func TestNonSSAableArgs(t *testing.T)](#TestNonSSAableArgs)
    * [func TestNonblockRecvRace(t *testing.T)](#TestNonblockRecvRace)
    * [func TestNonblockSelectRace(t *testing.T)](#TestNonblockSelectRace)
    * [func TestNonblockSelectRace2(t *testing.T)](#TestNonblockSelectRace2)
    * [func TestNonblockingPipe(t *testing.T)](#TestNonblockingPipe)
    * [func TestNumGoroutine(t *testing.T)](#TestNumGoroutine)
    * [func TestOpenAndNonOpenDefers(t *testing.T)](#TestOpenAndNonOpenDefers)
    * [func TestPageAccounting(t *testing.T)](#TestPageAccounting)
    * [func TestPageAllocAlloc(t *testing.T)](#TestPageAllocAlloc)
    * [func TestPageAllocAllocAndFree(t *testing.T)](#TestPageAllocAllocAndFree)
    * [func TestPageAllocAllocToCache(t *testing.T)](#TestPageAllocAllocToCache)
    * [func TestPageAllocExhaust(t *testing.T)](#TestPageAllocExhaust)
    * [func TestPageAllocFree(t *testing.T)](#TestPageAllocFree)
    * [func TestPageAllocGrow(t *testing.T)](#TestPageAllocGrow)
    * [func TestPageAllocScavenge(t *testing.T)](#TestPageAllocScavenge)
    * [func TestPageCacheAlloc(t *testing.T)](#TestPageCacheAlloc)
    * [func TestPageCacheFlush(t *testing.T)](#TestPageCacheFlush)
    * [func TestPageCacheLeak(t *testing.T)](#TestPageCacheLeak)
    * [func TestPallocBitsAlloc(t *testing.T)](#TestPallocBitsAlloc)
    * [func TestPallocBitsAllocRange(t *testing.T)](#TestPallocBitsAllocRange)
    * [func TestPallocBitsFree(t *testing.T)](#TestPallocBitsFree)
    * [func TestPallocBitsSummarize(t *testing.T)](#TestPallocBitsSummarize)
    * [func TestPallocBitsSummarizeRandom(t *testing.T)](#TestPallocBitsSummarizeRandom)
    * [func TestPallocDataFindScavengeCandidate(t *testing.T)](#TestPallocDataFindScavengeCandidate)
    * [func TestPanicAfterGoexit(t *testing.T)](#TestPanicAfterGoexit)
    * [func TestPanicDeadlockGosched(t *testing.T)](#TestPanicDeadlockGosched)
    * [func TestPanicDeadlockSyscall(t *testing.T)](#TestPanicDeadlockSyscall)
    * [func TestPanicFar(t *testing.T)](#TestPanicFar)
    * [func TestPanicInlined(t *testing.T)](#TestPanicInlined)
    * [func TestPanicLoop(t *testing.T)](#TestPanicLoop)
    * [func TestPanicRace(t *testing.T)](#TestPanicRace)
    * [func TestPanicSystemstack(t *testing.T)](#TestPanicSystemstack)
    * [func TestPanicTraceback(t *testing.T)](#TestPanicTraceback)
    * [func TestPanicUseStack(t *testing.T)](#TestPanicUseStack)
    * [func TestPanicWithDirectlyPrintableCustomTypes(t *testing.T)](#TestPanicWithDirectlyPrintableCustomTypes)
    * [func TestParallelRWMutexReaders(t *testing.T)](#TestParallelRWMutexReaders)
    * [func TestPeriodicGC(t *testing.T)](#TestPeriodicGC)
    * [func TestPhysPageSize(t *testing.T)](#TestPhysPageSize)
    * [func TestPhysicalMemoryUtilization(t *testing.T)](#TestPhysicalMemoryUtilization)
    * [func TestPingPongHog(t *testing.T)](#TestPingPongHog)
    * [func TestPreemptSplitBig(t *testing.T)](#TestPreemptSplitBig)
    * [func TestPreemption(t *testing.T)](#TestPreemption)
    * [func TestPreemptionAfterSyscall(t *testing.T)](#TestPreemptionAfterSyscall)
    * [func TestPreemptionGC(t *testing.T)](#TestPreemptionGC)
    * [func TestPrintGC(t *testing.T)](#TestPrintGC)
    * [func TestProfBuf(t *testing.T)](#TestProfBuf)
    * [func TestPseudoRandomSend(t *testing.T)](#TestPseudoRandomSend)
    * [func TestRWMutex(t *testing.T)](#TestRWMutex)
    * [func TestRaceProf(t *testing.T)](#TestRaceProf)
    * [func TestRaceSignal(t *testing.T)](#TestRaceSignal)
    * [func TestRangeStringCast(t *testing.T)](#TestRangeStringCast)
    * [func TestReadMemStats(t *testing.T)](#TestReadMemStats)
    * [func TestReadMetrics(t *testing.T)](#TestReadMetrics)
    * [func TestReadMetricsConsistency(t *testing.T)](#TestReadMetricsConsistency)
    * [func TestRecoverBeforePanicAfterGoexit(t *testing.T)](#TestRecoverBeforePanicAfterGoexit)
    * [func TestRecoverBeforePanicAfterGoexit2(t *testing.T)](#TestRecoverBeforePanicAfterGoexit2)
    * [func TestRecoverMatching(t *testing.T)](#TestRecoverMatching)
    * [func TestRecoveredPanicAfterGoexit(t *testing.T)](#TestRecoveredPanicAfterGoexit)
    * [func TestRecursivePanic(t *testing.T)](#TestRecursivePanic)
    * [func TestRecursivePanic2(t *testing.T)](#TestRecursivePanic2)
    * [func TestRecursivePanic3(t *testing.T)](#TestRecursivePanic3)
    * [func TestRecursivePanic4(t *testing.T)](#TestRecursivePanic4)
    * [func TestRecursivePanic5(t *testing.T)](#TestRecursivePanic5)
    * [func TestRuntimePanic(t *testing.T)](#TestRuntimePanic)
    * [func TestRuntimePanicWithRuntimeError(t *testing.T)](#TestRuntimePanicWithRuntimeError)
    * [func TestScavengedBitsCleared(t *testing.T)](#TestScavengedBitsCleared)
    * [func TestSchedLocalQueue(t *testing.T)](#TestSchedLocalQueue)
    * [func TestSchedLocalQueueEmpty(t *testing.T)](#TestSchedLocalQueueEmpty)
    * [func TestSchedLocalQueueSteal(t *testing.T)](#TestSchedLocalQueueSteal)
    * [func TestSegv(t *testing.T)](#TestSegv)
    * [func TestSelectDuplicateChannel(t *testing.T)](#TestSelectDuplicateChannel)
    * [func TestSelectFairness(t *testing.T)](#TestSelectFairness)
    * [func TestSelectStackAdjust(t *testing.T)](#TestSelectStackAdjust)
    * [func TestSelectStress(t *testing.T)](#TestSelectStress)
    * [func TestSelfSelect(t *testing.T)](#TestSelfSelect)
    * [func TestSemaHandoff(t *testing.T)](#TestSemaHandoff)
    * [func TestSemaHandoff1(t *testing.T)](#TestSemaHandoff1)
    * [func TestSemaHandoff2(t *testing.T)](#TestSemaHandoff2)
    * [func TestSetNonblock(t *testing.T)](#TestSetNonblock)
    * [func TestSetPanicOnFault(t *testing.T)](#TestSetPanicOnFault)
    * [func TestShrinkStackDuringBlockedSend(t *testing.T)](#TestShrinkStackDuringBlockedSend)
    * [func TestSideEffectOrder(t *testing.T)](#TestSideEffectOrder)
    * [func TestSigStackSwapping(t *testing.T)](#TestSigStackSwapping)
    * [func TestSignalDuringExec(t *testing.T)](#TestSignalDuringExec)
    * [func TestSignalExitStatus(t *testing.T)](#TestSignalExitStatus)
    * [func TestSignalIgnoreSIGTRAP(t *testing.T)](#TestSignalIgnoreSIGTRAP)
    * [func TestSignalM(t *testing.T)](#TestSignalM)
    * [func TestSimpleDeadlock(t *testing.T)](#TestSimpleDeadlock)
    * [func TestSingleBucketMapStringKeys_DupLen(t *testing.T)](#TestSingleBucketMapStringKeys_DupLen)
    * [func TestSingleBucketMapStringKeys_NoDupLen(t *testing.T)](#TestSingleBucketMapStringKeys_NoDupLen)
    * [func TestSizeof(t *testing.T)](#TestSizeof)
    * [func TestSmhasherAppendedZeros(t *testing.T)](#TestSmhasherAppendedZeros)
    * [func TestSmhasherAvalanche(t *testing.T)](#TestSmhasherAvalanche)
    * [func TestSmhasherCyclic(t *testing.T)](#TestSmhasherCyclic)
    * [func TestSmhasherPermutation(t *testing.T)](#TestSmhasherPermutation)
    * [func TestSmhasherSanity(t *testing.T)](#TestSmhasherSanity)
    * [func TestSmhasherSeed(t *testing.T)](#TestSmhasherSeed)
    * [func TestSmhasherSmallKeys(t *testing.T)](#TestSmhasherSmallKeys)
    * [func TestSmhasherSparse(t *testing.T)](#TestSmhasherSparse)
    * [func TestSmhasherText(t *testing.T)](#TestSmhasherText)
    * [func TestSmhasherTwoNonzero(t *testing.T)](#TestSmhasherTwoNonzero)
    * [func TestSmhasherWindowed(t *testing.T)](#TestSmhasherWindowed)
    * [func TestSmhasherZeros(t *testing.T)](#TestSmhasherZeros)
    * [func TestSpuriousWakeupsNeverHangSemasleep(t *testing.T)](#TestSpuriousWakeupsNeverHangSemasleep)
    * [func TestStackAllOutput(t *testing.T)](#TestStackAllOutput)
    * [func TestStackCache(t *testing.T)](#TestStackCache)
    * [func TestStackGrowth(t *testing.T)](#TestStackGrowth)
    * [func TestStackGrowthCallback(t *testing.T)](#TestStackGrowthCallback)
    * [func TestStackMem(t *testing.T)](#TestStackMem)
    * [func TestStackOutput(t *testing.T)](#TestStackOutput)
    * [func TestStackOverflow(t *testing.T)](#TestStackOverflow)
    * [func TestStackPanic(t *testing.T)](#TestStackPanic)
    * [func TestStackWrapperCaller(t *testing.T)](#TestStackWrapperCaller)
    * [func TestStackWrapperCallers(t *testing.T)](#TestStackWrapperCallers)
    * [func TestStackWrapperStack(t *testing.T)](#TestStackWrapperStack)
    * [func TestStackWrapperStackPanic(t *testing.T)](#TestStackWrapperStackPanic)
    * [func TestStealOrder(t *testing.T)](#TestStealOrder)
    * [func TestStopCPUProfilingWithProfilerOff(t *testing.T)](#TestStopCPUProfilingWithProfilerOff)
    * [func TestStopTheWorldDeadlock(t *testing.T)](#TestStopTheWorldDeadlock)
    * [func TestString2Slice(t *testing.T)](#TestString2Slice)
    * [func TestStringConcatenationAllocs(t *testing.T)](#TestStringConcatenationAllocs)
    * [func TestStringIndexHaystack(t *testing.T)](#TestStringIndexHaystack)
    * [func TestStringIndexNeedle(t *testing.T)](#TestStringIndexNeedle)
    * [func TestStringOnStack(t *testing.T)](#TestStringOnStack)
    * [func TestStringW(t *testing.T)](#TestStringW)
    * [func TestStructHash(t *testing.T)](#TestStructHash)
    * [func TestThreadExhaustion(t *testing.T)](#TestThreadExhaustion)
    * [func TestTimeHistogram(t *testing.T)](#TestTimeHistogram)
    * [func TestTimePprof(t *testing.T)](#TestTimePprof)
    * [func TestTimerFairness(t *testing.T)](#TestTimerFairness)
    * [func TestTimerFairness2(t *testing.T)](#TestTimerFairness2)
    * [func TestTinyAlloc(t *testing.T)](#TestTinyAlloc)
    * [func TestTinyAllocIssue37262(t *testing.T)](#TestTinyAllocIssue37262)
    * [func TestTracebackAncestors(t *testing.T)](#TestTracebackAncestors)
    * [func TestTracebackArgs(t *testing.T)](#TestTracebackArgs)
    * [func TestTracebackInlineExcluded(t *testing.T)](#TestTracebackInlineExcluded)
    * [func TestTracebackSystemstack(t *testing.T)](#TestTracebackSystemstack)
    * [func TestTrailingZero(t *testing.T)](#TestTrailingZero)
    * [func TestUnconditionalPanic(t *testing.T)](#TestUnconditionalPanic)
    * [func TestUserForcedGC(t *testing.T)](#TestUserForcedGC)
    * [func TestVDSO(t *testing.T)](#TestVDSO)
    * [func TestVersion(t *testing.T)](#TestVersion)
    * [func TestWindowsStackMemoryCgo(t *testing.T)](#TestWindowsStackMemoryCgo)
    * [func TestYieldLocked(t *testing.T)](#TestYieldLocked)
    * [func TestYieldLockedProgress(t *testing.T)](#TestYieldLockedProgress)
    * [func TestYieldProgress(t *testing.T)](#TestYieldProgress)
    * [func TestZeroConvT2x(t *testing.T)](#TestZeroConvT2x)
    * [func add(x, y float64) float64](#add)
    * [func addr1(x int) *int](#addr1)
    * [func addr2() (x int, p *int)](#addr2)
    * [func adjChunks() (*objtype, *objtype)](#adjChunks)
    * [func applyGCLoad(b *testing.B) func()](#applyGCLoad)
    * [func avalancheTest1(t *testing.T, k Key)](#avalancheTest1)
    * [func benchHelper(b *testing.B, n int, read func(chan struct{}))](#benchHelper)
    * [func benchSetType(b *testing.B, x interface{})](#benchSetType)
    * [func benchmarkChanProdCons(b *testing.B, chanSize, localWork int)](#benchmarkChanProdCons)
    * [func benchmarkChanSync(b *testing.B, work int)](#benchmarkChanSync)
    * [func benchmarkCreateGoroutines(b *testing.B, procs int)](#benchmarkCreateGoroutines)
    * [func benchmarkHash(b *testing.B, n int)](#benchmarkHash)
    * [func benchmarkMapAppendAssignInt32(b *testing.B, n int)](#benchmarkMapAppendAssignInt32)
    * [func benchmarkMapAppendAssignInt64(b *testing.B, n int)](#benchmarkMapAppendAssignInt64)
    * [func benchmarkMapAppendAssignStr(b *testing.B, n int)](#benchmarkMapAppendAssignStr)
    * [func benchmarkMapAssignInt32(b *testing.B, n int)](#benchmarkMapAssignInt32)
    * [func benchmarkMapAssignInt64(b *testing.B, n int)](#benchmarkMapAssignInt64)
    * [func benchmarkMapAssignStr(b *testing.B, n int)](#benchmarkMapAssignStr)
    * [func benchmarkMapDeleteInt32(b *testing.B, n int)](#benchmarkMapDeleteInt32)
    * [func benchmarkMapDeleteInt64(b *testing.B, n int)](#benchmarkMapDeleteInt64)
    * [func benchmarkMapDeletePointer(b *testing.B, n int)](#benchmarkMapDeletePointer)
    * [func benchmarkMapDeleteStr(b *testing.B, n int)](#benchmarkMapDeleteStr)
    * [func benchmarkMapOperatorAssignInt32(b *testing.B, n int)](#benchmarkMapOperatorAssignInt32)
    * [func benchmarkMapOperatorAssignInt64(b *testing.B, n int)](#benchmarkMapOperatorAssignInt64)
    * [func benchmarkMapOperatorAssignStr(b *testing.B, n int)](#benchmarkMapOperatorAssignStr)
    * [func benchmarkMapPop(b *testing.B, n int)](#benchmarkMapPop)
    * [func benchmarkMapStringKeysEight(b *testing.B, keySize int)](#benchmarkMapStringKeysEight)
    * [func benchmarkRWMutex(b *testing.B, localWork, writeRatio int)](#benchmarkRWMutex)
    * [func benchmarkRepeatedLookup(b *testing.B, lookupKeySize int)](#benchmarkRepeatedLookup)
    * [func benchmarkSizes(b *testing.B, sizes []int, fn func(b *testing.B, n int))](#benchmarkSizes)
    * [func benchmarkStackGrowth(b *testing.B, rec int)](#benchmarkStackGrowth)
    * [func benchmarkSyscall(b *testing.B, work, excess int)](#benchmarkSyscall)
    * [func benchmarkWakeupParallel(b *testing.B, spin func(time.Duration))](#benchmarkWakeupParallel)
    * [func big(stop chan int) int](#big)
    * [func bigframe(stop chan int) int](#bigframe)
    * [func buildTestProg(t *testing.T, binary string, flags ...string) (string, error)](#buildTestProg)
    * [func checkCleanBacktrace(t *testing.T, backtrace string)](#checkCleanBacktrace)
    * [func checkCloseonexec(t *testing.T, fd int32, name string)](#checkCloseonexec)
    * [func checkGdbEnvironment(t *testing.T)](#checkGdbEnvironment)
    * [func checkGdbPython(t *testing.T)](#checkGdbPython)
    * [func checkGdbVersion(t *testing.T)](#checkGdbVersion)
    * [func checkIsPipe(t *testing.T, r, w int32)](#checkIsPipe)
    * [func checkLldbPython(t *testing.T)](#checkLldbPython)
    * [func checkNonblocking(t *testing.T, fd int32, name string)](#checkNonblocking)
    * [func checkPageAlloc(t *testing.T, want, got *PageAlloc)](#checkPageAlloc)
    * [func checkPageCache(t *testing.T, got, want PageCache)](#checkPageCache)
    * [func checkPallocBits(t *testing.T, got, want *PallocBits) bool](#checkPallocBits)
    * [func checkPallocSum(t testing.TB, got, want PallocSum)](#checkPallocSum)
    * [func cmpb(a, b []byte) int](#cmpb)
    * [func copybw(dst, src []byte)](#copybw)
    * [func copyref(dst, src []byte)](#copyref)
    * [func count(n int) int](#count)
    * [func count1(n int) int](#count1)
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
    * [func count2(n int) int](#count2)
    * [func count20(n int) int](#count20)
    * [func count21(n int) int](#count21)
    * [func count22(n int) int](#count22)
    * [func count23(n int) int](#count23)
    * [func count3(n int) int](#count3)
    * [func count4(n int) int](#count4)
    * [func count5(n int) int](#count5)
    * [func count6(n int) int](#count6)
    * [func count7(n int) int](#count7)
    * [func count8(n int) int](#count8)
    * [func count9(n int) int](#count9)
    * [func countp(n *int)](#countp)
    * [func countpwg(n *int, ready *sync.WaitGroup, teardown chan bool)](#countpwg)
    * [func defer1()](#defer1)
    * [func defer2()](#defer2)
    * [func defer3()](#defer3)
    * [func deferHeapAndStack(n int) (r int)](#deferHeapAndStack)
    * [func div(x, y float64) float64](#div)
    * [func dlogCanonicalize(x string) string](#dlogCanonicalize)
    * [func doPanic()](#doPanic)
    * [func doTestParallelReaders(numReaders int)](#doTestParallelReaders)
    * [func doWork(dur time.Duration)](#doWork)
    * [func eqstring_generic(s1, s2 string) bool](#eqstring_generic)
    * [func err(t *testing.T, format string, args ...interface{})](#err)
    * [func errfn() error](#errfn)
    * [func errfn1() error](#errfn1)
    * [func escape(p interface{}) interface{}](#escape)
    * [func expect(t *testing.T, n int, err interface{})](#expect)
    * [func f() int](#f)
    * [func f1(pan bool) []uintptr](#f1)
    * [func f2(pan bool) []uintptr](#f2)
    * [func f3(pan bool) []uintptr](#f3)
    * [func fakeSyscall(duration time.Duration)](#fakeSyscall)
    * [func fcntl(fd uintptr, cmd int, arg uintptr) (uintptr, syscall.Errno)](#fcntl)
    * [func ff1(ap *foo, a, b, c, d, e, f, g, h, i int)](#ff1)
    * [func fin(v *int)](#fin)
    * [func findTrace(text, top string) []string](#findTrace)
    * [func fop(f func(x, y uint64) uint64) func(x, y float64) float64](#fop)
    * [func fromMyNode(node *MyNode) *LFNode](#fromMyNode)
    * [func fromint64sw(f float64) float64](#fromint64sw)
    * [func g2()](#g2)
    * [func g3()](#g3)
    * [func genPerm(h *HashSet, b []byte, s []uint32, n int)](#genPerm)
    * [func growStack(progress *uint32)](#growStack)
    * [func growStackIter(p *int, n int)](#growStackIter)
    * [func growStackWithCallback(cb func())](#growStackWithCallback)
    * [func growing(c chan int, done chan struct{})](#growing)
    * [func hwcmp(f, g float64) (cmp int, isnan bool)](#hwcmp)
    * [func hwint32(f float64) float64](#hwint32)
    * [func hwint64(f float64) float64](#hwint64)
    * [func infoBigStruct() []byte](#infoBigStruct)
    * [func init()](#init.crash_test.go)
    * [func init()](#init.crash_unix_test.go)
    * [func init()](#init.crash_unix_test.go.0xc045da0c88)
    * [func init()](#init.netpoll_os_test.go)
    * [func init()](#init.runtime_test.go)
    * [func inlined()](#inlined)
    * [func interpreter(level int, maxlevel int, rec int)](#interpreter)
    * [func invertPallocBits(b *PallocBits)](#invertPallocBits)
    * [func isZeroed(b []byte) bool](#isZeroed)
    * [func isZeroedR(r []rune) bool](#isZeroedR)
    * [func lastLine(src []byte) int](#lastLine)
    * [func lineNumber() int](#lineNumber)
    * [func localWork(w int)](#localWork)
    * [func logDiff(t *testing.T, prefix string, got, want reflect.Value)](#logDiff)
    * [func makePallocBits(s []BitRange) *PallocBits](#makePallocBits)
    * [func makePallocData(alloc, scavenged []BitRange) *PallocData](#makePallocData)
    * [func matchLen(a, b []byte, max int) int](#matchLen)
    * [func matmult(done chan<- struct{}, A, B, C Matrix, i0, i1, j0, j1, k0, k1, threshold int)](#matmult)
    * [func moveStack1(x bool)](#moveStack1)
    * [func moveStackCheck(t *testing.T, new *int, old uintptr) bool](#moveStackCheck)
    * [func mul(x, y float64) float64](#mul)
    * [func nextTrace(lines []string) ([]string, []string)](#nextTrace)
    * [func nonleaf(stop chan int) bool](#nonleaf)
    * [func panicValue(fn func()) (recovered interface{})](#panicValue)
    * [func parallelReader(m *RWMutex, clocked chan bool, cunlock *uint32, cdone chan bool)](#parallelReader)
    * [func parseFakeTime(x []byte) ([]fakeTimeFrame, error)](#parseFakeTime)
    * [func permutation(t *testing.T, s []uint32, n int)](#permutation)
    * [func perpetuumMobile()](#perpetuumMobile)
    * [func prepareAllMetricsSamples() (map[string]metrics.Description, []metrics.Sample)](#prepareAllMetricsSamples)
    * [func randBytes(r *rand.Rand, b []byte)](#randBytes)
    * [func reader(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)](#reader)
    * [func rec1(max int)](#rec1)
    * [func recordLines(a, b, c int)](#recordLines)
    * [func recurseFn(level int, maxlevel int)](#recurseFn)
    * [func recurseFnPanicRec(level int, maxlevel int)](#recurseFnPanicRec)
    * [func runBuiltTestProg(t *testing.T, exe, name string, env ...string) string](#runBuiltTestProg)
    * [func runTestProg(t *testing.T, binary, name string, env ...string) string](#runTestProg)
    * [func runWith(f func(*testing.B, int), v ...int) func(*testing.B)](#runWith)
    * [func same(f, g float64) bool](#same)
    * [func set(p *int, x int)](#set)
    * [func setBig(p *int, x int, b bigBuf)](#setBig)
    * [func setbits(h *HashSet, b []byte, i int, k int)](#setbits)
    * [func sideeffect(n int64) int64](#sideeffect)
    * [func skipDebugLog(t *testing.T)](#skipDebugLog)
    * [func small(stop chan int, x *[8192]byte) int](#small)
    * [func sparse(t *testing.T, n int, k int)](#sparse)
    * [func stackGrowthRecursive(i int)](#stackGrowthRecursive)
    * [func sub(x, y float64) float64](#sub)
    * [func test(t *testing.T, op string, hw, sw func(float64, float64) float64, all []float64)](#test)
    * [func testAssert(x interface{}) error](#testAssert)
    * [func testAssertVar(x interface{}) error](#testAssertVar)
    * [func testCallerBar(t *testing.T)](#testCallerBar)
    * [func testCallerFoo(t *testing.T)](#testCallerFoo)
    * [func testCallers(t *testing.T, pcs []uintptr, pan bool)](#testCallers)
    * [func testCallersEqual(t *testing.T, pcs []uintptr, want []string)](#testCallersEqual)
    * [func testCgoPprof(t *testing.T, buildArg, runArg, top, bottom string)](#testCgoPprof)
    * [func testChanSendBarrier(useSelect bool)](#testChanSendBarrier)
    * [func testConcurrentReadsAfterGrowth(t *testing.T, useReflect bool)](#testConcurrentReadsAfterGrowth)
    * [func testConditionalDefers(n int)](#testConditionalDefers)
    * [func testCrashHandler(t *testing.T, cgo bool)](#testCrashHandler)
    * [func testDeadlock(t *testing.T, name string)](#testDeadlock)
    * [func testDeferLeafSigpanic1()](#testDeferLeafSigpanic1)
    * [func testDeferPtrsGoexit(c chan int, i int)](#testDeferPtrsGoexit)
    * [func testDeferPtrsPanic(c chan int, i int)](#testDeferPtrsPanic)
    * [func testGdbPython(t *testing.T, cgo bool)](#testGdbPython)
    * [func testGoroutineParallelism2(t *testing.T, load, netpoll bool)](#testGoroutineParallelism2)
    * [func testIfaceEqual(x interface{})](#testIfaceEqual)
    * [func testLockOSThreadExit(t *testing.T, prog string)](#testLockOSThreadExit)
    * [func testMapLookups(t *testing.T, m map[string]string)](#testMapLookups)
    * [func testMapNan(t *testing.T, m map[float64]int)](#testMapNan)
    * [func testOpen(t *testing.T, arg int)](#testOpen)
    * [func testOverlap(t *testing.T, size int)](#testOverlap)
    * [func testPanicDeadlock(t *testing.T, name string, want string)](#testPanicDeadlock)
    * [func testPanicSystemstackInternal()](#testPanicSystemstackInternal)
    * [func testPreemptionAfterSyscall(t *testing.T, syscallDuration time.Duration)](#testPreemptionAfterSyscall)
    * [func testSemaHandoff() bool](#testSemaHandoff)
    * [func testSetPanicOnFault(t *testing.T, addr uintptr, nfault *int)](#testSetPanicOnFault)
    * [func testSize(t *testing.T, size int)](#testSize)
    * [func testStackWrapperPanic(t *testing.T, cb func(), expect string)](#testStackWrapperPanic)
    * [func testTracebackArgs1(a, b, c, d, e, f, g, h, i, j, k, l int) int](#testTracebackArgs1)
    * [func testTracebackArgs2(a bool, b struct {...](#testTracebackArgs2)
    * [func testTracebackArgs3(x [3]byte, a, b, c int, y [3]byte) int](#testTracebackArgs3)
    * [func testTracebackArgs4(a bool, x [1][1][1][1][1][1][1][1][1][1]int) int](#testTracebackArgs4)
    * [func testTracebackArgs5(a bool, x struct {...](#testTracebackArgs5)
    * [func testTypeSwitch(x interface{}) error](#testTypeSwitch)
    * [func testYieldProgress(locked bool)](#testYieldProgress)
    * [func testcmp(t *testing.T, f, g float64)](#testcmp)
    * [func testu(t *testing.T, op string, hw, sw func(float64) float64, v float64)](#testu)
    * [func text(t *testing.T, prefix, suffix string)](#text)
    * [func to32sw(f float64) float64](#to32sw)
    * [func to64sw(f float64) float64](#to64sw)
    * [func toint64sw(f float64) float64](#toint64sw)
    * [func tracebackExcluded()](#tracebackExcluded)
    * [func tracebackFunc(t *testing.T) uintptr](#tracebackFunc)
    * [func tracebackNotExcluded()](#tracebackNotExcluded)
    * [func trimDead(mask []byte) []byte](#trimDead)
    * [func trunc32(f float64) float64](#trunc32)
    * [func trythis()](#trythis)
    * [func twoNonZero(h *HashSet, n int)](#twoNonZero)
    * [func useStack(n int)](#useStack)
    * [func useStackAndCall(n int, f func())](#useStackAndCall)
    * [func validateAddrRanges(t *testing.T, a *AddrRanges, want ...AddrRange)](#validateAddrRanges)
    * [func verifyGCInfo(t *testing.T, name string, p interface{}, mask0 []byte)](#verifyGCInfo)
    * [func warmupScheduler(targetThreadCount int)](#warmupScheduler)
    * [func windowed(t *testing.T, k Key)](#windowed)
    * [func writeBarrierBenchmark(b *testing.B, f func())](#writeBarrierBenchmark)
    * [func writer(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)](#writer)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="InfCallstackSource" href="#InfCallstackSource">const InfCallstackSource</a>

```
searchKey: runtime_test.InfCallstackSource
tags: [constant string private]
```

```Go
const InfCallstackSource = ...
```

### <a id="N" href="#N">const N</a>

```
searchKey: runtime_test.N
tags: [constant number private]
```

```Go
const N = 20
```

### <a id="autotmpTypeSource" href="#autotmpTypeSource">const autotmpTypeSource</a>

```
searchKey: runtime_test.autotmpTypeSource
tags: [constant string private]
```

```Go
const autotmpTypeSource = ...
```

### <a id="backtraceSource" href="#backtraceSource">const backtraceSource</a>

```
searchKey: runtime_test.backtraceSource
tags: [constant string private]
```

```Go
const backtraceSource = ...
```

### <a id="constsSource" href="#constsSource">const constsSource</a>

```
searchKey: runtime_test.constsSource
tags: [constant string private]
```

```Go
const constsSource = ...
```

### <a id="expectedLldbOutput" href="#expectedLldbOutput">const expectedLldbOutput</a>

```
searchKey: runtime_test.expectedLldbOutput
tags: [constant string private]
```

```Go
const expectedLldbOutput = ...
```

### <a id="hashSize" href="#hashSize">const hashSize</a>

```
searchKey: runtime_test.hashSize
tags: [constant number private]
```

```Go
const hashSize = 32 + int(^uintptr(0)>>63<<5)
```

size of the hash output (32 or 64 bits) 

### <a id="helloSource" href="#helloSource">const helloSource</a>

```
searchKey: runtime_test.helloSource
tags: [constant string private]
```

```Go
const helloSource = ...
```

### <a id="intSize" href="#intSize">const intSize</a>

```
searchKey: runtime_test.intSize
tags: [constant number private]
```

```Go
const intSize = 32 << (^uint(0) >> 63)
```

### <a id="lldbHelloSource" href="#lldbHelloSource">const lldbHelloSource</a>

```
searchKey: runtime_test.lldbHelloSource
tags: [constant string private]
```

```Go
const lldbHelloSource = ...
```

### <a id="lldbScriptSource" href="#lldbScriptSource">const lldbScriptSource</a>

```
searchKey: runtime_test.lldbScriptSource
tags: [constant string private]
```

```Go
const lldbScriptSource = ...
```

### <a id="objsize" href="#objsize">const objsize</a>

```
searchKey: runtime_test.objsize
tags: [constant number private]
```

```Go
const objsize = 320
```

One chunk must be exactly one sizeclass in size. It should be a sizeclass not used much by others, so we have a greater chance of finding adjacent ones. size class 19: 320 byte objects, 25 per page, 1 page alloc at a time 

### <a id="panicSource" href="#panicSource">const panicSource</a>

```
searchKey: runtime_test.panicSource
tags: [constant string private]
```

```Go
const panicSource = ...
```

### <a id="size" href="#size">const size</a>

```
searchKey: runtime_test.size
tags: [constant number private]
```

```Go
const size = 10
```

### <a id="sizeNoStack" href="#sizeNoStack">const sizeNoStack</a>

```
searchKey: runtime_test.sizeNoStack
tags: [constant number private]
```

```Go
const sizeNoStack = 100
```

Strings and slices that don't escape and fit into tmpBuf are stack allocated, which defeats using AllocsPerRun to test other optimizations. 

### <a id="typePointer" href="#typePointer">const typePointer</a>

```
searchKey: runtime_test.typePointer
tags: [constant number private]
```

```Go
const typePointer = 1
```

### <a id="typeScalar" href="#typeScalar">const typeScalar</a>

```
searchKey: runtime_test.typeScalar
tags: [constant number private]
```

```Go
const typeScalar = 0
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="BoolSink" href="#BoolSink">var BoolSink</a>

```
searchKey: runtime_test.BoolSink
tags: [variable boolean private]
```

```Go
var BoolSink bool
```

### <a id="Foo1" href="#Foo1">var Foo1</a>

```
searchKey: runtime_test.Foo1
tags: [variable struct private]
```

```Go
var Foo1 = &Object1{}
```

### <a id="Foo2" href="#Foo2">var Foo2</a>

```
searchKey: runtime_test.Foo2
tags: [variable struct private]
```

```Go
var Foo2 = &Object2{}
```

### <a id="One" href="#One">var One</a>

```
searchKey: runtime_test.One
tags: [variable array number private]
```

```Go
var One = []int64{1}
```

### <a id="SinkIntPointerSlice" href="#SinkIntPointerSlice">var SinkIntPointerSlice</a>

```
searchKey: runtime_test.SinkIntPointerSlice
tags: [variable array number private]
```

```Go
var SinkIntPointerSlice []*int
```

### <a id="SinkIntSlice" href="#SinkIntSlice">var SinkIntSlice</a>

```
searchKey: runtime_test.SinkIntSlice
tags: [variable array number private]
```

```Go
var SinkIntSlice []int
```

### <a id="a" href="#a">var a</a>

```
searchKey: runtime_test.a
tags: [variable boolean private]
```

```Go
var a bool
```

### <a id="alwaysFalse" href="#alwaysFalse">var alwaysFalse</a>

```
searchKey: runtime_test.alwaysFalse
tags: [variable boolean private]
```

```Go
var alwaysFalse = false
```

### <a id="arenaCollisionSink" href="#arenaCollisionSink">var arenaCollisionSink</a>

```
searchKey: runtime_test.arenaCollisionSink
tags: [variable array struct private]
```

```Go
var arenaCollisionSink []*acLink
```

### <a id="arrayLit" href="#arrayLit">var arrayLit</a>

```
searchKey: runtime_test.arrayLit
tags: [variable array number private]
```

```Go
var arrayLit = [...]int{lineNumber(),
	lineNumber(), lineNumber(),
	lineNumber(),
} // 23

```

### <a id="atoi32tests" href="#atoi32tests">var atoi32tests</a>

```
searchKey: runtime_test.atoi32tests
tags: [variable array struct private]
```

```Go
var atoi32tests = ...
```

### <a id="atoi64tests" href="#atoi64tests">var atoi64tests</a>

```
searchKey: runtime_test.atoi64tests
tags: [variable array struct private]
```

```Go
var atoi64tests = ...
```

### <a id="blackhole" href="#blackhole">var blackhole</a>

```
searchKey: runtime_test.blackhole
tags: [variable array number private]
```

```Go
var blackhole []byte
```

### <a id="bssBigStruct" href="#bssBigStruct">var bssBigStruct</a>

```
searchKey: runtime_test.bssBigStruct
tags: [variable struct private]
```

```Go
var bssBigStruct BigStruct
```

### <a id="bssEface" href="#bssEface">var bssEface</a>

```
searchKey: runtime_test.bssEface
tags: [variable interface private]
```

```Go
var bssEface interface{}
```

### <a id="bssIface" href="#bssIface">var bssIface</a>

```
searchKey: runtime_test.bssIface
tags: [variable interface private]
```

```Go
var bssIface Iface
```

### <a id="bssPtr" href="#bssPtr">var bssPtr</a>

```
searchKey: runtime_test.bssPtr
tags: [variable struct private]
```

```Go
var bssPtr Ptr
```

BSS 

### <a id="bssPtrScalar" href="#bssPtrScalar">var bssPtrScalar</a>

```
searchKey: runtime_test.bssPtrScalar
tags: [variable struct private]
```

```Go
var bssPtrScalar PtrScalar
```

### <a id="bssScalarPtr" href="#bssScalarPtr">var bssScalarPtr</a>

```
searchKey: runtime_test.bssScalarPtr
tags: [variable struct private]
```

```Go
var bssScalarPtr ScalarPtr
```

### <a id="bssSlice" href="#bssSlice">var bssSlice</a>

```
searchKey: runtime_test.bssSlice
tags: [variable array string private]
```

```Go
var bssSlice []string
```

### <a id="bssString" href="#bssString">var bssString</a>

```
searchKey: runtime_test.bssString
tags: [variable string private]
```

```Go
var bssString string
```

### <a id="bufSizes" href="#bufSizes">var bufSizes</a>

```
searchKey: runtime_test.bufSizes
tags: [variable array number private]
```

```Go
var bufSizes = ...
```

### <a id="bufSizesOverlap" href="#bufSizesOverlap">var bufSizesOverlap</a>

```
searchKey: runtime_test.bufSizesOverlap
tags: [variable array number private]
```

```Go
var bufSizesOverlap = []int{
	32, 64, 128, 256, 512, 1024, 2048, 4096,
}
```

### <a id="compLit" href="#compLit">var compLit</a>

```
searchKey: runtime_test.compLit
tags: [variable array struct private]
```

```Go
var compLit

// 19
 = ...
```

### <a id="concurrentMapTest" href="#concurrentMapTest">var concurrentMapTest</a>

```
searchKey: runtime_test.concurrentMapTest
tags: [variable boolean private]
```

```Go
var concurrentMapTest = ...
```

### <a id="dataBigStruct" href="#dataBigStruct">var dataBigStruct</a>

```
searchKey: runtime_test.dataBigStruct
tags: [variable struct private]
```

```Go
var dataBigStruct = BigStruct{w: 1}
```

### <a id="dataEface" href="#dataEface">var dataEface</a>

```
searchKey: runtime_test.dataEface
tags: [variable interface private]
```

```Go
var dataEface interface{} = 42
```

### <a id="dataIface" href="#dataIface">var dataIface</a>

```
searchKey: runtime_test.dataIface
tags: [variable interface private]
```

```Go
var dataIface Iface = IfaceImpl(42)
```

### <a id="dataPtr" href="#dataPtr">var dataPtr</a>

```
searchKey: runtime_test.dataPtr
tags: [variable struct private]
```

```Go
var dataPtr = Ptr{new(byte)}
```

DATA 

### <a id="dataPtrScalar" href="#dataPtrScalar">var dataPtrScalar</a>

```
searchKey: runtime_test.dataPtrScalar
tags: [variable struct private]
```

```Go
var dataPtrScalar = PtrScalar{w: 1}
```

### <a id="dataScalarPtr" href="#dataScalarPtr">var dataScalarPtr</a>

```
searchKey: runtime_test.dataScalarPtr
tags: [variable struct private]
```

```Go
var dataScalarPtr = ScalarPtr{q: 1}
```

### <a id="dataSlice" href="#dataSlice">var dataSlice</a>

```
searchKey: runtime_test.dataSlice
tags: [variable array string private]
```

```Go
var dataSlice = []string{"foo"}
```

### <a id="dataString" href="#dataString">var dataString</a>

```
searchKey: runtime_test.dataString
tags: [variable string private]
```

```Go
var dataString = "foo"
```

### <a id="dummy" href="#dummy">var dummy</a>

```
searchKey: runtime_test.dummy
tags: [variable number private]
```

```Go
var dummy int
```

### <a id="dummyTimeHistogram" href="#dummyTimeHistogram">var dummyTimeHistogram</a>

```
searchKey: runtime_test.dummyTimeHistogram
tags: [variable private]
```

```Go
var dummyTimeHistogram TimeHistogram
```

### <a id="e" href="#e">var e</a>

```
searchKey: runtime_test.e
tags: [variable interface private]
```

```Go
var e interface{}
```

### <a id="e_" href="#e_">var e_</a>

```
searchKey: runtime_test.e_
tags: [variable interface private]
```

```Go
var e_ interface{}
```

### <a id="efaceCmp1" href="#efaceCmp1">var efaceCmp1</a>

```
searchKey: runtime_test.efaceCmp1
tags: [variable interface private]
```

```Go
var efaceCmp1 interface{}
```

### <a id="efaceCmp2" href="#efaceCmp2">var efaceCmp2</a>

```
searchKey: runtime_test.efaceCmp2
tags: [variable interface private]
```

```Go
var efaceCmp2 interface{}
```

### <a id="eight8" href="#eight8">var eight8</a>

```
searchKey: runtime_test.eight8
tags: [variable number private]
```

```Go
var eight8 uint8 = 8
```

### <a id="eight8I" href="#eight8I">var eight8I</a>

```
searchKey: runtime_test.eight8I
tags: [variable number private]
```

```Go
var eight8I T8 = 8
```

### <a id="errf" href="#errf">var errf</a>

```
searchKey: runtime_test.errf
tags: [variable interface private]
```

```Go
var errf error
```

### <a id="escapeMe" href="#escapeMe">var escapeMe</a>

```
searchKey: runtime_test.escapeMe
tags: [variable function private]
```

```Go
var escapeMe = func(x interface{}) {}
```

Pass a value to escapeMe to force it to escape. 

### <a id="escapeString" href="#escapeString">var escapeString</a>

```
searchKey: runtime_test.escapeString
tags: [variable string private]
```

```Go
var escapeString string
```

### <a id="faultAddrs" href="#faultAddrs">var faultAddrs</a>

```
searchKey: runtime_test.faultAddrs
tags: [variable array number private]
```

```Go
var faultAddrs = ...
```

### <a id="firstLine" href="#firstLine">var firstLine</a>

```
searchKey: runtime_test.firstLine
tags: [variable number private]
```

```Go
var firstLine = lineNumber() // 0

```

Do not add/remove lines in this block without updating the line numbers. 

### <a id="flagQuick" href="#flagQuick">var flagQuick</a>

```
searchKey: runtime_test.flagQuick
tags: [variable boolean private]
```

```Go
var flagQuick = flag.Bool("quick", false, "skip slow tests, for second run in all.bash")
```

### <a id="gcinfoSink" href="#gcinfoSink">var gcinfoSink</a>

```
searchKey: runtime_test.gcinfoSink
tags: [variable interface private]
```

```Go
var gcinfoSink interface{}
```

### <a id="glob" href="#glob">var glob</a>

```
searchKey: runtime_test.glob
tags: [variable number private]
```

```Go
var glob int = 3
```

### <a id="global" href="#global">var global</a>

```
searchKey: runtime_test.global
tags: [variable interface private]
```

```Go
var global interface{}
```

### <a id="globint1" href="#globint1">var globint1</a>

```
searchKey: runtime_test.globint1
tags: [variable number private]
```

```Go
var globint1, globint2, globint3 int
```

### <a id="globint2" href="#globint2">var globint2</a>

```
searchKey: runtime_test.globint2
tags: [variable number private]
```

```Go
var globint1, globint2, globint3 int
```

### <a id="globint3" href="#globint3">var globint3</a>

```
searchKey: runtime_test.globint3
tags: [variable number private]
```

```Go
var globint1, globint2, globint3 int
```

### <a id="globstruct" href="#globstruct">var globstruct</a>

```
searchKey: runtime_test.globstruct
tags: [variable struct private]
```

```Go
var globstruct struct {
	a, b, c, d, e, f, g, h, i int
}
```

### <a id="hintGreaterThan8" href="#hintGreaterThan8">var hintGreaterThan8</a>

```
searchKey: runtime_test.hintGreaterThan8
tags: [variable number private]
```

```Go
var hintGreaterThan8 = 32
```

### <a id="hintLessThan8" href="#hintLessThan8">var hintLessThan8</a>

```
searchKey: runtime_test.hintLessThan8
tags: [variable number private]
```

```Go
var hintLessThan8 = 7
```

### <a id="hugeSink" href="#hugeSink">var hugeSink</a>

```
searchKey: runtime_test.hugeSink
tags: [variable interface private]
```

```Go
var hugeSink interface{}
```

### <a id="i1" href="#i1">var i1</a>

```
searchKey: runtime_test.i1
tags: [variable interface private]
```

```Go
var i1 I1
```

### <a id="i2" href="#i2">var i2</a>

```
searchKey: runtime_test.i2
tags: [variable interface private]
```

```Go
var i2 I2
```

### <a id="infoEface" href="#infoEface">var infoEface</a>

```
searchKey: runtime_test.infoEface
tags: [variable array number private]
```

```Go
var infoEface = []byte{typeScalar, typePointer}
```

### <a id="infoIface" href="#infoIface">var infoIface</a>

```
searchKey: runtime_test.infoIface
tags: [variable array number private]
```

```Go
var infoIface = []byte{typeScalar, typePointer}
```

### <a id="infoPtr" href="#infoPtr">var infoPtr</a>

```
searchKey: runtime_test.infoPtr
tags: [variable array number private]
```

```Go
var infoPtr = []byte{typePointer}
```

### <a id="infoPtr10" href="#infoPtr10">var infoPtr10</a>

```
searchKey: runtime_test.infoPtr10
tags: [variable array number private]
```

```Go
var infoPtr10 = ...
```

### <a id="infoPtrScalar" href="#infoPtrScalar">var infoPtrScalar</a>

```
searchKey: runtime_test.infoPtrScalar
tags: [variable array number private]
```

```Go
var infoPtrScalar = ...
```

### <a id="infoScalarPtr" href="#infoScalarPtr">var infoScalarPtr</a>

```
searchKey: runtime_test.infoScalarPtr
tags: [variable array number private]
```

```Go
var infoScalarPtr = ...
```

### <a id="infoScalarPtr4" href="#infoScalarPtr4">var infoScalarPtr4</a>

```
searchKey: runtime_test.infoScalarPtr4
tags: [variable array number private]
```

```Go
var infoScalarPtr4 = ...
```

### <a id="infoSlice" href="#infoSlice">var infoSlice</a>

```
searchKey: runtime_test.infoSlice
tags: [variable array number private]
```

```Go
var infoSlice = []byte{typePointer, typeScalar, typeScalar}
```

### <a id="infoString" href="#infoString">var infoString</a>

```
searchKey: runtime_test.infoString
tags: [variable array number private]
```

```Go
var infoString = []byte{typePointer, typeScalar}
```

### <a id="intLit" href="#intLit">var intLit</a>

```
searchKey: runtime_test.intLit
tags: [variable number private]
```

```Go
var intLit = lineNumber() +
	lineNumber() +
	lineNumber() // 36

```

### <a id="l38" href="#l38">var l38</a>

```
searchKey: runtime_test.l38
tags: [variable number private]
```

```Go
var l38, l39, l40 int
```

### <a id="l39" href="#l39">var l39</a>

```
searchKey: runtime_test.l39
tags: [variable number private]
```

```Go
var l38, l39, l40 int
```

### <a id="l40" href="#l40">var l40</a>

```
searchKey: runtime_test.l40
tags: [variable number private]
```

```Go
var l38, l39, l40 int
```

### <a id="lineVar1" href="#lineVar1">var lineVar1</a>

```
searchKey: runtime_test.lineVar1
tags: [variable number private]
```

```Go
var lineVar1 = lineNumber() // 2

```

### <a id="lineVar2a" href="#lineVar2a">var lineVar2a</a>

```
searchKey: runtime_test.lineVar2a
tags: [variable number private]
```

```Go
var lineVar2a, lineVar2b = lineNumber(), lineNumber() // 3

```

### <a id="lineVar2b" href="#lineVar2b">var lineVar2b</a>

```
searchKey: runtime_test.lineVar2b
tags: [variable number private]
```

```Go
var lineVar2a, lineVar2b = lineNumber(), lineNumber() // 3

```

### <a id="list" href="#list">var list</a>

```
searchKey: runtime_test.list
tags: [variable array number private]
```

```Go
var list []int
```

### <a id="lldbPath" href="#lldbPath">var lldbPath</a>

```
searchKey: runtime_test.lldbPath
tags: [variable string private]
```

```Go
var lldbPath string
```

### <a id="mallocSink" href="#mallocSink">var mallocSink</a>

```
searchKey: runtime_test.mallocSink
tags: [variable number private]
```

```Go
var mallocSink uintptr
```

### <a id="mapBucketTests" href="#mapBucketTests">var mapBucketTests</a>

```
searchKey: runtime_test.mapBucketTests
tags: [variable array struct private]
```

```Go
var mapBucketTests = ...
```

### <a id="mapLit" href="#mapLit">var mapLit</a>

```
searchKey: runtime_test.mapLit
tags: [variable object private]
```

```Go
var mapLit

// 33
 = ...
```

### <a id="mapSink" href="#mapSink">var mapSink</a>

```
searchKey: runtime_test.mapSink
tags: [variable object private]
```

```Go
var mapSink map[int]int
```

### <a id="n" href="#n">var n</a>

```
searchKey: runtime_test.n
tags: [variable number private]
```

```Go
var n = flag.Int("n", 1000, "number of goroutines")
```

### <a id="nerr" href="#nerr">var nerr</a>

```
searchKey: runtime_test.nerr
tags: [variable number private]
```

```Go
var nerr int
```

### <a id="nzbig" href="#nzbig">var nzbig</a>

```
searchKey: runtime_test.nzbig
tags: [variable array number private]
```

```Go
var nzbig [512]byte = [512]byte{511: 1}
```

### <a id="nzslice" href="#nzslice">var nzslice</a>

```
searchKey: runtime_test.nzslice
tags: [variable array number private]
```

```Go
var nzslice []byte = []byte("abc")
```

### <a id="nzstr" href="#nzstr">var nzstr</a>

```
searchKey: runtime_test.nzstr
tags: [variable string private]
```

```Go
var nzstr string = "abc"
```

### <a id="ok" href="#ok">var ok</a>

```
searchKey: runtime_test.ok
tags: [variable boolean private]
```

```Go
var ok bool
```

### <a id="one16" href="#one16">var one16</a>

```
searchKey: runtime_test.one16
tags: [variable number private]
```

```Go
var one16 uint16 = 1
```

### <a id="one32" href="#one32">var one32</a>

```
searchKey: runtime_test.one32
tags: [variable number private]
```

```Go
var one32 uint32 = 1
```

### <a id="one64" href="#one64">var one64</a>

```
searchKey: runtime_test.one64
tags: [variable number private]
```

```Go
var one64 uint64 = 1
```

### <a id="padData" href="#padData">var padData</a>

```
searchKey: runtime_test.padData
tags: [variable array number private]
```

```Go
var padData [128]uint64
```

### <a id="pointerClassData" href="#pointerClassData">var pointerClassData</a>

```
searchKey: runtime_test.pointerClassData
tags: [variable number private]
```

```Go
var pointerClassData = 42
```

### <a id="pointerClassSink" href="#pointerClassSink">var pointerClassSink</a>

```
searchKey: runtime_test.pointerClassSink
tags: [variable number private]
```

```Go
var pointerClassSink *int
```

### <a id="preempt" href="#preempt">var preempt</a>

```
searchKey: runtime_test.preempt
tags: [variable function private]
```

```Go
var preempt = ...
```

The function is used to test preemption at split stack checks. Declaring a var avoids inlining at the call site. 

### <a id="result" href="#result">var result</a>

```
searchKey: runtime_test.result
tags: [variable number private]
```

```Go
var result complex128
```

### <a id="s" href="#s">var s</a>

```
searchKey: runtime_test.s
tags: [variable number private]
```

```Go
var s int
```

### <a id="s1Ptr" href="#s1Ptr">var s1Ptr</a>

```
searchKey: runtime_test.s1Ptr
tags: [variable array number private]
```

```Go
var s1Ptr []uintptr
```

### <a id="s2Ptr" href="#s2Ptr">var s2Ptr</a>

```
searchKey: runtime_test.s2Ptr
tags: [variable array array number private]
```

```Go
var s2Ptr [][2]uintptr
```

### <a id="s3Ptr" href="#s3Ptr">var s3Ptr</a>

```
searchKey: runtime_test.s3Ptr
tags: [variable array array number private]
```

```Go
var s3Ptr [][3]uintptr
```

### <a id="s4Ptr" href="#s4Ptr">var s4Ptr</a>

```
searchKey: runtime_test.s4Ptr
tags: [variable array array number private]
```

```Go
var s4Ptr [][4]uintptr
```

### <a id="sByte" href="#sByte">var sByte</a>

```
searchKey: runtime_test.sByte
tags: [variable array number private]
```

```Go
var sByte []byte
```

### <a id="saveInt" href="#saveInt">var saveInt</a>

```
searchKey: runtime_test.saveInt
tags: [variable number private]
```

```Go
var saveInt uint32
```

### <a id="sigquit" href="#sigquit">var sigquit</a>

```
searchKey: runtime_test.sigquit
tags: [variable number private]
```

```Go
var sigquit = syscall.SIGQUIT
```

sigquit is the signal to send to kill a hanging testdata program. Send SIGQUIT to get a stack trace. 

### <a id="sink" href="#sink">var sink</a>

```
searchKey: runtime_test.sink
tags: [variable number private]
```

```Go
var sink uint64
```

### <a id="sink32" href="#sink32">var sink32</a>

```
searchKey: runtime_test.sink32
tags: [variable number private]
```

```Go
var sink32 uint32
```

### <a id="sinkAppend" href="#sinkAppend">var sinkAppend</a>

```
searchKey: runtime_test.sinkAppend
tags: [variable boolean private]
```

```Go
var sinkAppend bool
```

### <a id="sinkInt" href="#sinkInt">var sinkInt</a>

```
searchKey: runtime_test.sinkInt
tags: [variable number private]
```

```Go
var sinkInt int
```

### <a id="sliceLit" href="#sliceLit">var sliceLit</a>

```
searchKey: runtime_test.sliceLit
tags: [variable array number private]
```

```Go
var sliceLit = []int{lineNumber(),
	lineNumber(), lineNumber(),
	lineNumber(),
} // 27

```

### <a id="ss" href="#ss">var ss</a>

```
searchKey: runtime_test.ss
tags: [variable number private]
```

```Go
var ss *int
```

### <a id="ssglobal" href="#ssglobal">var ssglobal</a>

```
searchKey: runtime_test.ssglobal
tags: [variable string private]
```

```Go
var ssglobal string
```

### <a id="stop" href="#stop">var stop</a>

```
searchKey: runtime_test.stop
tags: [variable private]
```

```Go
var stop = make(chan bool, 1)
```

### <a id="stress" href="#stress">var stress</a>

```
searchKey: runtime_test.stress
tags: [variable array struct private]
```

```Go
var stress []*MyNode
```

### <a id="stringdata" href="#stringdata">var stringdata</a>

```
searchKey: runtime_test.stringdata
tags: [variable array struct private]
```

```Go
var stringdata = ...
```

### <a id="sysNanosleep" href="#sysNanosleep">var sysNanosleep</a>

```
searchKey: runtime_test.sysNanosleep
tags: [variable function private]
```

```Go
var sysNanosleep func(d time.Duration)
```

sysNanosleep is defined by OS-specific files (such as runtime_linux_test.go) to sleep for the given duration. If nil, dependent tests are skipped. The implementation should invoke a blocking system call and not call time.Sleep, which would deschedule the goroutine. 

### <a id="testMemStatsCount" href="#testMemStatsCount">var testMemStatsCount</a>

```
searchKey: runtime_test.testMemStatsCount
tags: [variable number private]
```

```Go
var testMemStatsCount int
```

### <a id="testNonEscapingMapVariable" href="#testNonEscapingMapVariable">var testNonEscapingMapVariable</a>

```
searchKey: runtime_test.testNonEscapingMapVariable
tags: [variable number private]
```

```Go
var testNonEscapingMapVariable int = 8
```

### <a id="testTracebackArgsBuf" href="#testTracebackArgsBuf">var testTracebackArgsBuf</a>

```
searchKey: runtime_test.testTracebackArgsBuf
tags: [variable array number private]
```

```Go
var testTracebackArgsBuf [1000]byte
```

### <a id="testprog" href="#testprog">var testprog</a>

```
searchKey: runtime_test.testprog
tags: [variable struct private]
```

```Go
var testprog struct {
	sync.Mutex
	dir    string
	target map[string]buildexe
}
```

### <a id="thousand16" href="#thousand16">var thousand16</a>

```
searchKey: runtime_test.thousand16
tags: [variable number private]
```

```Go
var thousand16 uint16 = 1000
```

### <a id="thousand32" href="#thousand32">var thousand32</a>

```
searchKey: runtime_test.thousand32
tags: [variable number private]
```

```Go
var thousand32 uint32 = 1000
```

### <a id="thousand64" href="#thousand64">var thousand64</a>

```
searchKey: runtime_test.thousand64
tags: [variable number private]
```

```Go
var thousand64 uint64 = 1000
```

### <a id="tinyByteSink" href="#tinyByteSink">var tinyByteSink</a>

```
searchKey: runtime_test.tinyByteSink
tags: [variable number private]
```

```Go
var tinyByteSink *byte
```

### <a id="tinyObj12Sink" href="#tinyObj12Sink">var tinyObj12Sink</a>

```
searchKey: runtime_test.tinyObj12Sink
tags: [variable struct private]
```

```Go
var tinyObj12Sink *obj12
```

### <a id="tinyUint32Sink" href="#tinyUint32Sink">var tinyUint32Sink</a>

```
searchKey: runtime_test.tinyUint32Sink
tags: [variable number private]
```

```Go
var tinyUint32Sink *uint32
```

### <a id="tl" href="#tl">var tl</a>

```
searchKey: runtime_test.tl
tags: [variable array number private]
```

```Go
var tl TL
```

### <a id="tm" href="#tm">var tm</a>

```
searchKey: runtime_test.tm
tags: [variable number private]
```

```Go
var tm TM
```

### <a id="toRemove" href="#toRemove">var toRemove</a>

```
searchKey: runtime_test.toRemove
tags: [variable array string private]
```

```Go
var toRemove []string
```

### <a id="ts" href="#ts">var ts</a>

```
searchKey: runtime_test.ts
tags: [variable number private]
```

```Go
var ts TS
```

### <a id="wg" href="#wg">var wg</a>

```
searchKey: runtime_test.wg
tags: [variable struct private]
```

```Go
var wg sync.WaitGroup
```

### <a id="workSink" href="#workSink">var workSink</a>

```
searchKey: runtime_test.workSink
tags: [variable number private]
```

```Go
var workSink = 0
```

### <a id="x" href="#x">var x</a>

```
searchKey: runtime_test.x
tags: [variable array number private]
```

```Go
var x []int
```

### <a id="xsglobal" href="#xsglobal">var xsglobal</a>

```
searchKey: runtime_test.xsglobal
tags: [variable array number private]
```

```Go
var xsglobal []byte
```

### <a id="yes" href="#yes">var yes</a>

```
searchKey: runtime_test.yes
tags: [variable boolean private]
```

```Go
var yes bool = true
```

### <a id="zero16" href="#zero16">var zero16</a>

```
searchKey: runtime_test.zero16
tags: [variable number private]
```

```Go
var zero16 uint16 = 0
```

### <a id="zero16I" href="#zero16I">var zero16I</a>

```
searchKey: runtime_test.zero16I
tags: [variable number private]
```

```Go
var zero16I T16 = 0
```

### <a id="zero32" href="#zero32">var zero32</a>

```
searchKey: runtime_test.zero32
tags: [variable number private]
```

```Go
var zero32 uint32 = 0
```

### <a id="zero32I" href="#zero32I">var zero32I</a>

```
searchKey: runtime_test.zero32I
tags: [variable number private]
```

```Go
var zero32I T32 = 0
```

### <a id="zero64" href="#zero64">var zero64</a>

```
searchKey: runtime_test.zero64
tags: [variable number private]
```

```Go
var zero64 uint64 = 0
```

### <a id="zero64I" href="#zero64I">var zero64I</a>

```
searchKey: runtime_test.zero64I
tags: [variable number private]
```

```Go
var zero64I T64 = 0
```

### <a id="zerobig" href="#zerobig">var zerobig</a>

```
searchKey: runtime_test.zerobig
tags: [variable array number private]
```

```Go
var zerobig [512]byte
```

### <a id="zeroslice" href="#zeroslice">var zeroslice</a>

```
searchKey: runtime_test.zeroslice
tags: [variable array number private]
```

```Go
var zeroslice []byte = nil
```

### <a id="zerosliceI" href="#zerosliceI">var zerosliceI</a>

```
searchKey: runtime_test.zerosliceI
tags: [variable array number private]
```

```Go
var zerosliceI Tslice = nil
```

### <a id="zerostr" href="#zerostr">var zerostr</a>

```
searchKey: runtime_test.zerostr
tags: [variable string private]
```

```Go
var zerostr string = ""
```

### <a id="zerostrI" href="#zerostrI">var zerostrI</a>

```
searchKey: runtime_test.zerostrI
tags: [variable string private]
```

```Go
var zerostrI Tstr = ""
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="BigKey" href="#BigKey">type BigKey [3]int64</a>

```
searchKey: runtime_test.BigKey
tags: [array number private]
```

```Go
type BigKey [3]int64
```

### <a id="BigStruct" href="#BigStruct">type BigStruct struct</a>

```
searchKey: runtime_test.BigStruct
tags: [struct private]
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

### <a id="BigVal" href="#BigVal">type BigVal [3]int64</a>

```
searchKey: runtime_test.BigVal
tags: [array number private]
```

```Go
type BigVal [3]int64
```

### <a id="BytesKey" href="#BytesKey">type BytesKey struct</a>

```
searchKey: runtime_test.BytesKey
tags: [struct private]
```

```Go
type BytesKey struct {
	b []byte
}
```

#### <a id="BytesKey.bits" href="#BytesKey.bits">func (k *BytesKey) bits() int</a>

```
searchKey: runtime_test.BytesKey.bits
tags: [function private]
```

```Go
func (k *BytesKey) bits() int
```

#### <a id="BytesKey.clear" href="#BytesKey.clear">func (k *BytesKey) clear()</a>

```
searchKey: runtime_test.BytesKey.clear
tags: [function private]
```

```Go
func (k *BytesKey) clear()
```

#### <a id="BytesKey.flipBit" href="#BytesKey.flipBit">func (k *BytesKey) flipBit(i int)</a>

```
searchKey: runtime_test.BytesKey.flipBit
tags: [method private]
```

```Go
func (k *BytesKey) flipBit(i int)
```

#### <a id="BytesKey.hash" href="#BytesKey.hash">func (k *BytesKey) hash() uintptr</a>

```
searchKey: runtime_test.BytesKey.hash
tags: [function private]
```

```Go
func (k *BytesKey) hash() uintptr
```

#### <a id="BytesKey.name" href="#BytesKey.name">func (k *BytesKey) name() string</a>

```
searchKey: runtime_test.BytesKey.name
tags: [function private]
```

```Go
func (k *BytesKey) name() string
```

#### <a id="BytesKey.random" href="#BytesKey.random">func (k *BytesKey) random(r *rand.Rand)</a>

```
searchKey: runtime_test.BytesKey.random
tags: [method private]
```

```Go
func (k *BytesKey) random(r *rand.Rand)
```

### <a id="ComplexAlgKey" href="#ComplexAlgKey">type ComplexAlgKey struct</a>

```
searchKey: runtime_test.ComplexAlgKey
tags: [struct private]
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

### <a id="EfaceKey" href="#EfaceKey">type EfaceKey struct</a>

```
searchKey: runtime_test.EfaceKey
tags: [struct private]
```

```Go
type EfaceKey struct {
	i interface{}
}
```

#### <a id="EfaceKey.bits" href="#EfaceKey.bits">func (k *EfaceKey) bits() int</a>

```
searchKey: runtime_test.EfaceKey.bits
tags: [function private]
```

```Go
func (k *EfaceKey) bits() int
```

#### <a id="EfaceKey.clear" href="#EfaceKey.clear">func (k *EfaceKey) clear()</a>

```
searchKey: runtime_test.EfaceKey.clear
tags: [function private]
```

```Go
func (k *EfaceKey) clear()
```

#### <a id="EfaceKey.flipBit" href="#EfaceKey.flipBit">func (k *EfaceKey) flipBit(i int)</a>

```
searchKey: runtime_test.EfaceKey.flipBit
tags: [method private]
```

```Go
func (k *EfaceKey) flipBit(i int)
```

#### <a id="EfaceKey.hash" href="#EfaceKey.hash">func (k *EfaceKey) hash() uintptr</a>

```
searchKey: runtime_test.EfaceKey.hash
tags: [function private]
```

```Go
func (k *EfaceKey) hash() uintptr
```

#### <a id="EfaceKey.name" href="#EfaceKey.name">func (k *EfaceKey) name() string</a>

```
searchKey: runtime_test.EfaceKey.name
tags: [function private]
```

```Go
func (k *EfaceKey) name() string
```

#### <a id="EfaceKey.random" href="#EfaceKey.random">func (k *EfaceKey) random(r *rand.Rand)</a>

```
searchKey: runtime_test.EfaceKey.random
tags: [method private]
```

```Go
func (k *EfaceKey) random(r *rand.Rand)
```

### <a id="FloatInt" href="#FloatInt">type FloatInt struct</a>

```
searchKey: runtime_test.FloatInt
tags: [struct private]
```

```Go
type FloatInt struct {
	x float64
	y int
}
```

### <a id="HashSet" href="#HashSet">type HashSet struct</a>

```
searchKey: runtime_test.HashSet
tags: [struct private]
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
tags: [function private]
```

```Go
func newHashSet() *HashSet
```

#### <a id="HashSet.add" href="#HashSet.add">func (s *HashSet) add(h uintptr)</a>

```
searchKey: runtime_test.HashSet.add
tags: [method private]
```

```Go
func (s *HashSet) add(h uintptr)
```

#### <a id="HashSet.addB" href="#HashSet.addB">func (s *HashSet) addB(x []byte)</a>

```
searchKey: runtime_test.HashSet.addB
tags: [method private]
```

```Go
func (s *HashSet) addB(x []byte)
```

#### <a id="HashSet.addS" href="#HashSet.addS">func (s *HashSet) addS(x string)</a>

```
searchKey: runtime_test.HashSet.addS
tags: [method private]
```

```Go
func (s *HashSet) addS(x string)
```

#### <a id="HashSet.addS_seed" href="#HashSet.addS_seed">func (s *HashSet) addS_seed(x string, seed uintptr)</a>

```
searchKey: runtime_test.HashSet.addS_seed
tags: [method private]
```

```Go
func (s *HashSet) addS_seed(x string, seed uintptr)
```

#### <a id="HashSet.check" href="#HashSet.check">func (s *HashSet) check(t *testing.T)</a>

```
searchKey: runtime_test.HashSet.check
tags: [method private]
```

```Go
func (s *HashSet) check(t *testing.T)
```

### <a id="I" href="#I">type I interface</a>

```
searchKey: runtime_test.I
tags: [interface private]
```

```Go
type I interface {
	M()
}
```

### <a id="I1" href="#I1">type I1 interface</a>

```
searchKey: runtime_test.I1
tags: [interface private]
```

```Go
type I1 interface {
	Method1()
}
```

### <a id="I2" href="#I2">type I2 interface</a>

```
searchKey: runtime_test.I2
tags: [interface private]
```

```Go
type I2 interface {
	Method1()
	Method2()
}
```

### <a id="Iface" href="#Iface">type Iface interface</a>

```
searchKey: runtime_test.Iface
tags: [interface private]
```

```Go
type Iface interface {
	f()
}
```

### <a id="IfaceImpl" href="#IfaceImpl">type IfaceImpl int</a>

```
searchKey: runtime_test.IfaceImpl
tags: [number private]
```

```Go
type IfaceImpl int
```

#### <a id="IfaceImpl.f" href="#IfaceImpl.f">func (IfaceImpl) f()</a>

```
searchKey: runtime_test.IfaceImpl.f
tags: [function private]
```

```Go
func (IfaceImpl) f()
```

### <a id="IfaceKey" href="#IfaceKey">type IfaceKey struct</a>

```
searchKey: runtime_test.IfaceKey
tags: [struct private]
```

```Go
type IfaceKey struct {
	i interface {
		F()
	}
}
```

#### <a id="IfaceKey.bits" href="#IfaceKey.bits">func (k *IfaceKey) bits() int</a>

```
searchKey: runtime_test.IfaceKey.bits
tags: [function private]
```

```Go
func (k *IfaceKey) bits() int
```

#### <a id="IfaceKey.clear" href="#IfaceKey.clear">func (k *IfaceKey) clear()</a>

```
searchKey: runtime_test.IfaceKey.clear
tags: [function private]
```

```Go
func (k *IfaceKey) clear()
```

#### <a id="IfaceKey.flipBit" href="#IfaceKey.flipBit">func (k *IfaceKey) flipBit(i int)</a>

```
searchKey: runtime_test.IfaceKey.flipBit
tags: [method private]
```

```Go
func (k *IfaceKey) flipBit(i int)
```

#### <a id="IfaceKey.hash" href="#IfaceKey.hash">func (k *IfaceKey) hash() uintptr</a>

```
searchKey: runtime_test.IfaceKey.hash
tags: [function private]
```

```Go
func (k *IfaceKey) hash() uintptr
```

#### <a id="IfaceKey.name" href="#IfaceKey.name">func (k *IfaceKey) name() string</a>

```
searchKey: runtime_test.IfaceKey.name
tags: [function private]
```

```Go
func (k *IfaceKey) name() string
```

#### <a id="IfaceKey.random" href="#IfaceKey.random">func (k *IfaceKey) random(r *rand.Rand)</a>

```
searchKey: runtime_test.IfaceKey.random
tags: [method private]
```

```Go
func (k *IfaceKey) random(r *rand.Rand)
```

### <a id="Int32Key" href="#Int32Key">type Int32Key struct</a>

```
searchKey: runtime_test.Int32Key
tags: [struct private]
```

```Go
type Int32Key struct {
	i uint32
}
```

#### <a id="Int32Key.bits" href="#Int32Key.bits">func (k *Int32Key) bits() int</a>

```
searchKey: runtime_test.Int32Key.bits
tags: [function private]
```

```Go
func (k *Int32Key) bits() int
```

#### <a id="Int32Key.clear" href="#Int32Key.clear">func (k *Int32Key) clear()</a>

```
searchKey: runtime_test.Int32Key.clear
tags: [function private]
```

```Go
func (k *Int32Key) clear()
```

#### <a id="Int32Key.flipBit" href="#Int32Key.flipBit">func (k *Int32Key) flipBit(i int)</a>

```
searchKey: runtime_test.Int32Key.flipBit
tags: [method private]
```

```Go
func (k *Int32Key) flipBit(i int)
```

#### <a id="Int32Key.hash" href="#Int32Key.hash">func (k *Int32Key) hash() uintptr</a>

```
searchKey: runtime_test.Int32Key.hash
tags: [function private]
```

```Go
func (k *Int32Key) hash() uintptr
```

#### <a id="Int32Key.name" href="#Int32Key.name">func (k *Int32Key) name() string</a>

```
searchKey: runtime_test.Int32Key.name
tags: [function private]
```

```Go
func (k *Int32Key) name() string
```

#### <a id="Int32Key.random" href="#Int32Key.random">func (k *Int32Key) random(r *rand.Rand)</a>

```
searchKey: runtime_test.Int32Key.random
tags: [method private]
```

```Go
func (k *Int32Key) random(r *rand.Rand)
```

### <a id="Int64Key" href="#Int64Key">type Int64Key struct</a>

```
searchKey: runtime_test.Int64Key
tags: [struct private]
```

```Go
type Int64Key struct {
	i uint64
}
```

#### <a id="Int64Key.bits" href="#Int64Key.bits">func (k *Int64Key) bits() int</a>

```
searchKey: runtime_test.Int64Key.bits
tags: [function private]
```

```Go
func (k *Int64Key) bits() int
```

#### <a id="Int64Key.clear" href="#Int64Key.clear">func (k *Int64Key) clear()</a>

```
searchKey: runtime_test.Int64Key.clear
tags: [function private]
```

```Go
func (k *Int64Key) clear()
```

#### <a id="Int64Key.flipBit" href="#Int64Key.flipBit">func (k *Int64Key) flipBit(i int)</a>

```
searchKey: runtime_test.Int64Key.flipBit
tags: [method private]
```

```Go
func (k *Int64Key) flipBit(i int)
```

#### <a id="Int64Key.hash" href="#Int64Key.hash">func (k *Int64Key) hash() uintptr</a>

```
searchKey: runtime_test.Int64Key.hash
tags: [function private]
```

```Go
func (k *Int64Key) hash() uintptr
```

#### <a id="Int64Key.name" href="#Int64Key.name">func (k *Int64Key) name() string</a>

```
searchKey: runtime_test.Int64Key.name
tags: [function private]
```

```Go
func (k *Int64Key) name() string
```

#### <a id="Int64Key.random" href="#Int64Key.random">func (k *Int64Key) random(r *rand.Rand)</a>

```
searchKey: runtime_test.Int64Key.random
tags: [method private]
```

```Go
func (k *Int64Key) random(r *rand.Rand)
```

### <a id="Key" href="#Key">type Key interface</a>

```
searchKey: runtime_test.Key
tags: [interface private]
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

### <a id="LargeStruct" href="#LargeStruct">type LargeStruct struct</a>

```
searchKey: runtime_test.LargeStruct
tags: [struct private]
```

```Go
type LargeStruct struct {
	x [16][]byte
}
```

### <a id="Matrix" href="#Matrix">type Matrix [][]float64</a>

```
searchKey: runtime_test.Matrix
tags: [array array number private]
```

```Go
type Matrix [][]float64
```

#### <a id="makeMatrix" href="#makeMatrix">func makeMatrix(n int) Matrix</a>

```
searchKey: runtime_test.makeMatrix
tags: [method private]
```

```Go
func makeMatrix(n int) Matrix
```

### <a id="MyNode" href="#MyNode">type MyNode struct</a>

```
searchKey: runtime_test.MyNode
tags: [struct private]
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
tags: [method private]
```

```Go
func toMyNode(node *LFNode) *MyNode
```

### <a id="Node1" href="#Node1">type Node1 struct</a>

```
searchKey: runtime_test.Node1
tags: [struct private]
```

```Go
type Node1 struct {
	Value       [1]uintptr
	Left, Right *byte
}
```

### <a id="Node1024" href="#Node1024">type Node1024 struct</a>

```
searchKey: runtime_test.Node1024
tags: [struct private]
```

```Go
type Node1024 struct {
	Value       [1024]uintptr
	Left, Right *byte
}
```

### <a id="Node124" href="#Node124">type Node124 struct</a>

```
searchKey: runtime_test.Node124
tags: [struct private]
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
tags: [struct private]
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
tags: [struct private]
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
tags: [struct private]
```

```Go
type Node130 struct {
	Value       [130]uintptr
	Left, Right *byte
}
```

### <a id="Node64" href="#Node64">type Node64 struct</a>

```
searchKey: runtime_test.Node64
tags: [struct private]
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
tags: [struct private]
```

```Go
type Node64Dead struct {
	Left, Right *byte
	Value       [64]uintptr
}
```

### <a id="Node8" href="#Node8">type Node8 struct</a>

```
searchKey: runtime_test.Node8
tags: [struct private]
```

```Go
type Node8 struct {
	Value       [8]uintptr
	Left, Right *byte
}
```

### <a id="Object1" href="#Object1">type Object1 struct</a>

```
searchKey: runtime_test.Object1
tags: [struct private]
```

```Go
type Object1 struct {
	Something []byte
}
```

### <a id="Object2" href="#Object2">type Object2 struct</a>

```
searchKey: runtime_test.Object2
tags: [struct private]
```

```Go
type Object2 struct {
	Something byte
}
```

### <a id="Ptr" href="#Ptr">type Ptr struct</a>

```
searchKey: runtime_test.Ptr
tags: [struct private]
```

```Go
type Ptr struct {
	*byte
}
```

### <a id="PtrScalar" href="#PtrScalar">type PtrScalar struct</a>

```
searchKey: runtime_test.PtrScalar
tags: [struct private]
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

### <a id="ScalarPtr" href="#ScalarPtr">type ScalarPtr struct</a>

```
searchKey: runtime_test.ScalarPtr
tags: [struct private]
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

### <a id="T16" href="#T16">type T16 uint16</a>

```
searchKey: runtime_test.T16
tags: [number private]
```

```Go
type T16 uint16
```

#### <a id="T16.Method1" href="#T16.Method1">func (T16) Method1()</a>

```
searchKey: runtime_test.T16.Method1
tags: [function private]
```

```Go
func (T16) Method1()
```

### <a id="T32" href="#T32">type T32 uint32</a>

```
searchKey: runtime_test.T32
tags: [number private]
```

```Go
type T32 uint32
```

#### <a id="T32.Method1" href="#T32.Method1">func (T32) Method1()</a>

```
searchKey: runtime_test.T32.Method1
tags: [function private]
```

```Go
func (T32) Method1()
```

### <a id="T64" href="#T64">type T64 uint64</a>

```
searchKey: runtime_test.T64
tags: [number private]
```

```Go
type T64 uint64
```

#### <a id="T64.Method1" href="#T64.Method1">func (T64) Method1()</a>

```
searchKey: runtime_test.T64.Method1
tags: [function private]
```

```Go
func (T64) Method1()
```

### <a id="T8" href="#T8">type T8 uint8</a>

```
searchKey: runtime_test.T8
tags: [number private]
```

```Go
type T8 uint8
```

#### <a id="T8.Method1" href="#T8.Method1">func (T8) Method1()</a>

```
searchKey: runtime_test.T8.Method1
tags: [function private]
```

```Go
func (T8) Method1()
```

### <a id="TL" href="#TL">type TL [2]uintptr</a>

```
searchKey: runtime_test.TL
tags: [array number private]
```

```Go
type TL [2]uintptr
```

#### <a id="TL.Method1" href="#TL.Method1">func (TL) Method1()</a>

```
searchKey: runtime_test.TL.Method1
tags: [function private]
```

```Go
func (TL) Method1()
```

#### <a id="TL.Method2" href="#TL.Method2">func (TL) Method2()</a>

```
searchKey: runtime_test.TL.Method2
tags: [function private]
```

```Go
func (TL) Method2()
```

### <a id="TM" href="#TM">type TM uintptr</a>

```
searchKey: runtime_test.TM
tags: [number private]
```

```Go
type TM uintptr
```

#### <a id="TM.Method1" href="#TM.Method1">func (TM) Method1()</a>

```
searchKey: runtime_test.TM.Method1
tags: [function private]
```

```Go
func (TM) Method1()
```

#### <a id="TM.Method2" href="#TM.Method2">func (TM) Method2()</a>

```
searchKey: runtime_test.TM.Method2
tags: [function private]
```

```Go
func (TM) Method2()
```

### <a id="TS" href="#TS">type TS uint16</a>

```
searchKey: runtime_test.TS
tags: [number private]
```

```Go
type TS uint16
```

#### <a id="TS.Method1" href="#TS.Method1">func (TS) Method1()</a>

```
searchKey: runtime_test.TS.Method1
tags: [function private]
```

```Go
func (TS) Method1()
```

#### <a id="TS.Method2" href="#TS.Method2">func (TS) Method2()</a>

```
searchKey: runtime_test.TS.Method2
tags: [function private]
```

```Go
func (TS) Method2()
```

### <a id="Tint" href="#Tint">type Tint int</a>

```
searchKey: runtime_test.Tint
tags: [number private]
```

```Go
type Tint int // *Tint implements Tinter, interface{}

```

#### <a id="Tint.m" href="#Tint.m">func (t *Tint) m()</a>

```
searchKey: runtime_test.Tint.m
tags: [function private]
```

```Go
func (t *Tint) m()
```

### <a id="Tinter" href="#Tinter">type Tinter interface</a>

```
searchKey: runtime_test.Tinter
tags: [interface private]
```

```Go
type Tinter interface {
	m()
}
```

### <a id="Tintptr" href="#Tintptr">type Tintptr *int</a>

```
searchKey: runtime_test.Tintptr
tags: [number private]
```

```Go
type Tintptr *int // assignable to *int

```

### <a id="Tslice" href="#Tslice">type Tslice []byte</a>

```
searchKey: runtime_test.Tslice
tags: [array number private]
```

```Go
type Tslice []byte
```

#### <a id="Tslice.Method1" href="#Tslice.Method1">func (Tslice) Method1()</a>

```
searchKey: runtime_test.Tslice.Method1
tags: [function private]
```

```Go
func (Tslice) Method1()
```

### <a id="Tstr" href="#Tstr">type Tstr string</a>

```
searchKey: runtime_test.Tstr
tags: [string private]
```

```Go
type Tstr string
```

#### <a id="Tstr.Method1" href="#Tstr.Method1">func (Tstr) Method1()</a>

```
searchKey: runtime_test.Tstr.Method1
tags: [function private]
```

```Go
func (Tstr) Method1()
```

### <a id="acLink" href="#acLink">type acLink struct</a>

```
searchKey: runtime_test.acLink
tags: [struct private]
```

```Go
type acLink struct {
	x [1 << 20]byte
}
```

### <a id="atoi32Test" href="#atoi32Test">type atoi32Test struct</a>

```
searchKey: runtime_test.atoi32Test
tags: [struct private]
```

```Go
type atoi32Test struct {
	in  string
	out int32
	ok  bool
}
```

### <a id="atoi64Test" href="#atoi64Test">type atoi64Test struct</a>

```
searchKey: runtime_test.atoi64Test
tags: [struct private]
```

```Go
type atoi64Test struct {
	in  string
	out int64
	ok  bool
}
```

### <a id="bigBuf" href="#bigBuf">type bigBuf [4096]byte</a>

```
searchKey: runtime_test.bigBuf
tags: [array number private]
```

```Go
type bigBuf [4 * 1024]byte
```

### <a id="bigStruct" href="#bigStruct">type bigStruct struct</a>

```
searchKey: runtime_test.bigStruct
tags: [struct private]
```

```Go
type bigStruct struct {
	x, y, z, w, p, q int64
}
```

### <a id="bigValue" href="#bigValue">type bigValue struct</a>

```
searchKey: runtime_test.bigValue
tags: [struct private]
```

```Go
type bigValue struct {
	fill uint64
	it   bool
	up   string
}
```

### <a id="buildexe" href="#buildexe">type buildexe struct</a>

```
searchKey: runtime_test.buildexe
tags: [struct private]
```

```Go
type buildexe struct {
	exe string
	err error
}
```

### <a id="canString" href="#canString">type canString int</a>

```
searchKey: runtime_test.canString
tags: [number private]
```

```Go
type canString int
```

#### <a id="canString.String" href="#canString.String">func (c canString) String() string</a>

```
searchKey: runtime_test.canString.String
tags: [function private]
```

```Go
func (c canString) String() string
```

### <a id="chunk" href="#chunk">type chunk [17]byte</a>

```
searchKey: runtime_test.chunk
tags: [array number private]
```

```Go
type chunk [17]byte
```

### <a id="containsBigStruct" href="#containsBigStruct">type containsBigStruct struct</a>

```
searchKey: runtime_test.containsBigStruct
tags: [struct private]
```

```Go
type containsBigStruct struct {
	element bigStruct
}
```

#### <a id="sideeffect2" href="#sideeffect2">func sideeffect2(in containsBigStruct) containsBigStruct</a>

```
searchKey: runtime_test.sideeffect2
tags: [method private]
```

```Go
func sideeffect2(in containsBigStruct) containsBigStruct
```

### <a id="empty" href="#empty">type empty struct{}</a>

```
searchKey: runtime_test.empty
tags: [struct private]
```

```Go
type empty struct {
}
```

### <a id="fInter" href="#fInter">type fInter uint64</a>

```
searchKey: runtime_test.fInter
tags: [number private]
```

```Go
type fInter uint64
```

#### <a id="fInter.F" href="#fInter.F">func (x fInter) F()</a>

```
searchKey: runtime_test.fInter.F
tags: [function private]
```

```Go
func (x fInter) F()
```

### <a id="fakeTimeFrame" href="#fakeTimeFrame">type fakeTimeFrame struct</a>

```
searchKey: runtime_test.fakeTimeFrame
tags: [struct private]
```

```Go
type fakeTimeFrame struct {
	time uint64
	data string
}
```

### <a id="foo" href="#foo">type foo struct{}</a>

```
searchKey: runtime_test.foo
tags: [struct private]
```

```Go
type foo struct {
}
```

#### <a id="foo.method1" href="#foo.method1">func (f *foo) method1()</a>

```
searchKey: runtime_test.foo.method1
tags: [function private]
```

```Go
func (f *foo) method1()
```

#### <a id="foo.method2" href="#foo.method2">func (f *foo) method2()</a>

```
searchKey: runtime_test.foo.method2
tags: [function private]
```

```Go
func (f *foo) method2()
```

### <a id="myError" href="#myError">type myError struct{}</a>

```
searchKey: runtime_test.myError
tags: [struct private]
```

```Go
type myError struct {
}
```

#### <a id="myError.Error" href="#myError.Error">func (myError) Error() string</a>

```
searchKey: runtime_test.myError.Error
tags: [function private]
```

```Go
func (myError) Error() string
```

### <a id="nonSSAable" href="#nonSSAable">type nonSSAable [128]byte</a>

```
searchKey: runtime_test.nonSSAable
tags: [array number private]
```

```Go
type nonSSAable [128]byte
```

#### <a id="mknonSSAable" href="#mknonSSAable">func mknonSSAable() nonSSAable</a>

```
searchKey: runtime_test.mknonSSAable
tags: [function private]
```

```Go
func mknonSSAable() nonSSAable
```

### <a id="obj12" href="#obj12">type obj12 struct</a>

```
searchKey: runtime_test.obj12
tags: [struct private]
```

```Go
type obj12 struct {
	a uint64
	b uint32
}
```

### <a id="objtype" href="#objtype">type objtype [320]byte</a>

```
searchKey: runtime_test.objtype
tags: [array number private]
```

```Go
type objtype [objsize]byte
```

#### <a id="adjStringChunk" href="#adjStringChunk">func adjStringChunk() (string, *objtype)</a>

```
searchKey: runtime_test.adjStringChunk
tags: [function private]
```

```Go
func adjStringChunk() (string, *objtype)
```

### <a id="point" href="#point">type point struct</a>

```
searchKey: runtime_test.point
tags: [struct private]
```

```Go
type point struct {
	x, y *int
}
```

#### <a id="point.negate" href="#point.negate">func (p *point) negate()</a>

```
searchKey: runtime_test.point.negate
tags: [function private]
```

```Go
func (p *point) negate()
```

### <a id="response" href="#response">type response struct{}</a>

```
searchKey: runtime_test.response
tags: [struct private]
```

```Go
type response struct {
}
```

#### <a id="doRequest" href="#doRequest">func doRequest(useSelect bool) (*response, error)</a>

```
searchKey: runtime_test.doRequest
tags: [method private]
```

```Go
func doRequest(useSelect bool) (*response, error)
```

### <a id="struct0" href="#struct0">type struct0 struct{}</a>

```
searchKey: runtime_test.struct0
tags: [struct private]
```

```Go
type struct0 struct{}
```

### <a id="struct24" href="#struct24">type struct24 struct</a>

```
searchKey: runtime_test.struct24
tags: [struct private]
```

```Go
type struct24 struct{ a, b, c int64 }
```

### <a id="struct32" href="#struct32">type struct32 struct</a>

```
searchKey: runtime_test.struct32
tags: [struct private]
```

```Go
type struct32 struct{ a, b, c, d int64 }
```

### <a id="struct40" href="#struct40">type struct40 struct</a>

```
searchKey: runtime_test.struct40
tags: [struct private]
```

```Go
type struct40 struct{ a, b, c, d, e int64 }
```

### <a id="structWithMethod" href="#structWithMethod">type structWithMethod struct{}</a>

```
searchKey: runtime_test.structWithMethod
tags: [struct private]
```

```Go
type structWithMethod struct{}
```

#### <a id="structWithMethod.caller" href="#structWithMethod.caller">func (s structWithMethod) caller() string</a>

```
searchKey: runtime_test.structWithMethod.caller
tags: [function private]
```

```Go
func (s structWithMethod) caller() string
```

#### <a id="structWithMethod.callers" href="#structWithMethod.callers">func (s structWithMethod) callers() []uintptr</a>

```
searchKey: runtime_test.structWithMethod.callers
tags: [function private]
```

```Go
func (s structWithMethod) callers() []uintptr
```

#### <a id="structWithMethod.nop" href="#structWithMethod.nop">func (s structWithMethod) nop()</a>

```
searchKey: runtime_test.structWithMethod.nop
tags: [function private]
```

```Go
func (s structWithMethod) nop()
```

#### <a id="structWithMethod.stack" href="#structWithMethod.stack">func (s structWithMethod) stack() string</a>

```
searchKey: runtime_test.structWithMethod.stack
tags: [function private]
```

```Go
func (s structWithMethod) stack() string
```

### <a id="xtreeNode" href="#xtreeNode">type xtreeNode struct</a>

```
searchKey: runtime_test.xtreeNode
tags: [struct private]
```

```Go
type xtreeNode struct {
	l, r *xtreeNode
}
```

#### <a id="makeTree" href="#makeTree">func makeTree(d int) *xtreeNode</a>

```
searchKey: runtime_test.makeTree
tags: [method private]
```

```Go
func makeTree(d int) *xtreeNode
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkAlignedLoad" href="#BenchmarkAlignedLoad">func BenchmarkAlignedLoad(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAlignedLoad
tags: [method private benchmark]
```

```Go
func BenchmarkAlignedLoad(b *testing.B)
```

### <a id="BenchmarkAllocation" href="#BenchmarkAllocation">func BenchmarkAllocation(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAllocation
tags: [method private benchmark]
```

```Go
func BenchmarkAllocation(b *testing.B)
```

### <a id="BenchmarkAppend" href="#BenchmarkAppend">func BenchmarkAppend(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppend
tags: [method private benchmark]
```

```Go
func BenchmarkAppend(b *testing.B)
```

### <a id="BenchmarkAppendGrowByte" href="#BenchmarkAppendGrowByte">func BenchmarkAppendGrowByte(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendGrowByte
tags: [method private benchmark]
```

```Go
func BenchmarkAppendGrowByte(b *testing.B)
```

### <a id="BenchmarkAppendGrowString" href="#BenchmarkAppendGrowString">func BenchmarkAppendGrowString(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendGrowString
tags: [method private benchmark]
```

```Go
func BenchmarkAppendGrowString(b *testing.B)
```

### <a id="BenchmarkAppendInPlace" href="#BenchmarkAppendInPlace">func BenchmarkAppendInPlace(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendInPlace
tags: [method private benchmark]
```

```Go
func BenchmarkAppendInPlace(b *testing.B)
```

BenchmarkAppendInPlace tests the performance of append when the result is being written back to the same slice. In order for the in-place optimization to occur, the slice must be referred to by address; using a global is an easy way to trigger that. We test the "grow" and "no grow" paths separately, but not the "normal" (occasionally grow) path, because it is a blend of the other two. We use small numbers and small sizes in an attempt to avoid benchmarking memory allocation and copying. We use scalars instead of pointers in an attempt to avoid benchmarking the write barriers. We benchmark four common sizes (byte, pointer, string/interface, slice), and one larger size. 

### <a id="BenchmarkAppendSlice" href="#BenchmarkAppendSlice">func BenchmarkAppendSlice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendSlice
tags: [method private benchmark]
```

```Go
func BenchmarkAppendSlice(b *testing.B)
```

### <a id="BenchmarkAppendSliceLarge" href="#BenchmarkAppendSliceLarge">func BenchmarkAppendSliceLarge(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendSliceLarge
tags: [method private benchmark]
```

```Go
func BenchmarkAppendSliceLarge(b *testing.B)
```

### <a id="BenchmarkAppendSpecialCase" href="#BenchmarkAppendSpecialCase">func BenchmarkAppendSpecialCase(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendSpecialCase
tags: [method private benchmark]
```

```Go
func BenchmarkAppendSpecialCase(b *testing.B)
```

### <a id="BenchmarkAppendStr" href="#BenchmarkAppendStr">func BenchmarkAppendStr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendStr
tags: [method private benchmark]
```

```Go
func BenchmarkAppendStr(b *testing.B)
```

### <a id="BenchmarkArrayEqual" href="#BenchmarkArrayEqual">func BenchmarkArrayEqual(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkArrayEqual
tags: [method private benchmark]
```

```Go
func BenchmarkArrayEqual(b *testing.B)
```

### <a id="BenchmarkAssertE2E" href="#BenchmarkAssertE2E">func BenchmarkAssertE2E(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2E
tags: [method private benchmark]
```

```Go
func BenchmarkAssertE2E(b *testing.B)
```

### <a id="BenchmarkAssertE2E2" href="#BenchmarkAssertE2E2">func BenchmarkAssertE2E2(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2E2
tags: [method private benchmark]
```

```Go
func BenchmarkAssertE2E2(b *testing.B)
```

### <a id="BenchmarkAssertE2E2Blank" href="#BenchmarkAssertE2E2Blank">func BenchmarkAssertE2E2Blank(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2E2Blank
tags: [method private benchmark]
```

```Go
func BenchmarkAssertE2E2Blank(b *testing.B)
```

### <a id="BenchmarkAssertE2I" href="#BenchmarkAssertE2I">func BenchmarkAssertE2I(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2I
tags: [method private benchmark]
```

```Go
func BenchmarkAssertE2I(b *testing.B)
```

### <a id="BenchmarkAssertE2T" href="#BenchmarkAssertE2T">func BenchmarkAssertE2T(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2T
tags: [method private benchmark]
```

```Go
func BenchmarkAssertE2T(b *testing.B)
```

### <a id="BenchmarkAssertE2T2" href="#BenchmarkAssertE2T2">func BenchmarkAssertE2T2(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2T2
tags: [method private benchmark]
```

```Go
func BenchmarkAssertE2T2(b *testing.B)
```

### <a id="BenchmarkAssertE2T2Blank" href="#BenchmarkAssertE2T2Blank">func BenchmarkAssertE2T2Blank(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2T2Blank
tags: [method private benchmark]
```

```Go
func BenchmarkAssertE2T2Blank(b *testing.B)
```

### <a id="BenchmarkAssertE2TLarge" href="#BenchmarkAssertE2TLarge">func BenchmarkAssertE2TLarge(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2TLarge
tags: [method private benchmark]
```

```Go
func BenchmarkAssertE2TLarge(b *testing.B)
```

### <a id="BenchmarkAssertI2E" href="#BenchmarkAssertI2E">func BenchmarkAssertI2E(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertI2E
tags: [method private benchmark]
```

```Go
func BenchmarkAssertI2E(b *testing.B)
```

### <a id="BenchmarkAssertI2E2" href="#BenchmarkAssertI2E2">func BenchmarkAssertI2E2(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertI2E2
tags: [method private benchmark]
```

```Go
func BenchmarkAssertI2E2(b *testing.B)
```

### <a id="BenchmarkAssertI2E2Blank" href="#BenchmarkAssertI2E2Blank">func BenchmarkAssertI2E2Blank(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertI2E2Blank
tags: [method private benchmark]
```

```Go
func BenchmarkAssertI2E2Blank(b *testing.B)
```

### <a id="BenchmarkAssertI2I" href="#BenchmarkAssertI2I">func BenchmarkAssertI2I(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertI2I
tags: [method private benchmark]
```

```Go
func BenchmarkAssertI2I(b *testing.B)
```

### <a id="BenchmarkAssertI2T" href="#BenchmarkAssertI2T">func BenchmarkAssertI2T(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertI2T
tags: [method private benchmark]
```

```Go
func BenchmarkAssertI2T(b *testing.B)
```

### <a id="BenchmarkBigKeyMap" href="#BenchmarkBigKeyMap">func BenchmarkBigKeyMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkBigKeyMap
tags: [method private benchmark]
```

```Go
func BenchmarkBigKeyMap(b *testing.B)
```

### <a id="BenchmarkBigValMap" href="#BenchmarkBigValMap">func BenchmarkBigValMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkBigValMap
tags: [method private benchmark]
```

```Go
func BenchmarkBigValMap(b *testing.B)
```

### <a id="BenchmarkBulkWriteBarrier" href="#BenchmarkBulkWriteBarrier">func BenchmarkBulkWriteBarrier(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkBulkWriteBarrier
tags: [method private benchmark]
```

```Go
func BenchmarkBulkWriteBarrier(b *testing.B)
```

### <a id="BenchmarkCallClosure" href="#BenchmarkCallClosure">func BenchmarkCallClosure(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCallClosure
tags: [method private benchmark]
```

```Go
func BenchmarkCallClosure(b *testing.B)
```

### <a id="BenchmarkCallClosure1" href="#BenchmarkCallClosure1">func BenchmarkCallClosure1(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCallClosure1
tags: [method private benchmark]
```

```Go
func BenchmarkCallClosure1(b *testing.B)
```

### <a id="BenchmarkCallClosure2" href="#BenchmarkCallClosure2">func BenchmarkCallClosure2(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCallClosure2
tags: [method private benchmark]
```

```Go
func BenchmarkCallClosure2(b *testing.B)
```

### <a id="BenchmarkCallClosure3" href="#BenchmarkCallClosure3">func BenchmarkCallClosure3(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCallClosure3
tags: [method private benchmark]
```

```Go
func BenchmarkCallClosure3(b *testing.B)
```

### <a id="BenchmarkCallClosure4" href="#BenchmarkCallClosure4">func BenchmarkCallClosure4(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCallClosure4
tags: [method private benchmark]
```

```Go
func BenchmarkCallClosure4(b *testing.B)
```

### <a id="BenchmarkChanClosed" href="#BenchmarkChanClosed">func BenchmarkChanClosed(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanClosed
tags: [method private benchmark]
```

```Go
func BenchmarkChanClosed(b *testing.B)
```

### <a id="BenchmarkChanContended" href="#BenchmarkChanContended">func BenchmarkChanContended(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanContended
tags: [method private benchmark]
```

```Go
func BenchmarkChanContended(b *testing.B)
```

### <a id="BenchmarkChanCreation" href="#BenchmarkChanCreation">func BenchmarkChanCreation(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanCreation
tags: [method private benchmark]
```

```Go
func BenchmarkChanCreation(b *testing.B)
```

### <a id="BenchmarkChanNonblocking" href="#BenchmarkChanNonblocking">func BenchmarkChanNonblocking(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanNonblocking
tags: [method private benchmark]
```

```Go
func BenchmarkChanNonblocking(b *testing.B)
```

### <a id="BenchmarkChanPopular" href="#BenchmarkChanPopular">func BenchmarkChanPopular(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanPopular
tags: [method private benchmark]
```

```Go
func BenchmarkChanPopular(b *testing.B)
```

### <a id="BenchmarkChanProdCons0" href="#BenchmarkChanProdCons0">func BenchmarkChanProdCons0(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanProdCons0
tags: [method private benchmark]
```

```Go
func BenchmarkChanProdCons0(b *testing.B)
```

### <a id="BenchmarkChanProdCons10" href="#BenchmarkChanProdCons10">func BenchmarkChanProdCons10(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanProdCons10
tags: [method private benchmark]
```

```Go
func BenchmarkChanProdCons10(b *testing.B)
```

### <a id="BenchmarkChanProdCons100" href="#BenchmarkChanProdCons100">func BenchmarkChanProdCons100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanProdCons100
tags: [method private benchmark]
```

```Go
func BenchmarkChanProdCons100(b *testing.B)
```

### <a id="BenchmarkChanProdConsWork0" href="#BenchmarkChanProdConsWork0">func BenchmarkChanProdConsWork0(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanProdConsWork0
tags: [method private benchmark]
```

```Go
func BenchmarkChanProdConsWork0(b *testing.B)
```

### <a id="BenchmarkChanProdConsWork10" href="#BenchmarkChanProdConsWork10">func BenchmarkChanProdConsWork10(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanProdConsWork10
tags: [method private benchmark]
```

```Go
func BenchmarkChanProdConsWork10(b *testing.B)
```

### <a id="BenchmarkChanProdConsWork100" href="#BenchmarkChanProdConsWork100">func BenchmarkChanProdConsWork100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanProdConsWork100
tags: [method private benchmark]
```

```Go
func BenchmarkChanProdConsWork100(b *testing.B)
```

### <a id="BenchmarkChanSem" href="#BenchmarkChanSem">func BenchmarkChanSem(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanSem
tags: [method private benchmark]
```

```Go
func BenchmarkChanSem(b *testing.B)
```

### <a id="BenchmarkChanSync" href="#BenchmarkChanSync">func BenchmarkChanSync(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanSync
tags: [method private benchmark]
```

```Go
func BenchmarkChanSync(b *testing.B)
```

### <a id="BenchmarkChanSyncWork" href="#BenchmarkChanSyncWork">func BenchmarkChanSyncWork(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanSyncWork
tags: [method private benchmark]
```

```Go
func BenchmarkChanSyncWork(b *testing.B)
```

### <a id="BenchmarkChanUncontended" href="#BenchmarkChanUncontended">func BenchmarkChanUncontended(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanUncontended
tags: [method private benchmark]
```

```Go
func BenchmarkChanUncontended(b *testing.B)
```

### <a id="BenchmarkClearFat1024" href="#BenchmarkClearFat1024">func BenchmarkClearFat1024(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat1024
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat1024(b *testing.B)
```

### <a id="BenchmarkClearFat12" href="#BenchmarkClearFat12">func BenchmarkClearFat12(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat12
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat12(b *testing.B)
```

### <a id="BenchmarkClearFat128" href="#BenchmarkClearFat128">func BenchmarkClearFat128(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat128
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat128(b *testing.B)
```

### <a id="BenchmarkClearFat16" href="#BenchmarkClearFat16">func BenchmarkClearFat16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat16
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat16(b *testing.B)
```

### <a id="BenchmarkClearFat24" href="#BenchmarkClearFat24">func BenchmarkClearFat24(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat24
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat24(b *testing.B)
```

### <a id="BenchmarkClearFat256" href="#BenchmarkClearFat256">func BenchmarkClearFat256(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat256
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat256(b *testing.B)
```

### <a id="BenchmarkClearFat32" href="#BenchmarkClearFat32">func BenchmarkClearFat32(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat32
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat32(b *testing.B)
```

### <a id="BenchmarkClearFat40" href="#BenchmarkClearFat40">func BenchmarkClearFat40(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat40
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat40(b *testing.B)
```

### <a id="BenchmarkClearFat48" href="#BenchmarkClearFat48">func BenchmarkClearFat48(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat48
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat48(b *testing.B)
```

### <a id="BenchmarkClearFat512" href="#BenchmarkClearFat512">func BenchmarkClearFat512(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat512
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat512(b *testing.B)
```

### <a id="BenchmarkClearFat56" href="#BenchmarkClearFat56">func BenchmarkClearFat56(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat56
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat56(b *testing.B)
```

### <a id="BenchmarkClearFat64" href="#BenchmarkClearFat64">func BenchmarkClearFat64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat64
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat64(b *testing.B)
```

### <a id="BenchmarkClearFat8" href="#BenchmarkClearFat8">func BenchmarkClearFat8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat8
tags: [method private benchmark]
```

```Go
func BenchmarkClearFat8(b *testing.B)
```

### <a id="BenchmarkClosureCall" href="#BenchmarkClosureCall">func BenchmarkClosureCall(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClosureCall
tags: [method private benchmark]
```

```Go
func BenchmarkClosureCall(b *testing.B)
```

### <a id="BenchmarkCompareStringBig" href="#BenchmarkCompareStringBig">func BenchmarkCompareStringBig(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCompareStringBig
tags: [method private benchmark]
```

```Go
func BenchmarkCompareStringBig(b *testing.B)
```

### <a id="BenchmarkCompareStringBigUnaligned" href="#BenchmarkCompareStringBigUnaligned">func BenchmarkCompareStringBigUnaligned(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCompareStringBigUnaligned
tags: [method private benchmark]
```

```Go
func BenchmarkCompareStringBigUnaligned(b *testing.B)
```

### <a id="BenchmarkCompareStringDifferentLength" href="#BenchmarkCompareStringDifferentLength">func BenchmarkCompareStringDifferentLength(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCompareStringDifferentLength
tags: [method private benchmark]
```

```Go
func BenchmarkCompareStringDifferentLength(b *testing.B)
```

### <a id="BenchmarkCompareStringEqual" href="#BenchmarkCompareStringEqual">func BenchmarkCompareStringEqual(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCompareStringEqual
tags: [method private benchmark]
```

```Go
func BenchmarkCompareStringEqual(b *testing.B)
```

### <a id="BenchmarkCompareStringIdentical" href="#BenchmarkCompareStringIdentical">func BenchmarkCompareStringIdentical(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCompareStringIdentical
tags: [method private benchmark]
```

```Go
func BenchmarkCompareStringIdentical(b *testing.B)
```

### <a id="BenchmarkCompareStringSameLength" href="#BenchmarkCompareStringSameLength">func BenchmarkCompareStringSameLength(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCompareStringSameLength
tags: [method private benchmark]
```

```Go
func BenchmarkCompareStringSameLength(b *testing.B)
```

### <a id="BenchmarkComplex128DivDisInf" href="#BenchmarkComplex128DivDisInf">func BenchmarkComplex128DivDisInf(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkComplex128DivDisInf
tags: [method private benchmark]
```

```Go
func BenchmarkComplex128DivDisInf(b *testing.B)
```

### <a id="BenchmarkComplex128DivDisNaN" href="#BenchmarkComplex128DivDisNaN">func BenchmarkComplex128DivDisNaN(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkComplex128DivDisNaN
tags: [method private benchmark]
```

```Go
func BenchmarkComplex128DivDisNaN(b *testing.B)
```

### <a id="BenchmarkComplex128DivNisInf" href="#BenchmarkComplex128DivNisInf">func BenchmarkComplex128DivNisInf(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkComplex128DivNisInf
tags: [method private benchmark]
```

```Go
func BenchmarkComplex128DivNisInf(b *testing.B)
```

### <a id="BenchmarkComplex128DivNisNaN" href="#BenchmarkComplex128DivNisNaN">func BenchmarkComplex128DivNisNaN(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkComplex128DivNisNaN
tags: [method private benchmark]
```

```Go
func BenchmarkComplex128DivNisNaN(b *testing.B)
```

### <a id="BenchmarkComplex128DivNormal" href="#BenchmarkComplex128DivNormal">func BenchmarkComplex128DivNormal(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkComplex128DivNormal
tags: [method private benchmark]
```

```Go
func BenchmarkComplex128DivNormal(b *testing.B)
```

### <a id="BenchmarkComplexAlgMap" href="#BenchmarkComplexAlgMap">func BenchmarkComplexAlgMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkComplexAlgMap
tags: [method private benchmark]
```

```Go
func BenchmarkComplexAlgMap(b *testing.B)
```

### <a id="BenchmarkConcatStringAndBytes" href="#BenchmarkConcatStringAndBytes">func BenchmarkConcatStringAndBytes(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConcatStringAndBytes
tags: [method private benchmark]
```

```Go
func BenchmarkConcatStringAndBytes(b *testing.B)
```

### <a id="BenchmarkConvI2E" href="#BenchmarkConvI2E">func BenchmarkConvI2E(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvI2E
tags: [method private benchmark]
```

```Go
func BenchmarkConvI2E(b *testing.B)
```

### <a id="BenchmarkConvI2I" href="#BenchmarkConvI2I">func BenchmarkConvI2I(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvI2I
tags: [method private benchmark]
```

```Go
func BenchmarkConvI2I(b *testing.B)
```

### <a id="BenchmarkConvT2EByteSized" href="#BenchmarkConvT2EByteSized">func BenchmarkConvT2EByteSized(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2EByteSized
tags: [method private benchmark]
```

```Go
func BenchmarkConvT2EByteSized(b *testing.B)
```

### <a id="BenchmarkConvT2ELarge" href="#BenchmarkConvT2ELarge">func BenchmarkConvT2ELarge(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2ELarge
tags: [method private benchmark]
```

```Go
func BenchmarkConvT2ELarge(b *testing.B)
```

### <a id="BenchmarkConvT2ESmall" href="#BenchmarkConvT2ESmall">func BenchmarkConvT2ESmall(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2ESmall
tags: [method private benchmark]
```

```Go
func BenchmarkConvT2ESmall(b *testing.B)
```

### <a id="BenchmarkConvT2EUintptr" href="#BenchmarkConvT2EUintptr">func BenchmarkConvT2EUintptr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2EUintptr
tags: [method private benchmark]
```

```Go
func BenchmarkConvT2EUintptr(b *testing.B)
```

### <a id="BenchmarkConvT2Ezero" href="#BenchmarkConvT2Ezero">func BenchmarkConvT2Ezero(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2Ezero
tags: [method private benchmark]
```

```Go
func BenchmarkConvT2Ezero(b *testing.B)
```

### <a id="BenchmarkConvT2ILarge" href="#BenchmarkConvT2ILarge">func BenchmarkConvT2ILarge(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2ILarge
tags: [method private benchmark]
```

```Go
func BenchmarkConvT2ILarge(b *testing.B)
```

### <a id="BenchmarkConvT2ISmall" href="#BenchmarkConvT2ISmall">func BenchmarkConvT2ISmall(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2ISmall
tags: [method private benchmark]
```

```Go
func BenchmarkConvT2ISmall(b *testing.B)
```

### <a id="BenchmarkConvT2IUintptr" href="#BenchmarkConvT2IUintptr">func BenchmarkConvT2IUintptr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2IUintptr
tags: [method private benchmark]
```

```Go
func BenchmarkConvT2IUintptr(b *testing.B)
```

### <a id="BenchmarkCopy" href="#BenchmarkCopy">func BenchmarkCopy(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopy
tags: [method private benchmark]
```

```Go
func BenchmarkCopy(b *testing.B)
```

### <a id="BenchmarkCopyFat1024" href="#BenchmarkCopyFat1024">func BenchmarkCopyFat1024(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat1024
tags: [method private benchmark]
```

```Go
func BenchmarkCopyFat1024(b *testing.B)
```

### <a id="BenchmarkCopyFat12" href="#BenchmarkCopyFat12">func BenchmarkCopyFat12(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat12
tags: [method private benchmark]
```

```Go
func BenchmarkCopyFat12(b *testing.B)
```

### <a id="BenchmarkCopyFat128" href="#BenchmarkCopyFat128">func BenchmarkCopyFat128(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat128
tags: [method private benchmark]
```

```Go
func BenchmarkCopyFat128(b *testing.B)
```

### <a id="BenchmarkCopyFat16" href="#BenchmarkCopyFat16">func BenchmarkCopyFat16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat16
tags: [method private benchmark]
```

```Go
func BenchmarkCopyFat16(b *testing.B)
```

### <a id="BenchmarkCopyFat24" href="#BenchmarkCopyFat24">func BenchmarkCopyFat24(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat24
tags: [method private benchmark]
```

```Go
func BenchmarkCopyFat24(b *testing.B)
```

### <a id="BenchmarkCopyFat256" href="#BenchmarkCopyFat256">func BenchmarkCopyFat256(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat256
tags: [method private benchmark]
```

```Go
func BenchmarkCopyFat256(b *testing.B)
```

### <a id="BenchmarkCopyFat32" href="#BenchmarkCopyFat32">func BenchmarkCopyFat32(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat32
tags: [method private benchmark]
```

```Go
func BenchmarkCopyFat32(b *testing.B)
```

### <a id="BenchmarkCopyFat512" href="#BenchmarkCopyFat512">func BenchmarkCopyFat512(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat512
tags: [method private benchmark]
```

```Go
func BenchmarkCopyFat512(b *testing.B)
```

### <a id="BenchmarkCopyFat520" href="#BenchmarkCopyFat520">func BenchmarkCopyFat520(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat520
tags: [method private benchmark]
```

```Go
func BenchmarkCopyFat520(b *testing.B)
```

### <a id="BenchmarkCopyFat64" href="#BenchmarkCopyFat64">func BenchmarkCopyFat64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat64
tags: [method private benchmark]
```

```Go
func BenchmarkCopyFat64(b *testing.B)
```

### <a id="BenchmarkCopyFat8" href="#BenchmarkCopyFat8">func BenchmarkCopyFat8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat8
tags: [method private benchmark]
```

```Go
func BenchmarkCopyFat8(b *testing.B)
```

### <a id="BenchmarkCreateGoroutines" href="#BenchmarkCreateGoroutines">func BenchmarkCreateGoroutines(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCreateGoroutines
tags: [method private benchmark]
```

```Go
func BenchmarkCreateGoroutines(b *testing.B)
```

### <a id="BenchmarkCreateGoroutinesCapture" href="#BenchmarkCreateGoroutinesCapture">func BenchmarkCreateGoroutinesCapture(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCreateGoroutinesCapture
tags: [method private benchmark]
```

```Go
func BenchmarkCreateGoroutinesCapture(b *testing.B)
```

### <a id="BenchmarkCreateGoroutinesParallel" href="#BenchmarkCreateGoroutinesParallel">func BenchmarkCreateGoroutinesParallel(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCreateGoroutinesParallel
tags: [method private benchmark]
```

```Go
func BenchmarkCreateGoroutinesParallel(b *testing.B)
```

### <a id="BenchmarkCreateGoroutinesSingle" href="#BenchmarkCreateGoroutinesSingle">func BenchmarkCreateGoroutinesSingle(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCreateGoroutinesSingle
tags: [method private benchmark]
```

```Go
func BenchmarkCreateGoroutinesSingle(b *testing.B)
```

BenchmarkCreateGoroutinesSingle creates many goroutines, all from a single producer (the main benchmark goroutine). 

Compared to BenchmarkCreateGoroutines, this causes different behavior in the scheduler because Ms are much more likely to need to steal work from the main P rather than having work in the local run queue. 

### <a id="BenchmarkDefer" href="#BenchmarkDefer">func BenchmarkDefer(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkDefer
tags: [method private benchmark]
```

```Go
func BenchmarkDefer(b *testing.B)
```

### <a id="BenchmarkDefer10" href="#BenchmarkDefer10">func BenchmarkDefer10(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkDefer10
tags: [method private benchmark]
```

```Go
func BenchmarkDefer10(b *testing.B)
```

### <a id="BenchmarkDeferMany" href="#BenchmarkDeferMany">func BenchmarkDeferMany(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkDeferMany
tags: [method private benchmark]
```

```Go
func BenchmarkDeferMany(b *testing.B)
```

### <a id="BenchmarkEfaceCmpDiff" href="#BenchmarkEfaceCmpDiff">func BenchmarkEfaceCmpDiff(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkEfaceCmpDiff
tags: [method private benchmark]
```

```Go
func BenchmarkEfaceCmpDiff(b *testing.B)
```

### <a id="BenchmarkEfaceCmpDiffIndirect" href="#BenchmarkEfaceCmpDiffIndirect">func BenchmarkEfaceCmpDiffIndirect(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkEfaceCmpDiffIndirect
tags: [method private benchmark]
```

```Go
func BenchmarkEfaceCmpDiffIndirect(b *testing.B)
```

### <a id="BenchmarkEqEfaceConcrete" href="#BenchmarkEqEfaceConcrete">func BenchmarkEqEfaceConcrete(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkEqEfaceConcrete
tags: [method private benchmark]
```

```Go
func BenchmarkEqEfaceConcrete(b *testing.B)
```

### <a id="BenchmarkEqIfaceConcrete" href="#BenchmarkEqIfaceConcrete">func BenchmarkEqIfaceConcrete(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkEqIfaceConcrete
tags: [method private benchmark]
```

```Go
func BenchmarkEqIfaceConcrete(b *testing.B)
```

### <a id="BenchmarkExtendSlice" href="#BenchmarkExtendSlice">func BenchmarkExtendSlice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkExtendSlice
tags: [method private benchmark]
```

```Go
func BenchmarkExtendSlice(b *testing.B)
```

### <a id="BenchmarkFastrand" href="#BenchmarkFastrand">func BenchmarkFastrand(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkFastrand
tags: [method private benchmark]
```

```Go
func BenchmarkFastrand(b *testing.B)
```

### <a id="BenchmarkFastrandHashiter" href="#BenchmarkFastrandHashiter">func BenchmarkFastrandHashiter(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkFastrandHashiter
tags: [method private benchmark]
```

```Go
func BenchmarkFastrandHashiter(b *testing.B)
```

### <a id="BenchmarkFastrandn" href="#BenchmarkFastrandn">func BenchmarkFastrandn(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkFastrandn
tags: [method private benchmark]
```

```Go
func BenchmarkFastrandn(b *testing.B)
```

### <a id="BenchmarkFinalizer" href="#BenchmarkFinalizer">func BenchmarkFinalizer(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkFinalizer
tags: [method private benchmark]
```

```Go
func BenchmarkFinalizer(b *testing.B)
```

### <a id="BenchmarkFinalizerRun" href="#BenchmarkFinalizerRun">func BenchmarkFinalizerRun(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkFinalizerRun
tags: [method private benchmark]
```

```Go
func BenchmarkFinalizerRun(b *testing.B)
```

### <a id="BenchmarkFindBitRange64" href="#BenchmarkFindBitRange64">func BenchmarkFindBitRange64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkFindBitRange64
tags: [method private benchmark]
```

```Go
func BenchmarkFindBitRange64(b *testing.B)
```

### <a id="BenchmarkGoMapClear" href="#BenchmarkGoMapClear">func BenchmarkGoMapClear(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGoMapClear
tags: [method private benchmark]
```

```Go
func BenchmarkGoMapClear(b *testing.B)
```

### <a id="BenchmarkGoMemclr" href="#BenchmarkGoMemclr">func BenchmarkGoMemclr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGoMemclr
tags: [method private benchmark]
```

```Go
func BenchmarkGoMemclr(b *testing.B)
```

### <a id="BenchmarkGoroutineBlocking" href="#BenchmarkGoroutineBlocking">func BenchmarkGoroutineBlocking(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGoroutineBlocking
tags: [method private benchmark]
```

```Go
func BenchmarkGoroutineBlocking(b *testing.B)
```

### <a id="BenchmarkGoroutineForRange" href="#BenchmarkGoroutineForRange">func BenchmarkGoroutineForRange(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGoroutineForRange
tags: [method private benchmark]
```

```Go
func BenchmarkGoroutineForRange(b *testing.B)
```

### <a id="BenchmarkGoroutineIdle" href="#BenchmarkGoroutineIdle">func BenchmarkGoroutineIdle(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGoroutineIdle
tags: [method private benchmark]
```

```Go
func BenchmarkGoroutineIdle(b *testing.B)
```

### <a id="BenchmarkGoroutineSelect" href="#BenchmarkGoroutineSelect">func BenchmarkGoroutineSelect(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGoroutineSelect
tags: [method private benchmark]
```

```Go
func BenchmarkGoroutineSelect(b *testing.B)
```

### <a id="BenchmarkGrowSlice" href="#BenchmarkGrowSlice">func BenchmarkGrowSlice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGrowSlice
tags: [method private benchmark]
```

```Go
func BenchmarkGrowSlice(b *testing.B)
```

### <a id="BenchmarkHash1024" href="#BenchmarkHash1024">func BenchmarkHash1024(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHash1024
tags: [method private benchmark]
```

```Go
func BenchmarkHash1024(b *testing.B)
```

### <a id="BenchmarkHash16" href="#BenchmarkHash16">func BenchmarkHash16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHash16
tags: [method private benchmark]
```

```Go
func BenchmarkHash16(b *testing.B)
```

### <a id="BenchmarkHash5" href="#BenchmarkHash5">func BenchmarkHash5(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHash5
tags: [method private benchmark]
```

```Go
func BenchmarkHash5(b *testing.B)
```

### <a id="BenchmarkHash64" href="#BenchmarkHash64">func BenchmarkHash64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHash64
tags: [method private benchmark]
```

```Go
func BenchmarkHash64(b *testing.B)
```

### <a id="BenchmarkHash65536" href="#BenchmarkHash65536">func BenchmarkHash65536(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHash65536
tags: [method private benchmark]
```

```Go
func BenchmarkHash65536(b *testing.B)
```

### <a id="BenchmarkHashBytesSpeed" href="#BenchmarkHashBytesSpeed">func BenchmarkHashBytesSpeed(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHashBytesSpeed
tags: [method private benchmark]
```

```Go
func BenchmarkHashBytesSpeed(b *testing.B)
```

### <a id="BenchmarkHashInt32Speed" href="#BenchmarkHashInt32Speed">func BenchmarkHashInt32Speed(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHashInt32Speed
tags: [method private benchmark]
```

```Go
func BenchmarkHashInt32Speed(b *testing.B)
```

### <a id="BenchmarkHashInt64Speed" href="#BenchmarkHashInt64Speed">func BenchmarkHashInt64Speed(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHashInt64Speed
tags: [method private benchmark]
```

```Go
func BenchmarkHashInt64Speed(b *testing.B)
```

### <a id="BenchmarkHashStringArraySpeed" href="#BenchmarkHashStringArraySpeed">func BenchmarkHashStringArraySpeed(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHashStringArraySpeed
tags: [method private benchmark]
```

```Go
func BenchmarkHashStringArraySpeed(b *testing.B)
```

### <a id="BenchmarkHashStringSpeed" href="#BenchmarkHashStringSpeed">func BenchmarkHashStringSpeed(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHashStringSpeed
tags: [method private benchmark]
```

```Go
func BenchmarkHashStringSpeed(b *testing.B)
```

### <a id="BenchmarkIfaceCmp100" href="#BenchmarkIfaceCmp100">func BenchmarkIfaceCmp100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkIfaceCmp100
tags: [method private benchmark]
```

```Go
func BenchmarkIfaceCmp100(b *testing.B)
```

### <a id="BenchmarkIfaceCmpNil100" href="#BenchmarkIfaceCmpNil100">func BenchmarkIfaceCmpNil100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkIfaceCmpNil100
tags: [method private benchmark]
```

```Go
func BenchmarkIfaceCmpNil100(b *testing.B)
```

### <a id="BenchmarkIntMap" href="#BenchmarkIntMap">func BenchmarkIntMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkIntMap
tags: [method private benchmark]
```

```Go
func BenchmarkIntMap(b *testing.B)
```

### <a id="BenchmarkIssue18740" href="#BenchmarkIssue18740">func BenchmarkIssue18740(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkIssue18740
tags: [method private benchmark]
```

```Go
func BenchmarkIssue18740(b *testing.B)
```

BenchmarkIssue18740 ensures that memmove uses 4 and 8 byte load/store to move 4 and 8 bytes. It used to do 2 2-byte load/stores, which leads to a pipeline stall when we try to read the result with one 4-byte load. 

### <a id="BenchmarkMSpanCountAlloc" href="#BenchmarkMSpanCountAlloc">func BenchmarkMSpanCountAlloc(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMSpanCountAlloc
tags: [method private benchmark]
```

```Go
func BenchmarkMSpanCountAlloc(b *testing.B)
```

### <a id="BenchmarkMakeChan" href="#BenchmarkMakeChan">func BenchmarkMakeChan(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMakeChan
tags: [method private benchmark]
```

```Go
func BenchmarkMakeChan(b *testing.B)
```

### <a id="BenchmarkMakeMap" href="#BenchmarkMakeMap">func BenchmarkMakeMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMakeMap
tags: [method private benchmark]
```

```Go
func BenchmarkMakeMap(b *testing.B)
```

### <a id="BenchmarkMakeSlice" href="#BenchmarkMakeSlice">func BenchmarkMakeSlice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMakeSlice
tags: [method private benchmark]
```

```Go
func BenchmarkMakeSlice(b *testing.B)
```

### <a id="BenchmarkMakeSliceCopy" href="#BenchmarkMakeSliceCopy">func BenchmarkMakeSliceCopy(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMakeSliceCopy
tags: [method private benchmark]
```

```Go
func BenchmarkMakeSliceCopy(b *testing.B)
```

### <a id="BenchmarkMalloc16" href="#BenchmarkMalloc16">func BenchmarkMalloc16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMalloc16
tags: [method private benchmark]
```

```Go
func BenchmarkMalloc16(b *testing.B)
```

### <a id="BenchmarkMalloc8" href="#BenchmarkMalloc8">func BenchmarkMalloc8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMalloc8
tags: [method private benchmark]
```

```Go
func BenchmarkMalloc8(b *testing.B)
```

### <a id="BenchmarkMallocLargeStruct" href="#BenchmarkMallocLargeStruct">func BenchmarkMallocLargeStruct(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMallocLargeStruct
tags: [method private benchmark]
```

```Go
func BenchmarkMallocLargeStruct(b *testing.B)
```

### <a id="BenchmarkMallocTypeInfo16" href="#BenchmarkMallocTypeInfo16">func BenchmarkMallocTypeInfo16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMallocTypeInfo16
tags: [method private benchmark]
```

```Go
func BenchmarkMallocTypeInfo16(b *testing.B)
```

### <a id="BenchmarkMallocTypeInfo8" href="#BenchmarkMallocTypeInfo8">func BenchmarkMallocTypeInfo8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMallocTypeInfo8
tags: [method private benchmark]
```

```Go
func BenchmarkMallocTypeInfo8(b *testing.B)
```

### <a id="BenchmarkMapAppendAssign" href="#BenchmarkMapAppendAssign">func BenchmarkMapAppendAssign(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapAppendAssign
tags: [method private benchmark]
```

```Go
func BenchmarkMapAppendAssign(b *testing.B)
```

### <a id="BenchmarkMapAssign" href="#BenchmarkMapAssign">func BenchmarkMapAssign(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapAssign
tags: [method private benchmark]
```

```Go
func BenchmarkMapAssign(b *testing.B)
```

### <a id="BenchmarkMapCycle" href="#BenchmarkMapCycle">func BenchmarkMapCycle(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapCycle
tags: [method private benchmark]
```

```Go
func BenchmarkMapCycle(b *testing.B)
```

### <a id="BenchmarkMapDelete" href="#BenchmarkMapDelete">func BenchmarkMapDelete(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapDelete
tags: [method private benchmark]
```

```Go
func BenchmarkMapDelete(b *testing.B)
```

### <a id="BenchmarkMapFirst" href="#BenchmarkMapFirst">func BenchmarkMapFirst(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapFirst
tags: [method private benchmark]
```

```Go
func BenchmarkMapFirst(b *testing.B)
```

### <a id="BenchmarkMapInterfacePtr" href="#BenchmarkMapInterfacePtr">func BenchmarkMapInterfacePtr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapInterfacePtr
tags: [method private benchmark]
```

```Go
func BenchmarkMapInterfacePtr(b *testing.B)
```

### <a id="BenchmarkMapInterfaceString" href="#BenchmarkMapInterfaceString">func BenchmarkMapInterfaceString(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapInterfaceString
tags: [method private benchmark]
```

```Go
func BenchmarkMapInterfaceString(b *testing.B)
```

### <a id="BenchmarkMapIter" href="#BenchmarkMapIter">func BenchmarkMapIter(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapIter
tags: [method private benchmark]
```

```Go
func BenchmarkMapIter(b *testing.B)
```

### <a id="BenchmarkMapIterEmpty" href="#BenchmarkMapIterEmpty">func BenchmarkMapIterEmpty(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapIterEmpty
tags: [method private benchmark]
```

```Go
func BenchmarkMapIterEmpty(b *testing.B)
```

### <a id="BenchmarkMapLast" href="#BenchmarkMapLast">func BenchmarkMapLast(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapLast
tags: [method private benchmark]
```

```Go
func BenchmarkMapLast(b *testing.B)
```

### <a id="BenchmarkMapMid" href="#BenchmarkMapMid">func BenchmarkMapMid(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapMid
tags: [method private benchmark]
```

```Go
func BenchmarkMapMid(b *testing.B)
```

### <a id="BenchmarkMapOperatorAssign" href="#BenchmarkMapOperatorAssign">func BenchmarkMapOperatorAssign(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapOperatorAssign
tags: [method private benchmark]
```

```Go
func BenchmarkMapOperatorAssign(b *testing.B)
```

### <a id="BenchmarkMapPop100" href="#BenchmarkMapPop100">func BenchmarkMapPop100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapPop100
tags: [method private benchmark]
```

```Go
func BenchmarkMapPop100(b *testing.B)
```

### <a id="BenchmarkMapPop1000" href="#BenchmarkMapPop1000">func BenchmarkMapPop1000(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapPop1000
tags: [method private benchmark]
```

```Go
func BenchmarkMapPop1000(b *testing.B)
```

### <a id="BenchmarkMapPop10000" href="#BenchmarkMapPop10000">func BenchmarkMapPop10000(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapPop10000
tags: [method private benchmark]
```

```Go
func BenchmarkMapPop10000(b *testing.B)
```

### <a id="BenchmarkMapPopulate" href="#BenchmarkMapPopulate">func BenchmarkMapPopulate(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapPopulate
tags: [method private benchmark]
```

```Go
func BenchmarkMapPopulate(b *testing.B)
```

### <a id="BenchmarkMapStringConversion" href="#BenchmarkMapStringConversion">func BenchmarkMapStringConversion(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapStringConversion
tags: [method private benchmark]
```

```Go
func BenchmarkMapStringConversion(b *testing.B)
```

### <a id="BenchmarkMapStringKeysEight_16" href="#BenchmarkMapStringKeysEight_16">func BenchmarkMapStringKeysEight_16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapStringKeysEight_16
tags: [method private benchmark]
```

```Go
func BenchmarkMapStringKeysEight_16(b *testing.B)
```

### <a id="BenchmarkMapStringKeysEight_1M" href="#BenchmarkMapStringKeysEight_1M">func BenchmarkMapStringKeysEight_1M(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapStringKeysEight_1M
tags: [method private benchmark]
```

```Go
func BenchmarkMapStringKeysEight_1M(b *testing.B)
```

### <a id="BenchmarkMapStringKeysEight_32" href="#BenchmarkMapStringKeysEight_32">func BenchmarkMapStringKeysEight_32(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapStringKeysEight_32
tags: [method private benchmark]
```

```Go
func BenchmarkMapStringKeysEight_32(b *testing.B)
```

### <a id="BenchmarkMapStringKeysEight_64" href="#BenchmarkMapStringKeysEight_64">func BenchmarkMapStringKeysEight_64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapStringKeysEight_64
tags: [method private benchmark]
```

```Go
func BenchmarkMapStringKeysEight_64(b *testing.B)
```

### <a id="BenchmarkMatmult" href="#BenchmarkMatmult">func BenchmarkMatmult(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMatmult
tags: [method private benchmark]
```

```Go
func BenchmarkMatmult(b *testing.B)
```

### <a id="BenchmarkMegEmptyMap" href="#BenchmarkMegEmptyMap">func BenchmarkMegEmptyMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMegEmptyMap
tags: [method private benchmark]
```

```Go
func BenchmarkMegEmptyMap(b *testing.B)
```

### <a id="BenchmarkMegEqMap" href="#BenchmarkMegEqMap">func BenchmarkMegEqMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMegEqMap
tags: [method private benchmark]
```

```Go
func BenchmarkMegEqMap(b *testing.B)
```

### <a id="BenchmarkMegMap" href="#BenchmarkMegMap">func BenchmarkMegMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMegMap
tags: [method private benchmark]
```

```Go
func BenchmarkMegMap(b *testing.B)
```

### <a id="BenchmarkMegOneMap" href="#BenchmarkMegOneMap">func BenchmarkMegOneMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMegOneMap
tags: [method private benchmark]
```

```Go
func BenchmarkMegOneMap(b *testing.B)
```

### <a id="BenchmarkMemclr" href="#BenchmarkMemclr">func BenchmarkMemclr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemclr
tags: [method private benchmark]
```

```Go
func BenchmarkMemclr(b *testing.B)
```

### <a id="BenchmarkMemmove" href="#BenchmarkMemmove">func BenchmarkMemmove(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemmove
tags: [method private benchmark]
```

```Go
func BenchmarkMemmove(b *testing.B)
```

### <a id="BenchmarkMemmoveOverlap" href="#BenchmarkMemmoveOverlap">func BenchmarkMemmoveOverlap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemmoveOverlap
tags: [method private benchmark]
```

```Go
func BenchmarkMemmoveOverlap(b *testing.B)
```

### <a id="BenchmarkMemmoveUnalignedDst" href="#BenchmarkMemmoveUnalignedDst">func BenchmarkMemmoveUnalignedDst(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemmoveUnalignedDst
tags: [method private benchmark]
```

```Go
func BenchmarkMemmoveUnalignedDst(b *testing.B)
```

### <a id="BenchmarkMemmoveUnalignedDstOverlap" href="#BenchmarkMemmoveUnalignedDstOverlap">func BenchmarkMemmoveUnalignedDstOverlap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemmoveUnalignedDstOverlap
tags: [method private benchmark]
```

```Go
func BenchmarkMemmoveUnalignedDstOverlap(b *testing.B)
```

### <a id="BenchmarkMemmoveUnalignedSrc" href="#BenchmarkMemmoveUnalignedSrc">func BenchmarkMemmoveUnalignedSrc(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemmoveUnalignedSrc
tags: [method private benchmark]
```

```Go
func BenchmarkMemmoveUnalignedSrc(b *testing.B)
```

### <a id="BenchmarkMemmoveUnalignedSrcOverlap" href="#BenchmarkMemmoveUnalignedSrcOverlap">func BenchmarkMemmoveUnalignedSrcOverlap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemmoveUnalignedSrcOverlap
tags: [method private benchmark]
```

```Go
func BenchmarkMemmoveUnalignedSrcOverlap(b *testing.B)
```

### <a id="BenchmarkNeEfaceConcrete" href="#BenchmarkNeEfaceConcrete">func BenchmarkNeEfaceConcrete(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNeEfaceConcrete
tags: [method private benchmark]
```

```Go
func BenchmarkNeEfaceConcrete(b *testing.B)
```

### <a id="BenchmarkNeIfaceConcrete" href="#BenchmarkNeIfaceConcrete">func BenchmarkNeIfaceConcrete(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNeIfaceConcrete
tags: [method private benchmark]
```

```Go
func BenchmarkNeIfaceConcrete(b *testing.B)
```

### <a id="BenchmarkNetpollBreak" href="#BenchmarkNetpollBreak">func BenchmarkNetpollBreak(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNetpollBreak
tags: [method private benchmark]
```

```Go
func BenchmarkNetpollBreak(b *testing.B)
```

### <a id="BenchmarkNewEmptyMap" href="#BenchmarkNewEmptyMap">func BenchmarkNewEmptyMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNewEmptyMap
tags: [method private benchmark]
```

```Go
func BenchmarkNewEmptyMap(b *testing.B)
```

### <a id="BenchmarkNewEmptyMapHintGreaterThan8" href="#BenchmarkNewEmptyMapHintGreaterThan8">func BenchmarkNewEmptyMapHintGreaterThan8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNewEmptyMapHintGreaterThan8
tags: [method private benchmark]
```

```Go
func BenchmarkNewEmptyMapHintGreaterThan8(b *testing.B)
```

### <a id="BenchmarkNewEmptyMapHintLessThan8" href="#BenchmarkNewEmptyMapHintLessThan8">func BenchmarkNewEmptyMapHintLessThan8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNewEmptyMapHintLessThan8
tags: [method private benchmark]
```

```Go
func BenchmarkNewEmptyMapHintLessThan8(b *testing.B)
```

### <a id="BenchmarkNewSmallMap" href="#BenchmarkNewSmallMap">func BenchmarkNewSmallMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNewSmallMap
tags: [method private benchmark]
```

```Go
func BenchmarkNewSmallMap(b *testing.B)
```

### <a id="BenchmarkPallocBitsSummarize" href="#BenchmarkPallocBitsSummarize">func BenchmarkPallocBitsSummarize(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkPallocBitsSummarize
tags: [method private benchmark]
```

```Go
func BenchmarkPallocBitsSummarize(b *testing.B)
```

Benchmarks how quickly we can summarize a PallocBits. 

### <a id="BenchmarkPanicRecover" href="#BenchmarkPanicRecover">func BenchmarkPanicRecover(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkPanicRecover
tags: [method private benchmark]
```

```Go
func BenchmarkPanicRecover(b *testing.B)
```

### <a id="BenchmarkPingPongHog" href="#BenchmarkPingPongHog">func BenchmarkPingPongHog(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkPingPongHog
tags: [method private benchmark]
```

```Go
func BenchmarkPingPongHog(b *testing.B)
```

### <a id="BenchmarkRWMutexUncontended" href="#BenchmarkRWMutexUncontended">func BenchmarkRWMutexUncontended(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRWMutexUncontended
tags: [method private benchmark]
```

```Go
func BenchmarkRWMutexUncontended(b *testing.B)
```

### <a id="BenchmarkRWMutexWorkWrite10" href="#BenchmarkRWMutexWorkWrite10">func BenchmarkRWMutexWorkWrite10(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRWMutexWorkWrite10
tags: [method private benchmark]
```

```Go
func BenchmarkRWMutexWorkWrite10(b *testing.B)
```

### <a id="BenchmarkRWMutexWorkWrite100" href="#BenchmarkRWMutexWorkWrite100">func BenchmarkRWMutexWorkWrite100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRWMutexWorkWrite100
tags: [method private benchmark]
```

```Go
func BenchmarkRWMutexWorkWrite100(b *testing.B)
```

### <a id="BenchmarkRWMutexWrite10" href="#BenchmarkRWMutexWrite10">func BenchmarkRWMutexWrite10(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRWMutexWrite10
tags: [method private benchmark]
```

```Go
func BenchmarkRWMutexWrite10(b *testing.B)
```

### <a id="BenchmarkRWMutexWrite100" href="#BenchmarkRWMutexWrite100">func BenchmarkRWMutexWrite100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRWMutexWrite100
tags: [method private benchmark]
```

```Go
func BenchmarkRWMutexWrite100(b *testing.B)
```

### <a id="BenchmarkReadMemStats" href="#BenchmarkReadMemStats">func BenchmarkReadMemStats(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkReadMemStats
tags: [method private benchmark]
```

```Go
func BenchmarkReadMemStats(b *testing.B)
```

### <a id="BenchmarkReadMemStatsLatency" href="#BenchmarkReadMemStatsLatency">func BenchmarkReadMemStatsLatency(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkReadMemStatsLatency
tags: [method private benchmark]
```

```Go
func BenchmarkReadMemStatsLatency(b *testing.B)
```

### <a id="BenchmarkReadMetricsLatency" href="#BenchmarkReadMetricsLatency">func BenchmarkReadMetricsLatency(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkReadMetricsLatency
tags: [method private benchmark]
```

```Go
func BenchmarkReadMetricsLatency(b *testing.B)
```

### <a id="BenchmarkRepeatedLookupStrMapKey1M" href="#BenchmarkRepeatedLookupStrMapKey1M">func BenchmarkRepeatedLookupStrMapKey1M(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRepeatedLookupStrMapKey1M
tags: [method private benchmark]
```

```Go
func BenchmarkRepeatedLookupStrMapKey1M(b *testing.B)
```

### <a id="BenchmarkRepeatedLookupStrMapKey32" href="#BenchmarkRepeatedLookupStrMapKey32">func BenchmarkRepeatedLookupStrMapKey32(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRepeatedLookupStrMapKey32
tags: [method private benchmark]
```

```Go
func BenchmarkRepeatedLookupStrMapKey32(b *testing.B)
```

### <a id="BenchmarkRuneCount" href="#BenchmarkRuneCount">func BenchmarkRuneCount(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRuneCount
tags: [method private benchmark]
```

```Go
func BenchmarkRuneCount(b *testing.B)
```

### <a id="BenchmarkRuneIterate" href="#BenchmarkRuneIterate">func BenchmarkRuneIterate(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRuneIterate
tags: [method private benchmark]
```

```Go
func BenchmarkRuneIterate(b *testing.B)
```

### <a id="BenchmarkSameLengthMap" href="#BenchmarkSameLengthMap">func BenchmarkSameLengthMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSameLengthMap
tags: [method private benchmark]
```

```Go
func BenchmarkSameLengthMap(b *testing.B)
```

### <a id="BenchmarkScanStackNoLocals" href="#BenchmarkScanStackNoLocals">func BenchmarkScanStackNoLocals(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkScanStackNoLocals
tags: [method private benchmark]
```

```Go
func BenchmarkScanStackNoLocals(b *testing.B)
```

### <a id="BenchmarkSelectAsyncContended" href="#BenchmarkSelectAsyncContended">func BenchmarkSelectAsyncContended(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSelectAsyncContended
tags: [method private benchmark]
```

```Go
func BenchmarkSelectAsyncContended(b *testing.B)
```

### <a id="BenchmarkSelectNonblock" href="#BenchmarkSelectNonblock">func BenchmarkSelectNonblock(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSelectNonblock
tags: [method private benchmark]
```

```Go
func BenchmarkSelectNonblock(b *testing.B)
```

### <a id="BenchmarkSelectProdCons" href="#BenchmarkSelectProdCons">func BenchmarkSelectProdCons(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSelectProdCons
tags: [method private benchmark]
```

```Go
func BenchmarkSelectProdCons(b *testing.B)
```

### <a id="BenchmarkSelectSyncContended" href="#BenchmarkSelectSyncContended">func BenchmarkSelectSyncContended(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSelectSyncContended
tags: [method private benchmark]
```

```Go
func BenchmarkSelectSyncContended(b *testing.B)
```

### <a id="BenchmarkSelectUncontended" href="#BenchmarkSelectUncontended">func BenchmarkSelectUncontended(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSelectUncontended
tags: [method private benchmark]
```

```Go
func BenchmarkSelectUncontended(b *testing.B)
```

### <a id="BenchmarkSetTypeNode1" href="#BenchmarkSetTypeNode1">func BenchmarkSetTypeNode1(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode1
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode1(b *testing.B)
```

### <a id="BenchmarkSetTypeNode1024" href="#BenchmarkSetTypeNode1024">func BenchmarkSetTypeNode1024(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode1024
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode1024(b *testing.B)
```

### <a id="BenchmarkSetTypeNode1024Slice" href="#BenchmarkSetTypeNode1024Slice">func BenchmarkSetTypeNode1024Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode1024Slice
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode1024Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode124" href="#BenchmarkSetTypeNode124">func BenchmarkSetTypeNode124(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode124
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode124(b *testing.B)
```

### <a id="BenchmarkSetTypeNode124Slice" href="#BenchmarkSetTypeNode124Slice">func BenchmarkSetTypeNode124Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode124Slice
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode124Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode126" href="#BenchmarkSetTypeNode126">func BenchmarkSetTypeNode126(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode126
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode126(b *testing.B)
```

### <a id="BenchmarkSetTypeNode126Slice" href="#BenchmarkSetTypeNode126Slice">func BenchmarkSetTypeNode126Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode126Slice
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode126Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode128" href="#BenchmarkSetTypeNode128">func BenchmarkSetTypeNode128(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode128
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode128(b *testing.B)
```

### <a id="BenchmarkSetTypeNode128Slice" href="#BenchmarkSetTypeNode128Slice">func BenchmarkSetTypeNode128Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode128Slice
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode128Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode130" href="#BenchmarkSetTypeNode130">func BenchmarkSetTypeNode130(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode130
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode130(b *testing.B)
```

### <a id="BenchmarkSetTypeNode130Slice" href="#BenchmarkSetTypeNode130Slice">func BenchmarkSetTypeNode130Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode130Slice
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode130Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode1Slice" href="#BenchmarkSetTypeNode1Slice">func BenchmarkSetTypeNode1Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode1Slice
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode1Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode64" href="#BenchmarkSetTypeNode64">func BenchmarkSetTypeNode64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode64
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode64(b *testing.B)
```

### <a id="BenchmarkSetTypeNode64Dead" href="#BenchmarkSetTypeNode64Dead">func BenchmarkSetTypeNode64Dead(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode64Dead
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode64Dead(b *testing.B)
```

### <a id="BenchmarkSetTypeNode64DeadSlice" href="#BenchmarkSetTypeNode64DeadSlice">func BenchmarkSetTypeNode64DeadSlice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode64DeadSlice
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode64DeadSlice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode64Slice" href="#BenchmarkSetTypeNode64Slice">func BenchmarkSetTypeNode64Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode64Slice
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode64Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode8" href="#BenchmarkSetTypeNode8">func BenchmarkSetTypeNode8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode8
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode8(b *testing.B)
```

### <a id="BenchmarkSetTypeNode8Slice" href="#BenchmarkSetTypeNode8Slice">func BenchmarkSetTypeNode8Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode8Slice
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypeNode8Slice(b *testing.B)
```

### <a id="BenchmarkSetTypePtr" href="#BenchmarkSetTypePtr">func BenchmarkSetTypePtr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypePtr(b *testing.B)
```

### <a id="BenchmarkSetTypePtr126" href="#BenchmarkSetTypePtr126">func BenchmarkSetTypePtr126(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr126
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypePtr126(b *testing.B)
```

### <a id="BenchmarkSetTypePtr128" href="#BenchmarkSetTypePtr128">func BenchmarkSetTypePtr128(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr128
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypePtr128(b *testing.B)
```

### <a id="BenchmarkSetTypePtr16" href="#BenchmarkSetTypePtr16">func BenchmarkSetTypePtr16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr16
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypePtr16(b *testing.B)
```

### <a id="BenchmarkSetTypePtr32" href="#BenchmarkSetTypePtr32">func BenchmarkSetTypePtr32(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr32
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypePtr32(b *testing.B)
```

### <a id="BenchmarkSetTypePtr64" href="#BenchmarkSetTypePtr64">func BenchmarkSetTypePtr64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr64
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypePtr64(b *testing.B)
```

### <a id="BenchmarkSetTypePtr8" href="#BenchmarkSetTypePtr8">func BenchmarkSetTypePtr8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr8
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypePtr8(b *testing.B)
```

### <a id="BenchmarkSetTypePtrSlice" href="#BenchmarkSetTypePtrSlice">func BenchmarkSetTypePtrSlice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtrSlice
tags: [method private benchmark]
```

```Go
func BenchmarkSetTypePtrSlice(b *testing.B)
```

### <a id="BenchmarkSliceByteToString" href="#BenchmarkSliceByteToString">func BenchmarkSliceByteToString(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSliceByteToString
tags: [method private benchmark]
```

```Go
func BenchmarkSliceByteToString(b *testing.B)
```

### <a id="BenchmarkSmallKeyMap" href="#BenchmarkSmallKeyMap">func BenchmarkSmallKeyMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSmallKeyMap
tags: [method private benchmark]
```

```Go
func BenchmarkSmallKeyMap(b *testing.B)
```

### <a id="BenchmarkSmallStrMap" href="#BenchmarkSmallStrMap">func BenchmarkSmallStrMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSmallStrMap
tags: [method private benchmark]
```

```Go
func BenchmarkSmallStrMap(b *testing.B)
```

### <a id="BenchmarkStackCopy" href="#BenchmarkStackCopy">func BenchmarkStackCopy(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkStackCopy
tags: [method private benchmark]
```

```Go
func BenchmarkStackCopy(b *testing.B)
```

### <a id="BenchmarkStackCopyNoCache" href="#BenchmarkStackCopyNoCache">func BenchmarkStackCopyNoCache(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkStackCopyNoCache
tags: [method private benchmark]
```

```Go
func BenchmarkStackCopyNoCache(b *testing.B)
```

### <a id="BenchmarkStackCopyPtr" href="#BenchmarkStackCopyPtr">func BenchmarkStackCopyPtr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkStackCopyPtr
tags: [method private benchmark]
```

```Go
func BenchmarkStackCopyPtr(b *testing.B)
```

### <a id="BenchmarkStackGrowth" href="#BenchmarkStackGrowth">func BenchmarkStackGrowth(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkStackGrowth
tags: [method private benchmark]
```

```Go
func BenchmarkStackGrowth(b *testing.B)
```

### <a id="BenchmarkStackGrowthDeep" href="#BenchmarkStackGrowthDeep">func BenchmarkStackGrowthDeep(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkStackGrowthDeep
tags: [method private benchmark]
```

```Go
func BenchmarkStackGrowthDeep(b *testing.B)
```

### <a id="BenchmarkSyscall" href="#BenchmarkSyscall">func BenchmarkSyscall(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSyscall
tags: [method private benchmark]
```

```Go
func BenchmarkSyscall(b *testing.B)
```

Syscall tests split stack between Entersyscall and Exitsyscall under race detector. 

### <a id="BenchmarkSyscallExcess" href="#BenchmarkSyscallExcess">func BenchmarkSyscallExcess(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSyscallExcess
tags: [method private benchmark]
```

```Go
func BenchmarkSyscallExcess(b *testing.B)
```

### <a id="BenchmarkSyscallExcessWork" href="#BenchmarkSyscallExcessWork">func BenchmarkSyscallExcessWork(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSyscallExcessWork
tags: [method private benchmark]
```

```Go
func BenchmarkSyscallExcessWork(b *testing.B)
```

### <a id="BenchmarkSyscallWork" href="#BenchmarkSyscallWork">func BenchmarkSyscallWork(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSyscallWork
tags: [method private benchmark]
```

```Go
func BenchmarkSyscallWork(b *testing.B)
```

### <a id="BenchmarkUnalignedLoad" href="#BenchmarkUnalignedLoad">func BenchmarkUnalignedLoad(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkUnalignedLoad
tags: [method private benchmark]
```

```Go
func BenchmarkUnalignedLoad(b *testing.B)
```

### <a id="BenchmarkWakeupParallelSpinning" href="#BenchmarkWakeupParallelSpinning">func BenchmarkWakeupParallelSpinning(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkWakeupParallelSpinning
tags: [method private benchmark]
```

```Go
func BenchmarkWakeupParallelSpinning(b *testing.B)
```

### <a id="BenchmarkWakeupParallelSyscall" href="#BenchmarkWakeupParallelSyscall">func BenchmarkWakeupParallelSyscall(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkWakeupParallelSyscall
tags: [method private benchmark]
```

```Go
func BenchmarkWakeupParallelSyscall(b *testing.B)
```

### <a id="BenchmarkWriteBarrier" href="#BenchmarkWriteBarrier">func BenchmarkWriteBarrier(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkWriteBarrier
tags: [method private benchmark]
```

```Go
func BenchmarkWriteBarrier(b *testing.B)
```

### <a id="ExampleFrames" href="#ExampleFrames">func ExampleFrames()</a>

```
searchKey: runtime_test.ExampleFrames
tags: [function private]
```

```Go
func ExampleFrames()
```

### <a id="HammerRWMutex" href="#HammerRWMutex">func HammerRWMutex(gomaxprocs, numReaders, num_iterations int)</a>

```
searchKey: runtime_test.HammerRWMutex
tags: [method private]
```

```Go
func HammerRWMutex(gomaxprocs, numReaders, num_iterations int)
```

### <a id="TestAbort" href="#TestAbort">func TestAbort(t *testing.T)</a>

```
searchKey: runtime_test.TestAbort
tags: [method private test]
```

```Go
func TestAbort(t *testing.T)
```

Test that runtime.abort does so. 

### <a id="TestAbortedPanic" href="#TestAbortedPanic">func TestAbortedPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestAbortedPanic
tags: [method private test]
```

```Go
func TestAbortedPanic(t *testing.T)
```

This tests an extra recursive panic behavior that is only specified in the code. Suppose a first panic P1 happens and starts processing defer calls. If a second panic P2 happens while processing defer call D in frame F, then defer call processing is restarted (with some potentially new defer calls created by D or its callees). If the defer processing reaches the started defer call D again in the defer stack, then the original panic P1 is aborted and cannot continue panic processing or be recovered. If the panic P2 does a recover at some point, it will naturally remove the original panic P1 from the stack (since the original panic had to be in frame F or a descendant of F). 

### <a id="TestAddrRangesAdd" href="#TestAddrRangesAdd">func TestAddrRangesAdd(t *testing.T)</a>

```
searchKey: runtime_test.TestAddrRangesAdd
tags: [method private test]
```

```Go
func TestAddrRangesAdd(t *testing.T)
```

### <a id="TestAddrRangesFindSucc" href="#TestAddrRangesFindSucc">func TestAddrRangesFindSucc(t *testing.T)</a>

```
searchKey: runtime_test.TestAddrRangesFindSucc
tags: [method private test]
```

```Go
func TestAddrRangesFindSucc(t *testing.T)
```

### <a id="TestAlias" href="#TestAlias">func TestAlias(t *testing.T)</a>

```
searchKey: runtime_test.TestAlias
tags: [method private test]
```

```Go
func TestAlias(t *testing.T)
```

Maps aren't actually copied on assignment. 

### <a id="TestAppendGrowth" href="#TestAppendGrowth">func TestAppendGrowth(t *testing.T)</a>

```
searchKey: runtime_test.TestAppendGrowth
tags: [method private test]
```

```Go
func TestAppendGrowth(t *testing.T)
```

### <a id="TestAppendOverlap" href="#TestAppendOverlap">func TestAppendOverlap(t *testing.T)</a>

```
searchKey: runtime_test.TestAppendOverlap
tags: [method private test]
```

```Go
func TestAppendOverlap(t *testing.T)
```

### <a id="TestAppendSliceGrowth" href="#TestAppendSliceGrowth">func TestAppendSliceGrowth(t *testing.T)</a>

```
searchKey: runtime_test.TestAppendSliceGrowth
tags: [method private test]
```

```Go
func TestAppendSliceGrowth(t *testing.T)
```

### <a id="TestArenaCollision" href="#TestArenaCollision">func TestArenaCollision(t *testing.T)</a>

```
searchKey: runtime_test.TestArenaCollision
tags: [method private test]
```

```Go
func TestArenaCollision(t *testing.T)
```

### <a id="TestArrayHash" href="#TestArrayHash">func TestArrayHash(t *testing.T)</a>

```
searchKey: runtime_test.TestArrayHash
tags: [method private test]
```

```Go
func TestArrayHash(t *testing.T)
```

### <a id="TestAsyncPreempt" href="#TestAsyncPreempt">func TestAsyncPreempt(t *testing.T)</a>

```
searchKey: runtime_test.TestAsyncPreempt
tags: [method private test]
```

```Go
func TestAsyncPreempt(t *testing.T)
```

### <a id="TestAtoi" href="#TestAtoi">func TestAtoi(t *testing.T)</a>

```
searchKey: runtime_test.TestAtoi
tags: [method private test]
```

```Go
func TestAtoi(t *testing.T)
```

### <a id="TestAtoi32" href="#TestAtoi32">func TestAtoi32(t *testing.T)</a>

```
searchKey: runtime_test.TestAtoi32
tags: [method private test]
```

```Go
func TestAtoi32(t *testing.T)
```

### <a id="TestBadOpen" href="#TestBadOpen">func TestBadOpen(t *testing.T)</a>

```
searchKey: runtime_test.TestBadOpen
tags: [method private test]
```

```Go
func TestBadOpen(t *testing.T)
```

### <a id="TestBadTraceback" href="#TestBadTraceback">func TestBadTraceback(t *testing.T)</a>

```
searchKey: runtime_test.TestBadTraceback
tags: [method private test]
```

```Go
func TestBadTraceback(t *testing.T)
```

### <a id="TestBigGOMAXPROCS" href="#TestBigGOMAXPROCS">func TestBigGOMAXPROCS(t *testing.T)</a>

```
searchKey: runtime_test.TestBigGOMAXPROCS
tags: [method private test]
```

```Go
func TestBigGOMAXPROCS(t *testing.T)
```

TestBigGOMAXPROCS tests that setting GOMAXPROCS to a large value doesn't cause a crash at startup. See issue 38474. 

### <a id="TestBigItems" href="#TestBigItems">func TestBigItems(t *testing.T)</a>

```
searchKey: runtime_test.TestBigItems
tags: [method private test]
```

```Go
func TestBigItems(t *testing.T)
```

### <a id="TestBigStackCallbackCgo" href="#TestBigStackCallbackCgo">func TestBigStackCallbackCgo(t *testing.T)</a>

```
searchKey: runtime_test.TestBigStackCallbackCgo
tags: [method private test]
```

```Go
func TestBigStackCallbackCgo(t *testing.T)
```

Test that C code called via cgo can use large Windows thread stacks and call back in to Go without crashing. See issue #20975. 

See also TestBigStackCallbackSyscall. 

### <a id="TestBlockLocked" href="#TestBlockLocked">func TestBlockLocked(t *testing.T)</a>

```
searchKey: runtime_test.TestBlockLocked
tags: [method private test]
```

```Go
func TestBlockLocked(t *testing.T)
```

### <a id="TestBreakpoint" href="#TestBreakpoint">func TestBreakpoint(t *testing.T)</a>

```
searchKey: runtime_test.TestBreakpoint
tags: [method private test]
```

```Go
func TestBreakpoint(t *testing.T)
```

### <a id="TestCaller" href="#TestCaller">func TestCaller(t *testing.T)</a>

```
searchKey: runtime_test.TestCaller
tags: [method private test]
```

```Go
func TestCaller(t *testing.T)
```

### <a id="TestCallers" href="#TestCallers">func TestCallers(t *testing.T)</a>

```
searchKey: runtime_test.TestCallers
tags: [method private test]
```

```Go
func TestCallers(t *testing.T)
```

### <a id="TestCallersAbortedPanic" href="#TestCallersAbortedPanic">func TestCallersAbortedPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersAbortedPanic
tags: [method private test]
```

```Go
func TestCallersAbortedPanic(t *testing.T)
```

### <a id="TestCallersAbortedPanic2" href="#TestCallersAbortedPanic2">func TestCallersAbortedPanic2(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersAbortedPanic2
tags: [method private test]
```

```Go
func TestCallersAbortedPanic2(t *testing.T)
```

### <a id="TestCallersAfterRecovery" href="#TestCallersAfterRecovery">func TestCallersAfterRecovery(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersAfterRecovery
tags: [method private test]
```

```Go
func TestCallersAfterRecovery(t *testing.T)
```

Test that a defer after a successful recovery looks like it is called directly from the function with the defers. 

### <a id="TestCallersDeferNilFuncPanic" href="#TestCallersDeferNilFuncPanic">func TestCallersDeferNilFuncPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersDeferNilFuncPanic
tags: [method private test]
```

```Go
func TestCallersDeferNilFuncPanic(t *testing.T)
```

### <a id="TestCallersDeferNilFuncPanicWithLoop" href="#TestCallersDeferNilFuncPanicWithLoop">func TestCallersDeferNilFuncPanicWithLoop(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersDeferNilFuncPanicWithLoop
tags: [method private test]
```

```Go
func TestCallersDeferNilFuncPanicWithLoop(t *testing.T)
```

Same test, but forcing non-open-coded defer by putting the defer in a loop.  See issue #36050 

### <a id="TestCallersDivZeroPanic" href="#TestCallersDivZeroPanic">func TestCallersDivZeroPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersDivZeroPanic
tags: [method private test]
```

```Go
func TestCallersDivZeroPanic(t *testing.T)
```

### <a id="TestCallersDoublePanic" href="#TestCallersDoublePanic">func TestCallersDoublePanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersDoublePanic
tags: [method private test]
```

```Go
func TestCallersDoublePanic(t *testing.T)
```

### <a id="TestCallersFromWrapper" href="#TestCallersFromWrapper">func TestCallersFromWrapper(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersFromWrapper
tags: [method private test]
```

```Go
func TestCallersFromWrapper(t *testing.T)
```

### <a id="TestCallersNilPointerPanic" href="#TestCallersNilPointerPanic">func TestCallersNilPointerPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersNilPointerPanic
tags: [method private test]
```

```Go
func TestCallersNilPointerPanic(t *testing.T)
```

### <a id="TestCallersPanic" href="#TestCallersPanic">func TestCallersPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersPanic
tags: [method private test]
```

```Go
func TestCallersPanic(t *testing.T)
```

### <a id="TestCatchPanic" href="#TestCatchPanic">func TestCatchPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCatchPanic
tags: [method private test]
```

```Go
func TestCatchPanic(t *testing.T)
```

### <a id="TestCgoCCodeSIGPROF" href="#TestCgoCCodeSIGPROF">func TestCgoCCodeSIGPROF(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoCCodeSIGPROF
tags: [method private test]
```

```Go
func TestCgoCCodeSIGPROF(t *testing.T)
```

### <a id="TestCgoCallbackGC" href="#TestCgoCallbackGC">func TestCgoCallbackGC(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoCallbackGC
tags: [method private test]
```

```Go
func TestCgoCallbackGC(t *testing.T)
```

### <a id="TestCgoCheckBytes" href="#TestCgoCheckBytes">func TestCgoCheckBytes(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoCheckBytes
tags: [method private test]
```

```Go
func TestCgoCheckBytes(t *testing.T)
```

Test for issue 14387. Test that the program that doesn't need any cgo pointer checking takes about the same amount of time with it as without it. 

### <a id="TestCgoCrashHandler" href="#TestCgoCrashHandler">func TestCgoCrashHandler(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoCrashHandler
tags: [method private test]
```

```Go
func TestCgoCrashHandler(t *testing.T)
```

### <a id="TestCgoCrashTraceback" href="#TestCgoCrashTraceback">func TestCgoCrashTraceback(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoCrashTraceback
tags: [method private test]
```

```Go
func TestCgoCrashTraceback(t *testing.T)
```

### <a id="TestCgoCrashTracebackGo" href="#TestCgoCrashTracebackGo">func TestCgoCrashTracebackGo(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoCrashTracebackGo
tags: [method private test]
```

```Go
func TestCgoCrashTracebackGo(t *testing.T)
```

### <a id="TestCgoDLLImports" href="#TestCgoDLLImports">func TestCgoDLLImports(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoDLLImports
tags: [method private test]
```

```Go
func TestCgoDLLImports(t *testing.T)
```

### <a id="TestCgoExecSignalMask" href="#TestCgoExecSignalMask">func TestCgoExecSignalMask(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoExecSignalMask
tags: [method private test]
```

```Go
func TestCgoExecSignalMask(t *testing.T)
```

### <a id="TestCgoExternalThreadPanic" href="#TestCgoExternalThreadPanic">func TestCgoExternalThreadPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoExternalThreadPanic
tags: [method private test]
```

```Go
func TestCgoExternalThreadPanic(t *testing.T)
```

### <a id="TestCgoExternalThreadSIGPROF" href="#TestCgoExternalThreadSIGPROF">func TestCgoExternalThreadSIGPROF(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoExternalThreadSIGPROF
tags: [method private test]
```

```Go
func TestCgoExternalThreadSIGPROF(t *testing.T)
```

### <a id="TestCgoExternalThreadSignal" href="#TestCgoExternalThreadSignal">func TestCgoExternalThreadSignal(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoExternalThreadSignal
tags: [method private test]
```

```Go
func TestCgoExternalThreadSignal(t *testing.T)
```

### <a id="TestCgoLockOSThreadExit" href="#TestCgoLockOSThreadExit">func TestCgoLockOSThreadExit(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoLockOSThreadExit
tags: [method private test]
```

```Go
func TestCgoLockOSThreadExit(t *testing.T)
```

### <a id="TestCgoNumGoroutine" href="#TestCgoNumGoroutine">func TestCgoNumGoroutine(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoNumGoroutine
tags: [method private test]
```

```Go
func TestCgoNumGoroutine(t *testing.T)
```

### <a id="TestCgoPanicDeadlock" href="#TestCgoPanicDeadlock">func TestCgoPanicDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoPanicDeadlock
tags: [method private test]
```

```Go
func TestCgoPanicDeadlock(t *testing.T)
```

### <a id="TestCgoPprof" href="#TestCgoPprof">func TestCgoPprof(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoPprof
tags: [method private test]
```

```Go
func TestCgoPprof(t *testing.T)
```

### <a id="TestCgoPprofPIE" href="#TestCgoPprofPIE">func TestCgoPprofPIE(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoPprofPIE
tags: [method private test]
```

```Go
func TestCgoPprofPIE(t *testing.T)
```

### <a id="TestCgoPprofThread" href="#TestCgoPprofThread">func TestCgoPprofThread(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoPprofThread
tags: [method private test]
```

```Go
func TestCgoPprofThread(t *testing.T)
```

### <a id="TestCgoPprofThreadNoTraceback" href="#TestCgoPprofThreadNoTraceback">func TestCgoPprofThreadNoTraceback(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoPprofThreadNoTraceback
tags: [method private test]
```

```Go
func TestCgoPprofThreadNoTraceback(t *testing.T)
```

### <a id="TestCgoSignalDeadlock" href="#TestCgoSignalDeadlock">func TestCgoSignalDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoSignalDeadlock
tags: [method private test]
```

```Go
func TestCgoSignalDeadlock(t *testing.T)
```

### <a id="TestCgoTraceback" href="#TestCgoTraceback">func TestCgoTraceback(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoTraceback
tags: [method private test]
```

```Go
func TestCgoTraceback(t *testing.T)
```

### <a id="TestCgoTracebackContext" href="#TestCgoTracebackContext">func TestCgoTracebackContext(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoTracebackContext
tags: [method private test]
```

```Go
func TestCgoTracebackContext(t *testing.T)
```

### <a id="TestCgoTracebackSigpanic" href="#TestCgoTracebackSigpanic">func TestCgoTracebackSigpanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoTracebackSigpanic
tags: [method private test]
```

```Go
func TestCgoTracebackSigpanic(t *testing.T)
```

### <a id="TestChan" href="#TestChan">func TestChan(t *testing.T)</a>

```
searchKey: runtime_test.TestChan
tags: [method private test]
```

```Go
func TestChan(t *testing.T)
```

### <a id="TestChanSendBarrier" href="#TestChanSendBarrier">func TestChanSendBarrier(t *testing.T)</a>

```
searchKey: runtime_test.TestChanSendBarrier
tags: [method private test]
```

```Go
func TestChanSendBarrier(t *testing.T)
```

### <a id="TestChanSendInterface" href="#TestChanSendInterface">func TestChanSendInterface(t *testing.T)</a>

```
searchKey: runtime_test.TestChanSendInterface
tags: [method private test]
```

```Go
func TestChanSendInterface(t *testing.T)
```

### <a id="TestChanSendSelectBarrier" href="#TestChanSendSelectBarrier">func TestChanSendSelectBarrier(t *testing.T)</a>

```
searchKey: runtime_test.TestChanSendSelectBarrier
tags: [method private test]
```

```Go
func TestChanSendSelectBarrier(t *testing.T)
```

### <a id="TestCheckPtr" href="#TestCheckPtr">func TestCheckPtr(t *testing.T)</a>

```
searchKey: runtime_test.TestCheckPtr
tags: [method private test]
```

```Go
func TestCheckPtr(t *testing.T)
```

### <a id="TestCmpIfaceConcreteAlloc" href="#TestCmpIfaceConcreteAlloc">func TestCmpIfaceConcreteAlloc(t *testing.T)</a>

```
searchKey: runtime_test.TestCmpIfaceConcreteAlloc
tags: [method private test]
```

```Go
func TestCmpIfaceConcreteAlloc(t *testing.T)
```

Issue 9370 

### <a id="TestCollisions" href="#TestCollisions">func TestCollisions(t *testing.T)</a>

```
searchKey: runtime_test.TestCollisions
tags: [method private test]
```

```Go
func TestCollisions(t *testing.T)
```

### <a id="TestCompareTempString" href="#TestCompareTempString">func TestCompareTempString(t *testing.T)</a>

```
searchKey: runtime_test.TestCompareTempString
tags: [method private test]
```

```Go
func TestCompareTempString(t *testing.T)
```

### <a id="TestConcurrentMapIterateWrite" href="#TestConcurrentMapIterateWrite">func TestConcurrentMapIterateWrite(t *testing.T)</a>

```
searchKey: runtime_test.TestConcurrentMapIterateWrite
tags: [method private test]
```

```Go
func TestConcurrentMapIterateWrite(t *testing.T)
```

### <a id="TestConcurrentMapReadWrite" href="#TestConcurrentMapReadWrite">func TestConcurrentMapReadWrite(t *testing.T)</a>

```
searchKey: runtime_test.TestConcurrentMapReadWrite
tags: [method private test]
```

```Go
func TestConcurrentMapReadWrite(t *testing.T)
```

### <a id="TestConcurrentMapWrites" href="#TestConcurrentMapWrites">func TestConcurrentMapWrites(t *testing.T)</a>

```
searchKey: runtime_test.TestConcurrentMapWrites
tags: [method private test]
```

```Go
func TestConcurrentMapWrites(t *testing.T)
```

### <a id="TestConcurrentReadsAfterGrowth" href="#TestConcurrentReadsAfterGrowth">func TestConcurrentReadsAfterGrowth(t *testing.T)</a>

```
searchKey: runtime_test.TestConcurrentReadsAfterGrowth
tags: [method private test]
```

```Go
func TestConcurrentReadsAfterGrowth(t *testing.T)
```

### <a id="TestConcurrentReadsAfterGrowthReflect" href="#TestConcurrentReadsAfterGrowthReflect">func TestConcurrentReadsAfterGrowthReflect(t *testing.T)</a>

```
searchKey: runtime_test.TestConcurrentReadsAfterGrowthReflect
tags: [method private test]
```

```Go
func TestConcurrentReadsAfterGrowthReflect(t *testing.T)
```

### <a id="TestConditionalDefers" href="#TestConditionalDefers">func TestConditionalDefers(t *testing.T)</a>

```
searchKey: runtime_test.TestConditionalDefers
tags: [method private test]
```

```Go
func TestConditionalDefers(t *testing.T)
```

Make sure that conditional open-coded defers are activated correctly and run in the correct order. 

### <a id="TestCrashDumpsAllThreads" href="#TestCrashDumpsAllThreads">func TestCrashDumpsAllThreads(t *testing.T)</a>

```
searchKey: runtime_test.TestCrashDumpsAllThreads
tags: [method private test]
```

```Go
func TestCrashDumpsAllThreads(t *testing.T)
```

### <a id="TestCrashHandler" href="#TestCrashHandler">func TestCrashHandler(t *testing.T)</a>

```
searchKey: runtime_test.TestCrashHandler
tags: [method private test]
```

```Go
func TestCrashHandler(t *testing.T)
```

### <a id="TestDebugLog" href="#TestDebugLog">func TestDebugLog(t *testing.T)</a>

```
searchKey: runtime_test.TestDebugLog
tags: [method private test]
```

```Go
func TestDebugLog(t *testing.T)
```

### <a id="TestDebugLogInterleaving" href="#TestDebugLogInterleaving">func TestDebugLogInterleaving(t *testing.T)</a>

```
searchKey: runtime_test.TestDebugLogInterleaving
tags: [method private test]
```

```Go
func TestDebugLogInterleaving(t *testing.T)
```

### <a id="TestDebugLogLongString" href="#TestDebugLogLongString">func TestDebugLogLongString(t *testing.T)</a>

```
searchKey: runtime_test.TestDebugLogLongString
tags: [method private test]
```

```Go
func TestDebugLogLongString(t *testing.T)
```

### <a id="TestDebugLogSym" href="#TestDebugLogSym">func TestDebugLogSym(t *testing.T)</a>

```
searchKey: runtime_test.TestDebugLogSym
tags: [method private test]
```

```Go
func TestDebugLogSym(t *testing.T)
```

### <a id="TestDebugLogTypes" href="#TestDebugLogTypes">func TestDebugLogTypes(t *testing.T)</a>

```
searchKey: runtime_test.TestDebugLogTypes
tags: [method private test]
```

```Go
func TestDebugLogTypes(t *testing.T)
```

### <a id="TestDebugLogWraparound" href="#TestDebugLogWraparound">func TestDebugLogWraparound(t *testing.T)</a>

```
searchKey: runtime_test.TestDebugLogWraparound
tags: [method private test]
```

```Go
func TestDebugLogWraparound(t *testing.T)
```

### <a id="TestDeferDeleteSlow" href="#TestDeferDeleteSlow">func TestDeferDeleteSlow(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferDeleteSlow
tags: [method private test]
```

```Go
func TestDeferDeleteSlow(t *testing.T)
```

### <a id="TestDeferForFuncWithNoExit" href="#TestDeferForFuncWithNoExit">func TestDeferForFuncWithNoExit(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferForFuncWithNoExit
tags: [method private test]
```

```Go
func TestDeferForFuncWithNoExit(t *testing.T)
```

### <a id="TestDeferHeapAndStack" href="#TestDeferHeapAndStack">func TestDeferHeapAndStack(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferHeapAndStack
tags: [method private test]
```

```Go
func TestDeferHeapAndStack(t *testing.T)
```

### <a id="TestDeferKeepAlive" href="#TestDeferKeepAlive">func TestDeferKeepAlive(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferKeepAlive
tags: [method private test]
```

```Go
func TestDeferKeepAlive(t *testing.T)
```

### <a id="TestDeferLeafSigpanic" href="#TestDeferLeafSigpanic">func TestDeferLeafSigpanic(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferLeafSigpanic
tags: [method private test]
```

```Go
func TestDeferLeafSigpanic(t *testing.T)
```

TestDeferLeafSigpanic tests defer matching around leaf functions that sigpanic. This is tricky because on LR machines the outer function and the inner function have the same SP, but it's critical that we match up the defer correctly to get the right liveness map. See issue #25499. 

### <a id="TestDeferLiveness" href="#TestDeferLiveness">func TestDeferLiveness(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferLiveness
tags: [method private test]
```

```Go
func TestDeferLiveness(t *testing.T)
```

Test that defer closure is correctly scanned when the stack is scanned. 

### <a id="TestDeferPtrs" href="#TestDeferPtrs">func TestDeferPtrs(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferPtrs
tags: [method private test]
```

```Go
func TestDeferPtrs(t *testing.T)
```

### <a id="TestDeferPtrsGoexit" href="#TestDeferPtrsGoexit">func TestDeferPtrsGoexit(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferPtrsGoexit
tags: [method private test]
```

```Go
func TestDeferPtrsGoexit(t *testing.T)
```

TestDeferPtrsGoexit is like TestDeferPtrs but exercises the possibility that the stack grows as part of starting the deferred function. It calls Goexit at various stack depths, forcing the deferred function (with >4kB of args) to be run at the bottom of the stack. The goal is to find a stack depth less than 4kB from the end of the stack. Each trial runs in a different goroutine so that an earlier stack growth does not invalidate a later attempt. 

### <a id="TestDeferPtrsPanic" href="#TestDeferPtrsPanic">func TestDeferPtrsPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferPtrsPanic
tags: [method private test]
```

```Go
func TestDeferPtrsPanic(t *testing.T)
```

TestDeferPtrsPanic is like TestDeferPtrsGoexit, but it's using panic instead of Goexit to run the Defers. Those two are different execution paths in the runtime. 

### <a id="TestDeferWithRepeatedRepanics" href="#TestDeferWithRepeatedRepanics">func TestDeferWithRepeatedRepanics(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferWithRepeatedRepanics
tags: [method private test]
```

```Go
func TestDeferWithRepeatedRepanics(t *testing.T)
```

Test case approximating issue #37664, where a recursive function (interpreter) may do repeated recovers/re-panics until it reaches the frame where the panic can actually be handled. The recurseFnPanicRec() function is testing that there are no stale defer structs on the defer chain after the interpreter() sequence, by writing a bunch of 0xffffffffs into several recursive stack frames, and then doing a single panic-recover which would invoke any such stale defer structs. 

### <a id="TestDisappearingDefer" href="#TestDisappearingDefer">func TestDisappearingDefer(t *testing.T)</a>

```
searchKey: runtime_test.TestDisappearingDefer
tags: [method private test]
```

```Go
func TestDisappearingDefer(t *testing.T)
```

Test that there is no compile-time or run-time error if an open-coded defer call is removed by constant propagation and dead-code elimination. 

### <a id="TestDoublePanic" href="#TestDoublePanic">func TestDoublePanic(t *testing.T)</a>

```
searchKey: runtime_test.TestDoublePanic
tags: [method private test]
```

```Go
func TestDoublePanic(t *testing.T)
```

Test that panic message is not clobbered. See issue 30150. 

### <a id="TestEINTR" href="#TestEINTR">func TestEINTR(t *testing.T)</a>

```
searchKey: runtime_test.TestEINTR
tags: [method private test]
```

```Go
func TestEINTR(t *testing.T)
```

TestEINTR tests that we handle EINTR correctly. See issue #20400 and friends. 

### <a id="TestEmptyKeyAndValue" href="#TestEmptyKeyAndValue">func TestEmptyKeyAndValue(t *testing.T)</a>

```
searchKey: runtime_test.TestEmptyKeyAndValue
tags: [method private test]
```

```Go
func TestEmptyKeyAndValue(t *testing.T)
```

### <a id="TestEmptySlice" href="#TestEmptySlice">func TestEmptySlice(t *testing.T)</a>

```
searchKey: runtime_test.TestEmptySlice
tags: [method private test]
```

```Go
func TestEmptySlice(t *testing.T)
```

Make sure an empty slice on the stack doesn't pin the next object in memory. 

### <a id="TestEmptyString" href="#TestEmptyString">func TestEmptyString(t *testing.T)</a>

```
searchKey: runtime_test.TestEmptyString
tags: [method private test]
```

```Go
func TestEmptyString(t *testing.T)
```

Make sure an empty string on the stack doesn't pin the next object in memory. 

### <a id="TestEnsureDropM" href="#TestEnsureDropM">func TestEnsureDropM(t *testing.T)</a>

```
searchKey: runtime_test.TestEnsureDropM
tags: [method private test]
```

```Go
func TestEnsureDropM(t *testing.T)
```

### <a id="TestEqString" href="#TestEqString">func TestEqString(t *testing.T)</a>

```
searchKey: runtime_test.TestEqString
tags: [method private test]
```

```Go
func TestEqString(t *testing.T)
```

### <a id="TestFakeTime" href="#TestFakeTime">func TestFakeTime(t *testing.T)</a>

```
searchKey: runtime_test.TestFakeTime
tags: [method private test]
```

```Go
func TestFakeTime(t *testing.T)
```

### <a id="TestFastLog2" href="#TestFastLog2">func TestFastLog2(t *testing.T)</a>

```
searchKey: runtime_test.TestFastLog2
tags: [method private test]
```

```Go
func TestFastLog2(t *testing.T)
```

### <a id="TestFillAligned" href="#TestFillAligned">func TestFillAligned(t *testing.T)</a>

```
searchKey: runtime_test.TestFillAligned
tags: [method private test]
```

```Go
func TestFillAligned(t *testing.T)
```

### <a id="TestFinalizerInterfaceBig" href="#TestFinalizerInterfaceBig">func TestFinalizerInterfaceBig(t *testing.T)</a>

```
searchKey: runtime_test.TestFinalizerInterfaceBig
tags: [method private test]
```

```Go
func TestFinalizerInterfaceBig(t *testing.T)
```

### <a id="TestFinalizerOnGlobal" href="#TestFinalizerOnGlobal">func TestFinalizerOnGlobal(t *testing.T)</a>

```
searchKey: runtime_test.TestFinalizerOnGlobal
tags: [method private test]
```

```Go
func TestFinalizerOnGlobal(t *testing.T)
```

Test for issue 7656. 

### <a id="TestFinalizerType" href="#TestFinalizerType">func TestFinalizerType(t *testing.T)</a>

```
searchKey: runtime_test.TestFinalizerType
tags: [method private test]
```

```Go
func TestFinalizerType(t *testing.T)
```

### <a id="TestFinalizerZeroSizedStruct" href="#TestFinalizerZeroSizedStruct">func TestFinalizerZeroSizedStruct(t *testing.T)</a>

```
searchKey: runtime_test.TestFinalizerZeroSizedStruct
tags: [method private test]
```

```Go
func TestFinalizerZeroSizedStruct(t *testing.T)
```

Verify we don't crash at least. golang.org/issue/6857 

### <a id="TestFindBitRange64" href="#TestFindBitRange64">func TestFindBitRange64(t *testing.T)</a>

```
searchKey: runtime_test.TestFindBitRange64
tags: [method private test]
```

```Go
func TestFindBitRange64(t *testing.T)
```

### <a id="TestFixedGOROOT" href="#TestFixedGOROOT">func TestFixedGOROOT(t *testing.T)</a>

```
searchKey: runtime_test.TestFixedGOROOT
tags: [method private test]
```

```Go
func TestFixedGOROOT(t *testing.T)
```

### <a id="TestFloat64" href="#TestFloat64">func TestFloat64(t *testing.T)</a>

```
searchKey: runtime_test.TestFloat64
tags: [method private test]
```

```Go
func TestFloat64(t *testing.T)
```

### <a id="TestFunctionAlignmentTraceback" href="#TestFunctionAlignmentTraceback">func TestFunctionAlignmentTraceback(t *testing.T)</a>

```
searchKey: runtime_test.TestFunctionAlignmentTraceback
tags: [method private test]
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

### <a id="TestG0StackOverflow" href="#TestG0StackOverflow">func TestG0StackOverflow(t *testing.T)</a>

```
searchKey: runtime_test.TestG0StackOverflow
tags: [method private test]
```

```Go
func TestG0StackOverflow(t *testing.T)
```

Test that g0 stack overflows are handled gracefully. 

### <a id="TestGCFairness" href="#TestGCFairness">func TestGCFairness(t *testing.T)</a>

```
searchKey: runtime_test.TestGCFairness
tags: [method private test]
```

```Go
func TestGCFairness(t *testing.T)
```

### <a id="TestGCFairness2" href="#TestGCFairness2">func TestGCFairness2(t *testing.T)</a>

```
searchKey: runtime_test.TestGCFairness2
tags: [method private test]
```

```Go
func TestGCFairness2(t *testing.T)
```

### <a id="TestGCInfo" href="#TestGCInfo">func TestGCInfo(t *testing.T)</a>

```
searchKey: runtime_test.TestGCInfo
tags: [method private test]
```

```Go
func TestGCInfo(t *testing.T)
```

TestGCInfo tests that various objects in heap, data and bss receive correct GC pointer type info. 

### <a id="TestGCTestIsReachable" href="#TestGCTestIsReachable">func TestGCTestIsReachable(t *testing.T)</a>

```
searchKey: runtime_test.TestGCTestIsReachable
tags: [method private test]
```

```Go
func TestGCTestIsReachable(t *testing.T)
```

### <a id="TestGCTestMoveStackOnNextCall" href="#TestGCTestMoveStackOnNextCall">func TestGCTestMoveStackOnNextCall(t *testing.T)</a>

```
searchKey: runtime_test.TestGCTestMoveStackOnNextCall
tags: [method private test]
```

```Go
func TestGCTestMoveStackOnNextCall(t *testing.T)
```

### <a id="TestGCTestMoveStackRepeatedly" href="#TestGCTestMoveStackRepeatedly">func TestGCTestMoveStackRepeatedly(t *testing.T)</a>

```
searchKey: runtime_test.TestGCTestMoveStackRepeatedly
tags: [method private test]
```

```Go
func TestGCTestMoveStackRepeatedly(t *testing.T)
```

### <a id="TestGCTestPointerClass" href="#TestGCTestPointerClass">func TestGCTestPointerClass(t *testing.T)</a>

```
searchKey: runtime_test.TestGCTestPointerClass
tags: [method private test]
```

```Go
func TestGCTestPointerClass(t *testing.T)
```

### <a id="TestGcArraySlice" href="#TestGcArraySlice">func TestGcArraySlice(t *testing.T)</a>

```
searchKey: runtime_test.TestGcArraySlice
tags: [method private test]
```

```Go
func TestGcArraySlice(t *testing.T)
```

### <a id="TestGcDeepNesting" href="#TestGcDeepNesting">func TestGcDeepNesting(t *testing.T)</a>

```
searchKey: runtime_test.TestGcDeepNesting
tags: [method private test]
```

```Go
func TestGcDeepNesting(t *testing.T)
```

### <a id="TestGcLastTime" href="#TestGcLastTime">func TestGcLastTime(t *testing.T)</a>

```
searchKey: runtime_test.TestGcLastTime
tags: [method private test]
```

```Go
func TestGcLastTime(t *testing.T)
```

### <a id="TestGcMapIndirection" href="#TestGcMapIndirection">func TestGcMapIndirection(t *testing.T)</a>

```
searchKey: runtime_test.TestGcMapIndirection
tags: [method private test]
```

```Go
func TestGcMapIndirection(t *testing.T)
```

### <a id="TestGcRescan" href="#TestGcRescan">func TestGcRescan(t *testing.T)</a>

```
searchKey: runtime_test.TestGcRescan
tags: [method private test]
```

```Go
func TestGcRescan(t *testing.T)
```

### <a id="TestGcSys" href="#TestGcSys">func TestGcSys(t *testing.T)</a>

```
searchKey: runtime_test.TestGcSys
tags: [method private test]
```

```Go
func TestGcSys(t *testing.T)
```

### <a id="TestGcZombieReporting" href="#TestGcZombieReporting">func TestGcZombieReporting(t *testing.T)</a>

```
searchKey: runtime_test.TestGcZombieReporting
tags: [method private test]
```

```Go
func TestGcZombieReporting(t *testing.T)
```

### <a id="TestGdbAutotmpTypes" href="#TestGdbAutotmpTypes">func TestGdbAutotmpTypes(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbAutotmpTypes
tags: [method private test]
```

```Go
func TestGdbAutotmpTypes(t *testing.T)
```

TestGdbAutotmpTypes ensures that types of autotmp variables appear in .debug_info See bug #17830. 

### <a id="TestGdbBacktrace" href="#TestGdbBacktrace">func TestGdbBacktrace(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbBacktrace
tags: [method private test]
```

```Go
func TestGdbBacktrace(t *testing.T)
```

TestGdbBacktrace tests that gdb can unwind the stack correctly using only the DWARF debug info. 

### <a id="TestGdbConst" href="#TestGdbConst">func TestGdbConst(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbConst
tags: [method private test]
```

```Go
func TestGdbConst(t *testing.T)
```

### <a id="TestGdbInfCallstack" href="#TestGdbInfCallstack">func TestGdbInfCallstack(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbInfCallstack
tags: [method private test]
```

```Go
func TestGdbInfCallstack(t *testing.T)
```

TestGdbInfCallstack tests that gdb can unwind the callstack of cgo programs on arm64 platforms without endless frames of function 'crossfunc1'. [https://golang.org/issue/37238](https://golang.org/issue/37238) 

### <a id="TestGdbPanic" href="#TestGdbPanic">func TestGdbPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbPanic
tags: [method private test]
```

```Go
func TestGdbPanic(t *testing.T)
```

TestGdbPanic tests that gdb can unwind the stack correctly from SIGABRTs from Go panics. 

### <a id="TestGdbPython" href="#TestGdbPython">func TestGdbPython(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbPython
tags: [method private test]
```

```Go
func TestGdbPython(t *testing.T)
```

### <a id="TestGdbPythonCgo" href="#TestGdbPythonCgo">func TestGdbPythonCgo(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbPythonCgo
tags: [method private test]
```

```Go
func TestGdbPythonCgo(t *testing.T)
```

### <a id="TestGetgThreadSwitch" href="#TestGetgThreadSwitch">func TestGetgThreadSwitch(t *testing.T)</a>

```
searchKey: runtime_test.TestGetgThreadSwitch
tags: [method private test]
```

```Go
func TestGetgThreadSwitch(t *testing.T)
```

### <a id="TestGoNil" href="#TestGoNil">func TestGoNil(t *testing.T)</a>

```
searchKey: runtime_test.TestGoNil
tags: [method private test]
```

```Go
func TestGoNil(t *testing.T)
```

### <a id="TestGoexitCrash" href="#TestGoexitCrash">func TestGoexitCrash(t *testing.T)</a>

```
searchKey: runtime_test.TestGoexitCrash
tags: [method private test]
```

```Go
func TestGoexitCrash(t *testing.T)
```

### <a id="TestGoexitDeadlock" href="#TestGoexitDeadlock">func TestGoexitDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestGoexitDeadlock
tags: [method private test]
```

```Go
func TestGoexitDeadlock(t *testing.T)
```

### <a id="TestGoexitDefer" href="#TestGoexitDefer">func TestGoexitDefer(t *testing.T)</a>

```
searchKey: runtime_test.TestGoexitDefer
tags: [method private test]
```

```Go
func TestGoexitDefer(t *testing.T)
```

### <a id="TestGoexitInPanic" href="#TestGoexitInPanic">func TestGoexitInPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestGoexitInPanic
tags: [method private test]
```

```Go
func TestGoexitInPanic(t *testing.T)
```

### <a id="TestGoroutineParallelism" href="#TestGoroutineParallelism">func TestGoroutineParallelism(t *testing.T)</a>

```
searchKey: runtime_test.TestGoroutineParallelism
tags: [method private test]
```

```Go
func TestGoroutineParallelism(t *testing.T)
```

### <a id="TestGoroutineParallelism2" href="#TestGoroutineParallelism2">func TestGoroutineParallelism2(t *testing.T)</a>

```
searchKey: runtime_test.TestGoroutineParallelism2
tags: [method private test]
```

```Go
func TestGoroutineParallelism2(t *testing.T)
```

Test that all runnable goroutines are scheduled at the same time. 

### <a id="TestGoroutineProfile" href="#TestGoroutineProfile">func TestGoroutineProfile(t *testing.T)</a>

```
searchKey: runtime_test.TestGoroutineProfile
tags: [method private test]
```

```Go
func TestGoroutineProfile(t *testing.T)
```

### <a id="TestGoroutineProfileTrivial" href="#TestGoroutineProfileTrivial">func TestGoroutineProfileTrivial(t *testing.T)</a>

```
searchKey: runtime_test.TestGoroutineProfileTrivial
tags: [method private test]
```

```Go
func TestGoroutineProfileTrivial(t *testing.T)
```

### <a id="TestGrowWithNaN" href="#TestGrowWithNaN">func TestGrowWithNaN(t *testing.T)</a>

```
searchKey: runtime_test.TestGrowWithNaN
tags: [method private test]
```

```Go
func TestGrowWithNaN(t *testing.T)
```

### <a id="TestGrowWithNegativeZero" href="#TestGrowWithNegativeZero">func TestGrowWithNegativeZero(t *testing.T)</a>

```
searchKey: runtime_test.TestGrowWithNegativeZero
tags: [method private test]
```

```Go
func TestGrowWithNegativeZero(t *testing.T)
```

### <a id="TestHmapSize" href="#TestHmapSize">func TestHmapSize(t *testing.T)</a>

```
searchKey: runtime_test.TestHmapSize
tags: [method private test]
```

```Go
func TestHmapSize(t *testing.T)
```

### <a id="TestHugeGCInfo" href="#TestHugeGCInfo">func TestHugeGCInfo(t *testing.T)</a>

```
searchKey: runtime_test.TestHugeGCInfo
tags: [method private test]
```

```Go
func TestHugeGCInfo(t *testing.T)
```

### <a id="TestIgnoreBogusMapHint" href="#TestIgnoreBogusMapHint">func TestIgnoreBogusMapHint(t *testing.T)</a>

```
searchKey: runtime_test.TestIgnoreBogusMapHint
tags: [method private test]
```

```Go
func TestIgnoreBogusMapHint(t *testing.T)
```

Test that making a map with a large or invalid hint doesn't panic. (Issue 19926). 

### <a id="TestIncrementAfterBulkClearKeyStringValueInt" href="#TestIncrementAfterBulkClearKeyStringValueInt">func TestIncrementAfterBulkClearKeyStringValueInt(t *testing.T)</a>

```
searchKey: runtime_test.TestIncrementAfterBulkClearKeyStringValueInt
tags: [method private test]
```

```Go
func TestIncrementAfterBulkClearKeyStringValueInt(t *testing.T)
```

TestIncrementAfterBulkClearKeyStringValueInt tests that map bulk deletion (mapclear) still works as expected. Note that it was not affected by Issue 25936. 

### <a id="TestIncrementAfterDeleteKeyStringValueInt" href="#TestIncrementAfterDeleteKeyStringValueInt">func TestIncrementAfterDeleteKeyStringValueInt(t *testing.T)</a>

```
searchKey: runtime_test.TestIncrementAfterDeleteKeyStringValueInt
tags: [method private test]
```

```Go
func TestIncrementAfterDeleteKeyStringValueInt(t *testing.T)
```

### <a id="TestIncrementAfterDeleteKeyValueString" href="#TestIncrementAfterDeleteKeyValueString">func TestIncrementAfterDeleteKeyValueString(t *testing.T)</a>

```
searchKey: runtime_test.TestIncrementAfterDeleteKeyValueString
tags: [method private test]
```

```Go
func TestIncrementAfterDeleteKeyValueString(t *testing.T)
```

### <a id="TestIncrementAfterDeleteValueInt" href="#TestIncrementAfterDeleteValueInt">func TestIncrementAfterDeleteValueInt(t *testing.T)</a>

```
searchKey: runtime_test.TestIncrementAfterDeleteValueInt
tags: [method private test]
```

```Go
func TestIncrementAfterDeleteValueInt(t *testing.T)
```

TestIncrementAfterDeleteValueInt and other test Issue 25936. Value types int, int32, int64 are affected. Value type string works as expected. 

### <a id="TestIncrementAfterDeleteValueInt32" href="#TestIncrementAfterDeleteValueInt32">func TestIncrementAfterDeleteValueInt32(t *testing.T)</a>

```
searchKey: runtime_test.TestIncrementAfterDeleteValueInt32
tags: [method private test]
```

```Go
func TestIncrementAfterDeleteValueInt32(t *testing.T)
```

### <a id="TestIncrementAfterDeleteValueInt64" href="#TestIncrementAfterDeleteValueInt64">func TestIncrementAfterDeleteValueInt64(t *testing.T)</a>

```
searchKey: runtime_test.TestIncrementAfterDeleteValueInt64
tags: [method private test]
```

```Go
func TestIncrementAfterDeleteValueInt64(t *testing.T)
```

### <a id="TestInitDeadlock" href="#TestInitDeadlock">func TestInitDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestInitDeadlock
tags: [method private test]
```

```Go
func TestInitDeadlock(t *testing.T)
```

### <a id="TestIntString" href="#TestIntString">func TestIntString(t *testing.T)</a>

```
searchKey: runtime_test.TestIntString
tags: [method private test]
```

```Go
func TestIntString(t *testing.T)
```

### <a id="TestIntStringAllocs" href="#TestIntStringAllocs">func TestIntStringAllocs(t *testing.T)</a>

```
searchKey: runtime_test.TestIntStringAllocs
tags: [method private test]
```

```Go
func TestIntStringAllocs(t *testing.T)
```

### <a id="TestIssue37688" href="#TestIssue37688">func TestIssue37688(t *testing.T)</a>

```
searchKey: runtime_test.TestIssue37688
tags: [method private test]
```

```Go
func TestIssue37688(t *testing.T)
```

Try to reproduce issue #37688, where a pointer to an open-coded defer struct is mistakenly held, and that struct keeps a pointer to a stack-allocated defer struct, and that stack-allocated struct gets overwritten or the stack gets moved, so a memory error happens on GC. 

### <a id="TestIssue43921" href="#TestIssue43921">func TestIssue43921(t *testing.T)</a>

```
searchKey: runtime_test.TestIssue43921
tags: [method private test]
```

```Go
func TestIssue43921(t *testing.T)
```

### <a id="TestIterGrowAndDelete" href="#TestIterGrowAndDelete">func TestIterGrowAndDelete(t *testing.T)</a>

```
searchKey: runtime_test.TestIterGrowAndDelete
tags: [method private test]
```

```Go
func TestIterGrowAndDelete(t *testing.T)
```

### <a id="TestIterGrowWithGC" href="#TestIterGrowWithGC">func TestIterGrowWithGC(t *testing.T)</a>

```
searchKey: runtime_test.TestIterGrowWithGC
tags: [method private test]
```

```Go
func TestIterGrowWithGC(t *testing.T)
```

make sure old bucket arrays don't get GCd while an iterator is still using them. 

### <a id="TestLFStack" href="#TestLFStack">func TestLFStack(t *testing.T)</a>

```
searchKey: runtime_test.TestLFStack
tags: [method private test]
```

```Go
func TestLFStack(t *testing.T)
```

### <a id="TestLFStackStress" href="#TestLFStackStress">func TestLFStackStress(t *testing.T)</a>

```
searchKey: runtime_test.TestLFStackStress
tags: [method private test]
```

```Go
func TestLFStackStress(t *testing.T)
```

### <a id="TestLargeStringConcat" href="#TestLargeStringConcat">func TestLargeStringConcat(t *testing.T)</a>

```
searchKey: runtime_test.TestLargeStringConcat
tags: [method private test]
```

```Go
func TestLargeStringConcat(t *testing.T)
```

### <a id="TestLineNumber" href="#TestLineNumber">func TestLineNumber(t *testing.T)</a>

```
searchKey: runtime_test.TestLineNumber
tags: [method private test]
```

```Go
func TestLineNumber(t *testing.T)
```

### <a id="TestLldbPython" href="#TestLldbPython">func TestLldbPython(t *testing.T)</a>

```
searchKey: runtime_test.TestLldbPython
tags: [method private test]
```

```Go
func TestLldbPython(t *testing.T)
```

### <a id="TestLockOSThreadAvoidsStatePropagation" href="#TestLockOSThreadAvoidsStatePropagation">func TestLockOSThreadAvoidsStatePropagation(t *testing.T)</a>

```
searchKey: runtime_test.TestLockOSThreadAvoidsStatePropagation
tags: [method private test]
```

```Go
func TestLockOSThreadAvoidsStatePropagation(t *testing.T)
```

### <a id="TestLockOSThreadExit" href="#TestLockOSThreadExit">func TestLockOSThreadExit(t *testing.T)</a>

```
searchKey: runtime_test.TestLockOSThreadExit
tags: [method private test]
```

```Go
func TestLockOSThreadExit(t *testing.T)
```

### <a id="TestLockOSThreadNesting" href="#TestLockOSThreadNesting">func TestLockOSThreadNesting(t *testing.T)</a>

```
searchKey: runtime_test.TestLockOSThreadNesting
tags: [method private test]
```

```Go
func TestLockOSThreadNesting(t *testing.T)
```

### <a id="TestLockOSThreadTemplateThreadRace" href="#TestLockOSThreadTemplateThreadRace">func TestLockOSThreadTemplateThreadRace(t *testing.T)</a>

```
searchKey: runtime_test.TestLockOSThreadTemplateThreadRace
tags: [method private test]
```

```Go
func TestLockOSThreadTemplateThreadRace(t *testing.T)
```

### <a id="TestLockRankPartialOrder" href="#TestLockRankPartialOrder">func TestLockRankPartialOrder(t *testing.T)</a>

```
searchKey: runtime_test.TestLockRankPartialOrder
tags: [method private test]
```

```Go
func TestLockRankPartialOrder(t *testing.T)
```

Check that the partial order in lockPartialOrder fits within the total order determined by the order of the lockRank constants. 

### <a id="TestLockRankPartialOrderSortedEntries" href="#TestLockRankPartialOrderSortedEntries">func TestLockRankPartialOrderSortedEntries(t *testing.T)</a>

```
searchKey: runtime_test.TestLockRankPartialOrderSortedEntries
tags: [method private test]
```

```Go
func TestLockRankPartialOrderSortedEntries(t *testing.T)
```

Verify that partial order lists are kept sorted. This is a purely cosemetic check to make manual reviews simpler. It does not affect correctness, unlike the above test. 

### <a id="TestLockedDeadlock" href="#TestLockedDeadlock">func TestLockedDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestLockedDeadlock
tags: [method private test]
```

```Go
func TestLockedDeadlock(t *testing.T)
```

### <a id="TestLockedDeadlock2" href="#TestLockedDeadlock2">func TestLockedDeadlock2(t *testing.T)</a>

```
searchKey: runtime_test.TestLockedDeadlock2
tags: [method private test]
```

```Go
func TestLockedDeadlock2(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: runtime_test.TestMain
tags: [method private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestMainGoroutineID" href="#TestMainGoroutineID">func TestMainGoroutineID(t *testing.T)</a>

```
searchKey: runtime_test.TestMainGoroutineID
tags: [method private test]
```

```Go
func TestMainGoroutineID(t *testing.T)
```

### <a id="TestMallocBitsPopcntRange" href="#TestMallocBitsPopcntRange">func TestMallocBitsPopcntRange(t *testing.T)</a>

```
searchKey: runtime_test.TestMallocBitsPopcntRange
tags: [method private test]
```

```Go
func TestMallocBitsPopcntRange(t *testing.T)
```

### <a id="TestMapAppendAssignment" href="#TestMapAppendAssignment">func TestMapAppendAssignment(t *testing.T)</a>

```
searchKey: runtime_test.TestMapAppendAssignment
tags: [method private test]
```

```Go
func TestMapAppendAssignment(t *testing.T)
```

### <a id="TestMapAssignmentNan" href="#TestMapAssignmentNan">func TestMapAssignmentNan(t *testing.T)</a>

```
searchKey: runtime_test.TestMapAssignmentNan
tags: [method private test]
```

```Go
func TestMapAssignmentNan(t *testing.T)
```

nan is a good test because nan != nan, and nan has a randomized hash value. 

### <a id="TestMapBuckets" href="#TestMapBuckets">func TestMapBuckets(t *testing.T)</a>

```
searchKey: runtime_test.TestMapBuckets
tags: [method private test]
```

```Go
func TestMapBuckets(t *testing.T)
```

### <a id="TestMapHugeZero" href="#TestMapHugeZero">func TestMapHugeZero(t *testing.T)</a>

```
searchKey: runtime_test.TestMapHugeZero
tags: [method private test]
```

```Go
func TestMapHugeZero(t *testing.T)
```

### <a id="TestMapInterfaceKey" href="#TestMapInterfaceKey">func TestMapInterfaceKey(t *testing.T)</a>

```
searchKey: runtime_test.TestMapInterfaceKey
tags: [method private test]
```

```Go
func TestMapInterfaceKey(t *testing.T)
```

### <a id="TestMapIterOrder" href="#TestMapIterOrder">func TestMapIterOrder(t *testing.T)</a>

```
searchKey: runtime_test.TestMapIterOrder
tags: [method private test]
```

```Go
func TestMapIterOrder(t *testing.T)
```

### <a id="TestMapLargeKeyNoPointer" href="#TestMapLargeKeyNoPointer">func TestMapLargeKeyNoPointer(t *testing.T)</a>

```
searchKey: runtime_test.TestMapLargeKeyNoPointer
tags: [method private test]
```

```Go
func TestMapLargeKeyNoPointer(t *testing.T)
```

### <a id="TestMapLargeValNoPointer" href="#TestMapLargeValNoPointer">func TestMapLargeValNoPointer(t *testing.T)</a>

```
searchKey: runtime_test.TestMapLargeValNoPointer
tags: [method private test]
```

```Go
func TestMapLargeValNoPointer(t *testing.T)
```

### <a id="TestMapNanGrowIterator" href="#TestMapNanGrowIterator">func TestMapNanGrowIterator(t *testing.T)</a>

```
searchKey: runtime_test.TestMapNanGrowIterator
tags: [method private test]
```

```Go
func TestMapNanGrowIterator(t *testing.T)
```

Tests whether the iterator returns the right elements when started in the middle of a grow, when the keys are NaNs. 

### <a id="TestMapOperatorAssignment" href="#TestMapOperatorAssignment">func TestMapOperatorAssignment(t *testing.T)</a>

```
searchKey: runtime_test.TestMapOperatorAssignment
tags: [method private test]
```

```Go
func TestMapOperatorAssignment(t *testing.T)
```

### <a id="TestMapOperatorAssignmentNan" href="#TestMapOperatorAssignmentNan">func TestMapOperatorAssignmentNan(t *testing.T)</a>

```
searchKey: runtime_test.TestMapOperatorAssignmentNan
tags: [method private test]
```

```Go
func TestMapOperatorAssignmentNan(t *testing.T)
```

nan is a good test because nan != nan, and nan has a randomized hash value. 

### <a id="TestMapSparseIterOrder" href="#TestMapSparseIterOrder">func TestMapSparseIterOrder(t *testing.T)</a>

```
searchKey: runtime_test.TestMapSparseIterOrder
tags: [method private test]
```

```Go
func TestMapSparseIterOrder(t *testing.T)
```

Issue 8410 

### <a id="TestMapStringBytesLookup" href="#TestMapStringBytesLookup">func TestMapStringBytesLookup(t *testing.T)</a>

```
searchKey: runtime_test.TestMapStringBytesLookup
tags: [method private test]
```

```Go
func TestMapStringBytesLookup(t *testing.T)
```

### <a id="TestMapTombstones" href="#TestMapTombstones">func TestMapTombstones(t *testing.T)</a>

```
searchKey: runtime_test.TestMapTombstones
tags: [method private test]
```

```Go
func TestMapTombstones(t *testing.T)
```

### <a id="TestMemHash32Equality" href="#TestMemHash32Equality">func TestMemHash32Equality(t *testing.T)</a>

```
searchKey: runtime_test.TestMemHash32Equality
tags: [method private test]
```

```Go
func TestMemHash32Equality(t *testing.T)
```

### <a id="TestMemHash64Equality" href="#TestMemHash64Equality">func TestMemHash64Equality(t *testing.T)</a>

```
searchKey: runtime_test.TestMemHash64Equality
tags: [method private test]
```

```Go
func TestMemHash64Equality(t *testing.T)
```

### <a id="TestMemPprof" href="#TestMemPprof">func TestMemPprof(t *testing.T)</a>

```
searchKey: runtime_test.TestMemPprof
tags: [method private test]
```

```Go
func TestMemPprof(t *testing.T)
```

### <a id="TestMemStats" href="#TestMemStats">func TestMemStats(t *testing.T)</a>

```
searchKey: runtime_test.TestMemStats
tags: [method private test]
```

```Go
func TestMemStats(t *testing.T)
```

### <a id="TestMemclr" href="#TestMemclr">func TestMemclr(t *testing.T)</a>

```
searchKey: runtime_test.TestMemclr
tags: [method private test]
```

```Go
func TestMemclr(t *testing.T)
```

### <a id="TestMemmove" href="#TestMemmove">func TestMemmove(t *testing.T)</a>

```
searchKey: runtime_test.TestMemmove
tags: [method private test]
```

```Go
func TestMemmove(t *testing.T)
```

### <a id="TestMemmoveAlias" href="#TestMemmoveAlias">func TestMemmoveAlias(t *testing.T)</a>

```
searchKey: runtime_test.TestMemmoveAlias
tags: [method private test]
```

```Go
func TestMemmoveAlias(t *testing.T)
```

### <a id="TestMemmoveAtomicity" href="#TestMemmoveAtomicity">func TestMemmoveAtomicity(t *testing.T)</a>

```
searchKey: runtime_test.TestMemmoveAtomicity
tags: [method private test]
```

```Go
func TestMemmoveAtomicity(t *testing.T)
```

Ensure that memmove writes pointers atomically, so the GC won't observe a partially updated pointer. 

### <a id="TestMemmoveLarge0x180000" href="#TestMemmoveLarge0x180000">func TestMemmoveLarge0x180000(t *testing.T)</a>

```
searchKey: runtime_test.TestMemmoveLarge0x180000
tags: [method private test]
```

```Go
func TestMemmoveLarge0x180000(t *testing.T)
```

### <a id="TestMemmoveOverlapLarge0x120000" href="#TestMemmoveOverlapLarge0x120000">func TestMemmoveOverlapLarge0x120000(t *testing.T)</a>

```
searchKey: runtime_test.TestMemmoveOverlapLarge0x120000
tags: [method private test]
```

```Go
func TestMemmoveOverlapLarge0x120000(t *testing.T)
```

### <a id="TestMmapErrorSign" href="#TestMmapErrorSign">func TestMmapErrorSign(t *testing.T)</a>

```
searchKey: runtime_test.TestMmapErrorSign
tags: [method private test]
```

```Go
func TestMmapErrorSign(t *testing.T)
```

Test that the error value returned by mmap is positive, as that is what the code in mem_bsd.go, mem_darwin.go, and mem_linux.go expects. See the uses of ENOMEM in sysMap in those files. 

### <a id="TestMultiConsumer" href="#TestMultiConsumer">func TestMultiConsumer(t *testing.T)</a>

```
searchKey: runtime_test.TestMultiConsumer
tags: [method private test]
```

```Go
func TestMultiConsumer(t *testing.T)
```

### <a id="TestNeedmDeadlock" href="#TestNeedmDeadlock">func TestNeedmDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestNeedmDeadlock
tags: [method private test]
```

```Go
func TestNeedmDeadlock(t *testing.T)
```

Issue #42207. 

### <a id="TestNegativeZero" href="#TestNegativeZero">func TestNegativeZero(t *testing.T)</a>

```
searchKey: runtime_test.TestNegativeZero
tags: [method private test]
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

### <a id="TestNetpollBreak" href="#TestNetpollBreak">func TestNetpollBreak(t *testing.T)</a>

```
searchKey: runtime_test.TestNetpollBreak
tags: [method private test]
```

```Go
func TestNetpollBreak(t *testing.T)
```

TestNetpollBreak tests that netpollBreak can break a netpoll. This test is not particularly safe since the call to netpoll will pick up any stray files that are ready, but it should work OK as long it is not run in parallel. 

### <a id="TestNetpollDeadlock" href="#TestNetpollDeadlock">func TestNetpollDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestNetpollDeadlock
tags: [method private test]
```

```Go
func TestNetpollDeadlock(t *testing.T)
```

### <a id="TestNilName" href="#TestNilName">func TestNilName(t *testing.T)</a>

```
searchKey: runtime_test.TestNilName
tags: [method private test]
```

```Go
func TestNilName(t *testing.T)
```

### <a id="TestNoHelperGoroutines" href="#TestNoHelperGoroutines">func TestNoHelperGoroutines(t *testing.T)</a>

```
searchKey: runtime_test.TestNoHelperGoroutines
tags: [method private test]
```

```Go
func TestNoHelperGoroutines(t *testing.T)
```

### <a id="TestNoShrinkStackWhileParking" href="#TestNoShrinkStackWhileParking">func TestNoShrinkStackWhileParking(t *testing.T)</a>

```
searchKey: runtime_test.TestNoShrinkStackWhileParking
tags: [method private test]
```

```Go
func TestNoShrinkStackWhileParking(t *testing.T)
```

### <a id="TestNonEscapingConvT2E" href="#TestNonEscapingConvT2E">func TestNonEscapingConvT2E(t *testing.T)</a>

```
searchKey: runtime_test.TestNonEscapingConvT2E
tags: [method private test]
```

```Go
func TestNonEscapingConvT2E(t *testing.T)
```

### <a id="TestNonEscapingConvT2I" href="#TestNonEscapingConvT2I">func TestNonEscapingConvT2I(t *testing.T)</a>

```
searchKey: runtime_test.TestNonEscapingConvT2I
tags: [method private test]
```

```Go
func TestNonEscapingConvT2I(t *testing.T)
```

### <a id="TestNonEscapingMap" href="#TestNonEscapingMap">func TestNonEscapingMap(t *testing.T)</a>

```
searchKey: runtime_test.TestNonEscapingMap
tags: [method private test]
```

```Go
func TestNonEscapingMap(t *testing.T)
```

### <a id="TestNonOpenAndOpenDefers" href="#TestNonOpenAndOpenDefers">func TestNonOpenAndOpenDefers(t *testing.T)</a>

```
searchKey: runtime_test.TestNonOpenAndOpenDefers
tags: [method private test]
```

```Go
func TestNonOpenAndOpenDefers(t *testing.T)
```

Test a non-open-coded defer and an open-coded defer - make sure both defers run and call recover() 

### <a id="TestNonSSAableArgs" href="#TestNonSSAableArgs">func TestNonSSAableArgs(t *testing.T)</a>

```
searchKey: runtime_test.TestNonSSAableArgs
tags: [method private test]
```

```Go
func TestNonSSAableArgs(t *testing.T)
```

Test that nonSSAable arguments to defer are handled correctly and only evaluated once. 

### <a id="TestNonblockRecvRace" href="#TestNonblockRecvRace">func TestNonblockRecvRace(t *testing.T)</a>

```
searchKey: runtime_test.TestNonblockRecvRace
tags: [method private test]
```

```Go
func TestNonblockRecvRace(t *testing.T)
```

### <a id="TestNonblockSelectRace" href="#TestNonblockSelectRace">func TestNonblockSelectRace(t *testing.T)</a>

```
searchKey: runtime_test.TestNonblockSelectRace
tags: [method private test]
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
tags: [method private test]
```

```Go
func TestNonblockSelectRace2(t *testing.T)
```

Same as TestNonblockSelectRace, but close(c2) replaces c2 <- 1. 

### <a id="TestNonblockingPipe" href="#TestNonblockingPipe">func TestNonblockingPipe(t *testing.T)</a>

```
searchKey: runtime_test.TestNonblockingPipe
tags: [method private test]
```

```Go
func TestNonblockingPipe(t *testing.T)
```

### <a id="TestNumGoroutine" href="#TestNumGoroutine">func TestNumGoroutine(t *testing.T)</a>

```
searchKey: runtime_test.TestNumGoroutine
tags: [method private test]
```

```Go
func TestNumGoroutine(t *testing.T)
```

### <a id="TestOpenAndNonOpenDefers" href="#TestOpenAndNonOpenDefers">func TestOpenAndNonOpenDefers(t *testing.T)</a>

```
searchKey: runtime_test.TestOpenAndNonOpenDefers
tags: [method private test]
```

```Go
func TestOpenAndNonOpenDefers(t *testing.T)
```

Test an open-coded defer and non-open-coded defer - make sure both defers run and call recover() 

### <a id="TestPageAccounting" href="#TestPageAccounting">func TestPageAccounting(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAccounting
tags: [method private test]
```

```Go
func TestPageAccounting(t *testing.T)
```

### <a id="TestPageAllocAlloc" href="#TestPageAllocAlloc">func TestPageAllocAlloc(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocAlloc
tags: [method private test]
```

```Go
func TestPageAllocAlloc(t *testing.T)
```

### <a id="TestPageAllocAllocAndFree" href="#TestPageAllocAllocAndFree">func TestPageAllocAllocAndFree(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocAllocAndFree
tags: [method private test]
```

```Go
func TestPageAllocAllocAndFree(t *testing.T)
```

### <a id="TestPageAllocAllocToCache" href="#TestPageAllocAllocToCache">func TestPageAllocAllocToCache(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocAllocToCache
tags: [method private test]
```

```Go
func TestPageAllocAllocToCache(t *testing.T)
```

### <a id="TestPageAllocExhaust" href="#TestPageAllocExhaust">func TestPageAllocExhaust(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocExhaust
tags: [method private test]
```

```Go
func TestPageAllocExhaust(t *testing.T)
```

### <a id="TestPageAllocFree" href="#TestPageAllocFree">func TestPageAllocFree(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocFree
tags: [method private test]
```

```Go
func TestPageAllocFree(t *testing.T)
```

### <a id="TestPageAllocGrow" href="#TestPageAllocGrow">func TestPageAllocGrow(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocGrow
tags: [method private test]
```

```Go
func TestPageAllocGrow(t *testing.T)
```

### <a id="TestPageAllocScavenge" href="#TestPageAllocScavenge">func TestPageAllocScavenge(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocScavenge
tags: [method private test]
```

```Go
func TestPageAllocScavenge(t *testing.T)
```

Tests end-to-end scavenging on a pageAlloc. 

### <a id="TestPageCacheAlloc" href="#TestPageCacheAlloc">func TestPageCacheAlloc(t *testing.T)</a>

```
searchKey: runtime_test.TestPageCacheAlloc
tags: [method private test]
```

```Go
func TestPageCacheAlloc(t *testing.T)
```

### <a id="TestPageCacheFlush" href="#TestPageCacheFlush">func TestPageCacheFlush(t *testing.T)</a>

```
searchKey: runtime_test.TestPageCacheFlush
tags: [method private test]
```

```Go
func TestPageCacheFlush(t *testing.T)
```

### <a id="TestPageCacheLeak" href="#TestPageCacheLeak">func TestPageCacheLeak(t *testing.T)</a>

```
searchKey: runtime_test.TestPageCacheLeak
tags: [method private test]
```

```Go
func TestPageCacheLeak(t *testing.T)
```

### <a id="TestPallocBitsAlloc" href="#TestPallocBitsAlloc">func TestPallocBitsAlloc(t *testing.T)</a>

```
searchKey: runtime_test.TestPallocBitsAlloc
tags: [method private test]
```

```Go
func TestPallocBitsAlloc(t *testing.T)
```

Ensures page allocation works. 

### <a id="TestPallocBitsAllocRange" href="#TestPallocBitsAllocRange">func TestPallocBitsAllocRange(t *testing.T)</a>

```
searchKey: runtime_test.TestPallocBitsAllocRange
tags: [method private test]
```

```Go
func TestPallocBitsAllocRange(t *testing.T)
```

Ensures that PallocBits.AllocRange works, which is a fundamental method used for testing and initialization since it's used by makePallocBits. 

### <a id="TestPallocBitsFree" href="#TestPallocBitsFree">func TestPallocBitsFree(t *testing.T)</a>

```
searchKey: runtime_test.TestPallocBitsFree
tags: [method private test]
```

```Go
func TestPallocBitsFree(t *testing.T)
```

Ensures page freeing works. 

### <a id="TestPallocBitsSummarize" href="#TestPallocBitsSummarize">func TestPallocBitsSummarize(t *testing.T)</a>

```
searchKey: runtime_test.TestPallocBitsSummarize
tags: [method private test]
```

```Go
func TestPallocBitsSummarize(t *testing.T)
```

Ensures computing bit summaries works as expected. 

### <a id="TestPallocBitsSummarizeRandom" href="#TestPallocBitsSummarizeRandom">func TestPallocBitsSummarizeRandom(t *testing.T)</a>

```
searchKey: runtime_test.TestPallocBitsSummarizeRandom
tags: [method private test]
```

```Go
func TestPallocBitsSummarizeRandom(t *testing.T)
```

Ensures computing bit summaries works as expected by generating random bitmaps and checking against a reference implementation. 

### <a id="TestPallocDataFindScavengeCandidate" href="#TestPallocDataFindScavengeCandidate">func TestPallocDataFindScavengeCandidate(t *testing.T)</a>

```
searchKey: runtime_test.TestPallocDataFindScavengeCandidate
tags: [method private test]
```

```Go
func TestPallocDataFindScavengeCandidate(t *testing.T)
```

### <a id="TestPanicAfterGoexit" href="#TestPanicAfterGoexit">func TestPanicAfterGoexit(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicAfterGoexit
tags: [method private test]
```

```Go
func TestPanicAfterGoexit(t *testing.T)
```

### <a id="TestPanicDeadlockGosched" href="#TestPanicDeadlockGosched">func TestPanicDeadlockGosched(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicDeadlockGosched
tags: [method private test]
```

```Go
func TestPanicDeadlockGosched(t *testing.T)
```

### <a id="TestPanicDeadlockSyscall" href="#TestPanicDeadlockSyscall">func TestPanicDeadlockSyscall(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicDeadlockSyscall
tags: [method private test]
```

```Go
func TestPanicDeadlockSyscall(t *testing.T)
```

### <a id="TestPanicFar" href="#TestPanicFar">func TestPanicFar(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicFar
tags: [method private test]
```

```Go
func TestPanicFar(t *testing.T)
```

### <a id="TestPanicInlined" href="#TestPanicInlined">func TestPanicInlined(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicInlined
tags: [method private test]
```

```Go
func TestPanicInlined(t *testing.T)
```

Test for issue #10152. 

### <a id="TestPanicLoop" href="#TestPanicLoop">func TestPanicLoop(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicLoop
tags: [method private test]
```

```Go
func TestPanicLoop(t *testing.T)
```

### <a id="TestPanicRace" href="#TestPanicRace">func TestPanicRace(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicRace
tags: [method private test]
```

```Go
func TestPanicRace(t *testing.T)
```

Test for issues #3934 and #20018. We want to delay exiting until a panic print is complete. 

### <a id="TestPanicSystemstack" href="#TestPanicSystemstack">func TestPanicSystemstack(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicSystemstack
tags: [method private test]
```

```Go
func TestPanicSystemstack(t *testing.T)
```

### <a id="TestPanicTraceback" href="#TestPanicTraceback">func TestPanicTraceback(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicTraceback
tags: [method private test]
```

```Go
func TestPanicTraceback(t *testing.T)
```

### <a id="TestPanicUseStack" href="#TestPanicUseStack">func TestPanicUseStack(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicUseStack
tags: [method private test]
```

```Go
func TestPanicUseStack(t *testing.T)
```

TestPanicUseStack checks that a chain of Panic structs on the stack are updated correctly if the stack grows during the deferred execution that happens as a result of the panic. 

### <a id="TestPanicWithDirectlyPrintableCustomTypes" href="#TestPanicWithDirectlyPrintableCustomTypes">func TestPanicWithDirectlyPrintableCustomTypes(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicWithDirectlyPrintableCustomTypes
tags: [method private test]
```

```Go
func TestPanicWithDirectlyPrintableCustomTypes(t *testing.T)
```

Test that panics print out the underlying value when the underlying kind is directly printable. Issue: [https://golang.org/issues/37531](https://golang.org/issues/37531) 

### <a id="TestParallelRWMutexReaders" href="#TestParallelRWMutexReaders">func TestParallelRWMutexReaders(t *testing.T)</a>

```
searchKey: runtime_test.TestParallelRWMutexReaders
tags: [method private test]
```

```Go
func TestParallelRWMutexReaders(t *testing.T)
```

### <a id="TestPeriodicGC" href="#TestPeriodicGC">func TestPeriodicGC(t *testing.T)</a>

```
searchKey: runtime_test.TestPeriodicGC
tags: [method private test]
```

```Go
func TestPeriodicGC(t *testing.T)
```

### <a id="TestPhysPageSize" href="#TestPhysPageSize">func TestPhysPageSize(t *testing.T)</a>

```
searchKey: runtime_test.TestPhysPageSize
tags: [method private test]
```

```Go
func TestPhysPageSize(t *testing.T)
```

### <a id="TestPhysicalMemoryUtilization" href="#TestPhysicalMemoryUtilization">func TestPhysicalMemoryUtilization(t *testing.T)</a>

```
searchKey: runtime_test.TestPhysicalMemoryUtilization
tags: [method private test]
```

```Go
func TestPhysicalMemoryUtilization(t *testing.T)
```

### <a id="TestPingPongHog" href="#TestPingPongHog">func TestPingPongHog(t *testing.T)</a>

```
searchKey: runtime_test.TestPingPongHog
tags: [method private test]
```

```Go
func TestPingPongHog(t *testing.T)
```

### <a id="TestPreemptSplitBig" href="#TestPreemptSplitBig">func TestPreemptSplitBig(t *testing.T)</a>

```
searchKey: runtime_test.TestPreemptSplitBig
tags: [method private test]
```

```Go
func TestPreemptSplitBig(t *testing.T)
```

### <a id="TestPreemption" href="#TestPreemption">func TestPreemption(t *testing.T)</a>

```
searchKey: runtime_test.TestPreemption
tags: [method private test]
```

```Go
func TestPreemption(t *testing.T)
```

### <a id="TestPreemptionAfterSyscall" href="#TestPreemptionAfterSyscall">func TestPreemptionAfterSyscall(t *testing.T)</a>

```
searchKey: runtime_test.TestPreemptionAfterSyscall
tags: [method private test]
```

```Go
func TestPreemptionAfterSyscall(t *testing.T)
```

### <a id="TestPreemptionGC" href="#TestPreemptionGC">func TestPreemptionGC(t *testing.T)</a>

```
searchKey: runtime_test.TestPreemptionGC
tags: [method private test]
```

```Go
func TestPreemptionGC(t *testing.T)
```

### <a id="TestPrintGC" href="#TestPrintGC">func TestPrintGC(t *testing.T)</a>

```
searchKey: runtime_test.TestPrintGC
tags: [method private test]
```

```Go
func TestPrintGC(t *testing.T)
```

### <a id="TestProfBuf" href="#TestProfBuf">func TestProfBuf(t *testing.T)</a>

```
searchKey: runtime_test.TestProfBuf
tags: [method private test]
```

```Go
func TestProfBuf(t *testing.T)
```

### <a id="TestPseudoRandomSend" href="#TestPseudoRandomSend">func TestPseudoRandomSend(t *testing.T)</a>

```
searchKey: runtime_test.TestPseudoRandomSend
tags: [method private test]
```

```Go
func TestPseudoRandomSend(t *testing.T)
```

### <a id="TestRWMutex" href="#TestRWMutex">func TestRWMutex(t *testing.T)</a>

```
searchKey: runtime_test.TestRWMutex
tags: [method private test]
```

```Go
func TestRWMutex(t *testing.T)
```

### <a id="TestRaceProf" href="#TestRaceProf">func TestRaceProf(t *testing.T)</a>

```
searchKey: runtime_test.TestRaceProf
tags: [method private test]
```

```Go
func TestRaceProf(t *testing.T)
```

### <a id="TestRaceSignal" href="#TestRaceSignal">func TestRaceSignal(t *testing.T)</a>

```
searchKey: runtime_test.TestRaceSignal
tags: [method private test]
```

```Go
func TestRaceSignal(t *testing.T)
```

### <a id="TestRangeStringCast" href="#TestRangeStringCast">func TestRangeStringCast(t *testing.T)</a>

```
searchKey: runtime_test.TestRangeStringCast
tags: [method private test]
```

```Go
func TestRangeStringCast(t *testing.T)
```

### <a id="TestReadMemStats" href="#TestReadMemStats">func TestReadMemStats(t *testing.T)</a>

```
searchKey: runtime_test.TestReadMemStats
tags: [method private test]
```

```Go
func TestReadMemStats(t *testing.T)
```

### <a id="TestReadMetrics" href="#TestReadMetrics">func TestReadMetrics(t *testing.T)</a>

```
searchKey: runtime_test.TestReadMetrics
tags: [method private test]
```

```Go
func TestReadMetrics(t *testing.T)
```

### <a id="TestReadMetricsConsistency" href="#TestReadMetricsConsistency">func TestReadMetricsConsistency(t *testing.T)</a>

```
searchKey: runtime_test.TestReadMetricsConsistency
tags: [method private test]
```

```Go
func TestReadMetricsConsistency(t *testing.T)
```

### <a id="TestRecoverBeforePanicAfterGoexit" href="#TestRecoverBeforePanicAfterGoexit">func TestRecoverBeforePanicAfterGoexit(t *testing.T)</a>

```
searchKey: runtime_test.TestRecoverBeforePanicAfterGoexit
tags: [method private test]
```

```Go
func TestRecoverBeforePanicAfterGoexit(t *testing.T)
```

### <a id="TestRecoverBeforePanicAfterGoexit2" href="#TestRecoverBeforePanicAfterGoexit2">func TestRecoverBeforePanicAfterGoexit2(t *testing.T)</a>

```
searchKey: runtime_test.TestRecoverBeforePanicAfterGoexit2
tags: [method private test]
```

```Go
func TestRecoverBeforePanicAfterGoexit2(t *testing.T)
```

### <a id="TestRecoverMatching" href="#TestRecoverMatching">func TestRecoverMatching(t *testing.T)</a>

```
searchKey: runtime_test.TestRecoverMatching
tags: [method private test]
```

```Go
func TestRecoverMatching(t *testing.T)
```

This tests that recover() does not succeed unless it is called directly from a defer function that is directly called by the panic.  Here, we first call it from a defer function that is created by the defer function called directly by the panic.  In 

### <a id="TestRecoveredPanicAfterGoexit" href="#TestRecoveredPanicAfterGoexit">func TestRecoveredPanicAfterGoexit(t *testing.T)</a>

```
searchKey: runtime_test.TestRecoveredPanicAfterGoexit
tags: [method private test]
```

```Go
func TestRecoveredPanicAfterGoexit(t *testing.T)
```

### <a id="TestRecursivePanic" href="#TestRecursivePanic">func TestRecursivePanic(t *testing.T)</a>

```
searchKey: runtime_test.TestRecursivePanic
tags: [method private test]
```

```Go
func TestRecursivePanic(t *testing.T)
```

### <a id="TestRecursivePanic2" href="#TestRecursivePanic2">func TestRecursivePanic2(t *testing.T)</a>

```
searchKey: runtime_test.TestRecursivePanic2
tags: [method private test]
```

```Go
func TestRecursivePanic2(t *testing.T)
```

### <a id="TestRecursivePanic3" href="#TestRecursivePanic3">func TestRecursivePanic3(t *testing.T)</a>

```
searchKey: runtime_test.TestRecursivePanic3
tags: [method private test]
```

```Go
func TestRecursivePanic3(t *testing.T)
```

### <a id="TestRecursivePanic4" href="#TestRecursivePanic4">func TestRecursivePanic4(t *testing.T)</a>

```
searchKey: runtime_test.TestRecursivePanic4
tags: [method private test]
```

```Go
func TestRecursivePanic4(t *testing.T)
```

### <a id="TestRecursivePanic5" href="#TestRecursivePanic5">func TestRecursivePanic5(t *testing.T)</a>

```
searchKey: runtime_test.TestRecursivePanic5
tags: [method private test]
```

```Go
func TestRecursivePanic5(t *testing.T)
```

### <a id="TestRuntimePanic" href="#TestRuntimePanic">func TestRuntimePanic(t *testing.T)</a>

```
searchKey: runtime_test.TestRuntimePanic
tags: [method private test]
```

```Go
func TestRuntimePanic(t *testing.T)
```

### <a id="TestRuntimePanicWithRuntimeError" href="#TestRuntimePanicWithRuntimeError">func TestRuntimePanicWithRuntimeError(t *testing.T)</a>

```
searchKey: runtime_test.TestRuntimePanicWithRuntimeError
tags: [method private test]
```

```Go
func TestRuntimePanicWithRuntimeError(t *testing.T)
```

Issue 14965: Runtime panics should be of type runtime.Error 

### <a id="TestScavengedBitsCleared" href="#TestScavengedBitsCleared">func TestScavengedBitsCleared(t *testing.T)</a>

```
searchKey: runtime_test.TestScavengedBitsCleared
tags: [method private test]
```

```Go
func TestScavengedBitsCleared(t *testing.T)
```

### <a id="TestSchedLocalQueue" href="#TestSchedLocalQueue">func TestSchedLocalQueue(t *testing.T)</a>

```
searchKey: runtime_test.TestSchedLocalQueue
tags: [method private test]
```

```Go
func TestSchedLocalQueue(t *testing.T)
```

### <a id="TestSchedLocalQueueEmpty" href="#TestSchedLocalQueueEmpty">func TestSchedLocalQueueEmpty(t *testing.T)</a>

```
searchKey: runtime_test.TestSchedLocalQueueEmpty
tags: [method private test]
```

```Go
func TestSchedLocalQueueEmpty(t *testing.T)
```

### <a id="TestSchedLocalQueueSteal" href="#TestSchedLocalQueueSteal">func TestSchedLocalQueueSteal(t *testing.T)</a>

```
searchKey: runtime_test.TestSchedLocalQueueSteal
tags: [method private test]
```

```Go
func TestSchedLocalQueueSteal(t *testing.T)
```

### <a id="TestSegv" href="#TestSegv">func TestSegv(t *testing.T)</a>

```
searchKey: runtime_test.TestSegv
tags: [method private test]
```

```Go
func TestSegv(t *testing.T)
```

### <a id="TestSelectDuplicateChannel" href="#TestSelectDuplicateChannel">func TestSelectDuplicateChannel(t *testing.T)</a>

```
searchKey: runtime_test.TestSelectDuplicateChannel
tags: [method private test]
```

```Go
func TestSelectDuplicateChannel(t *testing.T)
```

### <a id="TestSelectFairness" href="#TestSelectFairness">func TestSelectFairness(t *testing.T)</a>

```
searchKey: runtime_test.TestSelectFairness
tags: [method private test]
```

```Go
func TestSelectFairness(t *testing.T)
```

### <a id="TestSelectStackAdjust" href="#TestSelectStackAdjust">func TestSelectStackAdjust(t *testing.T)</a>

```
searchKey: runtime_test.TestSelectStackAdjust
tags: [method private test]
```

```Go
func TestSelectStackAdjust(t *testing.T)
```

### <a id="TestSelectStress" href="#TestSelectStress">func TestSelectStress(t *testing.T)</a>

```
searchKey: runtime_test.TestSelectStress
tags: [method private test]
```

```Go
func TestSelectStress(t *testing.T)
```

### <a id="TestSelfSelect" href="#TestSelfSelect">func TestSelfSelect(t *testing.T)</a>

```
searchKey: runtime_test.TestSelfSelect
tags: [method private test]
```

```Go
func TestSelfSelect(t *testing.T)
```

### <a id="TestSemaHandoff" href="#TestSemaHandoff">func TestSemaHandoff(t *testing.T)</a>

```
searchKey: runtime_test.TestSemaHandoff
tags: [method private test]
```

```Go
func TestSemaHandoff(t *testing.T)
```

TestSemaHandoff checks that when semrelease+handoff is requested, the G that releases the semaphore yields its P directly to the first waiter in line. See issue 33747 for discussion. 

### <a id="TestSemaHandoff1" href="#TestSemaHandoff1">func TestSemaHandoff1(t *testing.T)</a>

```
searchKey: runtime_test.TestSemaHandoff1
tags: [method private test]
```

```Go
func TestSemaHandoff1(t *testing.T)
```

### <a id="TestSemaHandoff2" href="#TestSemaHandoff2">func TestSemaHandoff2(t *testing.T)</a>

```
searchKey: runtime_test.TestSemaHandoff2
tags: [method private test]
```

```Go
func TestSemaHandoff2(t *testing.T)
```

### <a id="TestSetNonblock" href="#TestSetNonblock">func TestSetNonblock(t *testing.T)</a>

```
searchKey: runtime_test.TestSetNonblock
tags: [method private test]
```

```Go
func TestSetNonblock(t *testing.T)
```

### <a id="TestSetPanicOnFault" href="#TestSetPanicOnFault">func TestSetPanicOnFault(t *testing.T)</a>

```
searchKey: runtime_test.TestSetPanicOnFault
tags: [method private test]
```

```Go
func TestSetPanicOnFault(t *testing.T)
```

### <a id="TestShrinkStackDuringBlockedSend" href="#TestShrinkStackDuringBlockedSend">func TestShrinkStackDuringBlockedSend(t *testing.T)</a>

```
searchKey: runtime_test.TestShrinkStackDuringBlockedSend
tags: [method private test]
```

```Go
func TestShrinkStackDuringBlockedSend(t *testing.T)
```

### <a id="TestSideEffectOrder" href="#TestSideEffectOrder">func TestSideEffectOrder(t *testing.T)</a>

```
searchKey: runtime_test.TestSideEffectOrder
tags: [method private test]
```

```Go
func TestSideEffectOrder(t *testing.T)
```

### <a id="TestSigStackSwapping" href="#TestSigStackSwapping">func TestSigStackSwapping(t *testing.T)</a>

```
searchKey: runtime_test.TestSigStackSwapping
tags: [method private test]
```

```Go
func TestSigStackSwapping(t *testing.T)
```

### <a id="TestSignalDuringExec" href="#TestSignalDuringExec">func TestSignalDuringExec(t *testing.T)</a>

```
searchKey: runtime_test.TestSignalDuringExec
tags: [method private test]
```

```Go
func TestSignalDuringExec(t *testing.T)
```

### <a id="TestSignalExitStatus" href="#TestSignalExitStatus">func TestSignalExitStatus(t *testing.T)</a>

```
searchKey: runtime_test.TestSignalExitStatus
tags: [method private test]
```

```Go
func TestSignalExitStatus(t *testing.T)
```

### <a id="TestSignalIgnoreSIGTRAP" href="#TestSignalIgnoreSIGTRAP">func TestSignalIgnoreSIGTRAP(t *testing.T)</a>

```
searchKey: runtime_test.TestSignalIgnoreSIGTRAP
tags: [method private test]
```

```Go
func TestSignalIgnoreSIGTRAP(t *testing.T)
```

### <a id="TestSignalM" href="#TestSignalM">func TestSignalM(t *testing.T)</a>

```
searchKey: runtime_test.TestSignalM
tags: [method private test]
```

```Go
func TestSignalM(t *testing.T)
```

### <a id="TestSimpleDeadlock" href="#TestSimpleDeadlock">func TestSimpleDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestSimpleDeadlock
tags: [method private test]
```

```Go
func TestSimpleDeadlock(t *testing.T)
```

### <a id="TestSingleBucketMapStringKeys_DupLen" href="#TestSingleBucketMapStringKeys_DupLen">func TestSingleBucketMapStringKeys_DupLen(t *testing.T)</a>

```
searchKey: runtime_test.TestSingleBucketMapStringKeys_DupLen
tags: [method private test]
```

```Go
func TestSingleBucketMapStringKeys_DupLen(t *testing.T)
```

Tests a map with a single bucket, with same-lengthed short keys ("quick keys") as well as long keys. 

### <a id="TestSingleBucketMapStringKeys_NoDupLen" href="#TestSingleBucketMapStringKeys_NoDupLen">func TestSingleBucketMapStringKeys_NoDupLen(t *testing.T)</a>

```
searchKey: runtime_test.TestSingleBucketMapStringKeys_NoDupLen
tags: [method private test]
```

```Go
func TestSingleBucketMapStringKeys_NoDupLen(t *testing.T)
```

Tests a map with a single bucket, with all keys having different lengths. 

### <a id="TestSizeof" href="#TestSizeof">func TestSizeof(t *testing.T)</a>

```
searchKey: runtime_test.TestSizeof
tags: [method private test]
```

```Go
func TestSizeof(t *testing.T)
```

### <a id="TestSmhasherAppendedZeros" href="#TestSmhasherAppendedZeros">func TestSmhasherAppendedZeros(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherAppendedZeros
tags: [method private test]
```

```Go
func TestSmhasherAppendedZeros(t *testing.T)
```

a string plus adding zeros must make distinct hashes 

### <a id="TestSmhasherAvalanche" href="#TestSmhasherAvalanche">func TestSmhasherAvalanche(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherAvalanche
tags: [method private test]
```

```Go
func TestSmhasherAvalanche(t *testing.T)
```

Flipping a single bit of a key should flip each output bit with 50% probability. 

### <a id="TestSmhasherCyclic" href="#TestSmhasherCyclic">func TestSmhasherCyclic(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherCyclic
tags: [method private test]
```

```Go
func TestSmhasherCyclic(t *testing.T)
```

Test strings with repeats, like "abcdabcdabcdabcd..." 

### <a id="TestSmhasherPermutation" href="#TestSmhasherPermutation">func TestSmhasherPermutation(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherPermutation
tags: [method private test]
```

```Go
func TestSmhasherPermutation(t *testing.T)
```

Test all possible combinations of n blocks from the set s. "permutation" is a bad name here, but it is what Smhasher uses. 

### <a id="TestSmhasherSanity" href="#TestSmhasherSanity">func TestSmhasherSanity(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherSanity
tags: [method private test]
```

```Go
func TestSmhasherSanity(t *testing.T)
```

Sanity checks. hash should not depend on values outside key. hash should not depend on alignment. 

### <a id="TestSmhasherSeed" href="#TestSmhasherSeed">func TestSmhasherSeed(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherSeed
tags: [method private test]
```

```Go
func TestSmhasherSeed(t *testing.T)
```

Make sure different seed values generate different hashes. 

### <a id="TestSmhasherSmallKeys" href="#TestSmhasherSmallKeys">func TestSmhasherSmallKeys(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherSmallKeys
tags: [method private test]
```

```Go
func TestSmhasherSmallKeys(t *testing.T)
```

All 0-3 byte strings have distinct hashes. 

### <a id="TestSmhasherSparse" href="#TestSmhasherSparse">func TestSmhasherSparse(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherSparse
tags: [method private test]
```

```Go
func TestSmhasherSparse(t *testing.T)
```

Test strings with only a few bits set 

### <a id="TestSmhasherText" href="#TestSmhasherText">func TestSmhasherText(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherText
tags: [method private test]
```

```Go
func TestSmhasherText(t *testing.T)
```

All keys of the form prefix + [A-Za-z0-9]*N + suffix. 

### <a id="TestSmhasherTwoNonzero" href="#TestSmhasherTwoNonzero">func TestSmhasherTwoNonzero(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherTwoNonzero
tags: [method private test]
```

```Go
func TestSmhasherTwoNonzero(t *testing.T)
```

Strings with up to two nonzero bytes all have distinct hashes. 

### <a id="TestSmhasherWindowed" href="#TestSmhasherWindowed">func TestSmhasherWindowed(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherWindowed
tags: [method private test]
```

```Go
func TestSmhasherWindowed(t *testing.T)
```

All bit rotations of a set of distinct keys 

### <a id="TestSmhasherZeros" href="#TestSmhasherZeros">func TestSmhasherZeros(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherZeros
tags: [method private test]
```

```Go
func TestSmhasherZeros(t *testing.T)
```

Different length strings of all zeros have distinct hashes. 

### <a id="TestSpuriousWakeupsNeverHangSemasleep" href="#TestSpuriousWakeupsNeverHangSemasleep">func TestSpuriousWakeupsNeverHangSemasleep(t *testing.T)</a>

```
searchKey: runtime_test.TestSpuriousWakeupsNeverHangSemasleep
tags: [method private test]
```

```Go
func TestSpuriousWakeupsNeverHangSemasleep(t *testing.T)
```

Issue #27250. Spurious wakeups to pthread_cond_timedwait_relative_np shouldn't cause semasleep to retry with the same timeout which would cause indefinite spinning. 

### <a id="TestStackAllOutput" href="#TestStackAllOutput">func TestStackAllOutput(t *testing.T)</a>

```
searchKey: runtime_test.TestStackAllOutput
tags: [method private test]
```

```Go
func TestStackAllOutput(t *testing.T)
```

### <a id="TestStackCache" href="#TestStackCache">func TestStackCache(t *testing.T)</a>

```
searchKey: runtime_test.TestStackCache
tags: [method private test]
```

```Go
func TestStackCache(t *testing.T)
```

### <a id="TestStackGrowth" href="#TestStackGrowth">func TestStackGrowth(t *testing.T)</a>

```
searchKey: runtime_test.TestStackGrowth
tags: [method private test]
```

```Go
func TestStackGrowth(t *testing.T)
```

Test stack growing in different contexts. 

### <a id="TestStackGrowthCallback" href="#TestStackGrowthCallback">func TestStackGrowthCallback(t *testing.T)</a>

```
searchKey: runtime_test.TestStackGrowthCallback
tags: [method private test]
```

```Go
func TestStackGrowthCallback(t *testing.T)
```

### <a id="TestStackMem" href="#TestStackMem">func TestStackMem(t *testing.T)</a>

```
searchKey: runtime_test.TestStackMem
tags: [method private test]
```

```Go
func TestStackMem(t *testing.T)
```

TestStackMem measures per-thread stack segment cache behavior. The test consumed up to 500MB in the past. 

### <a id="TestStackOutput" href="#TestStackOutput">func TestStackOutput(t *testing.T)</a>

```
searchKey: runtime_test.TestStackOutput
tags: [method private test]
```

```Go
func TestStackOutput(t *testing.T)
```

### <a id="TestStackOverflow" href="#TestStackOverflow">func TestStackOverflow(t *testing.T)</a>

```
searchKey: runtime_test.TestStackOverflow
tags: [method private test]
```

```Go
func TestStackOverflow(t *testing.T)
```

### <a id="TestStackPanic" href="#TestStackPanic">func TestStackPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestStackPanic
tags: [method private test]
```

```Go
func TestStackPanic(t *testing.T)
```

### <a id="TestStackWrapperCaller" href="#TestStackWrapperCaller">func TestStackWrapperCaller(t *testing.T)</a>

```
searchKey: runtime_test.TestStackWrapperCaller
tags: [method private test]
```

```Go
func TestStackWrapperCaller(t *testing.T)
```

### <a id="TestStackWrapperCallers" href="#TestStackWrapperCallers">func TestStackWrapperCallers(t *testing.T)</a>

```
searchKey: runtime_test.TestStackWrapperCallers
tags: [method private test]
```

```Go
func TestStackWrapperCallers(t *testing.T)
```

### <a id="TestStackWrapperStack" href="#TestStackWrapperStack">func TestStackWrapperStack(t *testing.T)</a>

```
searchKey: runtime_test.TestStackWrapperStack
tags: [method private test]
```

```Go
func TestStackWrapperStack(t *testing.T)
```

### <a id="TestStackWrapperStackPanic" href="#TestStackWrapperStackPanic">func TestStackWrapperStackPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestStackWrapperStackPanic
tags: [method private test]
```

```Go
func TestStackWrapperStackPanic(t *testing.T)
```

### <a id="TestStealOrder" href="#TestStealOrder">func TestStealOrder(t *testing.T)</a>

```
searchKey: runtime_test.TestStealOrder
tags: [method private test]
```

```Go
func TestStealOrder(t *testing.T)
```

### <a id="TestStopCPUProfilingWithProfilerOff" href="#TestStopCPUProfilingWithProfilerOff">func TestStopCPUProfilingWithProfilerOff(t *testing.T)</a>

```
searchKey: runtime_test.TestStopCPUProfilingWithProfilerOff
tags: [method private test]
```

```Go
func TestStopCPUProfilingWithProfilerOff(t *testing.T)
```

golang.org/issue/7063 

### <a id="TestStopTheWorldDeadlock" href="#TestStopTheWorldDeadlock">func TestStopTheWorldDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestStopTheWorldDeadlock
tags: [method private test]
```

```Go
func TestStopTheWorldDeadlock(t *testing.T)
```

### <a id="TestString2Slice" href="#TestString2Slice">func TestString2Slice(t *testing.T)</a>

```
searchKey: runtime_test.TestString2Slice
tags: [method private test]
```

```Go
func TestString2Slice(t *testing.T)
```

### <a id="TestStringConcatenationAllocs" href="#TestStringConcatenationAllocs">func TestStringConcatenationAllocs(t *testing.T)</a>

```
searchKey: runtime_test.TestStringConcatenationAllocs
tags: [method private test]
```

```Go
func TestStringConcatenationAllocs(t *testing.T)
```

### <a id="TestStringIndexHaystack" href="#TestStringIndexHaystack">func TestStringIndexHaystack(t *testing.T)</a>

```
searchKey: runtime_test.TestStringIndexHaystack
tags: [method private test]
```

```Go
func TestStringIndexHaystack(t *testing.T)
```

### <a id="TestStringIndexNeedle" href="#TestStringIndexNeedle">func TestStringIndexNeedle(t *testing.T)</a>

```
searchKey: runtime_test.TestStringIndexNeedle
tags: [method private test]
```

```Go
func TestStringIndexNeedle(t *testing.T)
```

### <a id="TestStringOnStack" href="#TestStringOnStack">func TestStringOnStack(t *testing.T)</a>

```
searchKey: runtime_test.TestStringOnStack
tags: [method private test]
```

```Go
func TestStringOnStack(t *testing.T)
```

### <a id="TestStringW" href="#TestStringW">func TestStringW(t *testing.T)</a>

```
searchKey: runtime_test.TestStringW
tags: [method private test]
```

```Go
func TestStringW(t *testing.T)
```

### <a id="TestStructHash" href="#TestStructHash">func TestStructHash(t *testing.T)</a>

```
searchKey: runtime_test.TestStructHash
tags: [method private test]
```

```Go
func TestStructHash(t *testing.T)
```

### <a id="TestThreadExhaustion" href="#TestThreadExhaustion">func TestThreadExhaustion(t *testing.T)</a>

```
searchKey: runtime_test.TestThreadExhaustion
tags: [method private test]
```

```Go
func TestThreadExhaustion(t *testing.T)
```

### <a id="TestTimeHistogram" href="#TestTimeHistogram">func TestTimeHistogram(t *testing.T)</a>

```
searchKey: runtime_test.TestTimeHistogram
tags: [method private test]
```

```Go
func TestTimeHistogram(t *testing.T)
```

### <a id="TestTimePprof" href="#TestTimePprof">func TestTimePprof(t *testing.T)</a>

```
searchKey: runtime_test.TestTimePprof
tags: [method private test]
```

```Go
func TestTimePprof(t *testing.T)
```

### <a id="TestTimerFairness" href="#TestTimerFairness">func TestTimerFairness(t *testing.T)</a>

```
searchKey: runtime_test.TestTimerFairness
tags: [method private test]
```

```Go
func TestTimerFairness(t *testing.T)
```

### <a id="TestTimerFairness2" href="#TestTimerFairness2">func TestTimerFairness2(t *testing.T)</a>

```
searchKey: runtime_test.TestTimerFairness2
tags: [method private test]
```

```Go
func TestTimerFairness2(t *testing.T)
```

### <a id="TestTinyAlloc" href="#TestTinyAlloc">func TestTinyAlloc(t *testing.T)</a>

```
searchKey: runtime_test.TestTinyAlloc
tags: [method private test]
```

```Go
func TestTinyAlloc(t *testing.T)
```

### <a id="TestTinyAllocIssue37262" href="#TestTinyAllocIssue37262">func TestTinyAllocIssue37262(t *testing.T)</a>

```
searchKey: runtime_test.TestTinyAllocIssue37262
tags: [method private test]
```

```Go
func TestTinyAllocIssue37262(t *testing.T)
```

### <a id="TestTracebackAncestors" href="#TestTracebackAncestors">func TestTracebackAncestors(t *testing.T)</a>

```
searchKey: runtime_test.TestTracebackAncestors
tags: [method private test]
```

```Go
func TestTracebackAncestors(t *testing.T)
```

### <a id="TestTracebackArgs" href="#TestTracebackArgs">func TestTracebackArgs(t *testing.T)</a>

```
searchKey: runtime_test.TestTracebackArgs
tags: [method private test]
```

```Go
func TestTracebackArgs(t *testing.T)
```

### <a id="TestTracebackInlineExcluded" href="#TestTracebackInlineExcluded">func TestTracebackInlineExcluded(t *testing.T)</a>

```
searchKey: runtime_test.TestTracebackInlineExcluded
tags: [method private test]
```

```Go
func TestTracebackInlineExcluded(t *testing.T)
```

Test that when F -> G is inlined and F is excluded from stack traces, G still appears. 

### <a id="TestTracebackSystemstack" href="#TestTracebackSystemstack">func TestTracebackSystemstack(t *testing.T)</a>

```
searchKey: runtime_test.TestTracebackSystemstack
tags: [method private test]
```

```Go
func TestTracebackSystemstack(t *testing.T)
```

### <a id="TestTrailingZero" href="#TestTrailingZero">func TestTrailingZero(t *testing.T)</a>

```
searchKey: runtime_test.TestTrailingZero
tags: [method private test]
```

```Go
func TestTrailingZero(t *testing.T)
```

### <a id="TestUnconditionalPanic" href="#TestUnconditionalPanic">func TestUnconditionalPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestUnconditionalPanic
tags: [method private test]
```

```Go
func TestUnconditionalPanic(t *testing.T)
```

Make sure open-coded defer exit code is not lost, even when there is an unconditional panic (hence no return from the function) 

### <a id="TestUserForcedGC" href="#TestUserForcedGC">func TestUserForcedGC(t *testing.T)</a>

```
searchKey: runtime_test.TestUserForcedGC
tags: [method private test]
```

```Go
func TestUserForcedGC(t *testing.T)
```

### <a id="TestVDSO" href="#TestVDSO">func TestVDSO(t *testing.T)</a>

```
searchKey: runtime_test.TestVDSO
tags: [method private test]
```

```Go
func TestVDSO(t *testing.T)
```

### <a id="TestVersion" href="#TestVersion">func TestVersion(t *testing.T)</a>

```
searchKey: runtime_test.TestVersion
tags: [method private test]
```

```Go
func TestVersion(t *testing.T)
```

### <a id="TestWindowsStackMemoryCgo" href="#TestWindowsStackMemoryCgo">func TestWindowsStackMemoryCgo(t *testing.T)</a>

```
searchKey: runtime_test.TestWindowsStackMemoryCgo
tags: [method private test]
```

```Go
func TestWindowsStackMemoryCgo(t *testing.T)
```

### <a id="TestYieldLocked" href="#TestYieldLocked">func TestYieldLocked(t *testing.T)</a>

```
searchKey: runtime_test.TestYieldLocked
tags: [method private test]
```

```Go
func TestYieldLocked(t *testing.T)
```

### <a id="TestYieldLockedProgress" href="#TestYieldLockedProgress">func TestYieldLockedProgress(t *testing.T)</a>

```
searchKey: runtime_test.TestYieldLockedProgress
tags: [method private test]
```

```Go
func TestYieldLockedProgress(t *testing.T)
```

### <a id="TestYieldProgress" href="#TestYieldProgress">func TestYieldProgress(t *testing.T)</a>

```
searchKey: runtime_test.TestYieldProgress
tags: [method private test]
```

```Go
func TestYieldProgress(t *testing.T)
```

### <a id="TestZeroConvT2x" href="#TestZeroConvT2x">func TestZeroConvT2x(t *testing.T)</a>

```
searchKey: runtime_test.TestZeroConvT2x
tags: [method private test]
```

```Go
func TestZeroConvT2x(t *testing.T)
```

### <a id="add" href="#add">func add(x, y float64) float64</a>

```
searchKey: runtime_test.add
tags: [method private]
```

```Go
func add(x, y float64) float64
```

### <a id="addr1" href="#addr1">func addr1(x int) *int</a>

```
searchKey: runtime_test.addr1
tags: [method private]
```

```Go
func addr1(x int) *int
```

### <a id="addr2" href="#addr2">func addr2() (x int, p *int)</a>

```
searchKey: runtime_test.addr2
tags: [function private]
```

```Go
func addr2() (x int, p *int)
```

### <a id="adjChunks" href="#adjChunks">func adjChunks() (*objtype, *objtype)</a>

```
searchKey: runtime_test.adjChunks
tags: [function private]
```

```Go
func adjChunks() (*objtype, *objtype)
```

### <a id="applyGCLoad" href="#applyGCLoad">func applyGCLoad(b *testing.B) func()</a>

```
searchKey: runtime_test.applyGCLoad
tags: [method private]
```

```Go
func applyGCLoad(b *testing.B) func()
```

### <a id="avalancheTest1" href="#avalancheTest1">func avalancheTest1(t *testing.T, k Key)</a>

```
searchKey: runtime_test.avalancheTest1
tags: [method private]
```

```Go
func avalancheTest1(t *testing.T, k Key)
```

### <a id="benchHelper" href="#benchHelper">func benchHelper(b *testing.B, n int, read func(chan struct{}))</a>

```
searchKey: runtime_test.benchHelper
tags: [method private]
```

```Go
func benchHelper(b *testing.B, n int, read func(chan struct{}))
```

### <a id="benchSetType" href="#benchSetType">func benchSetType(b *testing.B, x interface{})</a>

```
searchKey: runtime_test.benchSetType
tags: [method private]
```

```Go
func benchSetType(b *testing.B, x interface{})
```

### <a id="benchmarkChanProdCons" href="#benchmarkChanProdCons">func benchmarkChanProdCons(b *testing.B, chanSize, localWork int)</a>

```
searchKey: runtime_test.benchmarkChanProdCons
tags: [method private]
```

```Go
func benchmarkChanProdCons(b *testing.B, chanSize, localWork int)
```

### <a id="benchmarkChanSync" href="#benchmarkChanSync">func benchmarkChanSync(b *testing.B, work int)</a>

```
searchKey: runtime_test.benchmarkChanSync
tags: [method private]
```

```Go
func benchmarkChanSync(b *testing.B, work int)
```

### <a id="benchmarkCreateGoroutines" href="#benchmarkCreateGoroutines">func benchmarkCreateGoroutines(b *testing.B, procs int)</a>

```
searchKey: runtime_test.benchmarkCreateGoroutines
tags: [method private]
```

```Go
func benchmarkCreateGoroutines(b *testing.B, procs int)
```

### <a id="benchmarkHash" href="#benchmarkHash">func benchmarkHash(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkHash
tags: [method private]
```

```Go
func benchmarkHash(b *testing.B, n int)
```

### <a id="benchmarkMapAppendAssignInt32" href="#benchmarkMapAppendAssignInt32">func benchmarkMapAppendAssignInt32(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapAppendAssignInt32
tags: [method private]
```

```Go
func benchmarkMapAppendAssignInt32(b *testing.B, n int)
```

### <a id="benchmarkMapAppendAssignInt64" href="#benchmarkMapAppendAssignInt64">func benchmarkMapAppendAssignInt64(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapAppendAssignInt64
tags: [method private]
```

```Go
func benchmarkMapAppendAssignInt64(b *testing.B, n int)
```

### <a id="benchmarkMapAppendAssignStr" href="#benchmarkMapAppendAssignStr">func benchmarkMapAppendAssignStr(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapAppendAssignStr
tags: [method private]
```

```Go
func benchmarkMapAppendAssignStr(b *testing.B, n int)
```

### <a id="benchmarkMapAssignInt32" href="#benchmarkMapAssignInt32">func benchmarkMapAssignInt32(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapAssignInt32
tags: [method private]
```

```Go
func benchmarkMapAssignInt32(b *testing.B, n int)
```

### <a id="benchmarkMapAssignInt64" href="#benchmarkMapAssignInt64">func benchmarkMapAssignInt64(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapAssignInt64
tags: [method private]
```

```Go
func benchmarkMapAssignInt64(b *testing.B, n int)
```

### <a id="benchmarkMapAssignStr" href="#benchmarkMapAssignStr">func benchmarkMapAssignStr(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapAssignStr
tags: [method private]
```

```Go
func benchmarkMapAssignStr(b *testing.B, n int)
```

### <a id="benchmarkMapDeleteInt32" href="#benchmarkMapDeleteInt32">func benchmarkMapDeleteInt32(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapDeleteInt32
tags: [method private]
```

```Go
func benchmarkMapDeleteInt32(b *testing.B, n int)
```

### <a id="benchmarkMapDeleteInt64" href="#benchmarkMapDeleteInt64">func benchmarkMapDeleteInt64(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapDeleteInt64
tags: [method private]
```

```Go
func benchmarkMapDeleteInt64(b *testing.B, n int)
```

### <a id="benchmarkMapDeletePointer" href="#benchmarkMapDeletePointer">func benchmarkMapDeletePointer(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapDeletePointer
tags: [method private]
```

```Go
func benchmarkMapDeletePointer(b *testing.B, n int)
```

### <a id="benchmarkMapDeleteStr" href="#benchmarkMapDeleteStr">func benchmarkMapDeleteStr(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapDeleteStr
tags: [method private]
```

```Go
func benchmarkMapDeleteStr(b *testing.B, n int)
```

### <a id="benchmarkMapOperatorAssignInt32" href="#benchmarkMapOperatorAssignInt32">func benchmarkMapOperatorAssignInt32(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapOperatorAssignInt32
tags: [method private]
```

```Go
func benchmarkMapOperatorAssignInt32(b *testing.B, n int)
```

### <a id="benchmarkMapOperatorAssignInt64" href="#benchmarkMapOperatorAssignInt64">func benchmarkMapOperatorAssignInt64(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapOperatorAssignInt64
tags: [method private]
```

```Go
func benchmarkMapOperatorAssignInt64(b *testing.B, n int)
```

### <a id="benchmarkMapOperatorAssignStr" href="#benchmarkMapOperatorAssignStr">func benchmarkMapOperatorAssignStr(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapOperatorAssignStr
tags: [method private]
```

```Go
func benchmarkMapOperatorAssignStr(b *testing.B, n int)
```

### <a id="benchmarkMapPop" href="#benchmarkMapPop">func benchmarkMapPop(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapPop
tags: [method private]
```

```Go
func benchmarkMapPop(b *testing.B, n int)
```

### <a id="benchmarkMapStringKeysEight" href="#benchmarkMapStringKeysEight">func benchmarkMapStringKeysEight(b *testing.B, keySize int)</a>

```
searchKey: runtime_test.benchmarkMapStringKeysEight
tags: [method private]
```

```Go
func benchmarkMapStringKeysEight(b *testing.B, keySize int)
```

### <a id="benchmarkRWMutex" href="#benchmarkRWMutex">func benchmarkRWMutex(b *testing.B, localWork, writeRatio int)</a>

```
searchKey: runtime_test.benchmarkRWMutex
tags: [method private]
```

```Go
func benchmarkRWMutex(b *testing.B, localWork, writeRatio int)
```

### <a id="benchmarkRepeatedLookup" href="#benchmarkRepeatedLookup">func benchmarkRepeatedLookup(b *testing.B, lookupKeySize int)</a>

```
searchKey: runtime_test.benchmarkRepeatedLookup
tags: [method private]
```

```Go
func benchmarkRepeatedLookup(b *testing.B, lookupKeySize int)
```

Accessing the same keys in a row. 

### <a id="benchmarkSizes" href="#benchmarkSizes">func benchmarkSizes(b *testing.B, sizes []int, fn func(b *testing.B, n int))</a>

```
searchKey: runtime_test.benchmarkSizes
tags: [method private]
```

```Go
func benchmarkSizes(b *testing.B, sizes []int, fn func(b *testing.B, n int))
```

### <a id="benchmarkStackGrowth" href="#benchmarkStackGrowth">func benchmarkStackGrowth(b *testing.B, rec int)</a>

```
searchKey: runtime_test.benchmarkStackGrowth
tags: [method private]
```

```Go
func benchmarkStackGrowth(b *testing.B, rec int)
```

### <a id="benchmarkSyscall" href="#benchmarkSyscall">func benchmarkSyscall(b *testing.B, work, excess int)</a>

```
searchKey: runtime_test.benchmarkSyscall
tags: [method private]
```

```Go
func benchmarkSyscall(b *testing.B, work, excess int)
```

### <a id="benchmarkWakeupParallel" href="#benchmarkWakeupParallel">func benchmarkWakeupParallel(b *testing.B, spin func(time.Duration))</a>

```
searchKey: runtime_test.benchmarkWakeupParallel
tags: [method private]
```

```Go
func benchmarkWakeupParallel(b *testing.B, spin func(time.Duration))
```

### <a id="big" href="#big">func big(stop chan int) int</a>

```
searchKey: runtime_test.big
tags: [method private]
```

```Go
func big(stop chan int) int
```

### <a id="bigframe" href="#bigframe">func bigframe(stop chan int) int</a>

```
searchKey: runtime_test.bigframe
tags: [method private]
```

```Go
func bigframe(stop chan int) int
```

### <a id="buildTestProg" href="#buildTestProg">func buildTestProg(t *testing.T, binary string, flags ...string) (string, error)</a>

```
searchKey: runtime_test.buildTestProg
tags: [method private]
```

```Go
func buildTestProg(t *testing.T, binary string, flags ...string) (string, error)
```

### <a id="checkCleanBacktrace" href="#checkCleanBacktrace">func checkCleanBacktrace(t *testing.T, backtrace string)</a>

```
searchKey: runtime_test.checkCleanBacktrace
tags: [method private]
```

```Go
func checkCleanBacktrace(t *testing.T, backtrace string)
```

checkCleanBacktrace checks that the given backtrace is well formed and does not contain any error messages from GDB. 

### <a id="checkCloseonexec" href="#checkCloseonexec">func checkCloseonexec(t *testing.T, fd int32, name string)</a>

```
searchKey: runtime_test.checkCloseonexec
tags: [method private]
```

```Go
func checkCloseonexec(t *testing.T, fd int32, name string)
```

### <a id="checkGdbEnvironment" href="#checkGdbEnvironment">func checkGdbEnvironment(t *testing.T)</a>

```
searchKey: runtime_test.checkGdbEnvironment
tags: [method private]
```

```Go
func checkGdbEnvironment(t *testing.T)
```

### <a id="checkGdbPython" href="#checkGdbPython">func checkGdbPython(t *testing.T)</a>

```
searchKey: runtime_test.checkGdbPython
tags: [method private]
```

```Go
func checkGdbPython(t *testing.T)
```

### <a id="checkGdbVersion" href="#checkGdbVersion">func checkGdbVersion(t *testing.T)</a>

```
searchKey: runtime_test.checkGdbVersion
tags: [method private]
```

```Go
func checkGdbVersion(t *testing.T)
```

### <a id="checkIsPipe" href="#checkIsPipe">func checkIsPipe(t *testing.T, r, w int32)</a>

```
searchKey: runtime_test.checkIsPipe
tags: [method private]
```

```Go
func checkIsPipe(t *testing.T, r, w int32)
```

### <a id="checkLldbPython" href="#checkLldbPython">func checkLldbPython(t *testing.T)</a>

```
searchKey: runtime_test.checkLldbPython
tags: [method private]
```

```Go
func checkLldbPython(t *testing.T)
```

### <a id="checkNonblocking" href="#checkNonblocking">func checkNonblocking(t *testing.T, fd int32, name string)</a>

```
searchKey: runtime_test.checkNonblocking
tags: [method private]
```

```Go
func checkNonblocking(t *testing.T, fd int32, name string)
```

### <a id="checkPageAlloc" href="#checkPageAlloc">func checkPageAlloc(t *testing.T, want, got *PageAlloc)</a>

```
searchKey: runtime_test.checkPageAlloc
tags: [method private]
```

```Go
func checkPageAlloc(t *testing.T, want, got *PageAlloc)
```

### <a id="checkPageCache" href="#checkPageCache">func checkPageCache(t *testing.T, got, want PageCache)</a>

```
searchKey: runtime_test.checkPageCache
tags: [method private]
```

```Go
func checkPageCache(t *testing.T, got, want PageCache)
```

### <a id="checkPallocBits" href="#checkPallocBits">func checkPallocBits(t *testing.T, got, want *PallocBits) bool</a>

```
searchKey: runtime_test.checkPallocBits
tags: [method private]
```

```Go
func checkPallocBits(t *testing.T, got, want *PallocBits) bool
```

Ensures that got and want are the same, and if not, reports detailed diff information. 

### <a id="checkPallocSum" href="#checkPallocSum">func checkPallocSum(t testing.TB, got, want PallocSum)</a>

```
searchKey: runtime_test.checkPallocSum
tags: [method private]
```

```Go
func checkPallocSum(t testing.TB, got, want PallocSum)
```

Ensures two packed summaries are identical, and reports a detailed description of the difference if they're not. 

### <a id="cmpb" href="#cmpb">func cmpb(a, b []byte) int</a>

```
searchKey: runtime_test.cmpb
tags: [method private]
```

```Go
func cmpb(a, b []byte) int
```

### <a id="copybw" href="#copybw">func copybw(dst, src []byte)</a>

```
searchKey: runtime_test.copybw
tags: [method private]
```

```Go
func copybw(dst, src []byte)
```

Backwards copy 

### <a id="copyref" href="#copyref">func copyref(dst, src []byte)</a>

```
searchKey: runtime_test.copyref
tags: [method private]
```

```Go
func copyref(dst, src []byte)
```

Forward copy. 

### <a id="count" href="#count">func count(n int) int</a>

```
searchKey: runtime_test.count
tags: [method private]
```

```Go
func count(n int) int
```

### <a id="count1" href="#count1">func count1(n int) int</a>

```
searchKey: runtime_test.count1
tags: [method private]
```

```Go
func count1(n int) int
```

### <a id="count10" href="#count10">func count10(n int) int</a>

```
searchKey: runtime_test.count10
tags: [method private]
```

```Go
func count10(n int) int
```

### <a id="count11" href="#count11">func count11(n int) int</a>

```
searchKey: runtime_test.count11
tags: [method private]
```

```Go
func count11(n int) int
```

### <a id="count12" href="#count12">func count12(n int) int</a>

```
searchKey: runtime_test.count12
tags: [method private]
```

```Go
func count12(n int) int
```

### <a id="count13" href="#count13">func count13(n int) int</a>

```
searchKey: runtime_test.count13
tags: [method private]
```

```Go
func count13(n int) int
```

### <a id="count14" href="#count14">func count14(n int) int</a>

```
searchKey: runtime_test.count14
tags: [method private]
```

```Go
func count14(n int) int
```

### <a id="count15" href="#count15">func count15(n int) int</a>

```
searchKey: runtime_test.count15
tags: [method private]
```

```Go
func count15(n int) int
```

### <a id="count16" href="#count16">func count16(n int) int</a>

```
searchKey: runtime_test.count16
tags: [method private]
```

```Go
func count16(n int) int
```

### <a id="count17" href="#count17">func count17(n int) int</a>

```
searchKey: runtime_test.count17
tags: [method private]
```

```Go
func count17(n int) int
```

### <a id="count18" href="#count18">func count18(n int) int</a>

```
searchKey: runtime_test.count18
tags: [method private]
```

```Go
func count18(n int) int
```

### <a id="count19" href="#count19">func count19(n int) int</a>

```
searchKey: runtime_test.count19
tags: [method private]
```

```Go
func count19(n int) int
```

### <a id="count2" href="#count2">func count2(n int) int</a>

```
searchKey: runtime_test.count2
tags: [method private]
```

```Go
func count2(n int) int
```

### <a id="count20" href="#count20">func count20(n int) int</a>

```
searchKey: runtime_test.count20
tags: [method private]
```

```Go
func count20(n int) int
```

### <a id="count21" href="#count21">func count21(n int) int</a>

```
searchKey: runtime_test.count21
tags: [method private]
```

```Go
func count21(n int) int
```

### <a id="count22" href="#count22">func count22(n int) int</a>

```
searchKey: runtime_test.count22
tags: [method private]
```

```Go
func count22(n int) int
```

### <a id="count23" href="#count23">func count23(n int) int</a>

```
searchKey: runtime_test.count23
tags: [method private]
```

```Go
func count23(n int) int
```

### <a id="count3" href="#count3">func count3(n int) int</a>

```
searchKey: runtime_test.count3
tags: [method private]
```

```Go
func count3(n int) int
```

### <a id="count4" href="#count4">func count4(n int) int</a>

```
searchKey: runtime_test.count4
tags: [method private]
```

```Go
func count4(n int) int
```

### <a id="count5" href="#count5">func count5(n int) int</a>

```
searchKey: runtime_test.count5
tags: [method private]
```

```Go
func count5(n int) int
```

### <a id="count6" href="#count6">func count6(n int) int</a>

```
searchKey: runtime_test.count6
tags: [method private]
```

```Go
func count6(n int) int
```

### <a id="count7" href="#count7">func count7(n int) int</a>

```
searchKey: runtime_test.count7
tags: [method private]
```

```Go
func count7(n int) int
```

### <a id="count8" href="#count8">func count8(n int) int</a>

```
searchKey: runtime_test.count8
tags: [method private]
```

```Go
func count8(n int) int
```

### <a id="count9" href="#count9">func count9(n int) int</a>

```
searchKey: runtime_test.count9
tags: [method private]
```

```Go
func count9(n int) int
```

### <a id="countp" href="#countp">func countp(n *int)</a>

```
searchKey: runtime_test.countp
tags: [method private]
```

```Go
func countp(n *int)
```

### <a id="countpwg" href="#countpwg">func countpwg(n *int, ready *sync.WaitGroup, teardown chan bool)</a>

```
searchKey: runtime_test.countpwg
tags: [method private]
```

```Go
func countpwg(n *int, ready *sync.WaitGroup, teardown chan bool)
```

### <a id="defer1" href="#defer1">func defer1()</a>

```
searchKey: runtime_test.defer1
tags: [function private]
```

```Go
func defer1()
```

### <a id="defer2" href="#defer2">func defer2()</a>

```
searchKey: runtime_test.defer2
tags: [function private]
```

```Go
func defer2()
```

### <a id="defer3" href="#defer3">func defer3()</a>

```
searchKey: runtime_test.defer3
tags: [function private]
```

```Go
func defer3()
```

### <a id="deferHeapAndStack" href="#deferHeapAndStack">func deferHeapAndStack(n int) (r int)</a>

```
searchKey: runtime_test.deferHeapAndStack
tags: [method private]
```

```Go
func deferHeapAndStack(n int) (r int)
```

deferHeapAndStack(n) computes 2*n 

### <a id="div" href="#div">func div(x, y float64) float64</a>

```
searchKey: runtime_test.div
tags: [method private]
```

```Go
func div(x, y float64) float64
```

### <a id="dlogCanonicalize" href="#dlogCanonicalize">func dlogCanonicalize(x string) string</a>

```
searchKey: runtime_test.dlogCanonicalize
tags: [method private]
```

```Go
func dlogCanonicalize(x string) string
```

### <a id="doPanic" href="#doPanic">func doPanic()</a>

```
searchKey: runtime_test.doPanic
tags: [function private]
```

```Go
func doPanic()
```

### <a id="doTestParallelReaders" href="#doTestParallelReaders">func doTestParallelReaders(numReaders int)</a>

```
searchKey: runtime_test.doTestParallelReaders
tags: [method private]
```

```Go
func doTestParallelReaders(numReaders int)
```

### <a id="doWork" href="#doWork">func doWork(dur time.Duration)</a>

```
searchKey: runtime_test.doWork
tags: [method private]
```

```Go
func doWork(dur time.Duration)
```

### <a id="eqstring_generic" href="#eqstring_generic">func eqstring_generic(s1, s2 string) bool</a>

```
searchKey: runtime_test.eqstring_generic
tags: [method private]
```

```Go
func eqstring_generic(s1, s2 string) bool
```

### <a id="err" href="#err">func err(t *testing.T, format string, args ...interface{})</a>

```
searchKey: runtime_test.err
tags: [method private]
```

```Go
func err(t *testing.T, format string, args ...interface{})
```

### <a id="errfn" href="#errfn">func errfn() error</a>

```
searchKey: runtime_test.errfn
tags: [function private]
```

```Go
func errfn() error
```

### <a id="errfn1" href="#errfn1">func errfn1() error</a>

```
searchKey: runtime_test.errfn1
tags: [function private]
```

```Go
func errfn1() error
```

### <a id="escape" href="#escape">func escape(p interface{}) interface{}</a>

```
searchKey: runtime_test.escape
tags: [method private]
```

```Go
func escape(p interface{}) interface{}
```

### <a id="expect" href="#expect">func expect(t *testing.T, n int, err interface{})</a>

```
searchKey: runtime_test.expect
tags: [method private]
```

```Go
func expect(t *testing.T, n int, err interface{})
```

### <a id="f" href="#f">func f() int</a>

```
searchKey: runtime_test.f
tags: [function private]
```

```Go
func f() int
```

### <a id="f1" href="#f1">func f1(pan bool) []uintptr</a>

```
searchKey: runtime_test.f1
tags: [method private]
```

```Go
func f1(pan bool) []uintptr
```

### <a id="f2" href="#f2">func f2(pan bool) []uintptr</a>

```
searchKey: runtime_test.f2
tags: [method private]
```

```Go
func f2(pan bool) []uintptr
```

### <a id="f3" href="#f3">func f3(pan bool) []uintptr</a>

```
searchKey: runtime_test.f3
tags: [method private]
```

```Go
func f3(pan bool) []uintptr
```

### <a id="fakeSyscall" href="#fakeSyscall">func fakeSyscall(duration time.Duration)</a>

```
searchKey: runtime_test.fakeSyscall
tags: [method private]
```

```Go
func fakeSyscall(duration time.Duration)
```

fakeSyscall emulates a system call. 

### <a id="fcntl" href="#fcntl">func fcntl(fd uintptr, cmd int, arg uintptr) (uintptr, syscall.Errno)</a>

```
searchKey: runtime_test.fcntl
tags: [method private]
```

```Go
func fcntl(fd uintptr, cmd int, arg uintptr) (uintptr, syscall.Errno)
```

Call fcntl libc function rather than calling syscall. 

### <a id="ff1" href="#ff1">func ff1(ap *foo, a, b, c, d, e, f, g, h, i int)</a>

```
searchKey: runtime_test.ff1
tags: [method private]
```

```Go
func ff1(ap *foo, a, b, c, d, e, f, g, h, i int)
```

### <a id="fin" href="#fin">func fin(v *int)</a>

```
searchKey: runtime_test.fin
tags: [method private]
```

```Go
func fin(v *int)
```

### <a id="findTrace" href="#findTrace">func findTrace(text, top string) []string</a>

```
searchKey: runtime_test.findTrace
tags: [method private]
```

```Go
func findTrace(text, top string) []string
```

### <a id="fop" href="#fop">func fop(f func(x, y uint64) uint64) func(x, y float64) float64</a>

```
searchKey: runtime_test.fop
tags: [method private]
```

```Go
func fop(f func(x, y uint64) uint64) func(x, y float64) float64
```

turn uint64 op into float64 op 

### <a id="fromMyNode" href="#fromMyNode">func fromMyNode(node *MyNode) *LFNode</a>

```
searchKey: runtime_test.fromMyNode
tags: [method private]
```

```Go
func fromMyNode(node *MyNode) *LFNode
```

### <a id="fromint64sw" href="#fromint64sw">func fromint64sw(f float64) float64</a>

```
searchKey: runtime_test.fromint64sw
tags: [method private]
```

```Go
func fromint64sw(f float64) float64
```

float64 -hw-> int64 -sw-> float64 

### <a id="g2" href="#g2">func g2()</a>

```
searchKey: runtime_test.g2
tags: [function private]
```

```Go
func g2()
```

### <a id="g3" href="#g3">func g3()</a>

```
searchKey: runtime_test.g3
tags: [function private]
```

```Go
func g3()
```

### <a id="genPerm" href="#genPerm">func genPerm(h *HashSet, b []byte, s []uint32, n int)</a>

```
searchKey: runtime_test.genPerm
tags: [method private]
```

```Go
func genPerm(h *HashSet, b []byte, s []uint32, n int)
```

### <a id="growStack" href="#growStack">func growStack(progress *uint32)</a>

```
searchKey: runtime_test.growStack
tags: [method private]
```

```Go
func growStack(progress *uint32)
```

### <a id="growStackIter" href="#growStackIter">func growStackIter(p *int, n int)</a>

```
searchKey: runtime_test.growStackIter
tags: [method private]
```

```Go
func growStackIter(p *int, n int)
```

This function is not an anonymous func, so that the compiler can do escape analysis and place x on stack (and subsequently stack growth update the pointer). 

### <a id="growStackWithCallback" href="#growStackWithCallback">func growStackWithCallback(cb func())</a>

```
searchKey: runtime_test.growStackWithCallback
tags: [method private]
```

```Go
func growStackWithCallback(cb func())
```

### <a id="growing" href="#growing">func growing(c chan int, done chan struct{})</a>

```
searchKey: runtime_test.growing
tags: [method private]
```

```Go
func growing(c chan int, done chan struct{})
```

### <a id="hwcmp" href="#hwcmp">func hwcmp(f, g float64) (cmp int, isnan bool)</a>

```
searchKey: runtime_test.hwcmp
tags: [method private]
```

```Go
func hwcmp(f, g float64) (cmp int, isnan bool)
```

### <a id="hwint32" href="#hwint32">func hwint32(f float64) float64</a>

```
searchKey: runtime_test.hwint32
tags: [method private]
```

```Go
func hwint32(f float64) float64
```

float64 -hw-> int32 -hw-> float64 

### <a id="hwint64" href="#hwint64">func hwint64(f float64) float64</a>

```
searchKey: runtime_test.hwint64
tags: [method private]
```

```Go
func hwint64(f float64) float64
```

float64 -hw-> int64 -hw-> float64 

### <a id="infoBigStruct" href="#infoBigStruct">func infoBigStruct() []byte</a>

```
searchKey: runtime_test.infoBigStruct
tags: [function private]
```

```Go
func infoBigStruct() []byte
```

### <a id="init.crash_test.go" href="#init.crash_test.go">func init()</a>

```
searchKey: runtime_test.init
tags: [function private]
```

```Go
func init()
```

For TestRuntimePanic: test a panic in the runtime package without involving the testing harness. 

### <a id="init.crash_unix_test.go" href="#init.crash_unix_test.go">func init()</a>

```
searchKey: runtime_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.crash_unix_test.go.0xc045da0c88" href="#init.crash_unix_test.go.0xc045da0c88">func init()</a>

```
searchKey: runtime_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.netpoll_os_test.go" href="#init.netpoll_os_test.go">func init()</a>

```
searchKey: runtime_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.runtime_test.go" href="#init.runtime_test.go">func init()</a>

```
searchKey: runtime_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="inlined" href="#inlined">func inlined()</a>

```
searchKey: runtime_test.inlined
tags: [function private]
```

```Go
func inlined()
```

### <a id="interpreter" href="#interpreter">func interpreter(level int, maxlevel int, rec int)</a>

```
searchKey: runtime_test.interpreter
tags: [method private]
```

```Go
func interpreter(level int, maxlevel int, rec int)
```

### <a id="invertPallocBits" href="#invertPallocBits">func invertPallocBits(b *PallocBits)</a>

```
searchKey: runtime_test.invertPallocBits
tags: [method private]
```

```Go
func invertPallocBits(b *PallocBits)
```

Inverts every bit in the PallocBits. 

### <a id="isZeroed" href="#isZeroed">func isZeroed(b []byte) bool</a>

```
searchKey: runtime_test.isZeroed
tags: [method private]
```

```Go
func isZeroed(b []byte) bool
```

### <a id="isZeroedR" href="#isZeroedR">func isZeroedR(r []rune) bool</a>

```
searchKey: runtime_test.isZeroedR
tags: [method private]
```

```Go
func isZeroedR(r []rune) bool
```

### <a id="lastLine" href="#lastLine">func lastLine(src []byte) int</a>

```
searchKey: runtime_test.lastLine
tags: [method private]
```

```Go
func lastLine(src []byte) int
```

### <a id="lineNumber" href="#lineNumber">func lineNumber() int</a>

```
searchKey: runtime_test.lineNumber
tags: [function private]
```

```Go
func lineNumber() int
```

### <a id="localWork" href="#localWork">func localWork(w int)</a>

```
searchKey: runtime_test.localWork
tags: [method private]
```

```Go
func localWork(w int)
```

### <a id="logDiff" href="#logDiff">func logDiff(t *testing.T, prefix string, got, want reflect.Value)</a>

```
searchKey: runtime_test.logDiff
tags: [method private]
```

```Go
func logDiff(t *testing.T, prefix string, got, want reflect.Value)
```

### <a id="makePallocBits" href="#makePallocBits">func makePallocBits(s []BitRange) *PallocBits</a>

```
searchKey: runtime_test.makePallocBits
tags: [method private]
```

```Go
func makePallocBits(s []BitRange) *PallocBits
```

makePallocBits produces an initialized PallocBits by setting the ranges in s to 1 and the rest to zero. 

### <a id="makePallocData" href="#makePallocData">func makePallocData(alloc, scavenged []BitRange) *PallocData</a>

```
searchKey: runtime_test.makePallocData
tags: [method private]
```

```Go
func makePallocData(alloc, scavenged []BitRange) *PallocData
```

makePallocData produces an initialized PallocData by setting the ranges of described in alloc and scavenge. 

### <a id="matchLen" href="#matchLen">func matchLen(a, b []byte, max int) int</a>

```
searchKey: runtime_test.matchLen
tags: [method private]
```

```Go
func matchLen(a, b []byte, max int) int
```

Returns offset of difference 

### <a id="matmult" href="#matmult">func matmult(done chan<- struct{}, A, B, C Matrix, i0, i1, j0, j1, k0, k1, threshold int)</a>

```
searchKey: runtime_test.matmult
tags: [method private]
```

```Go
func matmult(done chan<- struct{}, A, B, C Matrix, i0, i1, j0, j1, k0, k1, threshold int)
```

### <a id="moveStack1" href="#moveStack1">func moveStack1(x bool)</a>

```
searchKey: runtime_test.moveStack1
tags: [method private]
```

```Go
func moveStack1(x bool)
```

### <a id="moveStackCheck" href="#moveStackCheck">func moveStackCheck(t *testing.T, new *int, old uintptr) bool</a>

```
searchKey: runtime_test.moveStackCheck
tags: [method private]
```

```Go
func moveStackCheck(t *testing.T, new *int, old uintptr) bool
```

This must not be inlined because the point is to force a stack growth check and move the stack. 

### <a id="mul" href="#mul">func mul(x, y float64) float64</a>

```
searchKey: runtime_test.mul
tags: [method private]
```

```Go
func mul(x, y float64) float64
```

### <a id="nextTrace" href="#nextTrace">func nextTrace(lines []string) ([]string, []string)</a>

```
searchKey: runtime_test.nextTrace
tags: [method private]
```

```Go
func nextTrace(lines []string) ([]string, []string)
```

### <a id="nonleaf" href="#nonleaf">func nonleaf(stop chan int) bool</a>

```
searchKey: runtime_test.nonleaf
tags: [method private]
```

```Go
func nonleaf(stop chan int) bool
```

### <a id="panicValue" href="#panicValue">func panicValue(fn func()) (recovered interface{})</a>

```
searchKey: runtime_test.panicValue
tags: [method private]
```

```Go
func panicValue(fn func()) (recovered interface{})
```

### <a id="parallelReader" href="#parallelReader">func parallelReader(m *RWMutex, clocked chan bool, cunlock *uint32, cdone chan bool)</a>

```
searchKey: runtime_test.parallelReader
tags: [method private]
```

```Go
func parallelReader(m *RWMutex, clocked chan bool, cunlock *uint32, cdone chan bool)
```

### <a id="parseFakeTime" href="#parseFakeTime">func parseFakeTime(x []byte) ([]fakeTimeFrame, error)</a>

```
searchKey: runtime_test.parseFakeTime
tags: [method private]
```

```Go
func parseFakeTime(x []byte) ([]fakeTimeFrame, error)
```

### <a id="permutation" href="#permutation">func permutation(t *testing.T, s []uint32, n int)</a>

```
searchKey: runtime_test.permutation
tags: [method private]
```

```Go
func permutation(t *testing.T, s []uint32, n int)
```

### <a id="perpetuumMobile" href="#perpetuumMobile">func perpetuumMobile()</a>

```
searchKey: runtime_test.perpetuumMobile
tags: [function private]
```

```Go
func perpetuumMobile()
```

### <a id="prepareAllMetricsSamples" href="#prepareAllMetricsSamples">func prepareAllMetricsSamples() (map[string]metrics.Description, []metrics.Sample)</a>

```
searchKey: runtime_test.prepareAllMetricsSamples
tags: [function private]
```

```Go
func prepareAllMetricsSamples() (map[string]metrics.Description, []metrics.Sample)
```

### <a id="randBytes" href="#randBytes">func randBytes(r *rand.Rand, b []byte)</a>

```
searchKey: runtime_test.randBytes
tags: [method private]
```

```Go
func randBytes(r *rand.Rand, b []byte)
```

### <a id="reader" href="#reader">func reader(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)</a>

```
searchKey: runtime_test.reader
tags: [method private]
```

```Go
func reader(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)
```

### <a id="rec1" href="#rec1">func rec1(max int)</a>

```
searchKey: runtime_test.rec1
tags: [method private]
```

```Go
func rec1(max int)
```

### <a id="recordLines" href="#recordLines">func recordLines(a, b, c int)</a>

```
searchKey: runtime_test.recordLines
tags: [method private]
```

```Go
func recordLines(a, b, c int)
```

### <a id="recurseFn" href="#recurseFn">func recurseFn(level int, maxlevel int)</a>

```
searchKey: runtime_test.recurseFn
tags: [method private]
```

```Go
func recurseFn(level int, maxlevel int)
```

### <a id="recurseFnPanicRec" href="#recurseFnPanicRec">func recurseFnPanicRec(level int, maxlevel int)</a>

```
searchKey: runtime_test.recurseFnPanicRec
tags: [method private]
```

```Go
func recurseFnPanicRec(level int, maxlevel int)
```

### <a id="runBuiltTestProg" href="#runBuiltTestProg">func runBuiltTestProg(t *testing.T, exe, name string, env ...string) string</a>

```
searchKey: runtime_test.runBuiltTestProg
tags: [method private]
```

```Go
func runBuiltTestProg(t *testing.T, exe, name string, env ...string) string
```

### <a id="runTestProg" href="#runTestProg">func runTestProg(t *testing.T, binary, name string, env ...string) string</a>

```
searchKey: runtime_test.runTestProg
tags: [method private]
```

```Go
func runTestProg(t *testing.T, binary, name string, env ...string) string
```

### <a id="runWith" href="#runWith">func runWith(f func(*testing.B, int), v ...int) func(*testing.B)</a>

```
searchKey: runtime_test.runWith
tags: [method private]
```

```Go
func runWith(f func(*testing.B, int), v ...int) func(*testing.B)
```

### <a id="same" href="#same">func same(f, g float64) bool</a>

```
searchKey: runtime_test.same
tags: [method private]
```

```Go
func same(f, g float64) bool
```

### <a id="set" href="#set">func set(p *int, x int)</a>

```
searchKey: runtime_test.set
tags: [method private]
```

```Go
func set(p *int, x int)
```

TestDeferPtrs tests the adjustment of Defer's argument pointers (p aka &y) during a stack copy. 

### <a id="setBig" href="#setBig">func setBig(p *int, x int, b bigBuf)</a>

```
searchKey: runtime_test.setBig
tags: [method private]
```

```Go
func setBig(p *int, x int, b bigBuf)
```

### <a id="setbits" href="#setbits">func setbits(h *HashSet, b []byte, i int, k int)</a>

```
searchKey: runtime_test.setbits
tags: [method private]
```

```Go
func setbits(h *HashSet, b []byte, i int, k int)
```

set up to k bits at index i and greater 

### <a id="sideeffect" href="#sideeffect">func sideeffect(n int64) int64</a>

```
searchKey: runtime_test.sideeffect
tags: [method private]
```

```Go
func sideeffect(n int64) int64
```

### <a id="skipDebugLog" href="#skipDebugLog">func skipDebugLog(t *testing.T)</a>

```
searchKey: runtime_test.skipDebugLog
tags: [method private]
```

```Go
func skipDebugLog(t *testing.T)
```

### <a id="small" href="#small">func small(stop chan int, x *[8192]byte) int</a>

```
searchKey: runtime_test.small
tags: [method private]
```

```Go
func small(stop chan int, x *[8192]byte) int
```

### <a id="sparse" href="#sparse">func sparse(t *testing.T, n int, k int)</a>

```
searchKey: runtime_test.sparse
tags: [method private]
```

```Go
func sparse(t *testing.T, n int, k int)
```

### <a id="stackGrowthRecursive" href="#stackGrowthRecursive">func stackGrowthRecursive(i int)</a>

```
searchKey: runtime_test.stackGrowthRecursive
tags: [method private]
```

```Go
func stackGrowthRecursive(i int)
```

### <a id="sub" href="#sub">func sub(x, y float64) float64</a>

```
searchKey: runtime_test.sub
tags: [method private]
```

```Go
func sub(x, y float64) float64
```

### <a id="test" href="#test">func test(t *testing.T, op string, hw, sw func(float64, float64) float64, all []float64)</a>

```
searchKey: runtime_test.test
tags: [method private]
```

```Go
func test(t *testing.T, op string, hw, sw func(float64, float64) float64, all []float64)
```

### <a id="testAssert" href="#testAssert">func testAssert(x interface{}) error</a>

```
searchKey: runtime_test.testAssert
tags: [method private]
```

```Go
func testAssert(x interface{}) error
```

### <a id="testAssertVar" href="#testAssertVar">func testAssertVar(x interface{}) error</a>

```
searchKey: runtime_test.testAssertVar
tags: [method private]
```

```Go
func testAssertVar(x interface{}) error
```

### <a id="testCallerBar" href="#testCallerBar">func testCallerBar(t *testing.T)</a>

```
searchKey: runtime_test.testCallerBar
tags: [method private]
```

```Go
func testCallerBar(t *testing.T)
```

### <a id="testCallerFoo" href="#testCallerFoo">func testCallerFoo(t *testing.T)</a>

```
searchKey: runtime_test.testCallerFoo
tags: [method private]
```

```Go
func testCallerFoo(t *testing.T)
```

These are marked noinline so that we can use FuncForPC in testCallerBar. 

### <a id="testCallers" href="#testCallers">func testCallers(t *testing.T, pcs []uintptr, pan bool)</a>

```
searchKey: runtime_test.testCallers
tags: [method private]
```

```Go
func testCallers(t *testing.T, pcs []uintptr, pan bool)
```

### <a id="testCallersEqual" href="#testCallersEqual">func testCallersEqual(t *testing.T, pcs []uintptr, want []string)</a>

```
searchKey: runtime_test.testCallersEqual
tags: [method private]
```

```Go
func testCallersEqual(t *testing.T, pcs []uintptr, want []string)
```

### <a id="testCgoPprof" href="#testCgoPprof">func testCgoPprof(t *testing.T, buildArg, runArg, top, bottom string)</a>

```
searchKey: runtime_test.testCgoPprof
tags: [method private]
```

```Go
func testCgoPprof(t *testing.T, buildArg, runArg, top, bottom string)
```

### <a id="testChanSendBarrier" href="#testChanSendBarrier">func testChanSendBarrier(useSelect bool)</a>

```
searchKey: runtime_test.testChanSendBarrier
tags: [method private]
```

```Go
func testChanSendBarrier(useSelect bool)
```

### <a id="testConcurrentReadsAfterGrowth" href="#testConcurrentReadsAfterGrowth">func testConcurrentReadsAfterGrowth(t *testing.T, useReflect bool)</a>

```
searchKey: runtime_test.testConcurrentReadsAfterGrowth
tags: [method private]
```

```Go
func testConcurrentReadsAfterGrowth(t *testing.T, useReflect bool)
```

### <a id="testConditionalDefers" href="#testConditionalDefers">func testConditionalDefers(n int)</a>

```
searchKey: runtime_test.testConditionalDefers
tags: [method private]
```

```Go
func testConditionalDefers(n int)
```

### <a id="testCrashHandler" href="#testCrashHandler">func testCrashHandler(t *testing.T, cgo bool)</a>

```
searchKey: runtime_test.testCrashHandler
tags: [method private]
```

```Go
func testCrashHandler(t *testing.T, cgo bool)
```

### <a id="testDeadlock" href="#testDeadlock">func testDeadlock(t *testing.T, name string)</a>

```
searchKey: runtime_test.testDeadlock
tags: [method private]
```

```Go
func testDeadlock(t *testing.T, name string)
```

### <a id="testDeferLeafSigpanic1" href="#testDeferLeafSigpanic1">func testDeferLeafSigpanic1()</a>

```
searchKey: runtime_test.testDeferLeafSigpanic1
tags: [function private]
```

```Go
func testDeferLeafSigpanic1()
```

### <a id="testDeferPtrsGoexit" href="#testDeferPtrsGoexit">func testDeferPtrsGoexit(c chan int, i int)</a>

```
searchKey: runtime_test.testDeferPtrsGoexit
tags: [method private]
```

```Go
func testDeferPtrsGoexit(c chan int, i int)
```

### <a id="testDeferPtrsPanic" href="#testDeferPtrsPanic">func testDeferPtrsPanic(c chan int, i int)</a>

```
searchKey: runtime_test.testDeferPtrsPanic
tags: [method private]
```

```Go
func testDeferPtrsPanic(c chan int, i int)
```

### <a id="testGdbPython" href="#testGdbPython">func testGdbPython(t *testing.T, cgo bool)</a>

```
searchKey: runtime_test.testGdbPython
tags: [method private]
```

```Go
func testGdbPython(t *testing.T, cgo bool)
```

### <a id="testGoroutineParallelism2" href="#testGoroutineParallelism2">func testGoroutineParallelism2(t *testing.T, load, netpoll bool)</a>

```
searchKey: runtime_test.testGoroutineParallelism2
tags: [method private]
```

```Go
func testGoroutineParallelism2(t *testing.T, load, netpoll bool)
```

### <a id="testIfaceEqual" href="#testIfaceEqual">func testIfaceEqual(x interface{})</a>

```
searchKey: runtime_test.testIfaceEqual
tags: [method private]
```

```Go
func testIfaceEqual(x interface{})
```

### <a id="testLockOSThreadExit" href="#testLockOSThreadExit">func testLockOSThreadExit(t *testing.T, prog string)</a>

```
searchKey: runtime_test.testLockOSThreadExit
tags: [method private]
```

```Go
func testLockOSThreadExit(t *testing.T, prog string)
```

### <a id="testMapLookups" href="#testMapLookups">func testMapLookups(t *testing.T, m map[string]string)</a>

```
searchKey: runtime_test.testMapLookups
tags: [method private]
```

```Go
func testMapLookups(t *testing.T, m map[string]string)
```

### <a id="testMapNan" href="#testMapNan">func testMapNan(t *testing.T, m map[float64]int)</a>

```
searchKey: runtime_test.testMapNan
tags: [method private]
```

```Go
func testMapNan(t *testing.T, m map[float64]int)
```

### <a id="testOpen" href="#testOpen">func testOpen(t *testing.T, arg int)</a>

```
searchKey: runtime_test.testOpen
tags: [method private]
```

```Go
func testOpen(t *testing.T, arg int)
```

### <a id="testOverlap" href="#testOverlap">func testOverlap(t *testing.T, size int)</a>

```
searchKey: runtime_test.testOverlap
tags: [method private]
```

```Go
func testOverlap(t *testing.T, size int)
```

### <a id="testPanicDeadlock" href="#testPanicDeadlock">func testPanicDeadlock(t *testing.T, name string, want string)</a>

```
searchKey: runtime_test.testPanicDeadlock
tags: [method private]
```

```Go
func testPanicDeadlock(t *testing.T, name string, want string)
```

### <a id="testPanicSystemstackInternal" href="#testPanicSystemstackInternal">func testPanicSystemstackInternal()</a>

```
searchKey: runtime_test.testPanicSystemstackInternal
tags: [function private]
```

```Go
func testPanicSystemstackInternal()
```

### <a id="testPreemptionAfterSyscall" href="#testPreemptionAfterSyscall">func testPreemptionAfterSyscall(t *testing.T, syscallDuration time.Duration)</a>

```
searchKey: runtime_test.testPreemptionAfterSyscall
tags: [method private]
```

```Go
func testPreemptionAfterSyscall(t *testing.T, syscallDuration time.Duration)
```

Check that a goroutine will be preempted if it is calling short system calls. 

### <a id="testSemaHandoff" href="#testSemaHandoff">func testSemaHandoff() bool</a>

```
searchKey: runtime_test.testSemaHandoff
tags: [function private]
```

```Go
func testSemaHandoff() bool
```

### <a id="testSetPanicOnFault" href="#testSetPanicOnFault">func testSetPanicOnFault(t *testing.T, addr uintptr, nfault *int)</a>

```
searchKey: runtime_test.testSetPanicOnFault
tags: [method private]
```

```Go
func testSetPanicOnFault(t *testing.T, addr uintptr, nfault *int)
```

testSetPanicOnFault tests one potentially faulting address. It deliberately constructs and uses an invalid pointer, so mark it as nocheckptr. 

### <a id="testSize" href="#testSize">func testSize(t *testing.T, size int)</a>

```
searchKey: runtime_test.testSize
tags: [method private]
```

```Go
func testSize(t *testing.T, size int)
```

### <a id="testStackWrapperPanic" href="#testStackWrapperPanic">func testStackWrapperPanic(t *testing.T, cb func(), expect string)</a>

```
searchKey: runtime_test.testStackWrapperPanic
tags: [method private]
```

```Go
func testStackWrapperPanic(t *testing.T, cb func(), expect string)
```

### <a id="testTracebackArgs1" href="#testTracebackArgs1">func testTracebackArgs1(a, b, c, d, e, f, g, h, i, j, k, l int) int</a>

```
searchKey: runtime_test.testTracebackArgs1
tags: [method private]
```

```Go
func testTracebackArgs1(a, b, c, d, e, f, g, h, i, j, k, l int) int
```

### <a id="testTracebackArgs2" href="#testTracebackArgs2">func testTracebackArgs2(a bool, b struct {...</a>

```
searchKey: runtime_test.testTracebackArgs2
tags: [method private]
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
tags: [method private]
```

```Go
func testTracebackArgs3(x [3]byte, a, b, c int, y [3]byte) int
```

### <a id="testTracebackArgs4" href="#testTracebackArgs4">func testTracebackArgs4(a bool, x [1][1][1][1][1][1][1][1][1][1]int) int</a>

```
searchKey: runtime_test.testTracebackArgs4
tags: [method private]
```

```Go
func testTracebackArgs4(a bool, x [1][1][1][1][1][1][1][1][1][1]int) int
```

### <a id="testTracebackArgs5" href="#testTracebackArgs5">func testTracebackArgs5(a bool, x struct {...</a>

```
searchKey: runtime_test.testTracebackArgs5
tags: [method private]
```

```Go
func testTracebackArgs5(a bool, x struct {
	x int
	y [0]int
	z [2][0]int
}, _, _, _, _, _, _, _, _, _, _, _, _ [0]int) int
```

### <a id="testTypeSwitch" href="#testTypeSwitch">func testTypeSwitch(x interface{}) error</a>

```
searchKey: runtime_test.testTypeSwitch
tags: [method private]
```

```Go
func testTypeSwitch(x interface{}) error
```

### <a id="testYieldProgress" href="#testYieldProgress">func testYieldProgress(locked bool)</a>

```
searchKey: runtime_test.testYieldProgress
tags: [method private]
```

```Go
func testYieldProgress(locked bool)
```

### <a id="testcmp" href="#testcmp">func testcmp(t *testing.T, f, g float64)</a>

```
searchKey: runtime_test.testcmp
tags: [method private]
```

```Go
func testcmp(t *testing.T, f, g float64)
```

### <a id="testu" href="#testu">func testu(t *testing.T, op string, hw, sw func(float64) float64, v float64)</a>

```
searchKey: runtime_test.testu
tags: [method private]
```

```Go
func testu(t *testing.T, op string, hw, sw func(float64) float64, v float64)
```

### <a id="text" href="#text">func text(t *testing.T, prefix, suffix string)</a>

```
searchKey: runtime_test.text
tags: [method private]
```

```Go
func text(t *testing.T, prefix, suffix string)
```

### <a id="to32sw" href="#to32sw">func to32sw(f float64) float64</a>

```
searchKey: runtime_test.to32sw
tags: [method private]
```

```Go
func to32sw(f float64) float64
```

64 -sw->32 -hw-> 64 

### <a id="to64sw" href="#to64sw">func to64sw(f float64) float64</a>

```
searchKey: runtime_test.to64sw
tags: [method private]
```

```Go
func to64sw(f float64) float64
```

64 -hw->32 -sw-> 64 

### <a id="toint64sw" href="#toint64sw">func toint64sw(f float64) float64</a>

```
searchKey: runtime_test.toint64sw
tags: [method private]
```

```Go
func toint64sw(f float64) float64
```

float64 -sw-> int64 -hw-> float64 

### <a id="tracebackExcluded" href="#tracebackExcluded">func tracebackExcluded()</a>

```
searchKey: runtime_test.tracebackExcluded
tags: [function private]
```

```Go
func tracebackExcluded()
```

tracebackExcluded should be excluded from tracebacks. There are various ways this could come up. Linking it to a "runtime." name is rather synthetic, but it's easy and reliable. See issue #42754 for one way this happened in real code. 

### <a id="tracebackFunc" href="#tracebackFunc">func tracebackFunc(t *testing.T) uintptr</a>

```
searchKey: runtime_test.tracebackFunc
tags: [method private]
```

```Go
func tracebackFunc(t *testing.T) uintptr
```

A function with an InlTree. Returns a PC within the function body. 

No inline to ensure this complete function appears in output. 

### <a id="tracebackNotExcluded" href="#tracebackNotExcluded">func tracebackNotExcluded()</a>

```
searchKey: runtime_test.tracebackNotExcluded
tags: [function private]
```

```Go
func tracebackNotExcluded()
```

tracebackNotExcluded should be inlined into tracebackExcluded, but should not itself be excluded from the traceback. 

### <a id="trimDead" href="#trimDead">func trimDead(mask []byte) []byte</a>

```
searchKey: runtime_test.trimDead
tags: [method private]
```

```Go
func trimDead(mask []byte) []byte
```

### <a id="trunc32" href="#trunc32">func trunc32(f float64) float64</a>

```
searchKey: runtime_test.trunc32
tags: [method private]
```

```Go
func trunc32(f float64) float64
```

64 -hw-> 32 -hw-> 64 

### <a id="trythis" href="#trythis">func trythis()</a>

```
searchKey: runtime_test.trythis
tags: [function private]
```

```Go
func trythis()
```

### <a id="twoNonZero" href="#twoNonZero">func twoNonZero(h *HashSet, n int)</a>

```
searchKey: runtime_test.twoNonZero
tags: [method private]
```

```Go
func twoNonZero(h *HashSet, n int)
```

### <a id="useStack" href="#useStack">func useStack(n int)</a>

```
searchKey: runtime_test.useStack
tags: [method private]
```

```Go
func useStack(n int)
```

### <a id="useStackAndCall" href="#useStackAndCall">func useStackAndCall(n int, f func())</a>

```
searchKey: runtime_test.useStackAndCall
tags: [method private]
```

```Go
func useStackAndCall(n int, f func())
```

use about n KB of stack and call f 

### <a id="validateAddrRanges" href="#validateAddrRanges">func validateAddrRanges(t *testing.T, a *AddrRanges, want ...AddrRange)</a>

```
searchKey: runtime_test.validateAddrRanges
tags: [method private]
```

```Go
func validateAddrRanges(t *testing.T, a *AddrRanges, want ...AddrRange)
```

### <a id="verifyGCInfo" href="#verifyGCInfo">func verifyGCInfo(t *testing.T, name string, p interface{}, mask0 []byte)</a>

```
searchKey: runtime_test.verifyGCInfo
tags: [method private]
```

```Go
func verifyGCInfo(t *testing.T, name string, p interface{}, mask0 []byte)
```

### <a id="warmupScheduler" href="#warmupScheduler">func warmupScheduler(targetThreadCount int)</a>

```
searchKey: runtime_test.warmupScheduler
tags: [method private]
```

```Go
func warmupScheduler(targetThreadCount int)
```

warmupScheduler ensures the scheduler has at least targetThreadCount threads in its thread pool. 

### <a id="windowed" href="#windowed">func windowed(t *testing.T, k Key)</a>

```
searchKey: runtime_test.windowed
tags: [method private]
```

```Go
func windowed(t *testing.T, k Key)
```

### <a id="writeBarrierBenchmark" href="#writeBarrierBenchmark">func writeBarrierBenchmark(b *testing.B, f func())</a>

```
searchKey: runtime_test.writeBarrierBenchmark
tags: [method private]
```

```Go
func writeBarrierBenchmark(b *testing.B, f func())
```

### <a id="writer" href="#writer">func writer(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)</a>

```
searchKey: runtime_test.writer
tags: [method private]
```

```Go
func writer(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)
```

