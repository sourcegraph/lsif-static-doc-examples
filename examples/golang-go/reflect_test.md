# Package reflect_test

## Index

* [Variables](#var)
    * [var V](#V)
    * [var allselect](#allselect)
    * [var appendTests](#appendTests)
    * [var assignableTests](#assignableTests)
    * [var comparableTests](#comparableTests)
    * [var convertTests](#convertTests)
    * [var cycleMap1](#cycleMap1)
    * [var cycleMap2](#cycleMap2)
    * [var cycleMap3](#cycleMap3)
    * [var deepEqualTests](#deepEqualTests)
    * [var fieldTests](#fieldTests)
    * [var fieldsTests](#fieldsTests)
    * [var fn1](#fn1)
    * [var fn2](#fn2)
    * [var fn3](#fn3)
    * [var gFloat32](#gFloat32)
    * [var implementsTests](#implementsTests)
    * [var loop1](#loop1)
    * [var loop2](#loop2)
    * [var loopy1](#loopy1)
    * [var loopy2](#loopy2)
    * [var nameTests](#nameTests)
    * [var selectWatch](#selectWatch)
    * [var sink](#sink)
    * [var tagGetTests](#tagGetTests)
    * [var typeTests](#typeTests)
    * [var unexpi](#unexpi)
    * [var valueTests](#valueTests)
    * [var valueToStringTests](#valueToStringTests)
    * [var _i](#_i)
* [Types](#type)
    * [type B1 struct](#B1)
    * [type Basic struct](#Basic)
    * [type BytesChan chan []byte](#BytesChan)
    * [type BytesChanRecv <-chan []byte](#BytesChanRecv)
    * [type BytesChanSend chan<- []byte](#BytesChanSend)
    * [type Ch <-chan interface{}](#Ch)
    * [type ComparableStruct struct](#ComparableStruct)
    * [type D1 struct](#D1)
    * [type D2 struct](#D2)
    * [type DeepEqualTest struct](#DeepEqualTest)
    * [type DirectIfaceT struct](#DirectIfaceT)
        * [func (d DirectIfaceT) M() int](#DirectIfaceT.M)
    * [type Empty struct{}](#Empty)
    * [type FTest struct](#FTest)
    * [type FuncDDD func(...interface{}) error](#FuncDDD)
        * [func (f FuncDDD) M()](#FuncDDD.M)
    * [type Impl struct{}](#Impl)
        * [func (Impl) F()](#Impl.F)
    * [type Inner struct](#Inner)
        * [func (pi *Inner) M()](#Inner.M)
    * [type InnerInt struct](#InnerInt)
        * [func (i *InnerInt) M() int](#InnerInt.M)
    * [type IntChan chan int](#IntChan)
    * [type IntChanRecv <-chan int](#IntChanRecv)
    * [type IntChanSend chan<- int](#IntChanSend)
    * [type IntPtr *int](#IntPtr)
    * [type IntPtr1 *int](#IntPtr1)
    * [type KeepMethodLive struct{}](#KeepMethodLive)
        * [func (k KeepMethodLive) Method1(i int)](#KeepMethodLive.Method1)
        * [func (k KeepMethodLive) Method2(i int)](#KeepMethodLive.Method2)
    * [type Loop *reflect_test.Loop](#Loop)
    * [type Loopy interface{}](#Loopy)
    * [type M map[string]interface{}](#M)
    * [type MyByte byte](#MyByte)
    * [type MyBytes []byte](#MyBytes)
    * [type MyBytesArray [4]byte](#MyBytesArray)
    * [type MyBytesArray0 [0]byte](#MyBytesArray0)
    * [type MyBytesArrayPtr *[4]byte](#MyBytesArrayPtr)
    * [type MyBytesArrayPtr0 *[0]byte](#MyBytesArrayPtr0)
    * [type MyFunc func()](#MyFunc)
    * [type MyRunes []int32](#MyRunes)
    * [type MyString string](#MyString)
    * [type MyStruct struct](#MyStruct)
    * [type MyStruct1 struct](#MyStruct1)
    * [type MyStruct2 struct](#MyStruct2)
    * [type NonComparableStruct struct](#NonComparableStruct)
    * [type NonExportedFirst int](#NonExportedFirst)
        * [func (i NonExportedFirst) ΦExported()](#NonExportedFirst.ΦExported)
        * [func (i NonExportedFirst) nonexported() int](#NonExportedFirst.nonexported)
    * [type NotBasic reflect_test.Basic](#NotBasic)
    * [type Outer struct](#Outer)
    * [type OuterInt struct](#OuterInt)
    * [type Point struct](#Point)
        * [func (p Point) AnotherMethod(scale int) int](#Point.AnotherMethod)
        * [func (p Point) Dist(scale int) int](#Point.Dist)
        * [func (p Point) GCMethod(k int) int](#Point.GCMethod)
        * [func (p *Point) Int32Method(x int32) int32](#Point.Int32Method)
        * [func (p *Point) Int64Method(x int64) int64](#Point.Int64Method)
        * [func (p Point) NoArgs()](#Point.NoArgs)
        * [func (p Point) TotalDist(points ...Point) int](#Point.TotalDist)
    * [type Private struct](#Private)
        * [func (p *Private) m()](#Private.m)
    * [type Public struct](#Public)
        * [func (p *Public) M()](#Public.M)
    * [type R0 struct](#R0)
    * [type R1 struct](#R1)
    * [type R10 reflect_test.R9](#R10)
    * [type R11 reflect_test.R9](#R11)
    * [type R12 reflect_test.R9](#R12)
    * [type R13 struct](#R13)
    * [type R14 reflect_test.R13](#R14)
    * [type R15 reflect_test.R13](#R15)
    * [type R16 reflect_test.R13](#R16)
    * [type R17 struct](#R17)
    * [type R18 reflect_test.R17](#R18)
    * [type R19 reflect_test.R17](#R19)
    * [type R2 reflect_test.R1](#R2)
    * [type R20 reflect_test.R17](#R20)
    * [type R21 struct](#R21)
    * [type R22 reflect_test.R21](#R22)
    * [type R23 reflect_test.R21](#R23)
    * [type R24 reflect_test.R21](#R24)
    * [type R3 reflect_test.R1](#R3)
    * [type R4 reflect_test.R1](#R4)
    * [type R5 struct](#R5)
    * [type R6 reflect_test.R5](#R6)
    * [type R7 reflect_test.R5](#R7)
    * [type R8 reflect_test.R5](#R8)
    * [type R9 struct](#R9)
    * [type RS1 struct](#RS1)
    * [type RS2 struct](#RS2)
    * [type RS3 struct](#RS3)
    * [type Rec1 struct](#Rec1)
    * [type Rec2 struct](#Rec2)
    * [type Recursive struct](#Recursive)
    * [type S struct](#S)
    * [type S0 struct](#S0)
    * [type S1 struct](#S1)
    * [type S10 struct](#S10)
    * [type S11 struct](#S11)
    * [type S12 struct](#S12)
    * [type S13 struct](#S13)
    * [type S14 struct](#S14)
    * [type S15 struct](#S15)
    * [type S16 struct](#S16)
    * [type S1x struct](#S1x)
    * [type S1y struct](#S1y)
    * [type S2 struct](#S2)
    * [type S3 struct](#S3)
    * [type S4 struct](#S4)
    * [type S5 struct](#S5)
    * [type S6 struct](#S6)
    * [type S7 reflect_test.S6](#S7)
    * [type S8 struct](#S8)
    * [type S9 struct](#S9)
    * [type SF struct](#SF)
    * [type SF1 struct](#SF1)
    * [type SF2 struct](#SF2)
    * [type SFG struct](#SFG)
    * [type SFG1 struct](#SFG1)
    * [type SFG2 struct](#SFG2)
    * [type SFGH struct](#SFGH)
    * [type SFGH1 struct](#SFGH1)
    * [type SFGH2 struct](#SFGH2)
    * [type SFGH3 struct](#SFGH3)
    * [type SG struct](#SG)
    * [type SG1 struct](#SG1)
    * [type SettablePointer struct](#SettablePointer)
        * [func (p *SettablePointer) Set(v int)](#SettablePointer.Set)
    * [type SettableStruct struct](#SettableStruct)
        * [func (p *SettableStruct) Set(v int)](#SettableStruct.Set)
    * [type StructI int](#StructI)
        * [func (i StructI) Get() int](#StructI.Get)
    * [type StructIPtr int](#StructIPtr)
        * [func (i *StructIPtr) Get() int](#StructIPtr.Get)
        * [func (i *StructIPtr) Set(v int)](#StructIPtr.Set)
    * [type T struct](#T)
    * [type T1 struct](#T1)
    * [type Talias1 struct](#Talias1)
    * [type Talias2 struct](#Talias2)
    * [type Tbigp [2]uintptr](#Tbigp)
        * [func (p *Tbigp) M(x int, b byte) (byte, int)](#Tbigp.M)
    * [type Tbigv [2]uintptr](#Tbigv)
        * [func (v Tbigv) M(x int, b byte) (byte, int)](#Tbigv.M)
    * [type TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678 int](#TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678)
    * [type Tint int](#Tint)
    * [type Tint2 reflect_test.Tint](#Tint2)
    * [type Tinter interface](#Tinter)
    * [type Tm1 struct](#Tm1)
    * [type Tm2 struct](#Tm2)
    * [type Tm3 struct](#Tm3)
    * [type Tm4 struct{}](#Tm4)
        * [func (t4 Tm4) M(x int, b byte) (byte, int)](#Tm4.M)
    * [type Tsmallp byte](#Tsmallp)
        * [func (p *Tsmallp) M(x int, b byte) (byte, int)](#Tsmallp.M)
    * [type Tsmallv byte](#Tsmallv)
        * [func (v Tsmallv) M(x int, b byte) (byte, int)](#Tsmallv.M)
    * [type Twordp uintptr](#Twordp)
        * [func (p *Twordp) M(x int, b byte) (byte, int)](#Twordp.M)
    * [type Twordv uintptr](#Twordv)
        * [func (v Twordv) M(x int, b byte) (byte, int)](#Twordv.M)
    * [type UnExportedFirst int](#UnExportedFirst)
        * [func (i UnExportedFirst) ΦExported()](#UnExportedFirst.ΦExported)
        * [func (i UnExportedFirst) unexported()](#UnExportedFirst.unexported)
    * [type UnexpT struct](#UnexpT)
    * [type WC struct{}](#WC)
        * [func (w *WC) Close() error](#WC.Close)
        * [func (w *WC) Write(p []byte) (n int, err error)](#WC.Write)
    * [type XM struct](#XM)
        * [func (*XM) String() string](#XM.String)
    * [type big struct](#big)
    * [type caseInfo struct](#caseInfo)
    * [type choice struct](#choice)
    * [type emptyStruct struct{}](#emptyStruct)
        * [func returnEmpty() emptyStruct](#returnEmpty)
    * [type exhaustive struct](#exhaustive)
        * [func (x *exhaustive) Choose(max int) int](#exhaustive.Choose)
        * [func (x *exhaustive) Maybe() bool](#exhaustive.Maybe)
        * [func (x *exhaustive) Next() bool](#exhaustive.Next)
    * [type inner struct](#inner)
        * [func (*inner) M()](#inner.M)
    * [type integer int](#integer)
    * [type myint int64](#myint)
        * [func (i *myint) inc()](#myint.inc)
    * [type nameTest struct](#nameTest)
    * [type nonEmptyStruct struct](#nonEmptyStruct)
        * [func returnNonEmpty(i int) nonEmptyStruct](#returnNonEmpty)
    * [type notASTExpr interface](#notASTExpr)
    * [type notAnExpr struct{}](#notAnExpr)
        * [func (notAnExpr) End() token.Pos](#notAnExpr.End)
        * [func (notAnExpr) Pos() token.Pos](#notAnExpr.Pos)
        * [func (notAnExpr) exprNode()](#notAnExpr.exprNode)
    * [type outer struct](#outer)
        * [func (*outer) M()](#outer.M)
    * [type pair struct](#pair)
    * [type private struct](#private)
        * [func (p *private) P()](#private.P)
    * [type sFG struct](#sFG)
    * [type self struct{}](#self)
    * [type structField struct](#structField)
    * [type structWithSelfPtr struct](#structWithSelfPtr)
    * [type timp int](#timp)
        * [func (t timp) W()](#timp.W)
        * [func (t timp) Y()](#timp.Y)
        * [func (t timp) w()](#timp.w)
        * [func (t timp) y()](#timp.y)
    * [type tinter interface](#tinter)
    * [type two [2]uintptr](#two)
        * [func dummy(b byte, c int, d byte, e two, f byte, g float32, h byte) (i byte, j int, k byte, l two, m byte, n float32, o byte)](#dummy)
    * [type unexp struct{}](#unexp)
        * [func (*unexp) f() (int32, int8)](#unexp.f)
        * [func (*unexp) g() (int64, int8)](#unexp.g)
    * [type unexpI interface](#unexpI)
    * [type _Complex struct](#_Complex)
* [Functions](#func)
    * [func BenchmarkCall(b *testing.B)](#BenchmarkCall)
    * [func BenchmarkCallArgCopy(b *testing.B)](#BenchmarkCallArgCopy)
    * [func BenchmarkCallMethod(b *testing.B)](#BenchmarkCallMethod)
    * [func BenchmarkFieldByName1(b *testing.B)](#BenchmarkFieldByName1)
    * [func BenchmarkFieldByName2(b *testing.B)](#BenchmarkFieldByName2)
    * [func BenchmarkFieldByName3(b *testing.B)](#BenchmarkFieldByName3)
    * [func BenchmarkInterfaceBig(b *testing.B)](#BenchmarkInterfaceBig)
    * [func BenchmarkInterfaceSmall(b *testing.B)](#BenchmarkInterfaceSmall)
    * [func BenchmarkNew(b *testing.B)](#BenchmarkNew)
    * [func BenchmarkPtrTo(b *testing.B)](#BenchmarkPtrTo)
    * [func BenchmarkSelect(b *testing.B)](#BenchmarkSelect)
    * [func EmptyInterfaceV(x interface{}) Value](#EmptyInterfaceV)
    * [func ExampleKind()](#ExampleKind)
    * [func ExampleMakeFunc()](#ExampleMakeFunc)
    * [func ExampleStructOf()](#ExampleStructOf)
    * [func ExampleStructTag()](#ExampleStructTag)
    * [func ExampleStructTag_Lookup()](#ExampleStructTag_Lookup)
    * [func ExampleTypeOf()](#ExampleTypeOf)
    * [func GCFunc(args []Value) []Value](#GCFunc)
    * [func Nil(a interface{}, t *testing.T)](#Nil)
    * [func NotNil(a interface{}, t *testing.T)](#NotNil)
    * [func ReadWriterV(x io.ReadWriter) Value](#ReadWriterV)
    * [func ReaderV(x io.Reader) Value](#ReaderV)
    * [func TestAddr(t *testing.T)](#TestAddr)
    * [func TestAlias(t *testing.T)](#TestAlias)
    * [func TestAliasNames(t *testing.T)](#TestAliasNames)
    * [func TestAlignment(t *testing.T)](#TestAlignment)
    * [func TestAll(t *testing.T)](#TestAll)
    * [func TestAllocations(t *testing.T)](#TestAllocations)
    * [func TestAllocsInterfaceBig(t *testing.T)](#TestAllocsInterfaceBig)
    * [func TestAllocsInterfaceSmall(t *testing.T)](#TestAllocsInterfaceSmall)
    * [func TestAnonymousFields(t *testing.T)](#TestAnonymousFields)
    * [func TestAppend(t *testing.T)](#TestAppend)
    * [func TestArrayElemSet(t *testing.T)](#TestArrayElemSet)
    * [func TestArrayOf(t *testing.T)](#TestArrayOf)
    * [func TestArrayOfAlg(t *testing.T)](#TestArrayOfAlg)
    * [func TestArrayOfDirectIface(t *testing.T)](#TestArrayOfDirectIface)
    * [func TestArrayOfGC(t *testing.T)](#TestArrayOfGC)
    * [func TestArrayOfGenericAlg(t *testing.T)](#TestArrayOfGenericAlg)
    * [func TestArrayOfPanicOnNegativeLength(t *testing.T)](#TestArrayOfPanicOnNegativeLength)
    * [func TestAssignableTo(t *testing.T)](#TestAssignableTo)
    * [func TestBigStruct(t *testing.T)](#TestBigStruct)
    * [func TestBigUnnamedStruct(t *testing.T)](#TestBigUnnamedStruct)
    * [func TestBigZero(t *testing.T)](#TestBigZero)
    * [func TestBool(t *testing.T)](#TestBool)
    * [func TestBytes(t *testing.T)](#TestBytes)
    * [func TestCallConvert(t *testing.T)](#TestCallConvert)
    * [func TestCallGC(t *testing.T)](#TestCallGC)
    * [func TestCallMethodJump(t *testing.T)](#TestCallMethodJump)
    * [func TestCallPanic(t *testing.T)](#TestCallPanic)
    * [func TestCallReturnsEmpty(t *testing.T)](#TestCallReturnsEmpty)
    * [func TestCallWithStruct(t *testing.T)](#TestCallWithStruct)
    * [func TestCanSetField(t *testing.T)](#TestCanSetField)
    * [func TestChan(t *testing.T)](#TestChan)
    * [func TestChanAlloc(t *testing.T)](#TestChanAlloc)
    * [func TestChanOf(t *testing.T)](#TestChanOf)
    * [func TestChanOfDir(t *testing.T)](#TestChanOfDir)
    * [func TestChanOfGC(t *testing.T)](#TestChanOfGC)
    * [func TestComparable(t *testing.T)](#TestComparable)
    * [func TestConvert(t *testing.T)](#TestConvert)
    * [func TestConvertNaNs(t *testing.T)](#TestConvertNaNs)
    * [func TestConvertPanic(t *testing.T)](#TestConvertPanic)
    * [func TestConvertibleTo(t *testing.T)](#TestConvertibleTo)
    * [func TestCopy(t *testing.T)](#TestCopy)
    * [func TestCopyArray(t *testing.T)](#TestCopyArray)
    * [func TestCopyString(t *testing.T)](#TestCopyString)
    * [func TestDeepEqual(t *testing.T)](#TestDeepEqual)
    * [func TestDeepEqualComplexStruct(t *testing.T)](#TestDeepEqualComplexStruct)
    * [func TestDeepEqualComplexStructInequality(t *testing.T)](#TestDeepEqualComplexStructInequality)
    * [func TestDeepEqualRecursiveStruct(t *testing.T)](#TestDeepEqualRecursiveStruct)
    * [func TestDeepEqualUnexportedMap(t *testing.T)](#TestDeepEqualUnexportedMap)
    * [func TestDirectIfaceMethod(t *testing.T)](#TestDirectIfaceMethod)
    * [func TestEmbed(t *testing.T)](#TestEmbed)
    * [func TestEmbeddedMethods(t *testing.T)](#TestEmbeddedMethods)
    * [func TestExported(t *testing.T)](#TestExported)
    * [func TestFieldByIndex(t *testing.T)](#TestFieldByIndex)
    * [func TestFieldByIndexNil(t *testing.T)](#TestFieldByIndexNil)
    * [func TestFieldByName(t *testing.T)](#TestFieldByName)
    * [func TestFieldPkgPath(t *testing.T)](#TestFieldPkgPath)
    * [func TestFields(t *testing.T)](#TestFields)
    * [func TestFunc(t *testing.T)](#TestFunc)
    * [func TestFuncArg(t *testing.T)](#TestFuncArg)
    * [func TestFuncLayout(t *testing.T)](#TestFuncLayout)
    * [func TestFuncOf(t *testing.T)](#TestFuncOf)
    * [func TestFunctionValue(t *testing.T)](#TestFunctionValue)
    * [func TestGCBits(t *testing.T)](#TestGCBits)
    * [func TestImplements(t *testing.T)](#TestImplements)
    * [func TestImplicitAppendConversion(t *testing.T)](#TestImplicitAppendConversion)
    * [func TestImplicitCallConversion(t *testing.T)](#TestImplicitCallConversion)
    * [func TestImplicitMapConversion(t *testing.T)](#TestImplicitMapConversion)
    * [func TestImplicitSendConversion(t *testing.T)](#TestImplicitSendConversion)
    * [func TestImplicitSetConversion(t *testing.T)](#TestImplicitSetConversion)
    * [func TestImportPath(t *testing.T)](#TestImportPath)
    * [func TestIndex(t *testing.T)](#TestIndex)
    * [func TestInterfaceExtraction(t *testing.T)](#TestInterfaceExtraction)
    * [func TestInterfaceGet(t *testing.T)](#TestInterfaceGet)
    * [func TestInterfaceSet(t *testing.T)](#TestInterfaceSet)
    * [func TestInterfaceValue(t *testing.T)](#TestInterfaceValue)
    * [func TestInvalid(t *testing.T)](#TestInvalid)
    * [func TestIsNil(t *testing.T)](#TestIsNil)
    * [func TestIsZero(t *testing.T)](#TestIsZero)
    * [func TestIssue22031(t *testing.T)](#TestIssue22031)
    * [func TestIssue22073(t *testing.T)](#TestIssue22073)
    * [func TestKeepFuncLive(t *testing.T)](#TestKeepFuncLive)
    * [func TestKeepMethodLive(t *testing.T)](#TestKeepMethodLive)
    * [func TestLargeGCProg(t *testing.T)](#TestLargeGCProg)
    * [func TestMakeFunc(t *testing.T)](#TestMakeFunc)
    * [func TestMakeFuncInterface(t *testing.T)](#TestMakeFuncInterface)
    * [func TestMakeFuncInvalidReturnAssignments(t *testing.T)](#TestMakeFuncInvalidReturnAssignments)
    * [func TestMakeFuncStackCopy(t *testing.T)](#TestMakeFuncStackCopy)
    * [func TestMakeFuncValidReturnAssignments(t *testing.T)](#TestMakeFuncValidReturnAssignments)
    * [func TestMakeFuncVariadic(t *testing.T)](#TestMakeFuncVariadic)
    * [func TestMap(t *testing.T)](#TestMap)
    * [func TestMapAlloc(t *testing.T)](#TestMapAlloc)
    * [func TestMapIterDelete0(t *testing.T)](#TestMapIterDelete0)
    * [func TestMapIterDelete1(t *testing.T)](#TestMapIterDelete1)
    * [func TestMapIterNext(t *testing.T)](#TestMapIterNext)
    * [func TestMapIterNilMap(t *testing.T)](#TestMapIterNilMap)
    * [func TestMapIterNonEmptyMap(t *testing.T)](#TestMapIterNonEmptyMap)
    * [func TestMapIterSafety(t *testing.T)](#TestMapIterSafety)
    * [func TestMapOf(t *testing.T)](#TestMapOf)
    * [func TestMapOfGCKeys(t *testing.T)](#TestMapOfGCKeys)
    * [func TestMapOfGCValues(t *testing.T)](#TestMapOfGCValues)
    * [func TestMapSetNil(t *testing.T)](#TestMapSetNil)
    * [func TestMethod(t *testing.T)](#TestMethod)
    * [func TestMethod5(t *testing.T)](#TestMethod5)
    * [func TestMethodByNameUnExportedFirst(t *testing.T)](#TestMethodByNameUnExportedFirst)
    * [func TestMethodPkgPath(t *testing.T)](#TestMethodPkgPath)
    * [func TestMethodValue(t *testing.T)](#TestMethodValue)
    * [func TestNames(t *testing.T)](#TestNames)
    * [func TestNestedMethods(t *testing.T)](#TestNestedMethods)
    * [func TestNilMap(t *testing.T)](#TestNilMap)
    * [func TestNilPtrValueSub(t *testing.T)](#TestNilPtrValueSub)
    * [func TestNumMethodOnDDD(t *testing.T)](#TestNumMethodOnDDD)
    * [func TestOffsetLock(t *testing.T)](#TestOffsetLock)
    * [func TestOverflow(t *testing.T)](#TestOverflow)
    * [func TestPtrPointTo(t *testing.T)](#TestPtrPointTo)
    * [func TestPtrSetNil(t *testing.T)](#TestPtrSetNil)
    * [func TestPtrTo(t *testing.T)](#TestPtrTo)
    * [func TestPtrToGC(t *testing.T)](#TestPtrToGC)
    * [func TestPtrToMethods(t *testing.T)](#TestPtrToMethods)
    * [func TestReflectFuncTraceback(t *testing.T)](#TestReflectFuncTraceback)
    * [func TestReflectMethodTraceback(t *testing.T)](#TestReflectMethodTraceback)
    * [func TestSelect(t *testing.T)](#TestSelect)
    * [func TestSelectMaxCases(t *testing.T)](#TestSelectMaxCases)
    * [func TestSelectNop(t *testing.T)](#TestSelectNop)
    * [func TestSet(t *testing.T)](#TestSet)
    * [func TestSetBytes(t *testing.T)](#TestSetBytes)
    * [func TestSetLenCap(t *testing.T)](#TestSetLenCap)
    * [func TestSetPanic(t *testing.T)](#TestSetPanic)
    * [func TestSetValue(t *testing.T)](#TestSetValue)
    * [func TestSlice(t *testing.T)](#TestSlice)
    * [func TestSlice3(t *testing.T)](#TestSlice3)
    * [func TestSliceOf(t *testing.T)](#TestSliceOf)
    * [func TestSliceOfGC(t *testing.T)](#TestSliceOfGC)
    * [func TestSliceOverflow(t *testing.T)](#TestSliceOverflow)
    * [func TestSmallNegativeInt(t *testing.T)](#TestSmallNegativeInt)
    * [func TestSmallZero(t *testing.T)](#TestSmallZero)
    * [func TestStructArg(t *testing.T)](#TestStructArg)
    * [func TestStructOf(t *testing.T)](#TestStructOf)
    * [func TestStructOfAlg(t *testing.T)](#TestStructOfAlg)
    * [func TestStructOfDifferentPkgPath(t *testing.T)](#TestStructOfDifferentPkgPath)
    * [func TestStructOfDirectIface(t *testing.T)](#TestStructOfDirectIface)
    * [func TestStructOfExportRules(t *testing.T)](#TestStructOfExportRules)
    * [func TestStructOfFieldName(t *testing.T)](#TestStructOfFieldName)
    * [func TestStructOfGC(t *testing.T)](#TestStructOfGC)
    * [func TestStructOfGenericAlg(t *testing.T)](#TestStructOfGenericAlg)
    * [func TestStructOfTooManyFields(t *testing.T)](#TestStructOfTooManyFields)
    * [func TestStructOfWithInterface(t *testing.T)](#TestStructOfWithInterface)
    * [func TestSwapper(t *testing.T)](#TestSwapper)
    * [func TestTagGet(t *testing.T)](#TestTagGet)
    * [func TestTypeFieldOutOfRangePanic(t *testing.T)](#TestTypeFieldOutOfRangePanic)
    * [func TestTypeOf(t *testing.T)](#TestTypeOf)
    * [func TestTypeOfTypeOf(t *testing.T)](#TestTypeOfTypeOf)
    * [func TestTypeStrings(t *testing.T)](#TestTypeStrings)
    * [func TestTypelinksSorted(t *testing.T)](#TestTypelinksSorted)
    * [func TestTypes(t *testing.T)](#TestTypes)
    * [func TestUnaddressableField(t *testing.T)](#TestUnaddressableField)
    * [func TestUnexported(t *testing.T)](#TestUnexported)
    * [func TestUnexportedMethods(t *testing.T)](#TestUnexportedMethods)
    * [func TestValueString(t *testing.T)](#TestValueString)
    * [func TestValueToString(t *testing.T)](#TestValueToString)
    * [func TestVariadic(t *testing.T)](#TestVariadic)
    * [func TestVariadicMethodValue(t *testing.T)](#TestVariadicMethodValue)
    * [func TestVariadicType(t *testing.T)](#TestVariadicType)
    * [func TestZeroSet(t *testing.T)](#TestZeroSet)
    * [func assert(t *testing.T, s, want string)](#assert)
    * [func check2ndField(x interface{}, offs uintptr, t *testing.T)](#check2ndField)
    * [func checkSameType(t *testing.T, x Type, y interface{})](#checkSameType)
    * [func clobber()](#clobber)
    * [func fieldIndexRecover(t Type, i int) (recovered interface{})](#fieldIndexRecover)
    * [func fmtSelect(info []caseInfo) string](#fmtSelect)
    * [func init()](#init.all_test.go)
    * [func isNonNil(x interface{})](#isNonNil)
    * [func isValid(v Value)](#isValid)
    * [func iterateToString(it *MapIter) string](#iterateToString)
    * [func join(b ...[]byte) []byte](#join)
    * [func lit(x ...byte) []byte](#lit)
    * [func noAlloc(t *testing.T, n int, f func(int))](#noAlloc)
    * [func rep(n int, b []byte) []byte](#rep)
    * [func runSelect(cases []SelectCase, info []caseInfo) (chosen int, recv Value, recvOK bool, panicErr interface{})](#runSelect)
    * [func sameInts(x, y []int) bool](#sameInts)
    * [func selectWatcher()](#selectWatcher)
    * [func shouldPanic(expect string, f func())](#shouldPanic)
    * [func takesEmpty(e emptyStruct)](#takesEmpty)
    * [func takesNonEmpty(n nonEmptyStruct) int](#takesNonEmpty)
    * [func testType(t *testing.T, i int, typ Type, want string)](#testType)
    * [func useStack(n int)](#useStack)
    * [func valueToString(val Value) string](#valueToString)
    * [func verifyGCBits(t *testing.T, typ Type, bits []byte)](#verifyGCBits)
    * [func verifyGCBitsSlice(t *testing.T, typ Type, cap int, bits []byte)](#verifyGCBitsSlice)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="V" href="#V">var V</a>

```
searchKey: reflect_test.V
tags: [variable function private]
```

```Go
var V = ValueOf
```

### <a id="allselect" href="#allselect">var allselect</a>

```
searchKey: reflect_test.allselect
tags: [variable boolean private]
```

```Go
var allselect = flag.Bool("allselect", false, "exhaustive select test")
```

### <a id="appendTests" href="#appendTests">var appendTests</a>

```
searchKey: reflect_test.appendTests
tags: [variable array struct private]
```

```Go
var appendTests = ...
```

### <a id="assignableTests" href="#assignableTests">var assignableTests</a>

```
searchKey: reflect_test.assignableTests
tags: [variable array struct private]
```

```Go
var assignableTests = ...
```

### <a id="comparableTests" href="#comparableTests">var comparableTests</a>

```
searchKey: reflect_test.comparableTests
tags: [variable array struct private]
```

```Go
var comparableTests = ...
```

### <a id="convertTests" href="#convertTests">var convertTests</a>

```
searchKey: reflect_test.convertTests
tags: [variable array struct private]
```

```Go
var convertTests = ...
```

### <a id="cycleMap1" href="#cycleMap1">var cycleMap1</a>

```
searchKey: reflect_test.cycleMap1
tags: [variable object private]
```

```Go
var cycleMap1, cycleMap2, cycleMap3 map[string]interface{}
```

### <a id="cycleMap2" href="#cycleMap2">var cycleMap2</a>

```
searchKey: reflect_test.cycleMap2
tags: [variable object private]
```

```Go
var cycleMap1, cycleMap2, cycleMap3 map[string]interface{}
```

### <a id="cycleMap3" href="#cycleMap3">var cycleMap3</a>

```
searchKey: reflect_test.cycleMap3
tags: [variable object private]
```

```Go
var cycleMap1, cycleMap2, cycleMap3 map[string]interface{}
```

### <a id="deepEqualTests" href="#deepEqualTests">var deepEqualTests</a>

```
searchKey: reflect_test.deepEqualTests
tags: [variable array struct private]
```

```Go
var deepEqualTests = ...
```

### <a id="fieldTests" href="#fieldTests">var fieldTests</a>

```
searchKey: reflect_test.fieldTests
tags: [variable array struct private]
```

```Go
var fieldTests = ...
```

### <a id="fieldsTests" href="#fieldsTests">var fieldsTests</a>

```
searchKey: reflect_test.fieldsTests
tags: [variable array struct private]
```

```Go
var fieldsTests = ...
```

### <a id="fn1" href="#fn1">var fn1</a>

```
searchKey: reflect_test.fn1
tags: [variable function private]
```

```Go
var fn1 func() // nil.

```

Simple functions for DeepEqual tests. 

### <a id="fn2" href="#fn2">var fn2</a>

```
searchKey: reflect_test.fn2
tags: [variable function private]
```

```Go
var fn2 func() // nil.

```

Simple functions for DeepEqual tests. 

### <a id="fn3" href="#fn3">var fn3</a>

```
searchKey: reflect_test.fn3
tags: [variable function private]
```

```Go
var fn3 = func() { fn1() } // Not nil.

```

Simple functions for DeepEqual tests. 

### <a id="gFloat32" href="#gFloat32">var gFloat32</a>

```
searchKey: reflect_test.gFloat32
tags: [variable number private]
```

```Go
var gFloat32 float32
```

### <a id="implementsTests" href="#implementsTests">var implementsTests</a>

```
searchKey: reflect_test.implementsTests
tags: [variable array struct private]
```

```Go
var implementsTests = ...
```

### <a id="loop1" href="#loop1">var loop1</a>

```
searchKey: reflect_test.loop1
tags: [variable private]
```

```Go
var loop1, loop2 Loop
```

### <a id="loop2" href="#loop2">var loop2</a>

```
searchKey: reflect_test.loop2
tags: [variable private]
```

```Go
var loop1, loop2 Loop
```

### <a id="loopy1" href="#loopy1">var loopy1</a>

```
searchKey: reflect_test.loopy1
tags: [variable interface private]
```

```Go
var loopy1, loopy2 Loopy
```

### <a id="loopy2" href="#loopy2">var loopy2</a>

```
searchKey: reflect_test.loopy2
tags: [variable interface private]
```

```Go
var loopy1, loopy2 Loopy
```

### <a id="nameTests" href="#nameTests">var nameTests</a>

```
searchKey: reflect_test.nameTests
tags: [variable array struct private]
```

```Go
var nameTests = ...
```

### <a id="selectWatch" href="#selectWatch">var selectWatch</a>

```
searchKey: reflect_test.selectWatch
tags: [variable struct private]
```

```Go
var selectWatch struct {
	sync.Mutex
	once sync.Once
	now  time.Time
	info []caseInfo
}
```

selectWatch and the selectWatcher are a watchdog mechanism for running Select. If the selectWatcher notices that the select has been blocked for >1 second, it prints an error describing the select and panics the entire test binary. 

### <a id="sink" href="#sink">var sink</a>

```
searchKey: reflect_test.sink
tags: [variable interface private]
```

```Go
var sink interface{}
```

### <a id="tagGetTests" href="#tagGetTests">var tagGetTests</a>

```
searchKey: reflect_test.tagGetTests
tags: [variable array struct private]
```

```Go
var tagGetTests = ...
```

### <a id="typeTests" href="#typeTests">var typeTests</a>

```
searchKey: reflect_test.typeTests
tags: [variable array struct private]
```

```Go
var typeTests = ...
```

### <a id="unexpi" href="#unexpi">var unexpi</a>

```
searchKey: reflect_test.unexpi
tags: [variable interface private]
```

```Go
var unexpi unexpI = new(unexp)
```

### <a id="valueTests" href="#valueTests">var valueTests</a>

```
searchKey: reflect_test.valueTests
tags: [variable array struct private]
```

```Go
var valueTests = ...
```

### <a id="valueToStringTests" href="#valueToStringTests">var valueToStringTests</a>

```
searchKey: reflect_test.valueToStringTests
tags: [variable array struct private]
```

```Go
var valueToStringTests = ...
```

### <a id="_i" href="#_i">var _i</a>

```
searchKey: reflect_test._i
tags: [variable number private]
```

```Go
var _i = 7
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="B1" href="#B1">type B1 struct</a>

```
searchKey: reflect_test.B1
tags: [struct private]
```

```Go
type B1 struct {
	X int
	Y int
	Z int
}
```

### <a id="Basic" href="#Basic">type Basic struct</a>

```
searchKey: reflect_test.Basic
tags: [struct private]
```

```Go
type Basic struct {
	x int
	y float32
}
```

### <a id="BytesChan" href="#BytesChan">type BytesChan chan []byte</a>

```
searchKey: reflect_test.BytesChan
tags: [private]
```

```Go
type BytesChan chan []byte
```

### <a id="BytesChanRecv" href="#BytesChanRecv">type BytesChanRecv <-chan []byte</a>

```
searchKey: reflect_test.BytesChanRecv
tags: [private]
```

```Go
type BytesChanRecv <-chan []byte
```

### <a id="BytesChanSend" href="#BytesChanSend">type BytesChanSend chan<- []byte</a>

```
searchKey: reflect_test.BytesChanSend
tags: [private]
```

```Go
type BytesChanSend chan<- []byte
```

### <a id="Ch" href="#Ch">type Ch <-chan interface{}</a>

```
searchKey: reflect_test.Ch
tags: [private]
```

```Go
type Ch <-chan interface{}
```

### <a id="ComparableStruct" href="#ComparableStruct">type ComparableStruct struct</a>

```
searchKey: reflect_test.ComparableStruct
tags: [struct private]
```

```Go
type ComparableStruct struct {
	X int
}
```

### <a id="D1" href="#D1">type D1 struct</a>

```
searchKey: reflect_test.D1
tags: [struct private]
```

```Go
type D1 struct {
	d int
}
```

### <a id="D2" href="#D2">type D2 struct</a>

```
searchKey: reflect_test.D2
tags: [struct private]
```

```Go
type D2 struct {
	d int
}
```

### <a id="DeepEqualTest" href="#DeepEqualTest">type DeepEqualTest struct</a>

```
searchKey: reflect_test.DeepEqualTest
tags: [struct private]
```

```Go
type DeepEqualTest struct {
	a, b interface{}
	eq   bool
}
```

### <a id="DirectIfaceT" href="#DirectIfaceT">type DirectIfaceT struct</a>

```
searchKey: reflect_test.DirectIfaceT
tags: [struct private]
```

```Go
type DirectIfaceT struct {
	p *int
}
```

#### <a id="DirectIfaceT.M" href="#DirectIfaceT.M">func (d DirectIfaceT) M() int</a>

```
searchKey: reflect_test.DirectIfaceT.M
tags: [function private]
```

```Go
func (d DirectIfaceT) M() int
```

### <a id="Empty" href="#Empty">type Empty struct{}</a>

```
searchKey: reflect_test.Empty
tags: [struct private]
```

```Go
type Empty struct{}
```

### <a id="FTest" href="#FTest">type FTest struct</a>

```
searchKey: reflect_test.FTest
tags: [struct private]
```

```Go
type FTest struct {
	s     interface{}
	name  string
	index []int
	value int
}
```

### <a id="FuncDDD" href="#FuncDDD">type FuncDDD func(...interface{}) error</a>

```
searchKey: reflect_test.FuncDDD
tags: [function private]
```

```Go
type FuncDDD func(...interface{}) error
```

#### <a id="FuncDDD.M" href="#FuncDDD.M">func (f FuncDDD) M()</a>

```
searchKey: reflect_test.FuncDDD.M
tags: [function private]
```

```Go
func (f FuncDDD) M()
```

### <a id="Impl" href="#Impl">type Impl struct{}</a>

```
searchKey: reflect_test.Impl
tags: [struct private]
```

```Go
type Impl struct{}
```

#### <a id="Impl.F" href="#Impl.F">func (Impl) F()</a>

```
searchKey: reflect_test.Impl.F
tags: [function private]
```

```Go
func (Impl) F()
```

### <a id="Inner" href="#Inner">type Inner struct</a>

```
searchKey: reflect_test.Inner
tags: [struct private]
```

```Go
type Inner struct {
	X  *Outer
	P1 uintptr
	P2 uintptr
}
```

#### <a id="Inner.M" href="#Inner.M">func (pi *Inner) M()</a>

```
searchKey: reflect_test.Inner.M
tags: [function private]
```

```Go
func (pi *Inner) M()
```

### <a id="InnerInt" href="#InnerInt">type InnerInt struct</a>

```
searchKey: reflect_test.InnerInt
tags: [struct private]
```

```Go
type InnerInt struct {
	X int
}
```

#### <a id="InnerInt.M" href="#InnerInt.M">func (i *InnerInt) M() int</a>

```
searchKey: reflect_test.InnerInt.M
tags: [function private]
```

```Go
func (i *InnerInt) M() int
```

### <a id="IntChan" href="#IntChan">type IntChan chan int</a>

```
searchKey: reflect_test.IntChan
tags: [private]
```

```Go
type IntChan chan int
```

### <a id="IntChanRecv" href="#IntChanRecv">type IntChanRecv <-chan int</a>

```
searchKey: reflect_test.IntChanRecv
tags: [private]
```

```Go
type IntChanRecv <-chan int
```

### <a id="IntChanSend" href="#IntChanSend">type IntChanSend chan<- int</a>

```
searchKey: reflect_test.IntChanSend
tags: [private]
```

```Go
type IntChanSend chan<- int
```

### <a id="IntPtr" href="#IntPtr">type IntPtr *int</a>

```
searchKey: reflect_test.IntPtr
tags: [number private]
```

```Go
type IntPtr *int
```

### <a id="IntPtr1" href="#IntPtr1">type IntPtr1 *int</a>

```
searchKey: reflect_test.IntPtr1
tags: [number private]
```

```Go
type IntPtr1 *int
```

### <a id="KeepMethodLive" href="#KeepMethodLive">type KeepMethodLive struct{}</a>

```
searchKey: reflect_test.KeepMethodLive
tags: [struct private]
```

```Go
type KeepMethodLive struct{}
```

Issue 18635 (method version). 

#### <a id="KeepMethodLive.Method1" href="#KeepMethodLive.Method1">func (k KeepMethodLive) Method1(i int)</a>

```
searchKey: reflect_test.KeepMethodLive.Method1
tags: [method private]
```

```Go
func (k KeepMethodLive) Method1(i int)
```

#### <a id="KeepMethodLive.Method2" href="#KeepMethodLive.Method2">func (k KeepMethodLive) Method2(i int)</a>

```
searchKey: reflect_test.KeepMethodLive.Method2
tags: [method private]
```

```Go
func (k KeepMethodLive) Method2(i int)
```

### <a id="Loop" href="#Loop">type Loop *reflect_test.Loop</a>

```
searchKey: reflect_test.Loop
tags: [private]
```

```Go
type Loop *Loop
```

### <a id="Loopy" href="#Loopy">type Loopy interface{}</a>

```
searchKey: reflect_test.Loopy
tags: [interface private]
```

```Go
type Loopy interface{}
```

### <a id="M" href="#M">type M map[string]interface{}</a>

```
searchKey: reflect_test.M
tags: [object private]
```

```Go
type M map[string]interface{}
```

### <a id="MyByte" href="#MyByte">type MyByte byte</a>

```
searchKey: reflect_test.MyByte
tags: [number private]
```

```Go
type MyByte byte
```

### <a id="MyBytes" href="#MyBytes">type MyBytes []byte</a>

```
searchKey: reflect_test.MyBytes
tags: [array number private]
```

```Go
type MyBytes []byte
```

### <a id="MyBytesArray" href="#MyBytesArray">type MyBytesArray [4]byte</a>

```
searchKey: reflect_test.MyBytesArray
tags: [array number private]
```

```Go
type MyBytesArray [4]byte
```

### <a id="MyBytesArray0" href="#MyBytesArray0">type MyBytesArray0 [0]byte</a>

```
searchKey: reflect_test.MyBytesArray0
tags: [array number private]
```

```Go
type MyBytesArray0 [0]byte
```

### <a id="MyBytesArrayPtr" href="#MyBytesArrayPtr">type MyBytesArrayPtr *[4]byte</a>

```
searchKey: reflect_test.MyBytesArrayPtr
tags: [array number private]
```

```Go
type MyBytesArrayPtr *[4]byte
```

### <a id="MyBytesArrayPtr0" href="#MyBytesArrayPtr0">type MyBytesArrayPtr0 *[0]byte</a>

```
searchKey: reflect_test.MyBytesArrayPtr0
tags: [array number private]
```

```Go
type MyBytesArrayPtr0 *[0]byte
```

### <a id="MyFunc" href="#MyFunc">type MyFunc func()</a>

```
searchKey: reflect_test.MyFunc
tags: [function private]
```

```Go
type MyFunc func()
```

### <a id="MyRunes" href="#MyRunes">type MyRunes []int32</a>

```
searchKey: reflect_test.MyRunes
tags: [array number private]
```

```Go
type MyRunes []int32
```

### <a id="MyString" href="#MyString">type MyString string</a>

```
searchKey: reflect_test.MyString
tags: [string private]
```

```Go
type MyString string
```

### <a id="MyStruct" href="#MyStruct">type MyStruct struct</a>

```
searchKey: reflect_test.MyStruct
tags: [struct private]
```

```Go
type MyStruct struct {
	x int `some:"tag"`
}
```

### <a id="MyStruct1" href="#MyStruct1">type MyStruct1 struct</a>

```
searchKey: reflect_test.MyStruct1
tags: [struct private]
```

```Go
type MyStruct1 struct {
	x struct {
		int `some:"bar"`
	}
}
```

### <a id="MyStruct2" href="#MyStruct2">type MyStruct2 struct</a>

```
searchKey: reflect_test.MyStruct2
tags: [struct private]
```

```Go
type MyStruct2 struct {
	x struct {
		int `some:"foo"`
	}
}
```

### <a id="NonComparableStruct" href="#NonComparableStruct">type NonComparableStruct struct</a>

```
searchKey: reflect_test.NonComparableStruct
tags: [struct private]
```

```Go
type NonComparableStruct struct {
	X int
	Y map[string]int
}
```

### <a id="NonExportedFirst" href="#NonExportedFirst">type NonExportedFirst int</a>

```
searchKey: reflect_test.NonExportedFirst
tags: [number private]
```

```Go
type NonExportedFirst int
```

#### <a id="NonExportedFirst.ΦExported" href="#NonExportedFirst.ΦExported">func (i NonExportedFirst) ΦExported()</a>

```
searchKey: reflect_test.NonExportedFirst.ΦExported
tags: [function private]
```

```Go
func (i NonExportedFirst) ΦExported()
```

#### <a id="NonExportedFirst.nonexported" href="#NonExportedFirst.nonexported">func (i NonExportedFirst) nonexported() int</a>

```
searchKey: reflect_test.NonExportedFirst.nonexported
tags: [function private]
```

```Go
func (i NonExportedFirst) nonexported() int
```

### <a id="NotBasic" href="#NotBasic">type NotBasic reflect_test.Basic</a>

```
searchKey: reflect_test.NotBasic
tags: [struct private]
```

```Go
type NotBasic Basic
```

### <a id="Outer" href="#Outer">type Outer struct</a>

```
searchKey: reflect_test.Outer
tags: [struct private]
```

```Go
type Outer struct {
	*Inner
	R io.Reader
}
```

### <a id="OuterInt" href="#OuterInt">type OuterInt struct</a>

```
searchKey: reflect_test.OuterInt
tags: [struct private]
```

```Go
type OuterInt struct {
	Y int
	InnerInt
}
```

### <a id="Point" href="#Point">type Point struct</a>

```
searchKey: reflect_test.Point
tags: [struct private]
```

```Go
type Point struct {
	x, y int
}
```

#### <a id="Point.AnotherMethod" href="#Point.AnotherMethod">func (p Point) AnotherMethod(scale int) int</a>

```
searchKey: reflect_test.Point.AnotherMethod
tags: [method private]
```

```Go
func (p Point) AnotherMethod(scale int) int
```

This will be index 0. 

#### <a id="Point.Dist" href="#Point.Dist">func (p Point) Dist(scale int) int</a>

```
searchKey: reflect_test.Point.Dist
tags: [method private]
```

```Go
func (p Point) Dist(scale int) int
```

This will be index 1. 

#### <a id="Point.GCMethod" href="#Point.GCMethod">func (p Point) GCMethod(k int) int</a>

```
searchKey: reflect_test.Point.GCMethod
tags: [method private]
```

```Go
func (p Point) GCMethod(k int) int
```

This will be index 2. 

#### <a id="Point.Int32Method" href="#Point.Int32Method">func (p *Point) Int32Method(x int32) int32</a>

```
searchKey: reflect_test.Point.Int32Method
tags: [method private]
```

```Go
func (p *Point) Int32Method(x int32) int32
```

This will be index 6. 

#### <a id="Point.Int64Method" href="#Point.Int64Method">func (p *Point) Int64Method(x int64) int64</a>

```
searchKey: reflect_test.Point.Int64Method
tags: [method private]
```

```Go
func (p *Point) Int64Method(x int64) int64
```

This will be index 5. 

#### <a id="Point.NoArgs" href="#Point.NoArgs">func (p Point) NoArgs()</a>

```
searchKey: reflect_test.Point.NoArgs
tags: [function private]
```

```Go
func (p Point) NoArgs()
```

This will be index 3. 

#### <a id="Point.TotalDist" href="#Point.TotalDist">func (p Point) TotalDist(points ...Point) int</a>

```
searchKey: reflect_test.Point.TotalDist
tags: [method private]
```

```Go
func (p Point) TotalDist(points ...Point) int
```

This will be index 4. 

### <a id="Private" href="#Private">type Private struct</a>

```
searchKey: reflect_test.Private
tags: [struct private]
```

```Go
type Private struct {
	x int
	y **int
	Z int
}
```

#### <a id="Private.m" href="#Private.m">func (p *Private) m()</a>

```
searchKey: reflect_test.Private.m
tags: [function private]
```

```Go
func (p *Private) m()
```

### <a id="Public" href="#Public">type Public struct</a>

```
searchKey: reflect_test.Public
tags: [struct private]
```

```Go
type Public struct {
	X int
	Y **int
	private
}
```

#### <a id="Public.M" href="#Public.M">func (p *Public) M()</a>

```
searchKey: reflect_test.Public.M
tags: [function private]
```

```Go
func (p *Public) M()
```

### <a id="R0" href="#R0">type R0 struct</a>

```
searchKey: reflect_test.R0
tags: [struct private]
```

```Go
type R0 struct {
	*R1
	*R2
	*R3
	*R4
}
```

### <a id="R1" href="#R1">type R1 struct</a>

```
searchKey: reflect_test.R1
tags: [struct private]
```

```Go
type R1 struct {
	*R5
	*R6
	*R7
	*R8
}
```

### <a id="R10" href="#R10">type R10 reflect_test.R9</a>

```
searchKey: reflect_test.R10
tags: [struct private]
```

```Go
type R10 R9
```

### <a id="R11" href="#R11">type R11 reflect_test.R9</a>

```
searchKey: reflect_test.R11
tags: [struct private]
```

```Go
type R11 R9
```

### <a id="R12" href="#R12">type R12 reflect_test.R9</a>

```
searchKey: reflect_test.R12
tags: [struct private]
```

```Go
type R12 R9
```

### <a id="R13" href="#R13">type R13 struct</a>

```
searchKey: reflect_test.R13
tags: [struct private]
```

```Go
type R13 struct {
	*R17
	*R18
	*R19
	*R20
}
```

### <a id="R14" href="#R14">type R14 reflect_test.R13</a>

```
searchKey: reflect_test.R14
tags: [struct private]
```

```Go
type R14 R13
```

### <a id="R15" href="#R15">type R15 reflect_test.R13</a>

```
searchKey: reflect_test.R15
tags: [struct private]
```

```Go
type R15 R13
```

### <a id="R16" href="#R16">type R16 reflect_test.R13</a>

```
searchKey: reflect_test.R16
tags: [struct private]
```

```Go
type R16 R13
```

### <a id="R17" href="#R17">type R17 struct</a>

```
searchKey: reflect_test.R17
tags: [struct private]
```

```Go
type R17 struct {
	*R21
	*R22
	*R23
	*R24
}
```

### <a id="R18" href="#R18">type R18 reflect_test.R17</a>

```
searchKey: reflect_test.R18
tags: [struct private]
```

```Go
type R18 R17
```

### <a id="R19" href="#R19">type R19 reflect_test.R17</a>

```
searchKey: reflect_test.R19
tags: [struct private]
```

```Go
type R19 R17
```

### <a id="R2" href="#R2">type R2 reflect_test.R1</a>

```
searchKey: reflect_test.R2
tags: [struct private]
```

```Go
type R2 R1
```

### <a id="R20" href="#R20">type R20 reflect_test.R17</a>

```
searchKey: reflect_test.R20
tags: [struct private]
```

```Go
type R20 R17
```

### <a id="R21" href="#R21">type R21 struct</a>

```
searchKey: reflect_test.R21
tags: [struct private]
```

```Go
type R21 struct {
	X int
}
```

### <a id="R22" href="#R22">type R22 reflect_test.R21</a>

```
searchKey: reflect_test.R22
tags: [struct private]
```

```Go
type R22 R21
```

### <a id="R23" href="#R23">type R23 reflect_test.R21</a>

```
searchKey: reflect_test.R23
tags: [struct private]
```

```Go
type R23 R21
```

### <a id="R24" href="#R24">type R24 reflect_test.R21</a>

```
searchKey: reflect_test.R24
tags: [struct private]
```

```Go
type R24 R21
```

### <a id="R3" href="#R3">type R3 reflect_test.R1</a>

```
searchKey: reflect_test.R3
tags: [struct private]
```

```Go
type R3 R1
```

### <a id="R4" href="#R4">type R4 reflect_test.R1</a>

```
searchKey: reflect_test.R4
tags: [struct private]
```

```Go
type R4 R1
```

### <a id="R5" href="#R5">type R5 struct</a>

```
searchKey: reflect_test.R5
tags: [struct private]
```

```Go
type R5 struct {
	*R9
	*R10
	*R11
	*R12
}
```

### <a id="R6" href="#R6">type R6 reflect_test.R5</a>

```
searchKey: reflect_test.R6
tags: [struct private]
```

```Go
type R6 R5
```

### <a id="R7" href="#R7">type R7 reflect_test.R5</a>

```
searchKey: reflect_test.R7
tags: [struct private]
```

```Go
type R7 R5
```

### <a id="R8" href="#R8">type R8 reflect_test.R5</a>

```
searchKey: reflect_test.R8
tags: [struct private]
```

```Go
type R8 R5
```

### <a id="R9" href="#R9">type R9 struct</a>

```
searchKey: reflect_test.R9
tags: [struct private]
```

```Go
type R9 struct {
	*R13
	*R14
	*R15
	*R16
}
```

### <a id="RS1" href="#RS1">type RS1 struct</a>

```
searchKey: reflect_test.RS1
tags: [struct private]
```

```Go
type RS1 struct {
	i int
}
```

### <a id="RS2" href="#RS2">type RS2 struct</a>

```
searchKey: reflect_test.RS2
tags: [struct private]
```

```Go
type RS2 struct {
	RS1
}
```

### <a id="RS3" href="#RS3">type RS3 struct</a>

```
searchKey: reflect_test.RS3
tags: [struct private]
```

```Go
type RS3 struct {
	RS2
	RS1
}
```

### <a id="Rec1" href="#Rec1">type Rec1 struct</a>

```
searchKey: reflect_test.Rec1
tags: [struct private]
```

```Go
type Rec1 struct {
	*Rec2
}
```

### <a id="Rec2" href="#Rec2">type Rec2 struct</a>

```
searchKey: reflect_test.Rec2
tags: [struct private]
```

```Go
type Rec2 struct {
	F string
	*Rec1
}
```

### <a id="Recursive" href="#Recursive">type Recursive struct</a>

```
searchKey: reflect_test.Recursive
tags: [struct private]
```

```Go
type Recursive struct {
	x int
	r *Recursive
}
```

### <a id="S" href="#S">type S struct</a>

```
searchKey: reflect_test.S
tags: [struct private]
```

```Go
type S struct {
	i1 int64
	i2 int64
}
```

### <a id="S0" href="#S0">type S0 struct</a>

```
searchKey: reflect_test.S0
tags: [struct private]
```

```Go
type S0 struct {
	A, B, C int
	D1
	D2
}
```

### <a id="S1" href="#S1">type S1 struct</a>

```
searchKey: reflect_test.S1
tags: [struct private]
```

```Go
type S1 struct {
	B int
	S0
}
```

### <a id="S10" href="#S10">type S10 struct</a>

```
searchKey: reflect_test.S10
tags: [struct private]
```

```Go
type S10 struct {
	S11
	S12
	S13
}
```

The X in S11.S6 and S12.S6 annihilate, but they also block the X in S13.S8.S9. 

### <a id="S11" href="#S11">type S11 struct</a>

```
searchKey: reflect_test.S11
tags: [struct private]
```

```Go
type S11 struct {
	S6
}
```

### <a id="S12" href="#S12">type S12 struct</a>

```
searchKey: reflect_test.S12
tags: [struct private]
```

```Go
type S12 struct {
	S6
}
```

### <a id="S13" href="#S13">type S13 struct</a>

```
searchKey: reflect_test.S13
tags: [struct private]
```

```Go
type S13 struct {
	S8
}
```

### <a id="S14" href="#S14">type S14 struct</a>

```
searchKey: reflect_test.S14
tags: [struct private]
```

```Go
type S14 struct {
	S15
	S16
}
```

The X in S15.S11.S1 and S16.S11.S1 annihilate. 

### <a id="S15" href="#S15">type S15 struct</a>

```
searchKey: reflect_test.S15
tags: [struct private]
```

```Go
type S15 struct {
	S11
}
```

### <a id="S16" href="#S16">type S16 struct</a>

```
searchKey: reflect_test.S16
tags: [struct private]
```

```Go
type S16 struct {
	S11
}
```

### <a id="S1x" href="#S1x">type S1x struct</a>

```
searchKey: reflect_test.S1x
tags: [struct private]
```

```Go
type S1x struct {
	S1
}
```

### <a id="S1y" href="#S1y">type S1y struct</a>

```
searchKey: reflect_test.S1y
tags: [struct private]
```

```Go
type S1y struct {
	S1
}
```

### <a id="S2" href="#S2">type S2 struct</a>

```
searchKey: reflect_test.S2
tags: [struct private]
```

```Go
type S2 struct {
	A int
	*S1
}
```

### <a id="S3" href="#S3">type S3 struct</a>

```
searchKey: reflect_test.S3
tags: [struct private]
```

```Go
type S3 struct {
	S1x
	S2
	D, E int
	*S1y
}
```

### <a id="S4" href="#S4">type S4 struct</a>

```
searchKey: reflect_test.S4
tags: [struct private]
```

```Go
type S4 struct {
	*S4
	A int
}
```

### <a id="S5" href="#S5">type S5 struct</a>

```
searchKey: reflect_test.S5
tags: [struct private]
```

```Go
type S5 struct {
	S6
	S7
	S8
}
```

The X in S6 and S7 annihilate, but they also block the X in S8.S9. 

### <a id="S6" href="#S6">type S6 struct</a>

```
searchKey: reflect_test.S6
tags: [struct private]
```

```Go
type S6 struct {
	X int
}
```

### <a id="S7" href="#S7">type S7 reflect_test.S6</a>

```
searchKey: reflect_test.S7
tags: [struct private]
```

```Go
type S7 S6
```

### <a id="S8" href="#S8">type S8 struct</a>

```
searchKey: reflect_test.S8
tags: [struct private]
```

```Go
type S8 struct {
	S9
}
```

### <a id="S9" href="#S9">type S9 struct</a>

```
searchKey: reflect_test.S9
tags: [struct private]
```

```Go
type S9 struct {
	X int
	Y int
}
```

### <a id="SF" href="#SF">type SF struct</a>

```
searchKey: reflect_test.SF
tags: [struct private]
```

```Go
type SF struct {
	F int
}
```

### <a id="SF1" href="#SF1">type SF1 struct</a>

```
searchKey: reflect_test.SF1
tags: [struct private]
```

```Go
type SF1 struct {
	SF
}
```

### <a id="SF2" href="#SF2">type SF2 struct</a>

```
searchKey: reflect_test.SF2
tags: [struct private]
```

```Go
type SF2 struct {
	SF1
}
```

### <a id="SFG" href="#SFG">type SFG struct</a>

```
searchKey: reflect_test.SFG
tags: [struct private]
```

```Go
type SFG struct {
	F int
	G int
}
```

### <a id="SFG1" href="#SFG1">type SFG1 struct</a>

```
searchKey: reflect_test.SFG1
tags: [struct private]
```

```Go
type SFG1 struct {
	SFG
}
```

### <a id="SFG2" href="#SFG2">type SFG2 struct</a>

```
searchKey: reflect_test.SFG2
tags: [struct private]
```

```Go
type SFG2 struct {
	SFG1
}
```

### <a id="SFGH" href="#SFGH">type SFGH struct</a>

```
searchKey: reflect_test.SFGH
tags: [struct private]
```

```Go
type SFGH struct {
	F int
	G int
	H int
}
```

### <a id="SFGH1" href="#SFGH1">type SFGH1 struct</a>

```
searchKey: reflect_test.SFGH1
tags: [struct private]
```

```Go
type SFGH1 struct {
	SFGH
}
```

### <a id="SFGH2" href="#SFGH2">type SFGH2 struct</a>

```
searchKey: reflect_test.SFGH2
tags: [struct private]
```

```Go
type SFGH2 struct {
	SFGH1
}
```

### <a id="SFGH3" href="#SFGH3">type SFGH3 struct</a>

```
searchKey: reflect_test.SFGH3
tags: [struct private]
```

```Go
type SFGH3 struct {
	SFGH2
}
```

### <a id="SG" href="#SG">type SG struct</a>

```
searchKey: reflect_test.SG
tags: [struct private]
```

```Go
type SG struct {
	G int
}
```

### <a id="SG1" href="#SG1">type SG1 struct</a>

```
searchKey: reflect_test.SG1
tags: [struct private]
```

```Go
type SG1 struct {
	SG
}
```

### <a id="SettablePointer" href="#SettablePointer">type SettablePointer struct</a>

```
searchKey: reflect_test.SettablePointer
tags: [struct private]
```

```Go
type SettablePointer struct {
	SettableField *int
}
```

#### <a id="SettablePointer.Set" href="#SettablePointer.Set">func (p *SettablePointer) Set(v int)</a>

```
searchKey: reflect_test.SettablePointer.Set
tags: [method private]
```

```Go
func (p *SettablePointer) Set(v int)
```

### <a id="SettableStruct" href="#SettableStruct">type SettableStruct struct</a>

```
searchKey: reflect_test.SettableStruct
tags: [struct private]
```

```Go
type SettableStruct struct {
	SettableField int
}
```

#### <a id="SettableStruct.Set" href="#SettableStruct.Set">func (p *SettableStruct) Set(v int)</a>

```
searchKey: reflect_test.SettableStruct.Set
tags: [method private]
```

```Go
func (p *SettableStruct) Set(v int)
```

### <a id="StructI" href="#StructI">type StructI int</a>

```
searchKey: reflect_test.StructI
tags: [number private]
```

```Go
type StructI int
```

#### <a id="StructI.Get" href="#StructI.Get">func (i StructI) Get() int</a>

```
searchKey: reflect_test.StructI.Get
tags: [function private]
```

```Go
func (i StructI) Get() int
```

### <a id="StructIPtr" href="#StructIPtr">type StructIPtr int</a>

```
searchKey: reflect_test.StructIPtr
tags: [number private]
```

```Go
type StructIPtr int
```

#### <a id="StructIPtr.Get" href="#StructIPtr.Get">func (i *StructIPtr) Get() int</a>

```
searchKey: reflect_test.StructIPtr.Get
tags: [function private]
```

```Go
func (i *StructIPtr) Get() int
```

#### <a id="StructIPtr.Set" href="#StructIPtr.Set">func (i *StructIPtr) Set(v int)</a>

```
searchKey: reflect_test.StructIPtr.Set
tags: [method private]
```

```Go
func (i *StructIPtr) Set(v int)
```

### <a id="T" href="#T">type T struct</a>

```
searchKey: reflect_test.T
tags: [struct private]
```

```Go
type T struct {
	a int
	b float64
	c string
	d *int
}
```

### <a id="T1" href="#T1">type T1 struct</a>

```
searchKey: reflect_test.T1
tags: [struct private]
```

```Go
type T1 struct {
	a string
	int
}
```

### <a id="Talias1" href="#Talias1">type Talias1 struct</a>

```
searchKey: reflect_test.Talias1
tags: [struct private]
```

```Go
type Talias1 struct {
	byte
	uint8
	int
	int32
	rune
}
```

### <a id="Talias2" href="#Talias2">type Talias2 struct</a>

```
searchKey: reflect_test.Talias2
tags: [struct private]
```

```Go
type Talias2 struct {
	Tint
	Tint2
}
```

### <a id="Tbigp" href="#Tbigp">type Tbigp [2]uintptr</a>

```
searchKey: reflect_test.Tbigp
tags: [array number private]
```

```Go
type Tbigp [2]uintptr
```

#### <a id="Tbigp.M" href="#Tbigp.M">func (p *Tbigp) M(x int, b byte) (byte, int)</a>

```
searchKey: reflect_test.Tbigp.M
tags: [method private]
```

```Go
func (p *Tbigp) M(x int, b byte) (byte, int)
```

### <a id="Tbigv" href="#Tbigv">type Tbigv [2]uintptr</a>

```
searchKey: reflect_test.Tbigv
tags: [array number private]
```

```Go
type Tbigv [2]uintptr
```

#### <a id="Tbigv.M" href="#Tbigv.M">func (v Tbigv) M(x int, b byte) (byte, int)</a>

```
searchKey: reflect_test.Tbigv.M
tags: [method private]
```

```Go
func (v Tbigv) M(x int, b byte) (byte, int)
```

### <a id="TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678" href="#TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678">type TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678 int</a>

```
searchKey: reflect_test.TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678
tags: [number private]
```

```Go
type TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678 int
```

### <a id="Tint" href="#Tint">type Tint int</a>

```
searchKey: reflect_test.Tint
tags: [number private]
```

```Go
type Tint int
```

### <a id="Tint2" href="#Tint2">type Tint2 reflect_test.Tint</a>

```
searchKey: reflect_test.Tint2
tags: [number private]
```

```Go
type Tint2 = Tint
```

### <a id="Tinter" href="#Tinter">type Tinter interface</a>

```
searchKey: reflect_test.Tinter
tags: [interface private]
```

```Go
type Tinter interface {
	M(int, byte) (byte, int)
}
```

### <a id="Tm1" href="#Tm1">type Tm1 struct</a>

```
searchKey: reflect_test.Tm1
tags: [struct private]
```

```Go
type Tm1 struct {
	Tm2
}
```

### <a id="Tm2" href="#Tm2">type Tm2 struct</a>

```
searchKey: reflect_test.Tm2
tags: [struct private]
```

```Go
type Tm2 struct {
	*Tm3
}
```

### <a id="Tm3" href="#Tm3">type Tm3 struct</a>

```
searchKey: reflect_test.Tm3
tags: [struct private]
```

```Go
type Tm3 struct {
	*Tm4
}
```

### <a id="Tm4" href="#Tm4">type Tm4 struct{}</a>

```
searchKey: reflect_test.Tm4
tags: [struct private]
```

```Go
type Tm4 struct {
}
```

#### <a id="Tm4.M" href="#Tm4.M">func (t4 Tm4) M(x int, b byte) (byte, int)</a>

```
searchKey: reflect_test.Tm4.M
tags: [method private]
```

```Go
func (t4 Tm4) M(x int, b byte) (byte, int)
```

### <a id="Tsmallp" href="#Tsmallp">type Tsmallp byte</a>

```
searchKey: reflect_test.Tsmallp
tags: [number private]
```

```Go
type Tsmallp byte
```

#### <a id="Tsmallp.M" href="#Tsmallp.M">func (p *Tsmallp) M(x int, b byte) (byte, int)</a>

```
searchKey: reflect_test.Tsmallp.M
tags: [method private]
```

```Go
func (p *Tsmallp) M(x int, b byte) (byte, int)
```

### <a id="Tsmallv" href="#Tsmallv">type Tsmallv byte</a>

```
searchKey: reflect_test.Tsmallv
tags: [number private]
```

```Go
type Tsmallv byte
```

#### <a id="Tsmallv.M" href="#Tsmallv.M">func (v Tsmallv) M(x int, b byte) (byte, int)</a>

```
searchKey: reflect_test.Tsmallv.M
tags: [method private]
```

```Go
func (v Tsmallv) M(x int, b byte) (byte, int)
```

### <a id="Twordp" href="#Twordp">type Twordp uintptr</a>

```
searchKey: reflect_test.Twordp
tags: [number private]
```

```Go
type Twordp uintptr
```

#### <a id="Twordp.M" href="#Twordp.M">func (p *Twordp) M(x int, b byte) (byte, int)</a>

```
searchKey: reflect_test.Twordp.M
tags: [method private]
```

```Go
func (p *Twordp) M(x int, b byte) (byte, int)
```

### <a id="Twordv" href="#Twordv">type Twordv uintptr</a>

```
searchKey: reflect_test.Twordv
tags: [number private]
```

```Go
type Twordv uintptr
```

#### <a id="Twordv.M" href="#Twordv.M">func (v Twordv) M(x int, b byte) (byte, int)</a>

```
searchKey: reflect_test.Twordv.M
tags: [method private]
```

```Go
func (v Twordv) M(x int, b byte) (byte, int)
```

### <a id="UnExportedFirst" href="#UnExportedFirst">type UnExportedFirst int</a>

```
searchKey: reflect_test.UnExportedFirst
tags: [number private]
```

```Go
type UnExportedFirst int
```

#### <a id="UnExportedFirst.ΦExported" href="#UnExportedFirst.ΦExported">func (i UnExportedFirst) ΦExported()</a>

```
searchKey: reflect_test.UnExportedFirst.ΦExported
tags: [function private]
```

```Go
func (i UnExportedFirst) ΦExported()
```

#### <a id="UnExportedFirst.unexported" href="#UnExportedFirst.unexported">func (i UnExportedFirst) unexported()</a>

```
searchKey: reflect_test.UnExportedFirst.unexported
tags: [function private]
```

```Go
func (i UnExportedFirst) unexported()
```

### <a id="UnexpT" href="#UnexpT">type UnexpT struct</a>

```
searchKey: reflect_test.UnexpT
tags: [struct private]
```

```Go
type UnexpT struct {
	m map[int]int
}
```

### <a id="WC" href="#WC">type WC struct{}</a>

```
searchKey: reflect_test.WC
tags: [struct private]
```

```Go
type WC struct {
}
```

Dummy type that implements io.WriteCloser 

#### <a id="WC.Close" href="#WC.Close">func (w *WC) Close() error</a>

```
searchKey: reflect_test.WC.Close
tags: [function private]
```

```Go
func (w *WC) Close() error
```

#### <a id="WC.Write" href="#WC.Write">func (w *WC) Write(p []byte) (n int, err error)</a>

```
searchKey: reflect_test.WC.Write
tags: [method private]
```

```Go
func (w *WC) Write(p []byte) (n int, err error)
```

### <a id="XM" href="#XM">type XM struct</a>

```
searchKey: reflect_test.XM
tags: [struct private]
```

```Go
type XM struct{ _ bool }
```

#### <a id="XM.String" href="#XM.String">func (*XM) String() string</a>

```
searchKey: reflect_test.XM.String
tags: [function private]
```

```Go
func (*XM) String() string
```

### <a id="big" href="#big">type big struct</a>

```
searchKey: reflect_test.big
tags: [struct private]
```

```Go
type big struct {
	a, b, c, d, e int64
}
```

### <a id="caseInfo" href="#caseInfo">type caseInfo struct</a>

```
searchKey: reflect_test.caseInfo
tags: [struct private]
```

```Go
type caseInfo struct {
	desc      string
	canSelect bool
	recv      Value
	closed    bool
	helper    func()
	panic     bool
}
```

caseInfo describes a single case in a select test. 

### <a id="choice" href="#choice">type choice struct</a>

```
searchKey: reflect_test.choice
tags: [struct private]
```

```Go
type choice struct {
	off int
	n   int
	max int
}
```

### <a id="emptyStruct" href="#emptyStruct">type emptyStruct struct{}</a>

```
searchKey: reflect_test.emptyStruct
tags: [struct private]
```

```Go
type emptyStruct struct{}
```

#### <a id="returnEmpty" href="#returnEmpty">func returnEmpty() emptyStruct</a>

```
searchKey: reflect_test.returnEmpty
tags: [function private]
```

```Go
func returnEmpty() emptyStruct
```

### <a id="exhaustive" href="#exhaustive">type exhaustive struct</a>

```
searchKey: reflect_test.exhaustive
tags: [struct private]
```

```Go
type exhaustive struct {
	r    *rand.Rand
	pos  int
	last []choice
}
```

An exhaustive is a mechanism for writing exhaustive or stochastic tests. The basic usage is: 

```
for x.Next() {
	... code using x.Maybe() or x.Choice(n) to create test cases ...
}

```
Each iteration of the loop returns a different set of results, until all possible result sets have been explored. It is okay for different code paths to make different method call sequences on x, but there must be no other source of non-determinism in the call sequences. 

When faced with a new decision, x chooses randomly. Future explorations of that path will choose successive values for the result. Thus, stopping the loop after a fixed number of iterations gives somewhat stochastic testing. 

Example: 

```
for x.Next() {
	v := make([]bool, x.Choose(4))
	for i := range v {
		v[i] = x.Maybe()
	}
	fmt.Println(v)
}

```
prints (in some order): 

```
[]
[false]
[true]
[false false]
[false true]
...
[true true]
[false false false]
...
[true true true]
[false false false false]
...
[true true true true]

```
#### <a id="exhaustive.Choose" href="#exhaustive.Choose">func (x *exhaustive) Choose(max int) int</a>

```
searchKey: reflect_test.exhaustive.Choose
tags: [method private]
```

```Go
func (x *exhaustive) Choose(max int) int
```

#### <a id="exhaustive.Maybe" href="#exhaustive.Maybe">func (x *exhaustive) Maybe() bool</a>

```
searchKey: reflect_test.exhaustive.Maybe
tags: [function private]
```

```Go
func (x *exhaustive) Maybe() bool
```

#### <a id="exhaustive.Next" href="#exhaustive.Next">func (x *exhaustive) Next() bool</a>

```
searchKey: reflect_test.exhaustive.Next
tags: [function private]
```

```Go
func (x *exhaustive) Next() bool
```

### <a id="inner" href="#inner">type inner struct</a>

```
searchKey: reflect_test.inner
tags: [struct private]
```

```Go
type inner struct {
	x int
}
```

#### <a id="inner.M" href="#inner.M">func (*inner) M()</a>

```
searchKey: reflect_test.inner.M
tags: [function private]
```

```Go
func (*inner) M()
```

### <a id="integer" href="#integer">type integer int</a>

```
searchKey: reflect_test.integer
tags: [number private]
```

```Go
type integer int
```

### <a id="myint" href="#myint">type myint int64</a>

```
searchKey: reflect_test.myint
tags: [number private]
```

```Go
type myint int64
```

#### <a id="myint.inc" href="#myint.inc">func (i *myint) inc()</a>

```
searchKey: reflect_test.myint.inc
tags: [function private]
```

```Go
func (i *myint) inc()
```

### <a id="nameTest" href="#nameTest">type nameTest struct</a>

```
searchKey: reflect_test.nameTest
tags: [struct private]
```

```Go
type nameTest struct {
	v    interface{}
	want string
}
```

### <a id="nonEmptyStruct" href="#nonEmptyStruct">type nonEmptyStruct struct</a>

```
searchKey: reflect_test.nonEmptyStruct
tags: [struct private]
```

```Go
type nonEmptyStruct struct {
	member int
}
```

#### <a id="returnNonEmpty" href="#returnNonEmpty">func returnNonEmpty(i int) nonEmptyStruct</a>

```
searchKey: reflect_test.returnNonEmpty
tags: [method private]
```

```Go
func returnNonEmpty(i int) nonEmptyStruct
```

### <a id="notASTExpr" href="#notASTExpr">type notASTExpr interface</a>

```
searchKey: reflect_test.notASTExpr
tags: [interface private]
```

```Go
type notASTExpr interface {
	Pos() token.Pos
	End() token.Pos
	exprNode()
}
```

### <a id="notAnExpr" href="#notAnExpr">type notAnExpr struct{}</a>

```
searchKey: reflect_test.notAnExpr
tags: [struct private]
```

```Go
type notAnExpr struct{}
```

#### <a id="notAnExpr.End" href="#notAnExpr.End">func (notAnExpr) End() token.Pos</a>

```
searchKey: reflect_test.notAnExpr.End
tags: [function private]
```

```Go
func (notAnExpr) End() token.Pos
```

#### <a id="notAnExpr.Pos" href="#notAnExpr.Pos">func (notAnExpr) Pos() token.Pos</a>

```
searchKey: reflect_test.notAnExpr.Pos
tags: [function private]
```

```Go
func (notAnExpr) Pos() token.Pos
```

#### <a id="notAnExpr.exprNode" href="#notAnExpr.exprNode">func (notAnExpr) exprNode()</a>

```
searchKey: reflect_test.notAnExpr.exprNode
tags: [function private]
```

```Go
func (notAnExpr) exprNode()
```

### <a id="outer" href="#outer">type outer struct</a>

```
searchKey: reflect_test.outer
tags: [struct private]
```

```Go
type outer struct {
	y int
	inner
}
```

#### <a id="outer.M" href="#outer.M">func (*outer) M()</a>

```
searchKey: reflect_test.outer.M
tags: [function private]
```

```Go
func (*outer) M()
```

### <a id="pair" href="#pair">type pair struct</a>

```
searchKey: reflect_test.pair
tags: [struct private]
```

```Go
type pair struct {
	i interface{}
	s string
}
```

### <a id="private" href="#private">type private struct</a>

```
searchKey: reflect_test.private
tags: [struct private]
```

```Go
type private struct {
	Z int
	z int
	S string
	A [1]Private
	T []Private
}
```

#### <a id="private.P" href="#private.P">func (p *private) P()</a>

```
searchKey: reflect_test.private.P
tags: [function private]
```

```Go
func (p *private) P()
```

### <a id="sFG" href="#sFG">type sFG struct</a>

```
searchKey: reflect_test.sFG
tags: [struct private]
```

```Go
type sFG struct {
	F int
	G int
}
```

### <a id="self" href="#self">type self struct{}</a>

```
searchKey: reflect_test.self
tags: [struct private]
```

```Go
type self struct{}
```

### <a id="structField" href="#structField">type structField struct</a>

```
searchKey: reflect_test.structField
tags: [struct private]
```

```Go
type structField struct {
	name  string
	index []int
}
```

### <a id="structWithSelfPtr" href="#structWithSelfPtr">type structWithSelfPtr struct</a>

```
searchKey: reflect_test.structWithSelfPtr
tags: [struct private]
```

```Go
type structWithSelfPtr struct {
	p *structWithSelfPtr
	s string
}
```

### <a id="timp" href="#timp">type timp int</a>

```
searchKey: reflect_test.timp
tags: [number private]
```

```Go
type timp int
```

#### <a id="timp.W" href="#timp.W">func (t timp) W()</a>

```
searchKey: reflect_test.timp.W
tags: [function private]
```

```Go
func (t timp) W()
```

#### <a id="timp.Y" href="#timp.Y">func (t timp) Y()</a>

```
searchKey: reflect_test.timp.Y
tags: [function private]
```

```Go
func (t timp) Y()
```

#### <a id="timp.w" href="#timp.w">func (t timp) w()</a>

```
searchKey: reflect_test.timp.w
tags: [function private]
```

```Go
func (t timp) w()
```

#### <a id="timp.y" href="#timp.y">func (t timp) y()</a>

```
searchKey: reflect_test.timp.y
tags: [function private]
```

```Go
func (t timp) y()
```

### <a id="tinter" href="#tinter">type tinter interface</a>

```
searchKey: reflect_test.tinter
tags: [interface private]
```

```Go
type tinter interface {
	m(int, byte) (byte, int)
}
```

### <a id="two" href="#two">type two [2]uintptr</a>

```
searchKey: reflect_test.two
tags: [array number private]
```

```Go
type two [2]uintptr
```

#### <a id="dummy" href="#dummy">func dummy(b byte, c int, d byte, e two, f byte, g float32, h byte) (i byte, j int, k byte, l two, m byte, n float32, o byte)</a>

```
searchKey: reflect_test.dummy
tags: [method private]
```

```Go
func dummy(b byte, c int, d byte, e two, f byte, g float32, h byte) (i byte, j int, k byte, l two, m byte, n float32, o byte)
```

Difficult test for function call because of implicit padding between arguments. 

### <a id="unexp" href="#unexp">type unexp struct{}</a>

```
searchKey: reflect_test.unexp
tags: [struct private]
```

```Go
type unexp struct{}
```

#### <a id="unexp.f" href="#unexp.f">func (*unexp) f() (int32, int8)</a>

```
searchKey: reflect_test.unexp.f
tags: [function private]
```

```Go
func (*unexp) f() (int32, int8)
```

#### <a id="unexp.g" href="#unexp.g">func (*unexp) g() (int64, int8)</a>

```
searchKey: reflect_test.unexp.g
tags: [function private]
```

```Go
func (*unexp) g() (int64, int8)
```

### <a id="unexpI" href="#unexpI">type unexpI interface</a>

```
searchKey: reflect_test.unexpI
tags: [interface private]
```

```Go
type unexpI interface {
	f() (int32, int8)
}
```

### <a id="_Complex" href="#_Complex">type _Complex struct</a>

```
searchKey: reflect_test._Complex
tags: [struct private]
```

```Go
type _Complex struct {
	a int
	b [3]*_Complex
	c *string
	d map[float64]float64
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkCall" href="#BenchmarkCall">func BenchmarkCall(b *testing.B)</a>

```
searchKey: reflect_test.BenchmarkCall
tags: [method private benchmark]
```

```Go
func BenchmarkCall(b *testing.B)
```

### <a id="BenchmarkCallArgCopy" href="#BenchmarkCallArgCopy">func BenchmarkCallArgCopy(b *testing.B)</a>

```
searchKey: reflect_test.BenchmarkCallArgCopy
tags: [method private benchmark]
```

```Go
func BenchmarkCallArgCopy(b *testing.B)
```

### <a id="BenchmarkCallMethod" href="#BenchmarkCallMethod">func BenchmarkCallMethod(b *testing.B)</a>

```
searchKey: reflect_test.BenchmarkCallMethod
tags: [method private benchmark]
```

```Go
func BenchmarkCallMethod(b *testing.B)
```

### <a id="BenchmarkFieldByName1" href="#BenchmarkFieldByName1">func BenchmarkFieldByName1(b *testing.B)</a>

```
searchKey: reflect_test.BenchmarkFieldByName1
tags: [method private benchmark]
```

```Go
func BenchmarkFieldByName1(b *testing.B)
```

### <a id="BenchmarkFieldByName2" href="#BenchmarkFieldByName2">func BenchmarkFieldByName2(b *testing.B)</a>

```
searchKey: reflect_test.BenchmarkFieldByName2
tags: [method private benchmark]
```

```Go
func BenchmarkFieldByName2(b *testing.B)
```

### <a id="BenchmarkFieldByName3" href="#BenchmarkFieldByName3">func BenchmarkFieldByName3(b *testing.B)</a>

```
searchKey: reflect_test.BenchmarkFieldByName3
tags: [method private benchmark]
```

```Go
func BenchmarkFieldByName3(b *testing.B)
```

### <a id="BenchmarkInterfaceBig" href="#BenchmarkInterfaceBig">func BenchmarkInterfaceBig(b *testing.B)</a>

```
searchKey: reflect_test.BenchmarkInterfaceBig
tags: [method private benchmark]
```

```Go
func BenchmarkInterfaceBig(b *testing.B)
```

### <a id="BenchmarkInterfaceSmall" href="#BenchmarkInterfaceSmall">func BenchmarkInterfaceSmall(b *testing.B)</a>

```
searchKey: reflect_test.BenchmarkInterfaceSmall
tags: [method private benchmark]
```

```Go
func BenchmarkInterfaceSmall(b *testing.B)
```

### <a id="BenchmarkNew" href="#BenchmarkNew">func BenchmarkNew(b *testing.B)</a>

```
searchKey: reflect_test.BenchmarkNew
tags: [method private benchmark]
```

```Go
func BenchmarkNew(b *testing.B)
```

### <a id="BenchmarkPtrTo" href="#BenchmarkPtrTo">func BenchmarkPtrTo(b *testing.B)</a>

```
searchKey: reflect_test.BenchmarkPtrTo
tags: [method private benchmark]
```

```Go
func BenchmarkPtrTo(b *testing.B)
```

### <a id="BenchmarkSelect" href="#BenchmarkSelect">func BenchmarkSelect(b *testing.B)</a>

```
searchKey: reflect_test.BenchmarkSelect
tags: [method private benchmark]
```

```Go
func BenchmarkSelect(b *testing.B)
```

### <a id="EmptyInterfaceV" href="#EmptyInterfaceV">func EmptyInterfaceV(x interface{}) Value</a>

```
searchKey: reflect_test.EmptyInterfaceV
tags: [method private]
```

```Go
func EmptyInterfaceV(x interface{}) Value
```

### <a id="ExampleKind" href="#ExampleKind">func ExampleKind()</a>

```
searchKey: reflect_test.ExampleKind
tags: [function private]
```

```Go
func ExampleKind()
```

### <a id="ExampleMakeFunc" href="#ExampleMakeFunc">func ExampleMakeFunc()</a>

```
searchKey: reflect_test.ExampleMakeFunc
tags: [function private]
```

```Go
func ExampleMakeFunc()
```

### <a id="ExampleStructOf" href="#ExampleStructOf">func ExampleStructOf()</a>

```
searchKey: reflect_test.ExampleStructOf
tags: [function private]
```

```Go
func ExampleStructOf()
```

### <a id="ExampleStructTag" href="#ExampleStructTag">func ExampleStructTag()</a>

```
searchKey: reflect_test.ExampleStructTag
tags: [function private]
```

```Go
func ExampleStructTag()
```

### <a id="ExampleStructTag_Lookup" href="#ExampleStructTag_Lookup">func ExampleStructTag_Lookup()</a>

```
searchKey: reflect_test.ExampleStructTag_Lookup
tags: [function private]
```

```Go
func ExampleStructTag_Lookup()
```

### <a id="ExampleTypeOf" href="#ExampleTypeOf">func ExampleTypeOf()</a>

```
searchKey: reflect_test.ExampleTypeOf
tags: [function private]
```

```Go
func ExampleTypeOf()
```

### <a id="GCFunc" href="#GCFunc">func GCFunc(args []Value) []Value</a>

```
searchKey: reflect_test.GCFunc
tags: [method private]
```

```Go
func GCFunc(args []Value) []Value
```

### <a id="Nil" href="#Nil">func Nil(a interface{}, t *testing.T)</a>

```
searchKey: reflect_test.Nil
tags: [method private]
```

```Go
func Nil(a interface{}, t *testing.T)
```

### <a id="NotNil" href="#NotNil">func NotNil(a interface{}, t *testing.T)</a>

```
searchKey: reflect_test.NotNil
tags: [method private]
```

```Go
func NotNil(a interface{}, t *testing.T)
```

### <a id="ReadWriterV" href="#ReadWriterV">func ReadWriterV(x io.ReadWriter) Value</a>

```
searchKey: reflect_test.ReadWriterV
tags: [method private]
```

```Go
func ReadWriterV(x io.ReadWriter) Value
```

### <a id="ReaderV" href="#ReaderV">func ReaderV(x io.Reader) Value</a>

```
searchKey: reflect_test.ReaderV
tags: [method private]
```

```Go
func ReaderV(x io.Reader) Value
```

### <a id="TestAddr" href="#TestAddr">func TestAddr(t *testing.T)</a>

```
searchKey: reflect_test.TestAddr
tags: [method private test]
```

```Go
func TestAddr(t *testing.T)
```

### <a id="TestAlias" href="#TestAlias">func TestAlias(t *testing.T)</a>

```
searchKey: reflect_test.TestAlias
tags: [method private test]
```

```Go
func TestAlias(t *testing.T)
```

### <a id="TestAliasNames" href="#TestAliasNames">func TestAliasNames(t *testing.T)</a>

```
searchKey: reflect_test.TestAliasNames
tags: [method private test]
```

```Go
func TestAliasNames(t *testing.T)
```

### <a id="TestAlignment" href="#TestAlignment">func TestAlignment(t *testing.T)</a>

```
searchKey: reflect_test.TestAlignment
tags: [method private test]
```

```Go
func TestAlignment(t *testing.T)
```

Check that structure alignment & offsets viewed through reflect agree with those from the compiler itself. 

### <a id="TestAll" href="#TestAll">func TestAll(t *testing.T)</a>

```
searchKey: reflect_test.TestAll
tags: [method private test]
```

```Go
func TestAll(t *testing.T)
```

### <a id="TestAllocations" href="#TestAllocations">func TestAllocations(t *testing.T)</a>

```
searchKey: reflect_test.TestAllocations
tags: [method private test]
```

```Go
func TestAllocations(t *testing.T)
```

### <a id="TestAllocsInterfaceBig" href="#TestAllocsInterfaceBig">func TestAllocsInterfaceBig(t *testing.T)</a>

```
searchKey: reflect_test.TestAllocsInterfaceBig
tags: [method private test]
```

```Go
func TestAllocsInterfaceBig(t *testing.T)
```

### <a id="TestAllocsInterfaceSmall" href="#TestAllocsInterfaceSmall">func TestAllocsInterfaceSmall(t *testing.T)</a>

```
searchKey: reflect_test.TestAllocsInterfaceSmall
tags: [method private test]
```

```Go
func TestAllocsInterfaceSmall(t *testing.T)
```

### <a id="TestAnonymousFields" href="#TestAnonymousFields">func TestAnonymousFields(t *testing.T)</a>

```
searchKey: reflect_test.TestAnonymousFields
tags: [method private test]
```

```Go
func TestAnonymousFields(t *testing.T)
```

### <a id="TestAppend" href="#TestAppend">func TestAppend(t *testing.T)</a>

```
searchKey: reflect_test.TestAppend
tags: [method private test]
```

```Go
func TestAppend(t *testing.T)
```

### <a id="TestArrayElemSet" href="#TestArrayElemSet">func TestArrayElemSet(t *testing.T)</a>

```
searchKey: reflect_test.TestArrayElemSet
tags: [method private test]
```

```Go
func TestArrayElemSet(t *testing.T)
```

### <a id="TestArrayOf" href="#TestArrayOf">func TestArrayOf(t *testing.T)</a>

```
searchKey: reflect_test.TestArrayOf
tags: [method private test]
```

```Go
func TestArrayOf(t *testing.T)
```

### <a id="TestArrayOfAlg" href="#TestArrayOfAlg">func TestArrayOfAlg(t *testing.T)</a>

```
searchKey: reflect_test.TestArrayOfAlg
tags: [method private test]
```

```Go
func TestArrayOfAlg(t *testing.T)
```

### <a id="TestArrayOfDirectIface" href="#TestArrayOfDirectIface">func TestArrayOfDirectIface(t *testing.T)</a>

```
searchKey: reflect_test.TestArrayOfDirectIface
tags: [method private test]
```

```Go
func TestArrayOfDirectIface(t *testing.T)
```

### <a id="TestArrayOfGC" href="#TestArrayOfGC">func TestArrayOfGC(t *testing.T)</a>

```
searchKey: reflect_test.TestArrayOfGC
tags: [method private test]
```

```Go
func TestArrayOfGC(t *testing.T)
```

### <a id="TestArrayOfGenericAlg" href="#TestArrayOfGenericAlg">func TestArrayOfGenericAlg(t *testing.T)</a>

```
searchKey: reflect_test.TestArrayOfGenericAlg
tags: [method private test]
```

```Go
func TestArrayOfGenericAlg(t *testing.T)
```

### <a id="TestArrayOfPanicOnNegativeLength" href="#TestArrayOfPanicOnNegativeLength">func TestArrayOfPanicOnNegativeLength(t *testing.T)</a>

```
searchKey: reflect_test.TestArrayOfPanicOnNegativeLength
tags: [method private test]
```

```Go
func TestArrayOfPanicOnNegativeLength(t *testing.T)
```

Ensure passing in negative lengths panics. See [https://golang.org/issue/43603](https://golang.org/issue/43603) 

### <a id="TestAssignableTo" href="#TestAssignableTo">func TestAssignableTo(t *testing.T)</a>

```
searchKey: reflect_test.TestAssignableTo
tags: [method private test]
```

```Go
func TestAssignableTo(t *testing.T)
```

### <a id="TestBigStruct" href="#TestBigStruct">func TestBigStruct(t *testing.T)</a>

```
searchKey: reflect_test.TestBigStruct
tags: [method private test]
```

```Go
func TestBigStruct(t *testing.T)
```

### <a id="TestBigUnnamedStruct" href="#TestBigUnnamedStruct">func TestBigUnnamedStruct(t *testing.T)</a>

```
searchKey: reflect_test.TestBigUnnamedStruct
tags: [method private test]
```

```Go
func TestBigUnnamedStruct(t *testing.T)
```

### <a id="TestBigZero" href="#TestBigZero">func TestBigZero(t *testing.T)</a>

```
searchKey: reflect_test.TestBigZero
tags: [method private test]
```

```Go
func TestBigZero(t *testing.T)
```

### <a id="TestBool" href="#TestBool">func TestBool(t *testing.T)</a>

```
searchKey: reflect_test.TestBool
tags: [method private test]
```

```Go
func TestBool(t *testing.T)
```

### <a id="TestBytes" href="#TestBytes">func TestBytes(t *testing.T)</a>

```
searchKey: reflect_test.TestBytes
tags: [method private test]
```

```Go
func TestBytes(t *testing.T)
```

### <a id="TestCallConvert" href="#TestCallConvert">func TestCallConvert(t *testing.T)</a>

```
searchKey: reflect_test.TestCallConvert
tags: [method private test]
```

```Go
func TestCallConvert(t *testing.T)
```

### <a id="TestCallGC" href="#TestCallGC">func TestCallGC(t *testing.T)</a>

```
searchKey: reflect_test.TestCallGC
tags: [method private test]
```

```Go
func TestCallGC(t *testing.T)
```

Issue 9179. 

### <a id="TestCallMethodJump" href="#TestCallMethodJump">func TestCallMethodJump(t *testing.T)</a>

```
searchKey: reflect_test.TestCallMethodJump
tags: [method private test]
```

```Go
func TestCallMethodJump(t *testing.T)
```

### <a id="TestCallPanic" href="#TestCallPanic">func TestCallPanic(t *testing.T)</a>

```
searchKey: reflect_test.TestCallPanic
tags: [method private test]
```

```Go
func TestCallPanic(t *testing.T)
```

### <a id="TestCallReturnsEmpty" href="#TestCallReturnsEmpty">func TestCallReturnsEmpty(t *testing.T)</a>

```
searchKey: reflect_test.TestCallReturnsEmpty
tags: [method private test]
```

```Go
func TestCallReturnsEmpty(t *testing.T)
```

### <a id="TestCallWithStruct" href="#TestCallWithStruct">func TestCallWithStruct(t *testing.T)</a>

```
searchKey: reflect_test.TestCallWithStruct
tags: [method private test]
```

```Go
func TestCallWithStruct(t *testing.T)
```

### <a id="TestCanSetField" href="#TestCanSetField">func TestCanSetField(t *testing.T)</a>

```
searchKey: reflect_test.TestCanSetField
tags: [method private test]
```

```Go
func TestCanSetField(t *testing.T)
```

### <a id="TestChan" href="#TestChan">func TestChan(t *testing.T)</a>

```
searchKey: reflect_test.TestChan
tags: [method private test]
```

```Go
func TestChan(t *testing.T)
```

### <a id="TestChanAlloc" href="#TestChanAlloc">func TestChanAlloc(t *testing.T)</a>

```
searchKey: reflect_test.TestChanAlloc
tags: [method private test]
```

```Go
func TestChanAlloc(t *testing.T)
```

### <a id="TestChanOf" href="#TestChanOf">func TestChanOf(t *testing.T)</a>

```
searchKey: reflect_test.TestChanOf
tags: [method private test]
```

```Go
func TestChanOf(t *testing.T)
```

### <a id="TestChanOfDir" href="#TestChanOfDir">func TestChanOfDir(t *testing.T)</a>

```
searchKey: reflect_test.TestChanOfDir
tags: [method private test]
```

```Go
func TestChanOfDir(t *testing.T)
```

### <a id="TestChanOfGC" href="#TestChanOfGC">func TestChanOfGC(t *testing.T)</a>

```
searchKey: reflect_test.TestChanOfGC
tags: [method private test]
```

```Go
func TestChanOfGC(t *testing.T)
```

### <a id="TestComparable" href="#TestComparable">func TestComparable(t *testing.T)</a>

```
searchKey: reflect_test.TestComparable
tags: [method private test]
```

```Go
func TestComparable(t *testing.T)
```

### <a id="TestConvert" href="#TestConvert">func TestConvert(t *testing.T)</a>

```
searchKey: reflect_test.TestConvert
tags: [method private test]
```

```Go
func TestConvert(t *testing.T)
```

### <a id="TestConvertNaNs" href="#TestConvertNaNs">func TestConvertNaNs(t *testing.T)</a>

```
searchKey: reflect_test.TestConvertNaNs
tags: [method private test]
```

```Go
func TestConvertNaNs(t *testing.T)
```

### <a id="TestConvertPanic" href="#TestConvertPanic">func TestConvertPanic(t *testing.T)</a>

```
searchKey: reflect_test.TestConvertPanic
tags: [method private test]
```

```Go
func TestConvertPanic(t *testing.T)
```

### <a id="TestConvertibleTo" href="#TestConvertibleTo">func TestConvertibleTo(t *testing.T)</a>

```
searchKey: reflect_test.TestConvertibleTo
tags: [method private test]
```

```Go
func TestConvertibleTo(t *testing.T)
```

### <a id="TestCopy" href="#TestCopy">func TestCopy(t *testing.T)</a>

```
searchKey: reflect_test.TestCopy
tags: [method private test]
```

```Go
func TestCopy(t *testing.T)
```

### <a id="TestCopyArray" href="#TestCopyArray">func TestCopyArray(t *testing.T)</a>

```
searchKey: reflect_test.TestCopyArray
tags: [method private test]
```

```Go
func TestCopyArray(t *testing.T)
```

### <a id="TestCopyString" href="#TestCopyString">func TestCopyString(t *testing.T)</a>

```
searchKey: reflect_test.TestCopyString
tags: [method private test]
```

```Go
func TestCopyString(t *testing.T)
```

### <a id="TestDeepEqual" href="#TestDeepEqual">func TestDeepEqual(t *testing.T)</a>

```
searchKey: reflect_test.TestDeepEqual
tags: [method private test]
```

```Go
func TestDeepEqual(t *testing.T)
```

### <a id="TestDeepEqualComplexStruct" href="#TestDeepEqualComplexStruct">func TestDeepEqualComplexStruct(t *testing.T)</a>

```
searchKey: reflect_test.TestDeepEqualComplexStruct
tags: [method private test]
```

```Go
func TestDeepEqualComplexStruct(t *testing.T)
```

### <a id="TestDeepEqualComplexStructInequality" href="#TestDeepEqualComplexStructInequality">func TestDeepEqualComplexStructInequality(t *testing.T)</a>

```
searchKey: reflect_test.TestDeepEqualComplexStructInequality
tags: [method private test]
```

```Go
func TestDeepEqualComplexStructInequality(t *testing.T)
```

### <a id="TestDeepEqualRecursiveStruct" href="#TestDeepEqualRecursiveStruct">func TestDeepEqualRecursiveStruct(t *testing.T)</a>

```
searchKey: reflect_test.TestDeepEqualRecursiveStruct
tags: [method private test]
```

```Go
func TestDeepEqualRecursiveStruct(t *testing.T)
```

### <a id="TestDeepEqualUnexportedMap" href="#TestDeepEqualUnexportedMap">func TestDeepEqualUnexportedMap(t *testing.T)</a>

```
searchKey: reflect_test.TestDeepEqualUnexportedMap
tags: [method private test]
```

```Go
func TestDeepEqualUnexportedMap(t *testing.T)
```

### <a id="TestDirectIfaceMethod" href="#TestDirectIfaceMethod">func TestDirectIfaceMethod(t *testing.T)</a>

```
searchKey: reflect_test.TestDirectIfaceMethod
tags: [method private test]
```

```Go
func TestDirectIfaceMethod(t *testing.T)
```

### <a id="TestEmbed" href="#TestEmbed">func TestEmbed(t *testing.T)</a>

```
searchKey: reflect_test.TestEmbed
tags: [method private test]
```

```Go
func TestEmbed(t *testing.T)
```

### <a id="TestEmbeddedMethods" href="#TestEmbeddedMethods">func TestEmbeddedMethods(t *testing.T)</a>

```
searchKey: reflect_test.TestEmbeddedMethods
tags: [method private test]
```

```Go
func TestEmbeddedMethods(t *testing.T)
```

### <a id="TestExported" href="#TestExported">func TestExported(t *testing.T)</a>

```
searchKey: reflect_test.TestExported
tags: [method private test]
```

```Go
func TestExported(t *testing.T)
```

### <a id="TestFieldByIndex" href="#TestFieldByIndex">func TestFieldByIndex(t *testing.T)</a>

```
searchKey: reflect_test.TestFieldByIndex
tags: [method private test]
```

```Go
func TestFieldByIndex(t *testing.T)
```

### <a id="TestFieldByIndexNil" href="#TestFieldByIndexNil">func TestFieldByIndexNil(t *testing.T)</a>

```
searchKey: reflect_test.TestFieldByIndexNil
tags: [method private test]
```

```Go
func TestFieldByIndexNil(t *testing.T)
```

### <a id="TestFieldByName" href="#TestFieldByName">func TestFieldByName(t *testing.T)</a>

```
searchKey: reflect_test.TestFieldByName
tags: [method private test]
```

```Go
func TestFieldByName(t *testing.T)
```

### <a id="TestFieldPkgPath" href="#TestFieldPkgPath">func TestFieldPkgPath(t *testing.T)</a>

```
searchKey: reflect_test.TestFieldPkgPath
tags: [method private test]
```

```Go
func TestFieldPkgPath(t *testing.T)
```

### <a id="TestFields" href="#TestFields">func TestFields(t *testing.T)</a>

```
searchKey: reflect_test.TestFields
tags: [method private test]
```

```Go
func TestFields(t *testing.T)
```

### <a id="TestFunc" href="#TestFunc">func TestFunc(t *testing.T)</a>

```
searchKey: reflect_test.TestFunc
tags: [method private test]
```

```Go
func TestFunc(t *testing.T)
```

### <a id="TestFuncArg" href="#TestFuncArg">func TestFuncArg(t *testing.T)</a>

```
searchKey: reflect_test.TestFuncArg
tags: [method private test]
```

```Go
func TestFuncArg(t *testing.T)
```

### <a id="TestFuncLayout" href="#TestFuncLayout">func TestFuncLayout(t *testing.T)</a>

```
searchKey: reflect_test.TestFuncLayout
tags: [method private test]
```

```Go
func TestFuncLayout(t *testing.T)
```

### <a id="TestFuncOf" href="#TestFuncOf">func TestFuncOf(t *testing.T)</a>

```
searchKey: reflect_test.TestFuncOf
tags: [method private test]
```

```Go
func TestFuncOf(t *testing.T)
```

### <a id="TestFunctionValue" href="#TestFunctionValue">func TestFunctionValue(t *testing.T)</a>

```
searchKey: reflect_test.TestFunctionValue
tags: [method private test]
```

```Go
func TestFunctionValue(t *testing.T)
```

### <a id="TestGCBits" href="#TestGCBits">func TestGCBits(t *testing.T)</a>

```
searchKey: reflect_test.TestGCBits
tags: [method private test]
```

```Go
func TestGCBits(t *testing.T)
```

### <a id="TestImplements" href="#TestImplements">func TestImplements(t *testing.T)</a>

```
searchKey: reflect_test.TestImplements
tags: [method private test]
```

```Go
func TestImplements(t *testing.T)
```

### <a id="TestImplicitAppendConversion" href="#TestImplicitAppendConversion">func TestImplicitAppendConversion(t *testing.T)</a>

```
searchKey: reflect_test.TestImplicitAppendConversion
tags: [method private test]
```

```Go
func TestImplicitAppendConversion(t *testing.T)
```

### <a id="TestImplicitCallConversion" href="#TestImplicitCallConversion">func TestImplicitCallConversion(t *testing.T)</a>

```
searchKey: reflect_test.TestImplicitCallConversion
tags: [method private test]
```

```Go
func TestImplicitCallConversion(t *testing.T)
```

### <a id="TestImplicitMapConversion" href="#TestImplicitMapConversion">func TestImplicitMapConversion(t *testing.T)</a>

```
searchKey: reflect_test.TestImplicitMapConversion
tags: [method private test]
```

```Go
func TestImplicitMapConversion(t *testing.T)
```

### <a id="TestImplicitSendConversion" href="#TestImplicitSendConversion">func TestImplicitSendConversion(t *testing.T)</a>

```
searchKey: reflect_test.TestImplicitSendConversion
tags: [method private test]
```

```Go
func TestImplicitSendConversion(t *testing.T)
```

### <a id="TestImplicitSetConversion" href="#TestImplicitSetConversion">func TestImplicitSetConversion(t *testing.T)</a>

```
searchKey: reflect_test.TestImplicitSetConversion
tags: [method private test]
```

```Go
func TestImplicitSetConversion(t *testing.T)
```

### <a id="TestImportPath" href="#TestImportPath">func TestImportPath(t *testing.T)</a>

```
searchKey: reflect_test.TestImportPath
tags: [method private test]
```

```Go
func TestImportPath(t *testing.T)
```

### <a id="TestIndex" href="#TestIndex">func TestIndex(t *testing.T)</a>

```
searchKey: reflect_test.TestIndex
tags: [method private test]
```

```Go
func TestIndex(t *testing.T)
```

### <a id="TestInterfaceExtraction" href="#TestInterfaceExtraction">func TestInterfaceExtraction(t *testing.T)</a>

```
searchKey: reflect_test.TestInterfaceExtraction
tags: [method private test]
```

```Go
func TestInterfaceExtraction(t *testing.T)
```

### <a id="TestInterfaceGet" href="#TestInterfaceGet">func TestInterfaceGet(t *testing.T)</a>

```
searchKey: reflect_test.TestInterfaceGet
tags: [method private test]
```

```Go
func TestInterfaceGet(t *testing.T)
```

### <a id="TestInterfaceSet" href="#TestInterfaceSet">func TestInterfaceSet(t *testing.T)</a>

```
searchKey: reflect_test.TestInterfaceSet
tags: [method private test]
```

```Go
func TestInterfaceSet(t *testing.T)
```

### <a id="TestInterfaceValue" href="#TestInterfaceValue">func TestInterfaceValue(t *testing.T)</a>

```
searchKey: reflect_test.TestInterfaceValue
tags: [method private test]
```

```Go
func TestInterfaceValue(t *testing.T)
```

### <a id="TestInvalid" href="#TestInvalid">func TestInvalid(t *testing.T)</a>

```
searchKey: reflect_test.TestInvalid
tags: [method private test]
```

```Go
func TestInvalid(t *testing.T)
```

### <a id="TestIsNil" href="#TestIsNil">func TestIsNil(t *testing.T)</a>

```
searchKey: reflect_test.TestIsNil
tags: [method private test]
```

```Go
func TestIsNil(t *testing.T)
```

### <a id="TestIsZero" href="#TestIsZero">func TestIsZero(t *testing.T)</a>

```
searchKey: reflect_test.TestIsZero
tags: [method private test]
```

```Go
func TestIsZero(t *testing.T)
```

### <a id="TestIssue22031" href="#TestIssue22031">func TestIssue22031(t *testing.T)</a>

```
searchKey: reflect_test.TestIssue22031
tags: [method private test]
```

```Go
func TestIssue22031(t *testing.T)
```

### <a id="TestIssue22073" href="#TestIssue22073">func TestIssue22073(t *testing.T)</a>

```
searchKey: reflect_test.TestIssue22073
tags: [method private test]
```

```Go
func TestIssue22073(t *testing.T)
```

### <a id="TestKeepFuncLive" href="#TestKeepFuncLive">func TestKeepFuncLive(t *testing.T)</a>

```
searchKey: reflect_test.TestKeepFuncLive
tags: [method private test]
```

```Go
func TestKeepFuncLive(t *testing.T)
```

Issue 18635 (function version). 

### <a id="TestKeepMethodLive" href="#TestKeepMethodLive">func TestKeepMethodLive(t *testing.T)</a>

```
searchKey: reflect_test.TestKeepMethodLive
tags: [method private test]
```

```Go
func TestKeepMethodLive(t *testing.T)
```

### <a id="TestLargeGCProg" href="#TestLargeGCProg">func TestLargeGCProg(t *testing.T)</a>

```
searchKey: reflect_test.TestLargeGCProg
tags: [method private test]
```

```Go
func TestLargeGCProg(t *testing.T)
```

Issue 8917. 

### <a id="TestMakeFunc" href="#TestMakeFunc">func TestMakeFunc(t *testing.T)</a>

```
searchKey: reflect_test.TestMakeFunc
tags: [method private test]
```

```Go
func TestMakeFunc(t *testing.T)
```

### <a id="TestMakeFuncInterface" href="#TestMakeFuncInterface">func TestMakeFuncInterface(t *testing.T)</a>

```
searchKey: reflect_test.TestMakeFuncInterface
tags: [method private test]
```

```Go
func TestMakeFuncInterface(t *testing.T)
```

### <a id="TestMakeFuncInvalidReturnAssignments" href="#TestMakeFuncInvalidReturnAssignments">func TestMakeFuncInvalidReturnAssignments(t *testing.T)</a>

```
searchKey: reflect_test.TestMakeFuncInvalidReturnAssignments
tags: [method private test]
```

```Go
func TestMakeFuncInvalidReturnAssignments(t *testing.T)
```

### <a id="TestMakeFuncStackCopy" href="#TestMakeFuncStackCopy">func TestMakeFuncStackCopy(t *testing.T)</a>

```
searchKey: reflect_test.TestMakeFuncStackCopy
tags: [method private test]
```

```Go
func TestMakeFuncStackCopy(t *testing.T)
```

### <a id="TestMakeFuncValidReturnAssignments" href="#TestMakeFuncValidReturnAssignments">func TestMakeFuncValidReturnAssignments(t *testing.T)</a>

```
searchKey: reflect_test.TestMakeFuncValidReturnAssignments
tags: [method private test]
```

```Go
func TestMakeFuncValidReturnAssignments(t *testing.T)
```

### <a id="TestMakeFuncVariadic" href="#TestMakeFuncVariadic">func TestMakeFuncVariadic(t *testing.T)</a>

```
searchKey: reflect_test.TestMakeFuncVariadic
tags: [method private test]
```

```Go
func TestMakeFuncVariadic(t *testing.T)
```

### <a id="TestMap" href="#TestMap">func TestMap(t *testing.T)</a>

```
searchKey: reflect_test.TestMap
tags: [method private test]
```

```Go
func TestMap(t *testing.T)
```

### <a id="TestMapAlloc" href="#TestMapAlloc">func TestMapAlloc(t *testing.T)</a>

```
searchKey: reflect_test.TestMapAlloc
tags: [method private test]
```

```Go
func TestMapAlloc(t *testing.T)
```

### <a id="TestMapIterDelete0" href="#TestMapIterDelete0">func TestMapIterDelete0(t *testing.T)</a>

```
searchKey: reflect_test.TestMapIterDelete0
tags: [method private test]
```

```Go
func TestMapIterDelete0(t *testing.T)
```

### <a id="TestMapIterDelete1" href="#TestMapIterDelete1">func TestMapIterDelete1(t *testing.T)</a>

```
searchKey: reflect_test.TestMapIterDelete1
tags: [method private test]
```

```Go
func TestMapIterDelete1(t *testing.T)
```

### <a id="TestMapIterNext" href="#TestMapIterNext">func TestMapIterNext(t *testing.T)</a>

```
searchKey: reflect_test.TestMapIterNext
tags: [method private test]
```

```Go
func TestMapIterNext(t *testing.T)
```

### <a id="TestMapIterNilMap" href="#TestMapIterNilMap">func TestMapIterNilMap(t *testing.T)</a>

```
searchKey: reflect_test.TestMapIterNilMap
tags: [method private test]
```

```Go
func TestMapIterNilMap(t *testing.T)
```

### <a id="TestMapIterNonEmptyMap" href="#TestMapIterNonEmptyMap">func TestMapIterNonEmptyMap(t *testing.T)</a>

```
searchKey: reflect_test.TestMapIterNonEmptyMap
tags: [method private test]
```

```Go
func TestMapIterNonEmptyMap(t *testing.T)
```

### <a id="TestMapIterSafety" href="#TestMapIterSafety">func TestMapIterSafety(t *testing.T)</a>

```
searchKey: reflect_test.TestMapIterSafety
tags: [method private test]
```

```Go
func TestMapIterSafety(t *testing.T)
```

### <a id="TestMapOf" href="#TestMapOf">func TestMapOf(t *testing.T)</a>

```
searchKey: reflect_test.TestMapOf
tags: [method private test]
```

```Go
func TestMapOf(t *testing.T)
```

### <a id="TestMapOfGCKeys" href="#TestMapOfGCKeys">func TestMapOfGCKeys(t *testing.T)</a>

```
searchKey: reflect_test.TestMapOfGCKeys
tags: [method private test]
```

```Go
func TestMapOfGCKeys(t *testing.T)
```

### <a id="TestMapOfGCValues" href="#TestMapOfGCValues">func TestMapOfGCValues(t *testing.T)</a>

```
searchKey: reflect_test.TestMapOfGCValues
tags: [method private test]
```

```Go
func TestMapOfGCValues(t *testing.T)
```

### <a id="TestMapSetNil" href="#TestMapSetNil">func TestMapSetNil(t *testing.T)</a>

```
searchKey: reflect_test.TestMapSetNil
tags: [method private test]
```

```Go
func TestMapSetNil(t *testing.T)
```

### <a id="TestMethod" href="#TestMethod">func TestMethod(t *testing.T)</a>

```
searchKey: reflect_test.TestMethod
tags: [method private test]
```

```Go
func TestMethod(t *testing.T)
```

### <a id="TestMethod5" href="#TestMethod5">func TestMethod5(t *testing.T)</a>

```
searchKey: reflect_test.TestMethod5
tags: [method private test]
```

```Go
func TestMethod5(t *testing.T)
```

### <a id="TestMethodByNameUnExportedFirst" href="#TestMethodByNameUnExportedFirst">func TestMethodByNameUnExportedFirst(t *testing.T)</a>

```
searchKey: reflect_test.TestMethodByNameUnExportedFirst
tags: [method private test]
```

```Go
func TestMethodByNameUnExportedFirst(t *testing.T)
```

Issue 21177 

### <a id="TestMethodPkgPath" href="#TestMethodPkgPath">func TestMethodPkgPath(t *testing.T)</a>

```
searchKey: reflect_test.TestMethodPkgPath
tags: [method private test]
```

```Go
func TestMethodPkgPath(t *testing.T)
```

### <a id="TestMethodValue" href="#TestMethodValue">func TestMethodValue(t *testing.T)</a>

```
searchKey: reflect_test.TestMethodValue
tags: [method private test]
```

```Go
func TestMethodValue(t *testing.T)
```

### <a id="TestNames" href="#TestNames">func TestNames(t *testing.T)</a>

```
searchKey: reflect_test.TestNames
tags: [method private test]
```

```Go
func TestNames(t *testing.T)
```

### <a id="TestNestedMethods" href="#TestNestedMethods">func TestNestedMethods(t *testing.T)</a>

```
searchKey: reflect_test.TestNestedMethods
tags: [method private test]
```

```Go
func TestNestedMethods(t *testing.T)
```

### <a id="TestNilMap" href="#TestNilMap">func TestNilMap(t *testing.T)</a>

```
searchKey: reflect_test.TestNilMap
tags: [method private test]
```

```Go
func TestNilMap(t *testing.T)
```

### <a id="TestNilPtrValueSub" href="#TestNilPtrValueSub">func TestNilPtrValueSub(t *testing.T)</a>

```
searchKey: reflect_test.TestNilPtrValueSub
tags: [method private test]
```

```Go
func TestNilPtrValueSub(t *testing.T)
```

### <a id="TestNumMethodOnDDD" href="#TestNumMethodOnDDD">func TestNumMethodOnDDD(t *testing.T)</a>

```
searchKey: reflect_test.TestNumMethodOnDDD
tags: [method private test]
```

```Go
func TestNumMethodOnDDD(t *testing.T)
```

### <a id="TestOffsetLock" href="#TestOffsetLock">func TestOffsetLock(t *testing.T)</a>

```
searchKey: reflect_test.TestOffsetLock
tags: [method private test]
```

```Go
func TestOffsetLock(t *testing.T)
```

### <a id="TestOverflow" href="#TestOverflow">func TestOverflow(t *testing.T)</a>

```
searchKey: reflect_test.TestOverflow
tags: [method private test]
```

```Go
func TestOverflow(t *testing.T)
```

### <a id="TestPtrPointTo" href="#TestPtrPointTo">func TestPtrPointTo(t *testing.T)</a>

```
searchKey: reflect_test.TestPtrPointTo
tags: [method private test]
```

```Go
func TestPtrPointTo(t *testing.T)
```

### <a id="TestPtrSetNil" href="#TestPtrSetNil">func TestPtrSetNil(t *testing.T)</a>

```
searchKey: reflect_test.TestPtrSetNil
tags: [method private test]
```

```Go
func TestPtrSetNil(t *testing.T)
```

### <a id="TestPtrTo" href="#TestPtrTo">func TestPtrTo(t *testing.T)</a>

```
searchKey: reflect_test.TestPtrTo
tags: [method private test]
```

```Go
func TestPtrTo(t *testing.T)
```

### <a id="TestPtrToGC" href="#TestPtrToGC">func TestPtrToGC(t *testing.T)</a>

```
searchKey: reflect_test.TestPtrToGC
tags: [method private test]
```

```Go
func TestPtrToGC(t *testing.T)
```

### <a id="TestPtrToMethods" href="#TestPtrToMethods">func TestPtrToMethods(t *testing.T)</a>

```
searchKey: reflect_test.TestPtrToMethods
tags: [method private test]
```

```Go
func TestPtrToMethods(t *testing.T)
```

### <a id="TestReflectFuncTraceback" href="#TestReflectFuncTraceback">func TestReflectFuncTraceback(t *testing.T)</a>

```
searchKey: reflect_test.TestReflectFuncTraceback
tags: [method private test]
```

```Go
func TestReflectFuncTraceback(t *testing.T)
```

### <a id="TestReflectMethodTraceback" href="#TestReflectMethodTraceback">func TestReflectMethodTraceback(t *testing.T)</a>

```
searchKey: reflect_test.TestReflectMethodTraceback
tags: [method private test]
```

```Go
func TestReflectMethodTraceback(t *testing.T)
```

### <a id="TestSelect" href="#TestSelect">func TestSelect(t *testing.T)</a>

```
searchKey: reflect_test.TestSelect
tags: [method private test]
```

```Go
func TestSelect(t *testing.T)
```

### <a id="TestSelectMaxCases" href="#TestSelectMaxCases">func TestSelectMaxCases(t *testing.T)</a>

```
searchKey: reflect_test.TestSelectMaxCases
tags: [method private test]
```

```Go
func TestSelectMaxCases(t *testing.T)
```

### <a id="TestSelectNop" href="#TestSelectNop">func TestSelectNop(t *testing.T)</a>

```
searchKey: reflect_test.TestSelectNop
tags: [method private test]
```

```Go
func TestSelectNop(t *testing.T)
```

### <a id="TestSet" href="#TestSet">func TestSet(t *testing.T)</a>

```
searchKey: reflect_test.TestSet
tags: [method private test]
```

```Go
func TestSet(t *testing.T)
```

### <a id="TestSetBytes" href="#TestSetBytes">func TestSetBytes(t *testing.T)</a>

```
searchKey: reflect_test.TestSetBytes
tags: [method private test]
```

```Go
func TestSetBytes(t *testing.T)
```

### <a id="TestSetLenCap" href="#TestSetLenCap">func TestSetLenCap(t *testing.T)</a>

```
searchKey: reflect_test.TestSetLenCap
tags: [method private test]
```

```Go
func TestSetLenCap(t *testing.T)
```

### <a id="TestSetPanic" href="#TestSetPanic">func TestSetPanic(t *testing.T)</a>

```
searchKey: reflect_test.TestSetPanic
tags: [method private test]
```

```Go
func TestSetPanic(t *testing.T)
```

### <a id="TestSetValue" href="#TestSetValue">func TestSetValue(t *testing.T)</a>

```
searchKey: reflect_test.TestSetValue
tags: [method private test]
```

```Go
func TestSetValue(t *testing.T)
```

### <a id="TestSlice" href="#TestSlice">func TestSlice(t *testing.T)</a>

```
searchKey: reflect_test.TestSlice
tags: [method private test]
```

```Go
func TestSlice(t *testing.T)
```

### <a id="TestSlice3" href="#TestSlice3">func TestSlice3(t *testing.T)</a>

```
searchKey: reflect_test.TestSlice3
tags: [method private test]
```

```Go
func TestSlice3(t *testing.T)
```

### <a id="TestSliceOf" href="#TestSliceOf">func TestSliceOf(t *testing.T)</a>

```
searchKey: reflect_test.TestSliceOf
tags: [method private test]
```

```Go
func TestSliceOf(t *testing.T)
```

### <a id="TestSliceOfGC" href="#TestSliceOfGC">func TestSliceOfGC(t *testing.T)</a>

```
searchKey: reflect_test.TestSliceOfGC
tags: [method private test]
```

```Go
func TestSliceOfGC(t *testing.T)
```

### <a id="TestSliceOverflow" href="#TestSliceOverflow">func TestSliceOverflow(t *testing.T)</a>

```
searchKey: reflect_test.TestSliceOverflow
tags: [method private test]
```

```Go
func TestSliceOverflow(t *testing.T)
```

### <a id="TestSmallNegativeInt" href="#TestSmallNegativeInt">func TestSmallNegativeInt(t *testing.T)</a>

```
searchKey: reflect_test.TestSmallNegativeInt
tags: [method private test]
```

```Go
func TestSmallNegativeInt(t *testing.T)
```

### <a id="TestSmallZero" href="#TestSmallZero">func TestSmallZero(t *testing.T)</a>

```
searchKey: reflect_test.TestSmallZero
tags: [method private test]
```

```Go
func TestSmallZero(t *testing.T)
```

### <a id="TestStructArg" href="#TestStructArg">func TestStructArg(t *testing.T)</a>

```
searchKey: reflect_test.TestStructArg
tags: [method private test]
```

```Go
func TestStructArg(t *testing.T)
```

### <a id="TestStructOf" href="#TestStructOf">func TestStructOf(t *testing.T)</a>

```
searchKey: reflect_test.TestStructOf
tags: [method private test]
```

```Go
func TestStructOf(t *testing.T)
```

### <a id="TestStructOfAlg" href="#TestStructOfAlg">func TestStructOfAlg(t *testing.T)</a>

```
searchKey: reflect_test.TestStructOfAlg
tags: [method private test]
```

```Go
func TestStructOfAlg(t *testing.T)
```

### <a id="TestStructOfDifferentPkgPath" href="#TestStructOfDifferentPkgPath">func TestStructOfDifferentPkgPath(t *testing.T)</a>

```
searchKey: reflect_test.TestStructOfDifferentPkgPath
tags: [method private test]
```

```Go
func TestStructOfDifferentPkgPath(t *testing.T)
```

### <a id="TestStructOfDirectIface" href="#TestStructOfDirectIface">func TestStructOfDirectIface(t *testing.T)</a>

```
searchKey: reflect_test.TestStructOfDirectIface
tags: [method private test]
```

```Go
func TestStructOfDirectIface(t *testing.T)
```

### <a id="TestStructOfExportRules" href="#TestStructOfExportRules">func TestStructOfExportRules(t *testing.T)</a>

```
searchKey: reflect_test.TestStructOfExportRules
tags: [method private test]
```

```Go
func TestStructOfExportRules(t *testing.T)
```

### <a id="TestStructOfFieldName" href="#TestStructOfFieldName">func TestStructOfFieldName(t *testing.T)</a>

```
searchKey: reflect_test.TestStructOfFieldName
tags: [method private test]
```

```Go
func TestStructOfFieldName(t *testing.T)
```

### <a id="TestStructOfGC" href="#TestStructOfGC">func TestStructOfGC(t *testing.T)</a>

```
searchKey: reflect_test.TestStructOfGC
tags: [method private test]
```

```Go
func TestStructOfGC(t *testing.T)
```

### <a id="TestStructOfGenericAlg" href="#TestStructOfGenericAlg">func TestStructOfGenericAlg(t *testing.T)</a>

```
searchKey: reflect_test.TestStructOfGenericAlg
tags: [method private test]
```

```Go
func TestStructOfGenericAlg(t *testing.T)
```

### <a id="TestStructOfTooManyFields" href="#TestStructOfTooManyFields">func TestStructOfTooManyFields(t *testing.T)</a>

```
searchKey: reflect_test.TestStructOfTooManyFields
tags: [method private test]
```

```Go
func TestStructOfTooManyFields(t *testing.T)
```

### <a id="TestStructOfWithInterface" href="#TestStructOfWithInterface">func TestStructOfWithInterface(t *testing.T)</a>

```
searchKey: reflect_test.TestStructOfWithInterface
tags: [method private test]
```

```Go
func TestStructOfWithInterface(t *testing.T)
```

### <a id="TestSwapper" href="#TestSwapper">func TestSwapper(t *testing.T)</a>

```
searchKey: reflect_test.TestSwapper
tags: [method private test]
```

```Go
func TestSwapper(t *testing.T)
```

### <a id="TestTagGet" href="#TestTagGet">func TestTagGet(t *testing.T)</a>

```
searchKey: reflect_test.TestTagGet
tags: [method private test]
```

```Go
func TestTagGet(t *testing.T)
```

### <a id="TestTypeFieldOutOfRangePanic" href="#TestTypeFieldOutOfRangePanic">func TestTypeFieldOutOfRangePanic(t *testing.T)</a>

```
searchKey: reflect_test.TestTypeFieldOutOfRangePanic
tags: [method private test]
```

```Go
func TestTypeFieldOutOfRangePanic(t *testing.T)
```

Issue 15046. 

### <a id="TestTypeOf" href="#TestTypeOf">func TestTypeOf(t *testing.T)</a>

```
searchKey: reflect_test.TestTypeOf
tags: [method private test]
```

```Go
func TestTypeOf(t *testing.T)
```

### <a id="TestTypeOfTypeOf" href="#TestTypeOfTypeOf">func TestTypeOfTypeOf(t *testing.T)</a>

```
searchKey: reflect_test.TestTypeOfTypeOf
tags: [method private test]
```

```Go
func TestTypeOfTypeOf(t *testing.T)
```

### <a id="TestTypeStrings" href="#TestTypeStrings">func TestTypeStrings(t *testing.T)</a>

```
searchKey: reflect_test.TestTypeStrings
tags: [method private test]
```

```Go
func TestTypeStrings(t *testing.T)
```

### <a id="TestTypelinksSorted" href="#TestTypelinksSorted">func TestTypelinksSorted(t *testing.T)</a>

```
searchKey: reflect_test.TestTypelinksSorted
tags: [method private test]
```

```Go
func TestTypelinksSorted(t *testing.T)
```

### <a id="TestTypes" href="#TestTypes">func TestTypes(t *testing.T)</a>

```
searchKey: reflect_test.TestTypes
tags: [method private test]
```

```Go
func TestTypes(t *testing.T)
```

### <a id="TestUnaddressableField" href="#TestUnaddressableField">func TestUnaddressableField(t *testing.T)</a>

```
searchKey: reflect_test.TestUnaddressableField
tags: [method private test]
```

```Go
func TestUnaddressableField(t *testing.T)
```

TestUnaddressableField tests that the reflect package will not allow a type from another package to be used as a named type with an unexported field. 

This ensures that unexported fields cannot be modified by other packages. 

### <a id="TestUnexported" href="#TestUnexported">func TestUnexported(t *testing.T)</a>

```
searchKey: reflect_test.TestUnexported
tags: [method private test]
```

```Go
func TestUnexported(t *testing.T)
```

### <a id="TestUnexportedMethods" href="#TestUnexportedMethods">func TestUnexportedMethods(t *testing.T)</a>

```
searchKey: reflect_test.TestUnexportedMethods
tags: [method private test]
```

```Go
func TestUnexportedMethods(t *testing.T)
```

### <a id="TestValueString" href="#TestValueString">func TestValueString(t *testing.T)</a>

```
searchKey: reflect_test.TestValueString
tags: [method private test]
```

```Go
func TestValueString(t *testing.T)
```

### <a id="TestValueToString" href="#TestValueToString">func TestValueToString(t *testing.T)</a>

```
searchKey: reflect_test.TestValueToString
tags: [method private test]
```

```Go
func TestValueToString(t *testing.T)
```

### <a id="TestVariadic" href="#TestVariadic">func TestVariadic(t *testing.T)</a>

```
searchKey: reflect_test.TestVariadic
tags: [method private test]
```

```Go
func TestVariadic(t *testing.T)
```

### <a id="TestVariadicMethodValue" href="#TestVariadicMethodValue">func TestVariadicMethodValue(t *testing.T)</a>

```
searchKey: reflect_test.TestVariadicMethodValue
tags: [method private test]
```

```Go
func TestVariadicMethodValue(t *testing.T)
```

### <a id="TestVariadicType" href="#TestVariadicType">func TestVariadicType(t *testing.T)</a>

```
searchKey: reflect_test.TestVariadicType
tags: [method private test]
```

```Go
func TestVariadicType(t *testing.T)
```

### <a id="TestZeroSet" href="#TestZeroSet">func TestZeroSet(t *testing.T)</a>

```
searchKey: reflect_test.TestZeroSet
tags: [method private test]
```

```Go
func TestZeroSet(t *testing.T)
```

### <a id="assert" href="#assert">func assert(t *testing.T, s, want string)</a>

```
searchKey: reflect_test.assert
tags: [method private]
```

```Go
func assert(t *testing.T, s, want string)
```

### <a id="check2ndField" href="#check2ndField">func check2ndField(x interface{}, offs uintptr, t *testing.T)</a>

```
searchKey: reflect_test.check2ndField
tags: [method private]
```

```Go
func check2ndField(x interface{}, offs uintptr, t *testing.T)
```

### <a id="checkSameType" href="#checkSameType">func checkSameType(t *testing.T, x Type, y interface{})</a>

```
searchKey: reflect_test.checkSameType
tags: [method private]
```

```Go
func checkSameType(t *testing.T, x Type, y interface{})
```

### <a id="clobber" href="#clobber">func clobber()</a>

```
searchKey: reflect_test.clobber
tags: [function private]
```

```Go
func clobber()
```

clobber tries to clobber unreachable memory. 

### <a id="fieldIndexRecover" href="#fieldIndexRecover">func fieldIndexRecover(t Type, i int) (recovered interface{})</a>

```
searchKey: reflect_test.fieldIndexRecover
tags: [method private]
```

```Go
func fieldIndexRecover(t Type, i int) (recovered interface{})
```

### <a id="fmtSelect" href="#fmtSelect">func fmtSelect(info []caseInfo) string</a>

```
searchKey: reflect_test.fmtSelect
tags: [method private]
```

```Go
func fmtSelect(info []caseInfo) string
```

fmtSelect formats the information about a single select test. 

### <a id="init.all_test.go" href="#init.all_test.go">func init()</a>

```
searchKey: reflect_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="isNonNil" href="#isNonNil">func isNonNil(x interface{})</a>

```
searchKey: reflect_test.isNonNil
tags: [method private]
```

```Go
func isNonNil(x interface{})
```

### <a id="isValid" href="#isValid">func isValid(v Value)</a>

```
searchKey: reflect_test.isValid
tags: [method private]
```

```Go
func isValid(v Value)
```

### <a id="iterateToString" href="#iterateToString">func iterateToString(it *MapIter) string</a>

```
searchKey: reflect_test.iterateToString
tags: [method private]
```

```Go
func iterateToString(it *MapIter) string
```

iterateToString returns the set of elements returned by an iterator in readable form. 

### <a id="join" href="#join">func join(b ...[]byte) []byte</a>

```
searchKey: reflect_test.join
tags: [method private]
```

```Go
func join(b ...[]byte) []byte
```

### <a id="lit" href="#lit">func lit(x ...byte) []byte</a>

```
searchKey: reflect_test.lit
tags: [method private]
```

```Go
func lit(x ...byte) []byte
```

### <a id="noAlloc" href="#noAlloc">func noAlloc(t *testing.T, n int, f func(int))</a>

```
searchKey: reflect_test.noAlloc
tags: [method private]
```

```Go
func noAlloc(t *testing.T, n int, f func(int))
```

### <a id="rep" href="#rep">func rep(n int, b []byte) []byte</a>

```
searchKey: reflect_test.rep
tags: [method private]
```

```Go
func rep(n int, b []byte) []byte
```

### <a id="runSelect" href="#runSelect">func runSelect(cases []SelectCase, info []caseInfo) (chosen int, recv Value, recvOK bool, panicErr interface{})</a>

```
searchKey: reflect_test.runSelect
tags: [method private]
```

```Go
func runSelect(cases []SelectCase, info []caseInfo) (chosen int, recv Value, recvOK bool, panicErr interface{})
```

runSelect runs a single select test. It returns the values returned by Select but also returns a panic value if the Select panics. 

### <a id="sameInts" href="#sameInts">func sameInts(x, y []int) bool</a>

```
searchKey: reflect_test.sameInts
tags: [method private]
```

```Go
func sameInts(x, y []int) bool
```

### <a id="selectWatcher" href="#selectWatcher">func selectWatcher()</a>

```
searchKey: reflect_test.selectWatcher
tags: [function private]
```

```Go
func selectWatcher()
```

### <a id="shouldPanic" href="#shouldPanic">func shouldPanic(expect string, f func())</a>

```
searchKey: reflect_test.shouldPanic
tags: [method private]
```

```Go
func shouldPanic(expect string, f func())
```

### <a id="takesEmpty" href="#takesEmpty">func takesEmpty(e emptyStruct)</a>

```
searchKey: reflect_test.takesEmpty
tags: [method private]
```

```Go
func takesEmpty(e emptyStruct)
```

### <a id="takesNonEmpty" href="#takesNonEmpty">func takesNonEmpty(n nonEmptyStruct) int</a>

```
searchKey: reflect_test.takesNonEmpty
tags: [method private]
```

```Go
func takesNonEmpty(n nonEmptyStruct) int
```

### <a id="testType" href="#testType">func testType(t *testing.T, i int, typ Type, want string)</a>

```
searchKey: reflect_test.testType
tags: [method private]
```

```Go
func testType(t *testing.T, i int, typ Type, want string)
```

### <a id="useStack" href="#useStack">func useStack(n int)</a>

```
searchKey: reflect_test.useStack
tags: [method private]
```

```Go
func useStack(n int)
```

use about n KB of stack 

### <a id="valueToString" href="#valueToString">func valueToString(val Value) string</a>

```
searchKey: reflect_test.valueToString
tags: [method private]
```

```Go
func valueToString(val Value) string
```

valueToString returns a textual representation of the reflection value val. For debugging only. 

### <a id="verifyGCBits" href="#verifyGCBits">func verifyGCBits(t *testing.T, typ Type, bits []byte)</a>

```
searchKey: reflect_test.verifyGCBits
tags: [method private]
```

```Go
func verifyGCBits(t *testing.T, typ Type, bits []byte)
```

### <a id="verifyGCBitsSlice" href="#verifyGCBitsSlice">func verifyGCBitsSlice(t *testing.T, typ Type, cap int, bits []byte)</a>

```
searchKey: reflect_test.verifyGCBitsSlice
tags: [method private]
```

```Go
func verifyGCBitsSlice(t *testing.T, typ Type, cap int, bits []byte)
```

