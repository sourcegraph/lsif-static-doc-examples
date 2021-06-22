# Package reflectlite_test

## Index

* [Variables](#var)
    * [var typeTests](#typeTests)
    * [var valueTests](#valueTests)
    * [var _i](#_i)
    * [var valueToStringTests](#valueToStringTests)
    * [var appendTests](#appendTests)
    * [var fn1](#fn1)
    * [var fn2](#fn2)
    * [var fn3](#fn3)
    * [var loop1](#loop1)
    * [var loop2](#loop2)
    * [var loopy1](#loopy1)
    * [var loopy2](#loopy2)
    * [var typeOfTests](#typeOfTests)
    * [var nameTests](#nameTests)
    * [var typeNames](#typeNames)
    * [var implementsTests](#implementsTests)
    * [var assignableTests](#assignableTests)
* [Types](#type)
    * [type integer int](#integer)
    * [type T struct](#T)
    * [type pair struct](#pair)
    * [type big struct](#big)
    * [type Basic struct](#Basic)
    * [type NotBasic reflectlite_test.Basic](#NotBasic)
    * [type DeepEqualTest struct](#DeepEqualTest)
    * [type self struct{}](#self)
    * [type Loop *reflectlite_test.Loop](#Loop)
    * [type Loopy interface{}](#Loopy)
    * [type Point struct](#Point)
        * [func (p Point) AnotherMethod(scale int) int](#Point.AnotherMethod)
        * [func (p Point) Dist(scale int) int](#Point.Dist)
        * [func (p Point) GCMethod(k int) int](#Point.GCMethod)
        * [func (p Point) NoArgs()](#Point.NoArgs)
        * [func (p Point) TotalDist(points ...Point) int](#Point.TotalDist)
    * [type D1 struct](#D1)
    * [type D2 struct](#D2)
    * [type S struct](#S)
    * [type TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678 int](#TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678)
    * [type nameTest struct](#nameTest)
    * [type Tint int](#Tint)
    * [type Tint2 reflectlite_test.Tint](#Tint2)
    * [type Talias1 struct](#Talias1)
    * [type Talias2 struct](#Talias2)
    * [type visitor struct](#visitor)
        * [func newVisitor() visitor](#newVisitor)
        * [func (v visitor) filter(name string) bool](#visitor.filter)
        * [func (v visitor) Visit(n ast.Node) ast.Visitor](#visitor.Visit)
    * [type notAnExpr struct{}](#notAnExpr)
        * [func (notAnExpr) Pos() token.Pos](#notAnExpr.Pos)
        * [func (notAnExpr) End() token.Pos](#notAnExpr.End)
        * [func (notAnExpr) exprNode()](#notAnExpr.exprNode)
    * [type notASTExpr interface](#notASTExpr)
    * [type mapError map[string]string](#mapError)
        * [func (mapError) Error() string](#mapError.Error)
    * [type IntPtr *int](#IntPtr)
    * [type IntPtr1 *int](#IntPtr1)
    * [type Ch <-chan interface{}](#Ch)
* [Functions](#func)
    * [func ToValue(v Value) reflect.Value](#ToValue)
    * [func TypeString(t Type) string](#TypeString)
    * [func assert(t *testing.T, s, want string)](#assert)
    * [func testType(t *testing.T, i int, typ Type, want string)](#testType)
    * [func testReflectType(t *testing.T, i int, typ Type, want string)](#testReflectType)
    * [func TestTypes(t *testing.T)](#TestTypes)
    * [func TestSetValue(t *testing.T)](#TestSetValue)
    * [func TestCanSetField(t *testing.T)](#TestCanSetField)
    * [func TestValueToString(t *testing.T)](#TestValueToString)
    * [func TestPtrSetNil(t *testing.T)](#TestPtrSetNil)
    * [func TestMapSetNil(t *testing.T)](#TestMapSetNil)
    * [func TestAll(t *testing.T)](#TestAll)
    * [func TestInterfaceValue(t *testing.T)](#TestInterfaceValue)
    * [func TestFunctionValue(t *testing.T)](#TestFunctionValue)
    * [func sameInts(x, y []int) bool](#sameInts)
    * [func TestBigUnnamedStruct(t *testing.T)](#TestBigUnnamedStruct)
    * [func TestBigStruct(t *testing.T)](#TestBigStruct)
    * [func init()](#init)
    * [func TestTypeOf(t *testing.T)](#TestTypeOf)
    * [func Nil(a interface{}, t *testing.T)](#Nil)
    * [func NotNil(a interface{}, t *testing.T)](#NotNil)
    * [func TestIsNil(t *testing.T)](#TestIsNil)
    * [func Indirect(v Value) Value](#Indirect)
    * [func TestNilPtrValueSub(t *testing.T)](#TestNilPtrValueSub)
    * [func TestImportPath(t *testing.T)](#TestImportPath)
    * [func noAlloc(t *testing.T, n int, f func(int))](#noAlloc)
    * [func TestAllocations(t *testing.T)](#TestAllocations)
    * [func TestSetPanic(t *testing.T)](#TestSetPanic)
    * [func shouldPanic(f func())](#shouldPanic)
    * [func TestBigZero(t *testing.T)](#TestBigZero)
    * [func TestInvalid(t *testing.T)](#TestInvalid)
    * [func TestNames(t *testing.T)](#TestNames)
    * [func TestUnaddressableField(t *testing.T)](#TestUnaddressableField)
    * [func TestAliasNames(t *testing.T)](#TestAliasNames)
    * [func loadTypes(path, pkgName string, v visitor)](#loadTypes)
    * [func TestMirrorWithReflect(t *testing.T)](#TestMirrorWithReflect)
    * [func TestImplicitSetConversion(t *testing.T)](#TestImplicitSetConversion)
    * [func TestImplements(t *testing.T)](#TestImplements)
    * [func TestAssignableTo(t *testing.T)](#TestAssignableTo)
    * [func valueToString(v Value) string](#valueToString)
    * [func valueToStringImpl(val reflect.Value) string](#valueToStringImpl)


## <a id="var" href="#var">Variables</a>

### <a id="typeTests" href="#typeTests">var typeTests</a>

```
searchKey: reflectlite_test.typeTests
```

```Go
var typeTests = ...
```

### <a id="valueTests" href="#valueTests">var valueTests</a>

```
searchKey: reflectlite_test.valueTests
```

```Go
var valueTests = ...
```

### <a id="_i" href="#_i">var _i</a>

```
searchKey: reflectlite_test._i
```

```Go
var _i = 7
```

### <a id="valueToStringTests" href="#valueToStringTests">var valueToStringTests</a>

```
searchKey: reflectlite_test.valueToStringTests
```

```Go
var valueToStringTests = ...
```

### <a id="appendTests" href="#appendTests">var appendTests</a>

```
searchKey: reflectlite_test.appendTests
```

```Go
var appendTests = ...
```

### <a id="fn1" href="#fn1">var fn1</a>

```
searchKey: reflectlite_test.fn1
```

```Go
var fn1 func() // nil.

```

Simple functions for DeepEqual tests. 

### <a id="fn2" href="#fn2">var fn2</a>

```
searchKey: reflectlite_test.fn2
```

```Go
var fn2 func() // nil.

```

Simple functions for DeepEqual tests. 

### <a id="fn3" href="#fn3">var fn3</a>

```
searchKey: reflectlite_test.fn3
```

```Go
var fn3 = func() { fn1() } // Not nil.

```

Simple functions for DeepEqual tests. 

### <a id="loop1" href="#loop1">var loop1</a>

```
searchKey: reflectlite_test.loop1
```

```Go
var loop1, loop2 Loop
```

### <a id="loop2" href="#loop2">var loop2</a>

```
searchKey: reflectlite_test.loop2
```

```Go
var loop1, loop2 Loop
```

### <a id="loopy1" href="#loopy1">var loopy1</a>

```
searchKey: reflectlite_test.loopy1
```

```Go
var loopy1, loopy2 Loopy
```

### <a id="loopy2" href="#loopy2">var loopy2</a>

```
searchKey: reflectlite_test.loopy2
```

```Go
var loopy1, loopy2 Loopy
```

### <a id="typeOfTests" href="#typeOfTests">var typeOfTests</a>

```
searchKey: reflectlite_test.typeOfTests
```

```Go
var typeOfTests = ...
```

### <a id="nameTests" href="#nameTests">var nameTests</a>

```
searchKey: reflectlite_test.nameTests
```

```Go
var nameTests = ...
```

### <a id="typeNames" href="#typeNames">var typeNames</a>

```
searchKey: reflectlite_test.typeNames
```

```Go
var typeNames = ...
```

### <a id="implementsTests" href="#implementsTests">var implementsTests</a>

```
searchKey: reflectlite_test.implementsTests
```

```Go
var implementsTests = ...
```

### <a id="assignableTests" href="#assignableTests">var assignableTests</a>

```
searchKey: reflectlite_test.assignableTests
```

```Go
var assignableTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="integer" href="#integer">type integer int</a>

```
searchKey: reflectlite_test.integer
```

```Go
type integer int
```

### <a id="T" href="#T">type T struct</a>

```
searchKey: reflectlite_test.T
```

```Go
type T struct {
	a int
	b float64
	c string
	d *int
}
```

### <a id="pair" href="#pair">type pair struct</a>

```
searchKey: reflectlite_test.pair
```

```Go
type pair struct {
	i interface{}
	s string
}
```

### <a id="big" href="#big">type big struct</a>

```
searchKey: reflectlite_test.big
```

```Go
type big struct {
	a, b, c, d, e int64
}
```

### <a id="Basic" href="#Basic">type Basic struct</a>

```
searchKey: reflectlite_test.Basic
```

```Go
type Basic struct {
	x int
	y float32
}
```

### <a id="NotBasic" href="#NotBasic">type NotBasic reflectlite_test.Basic</a>

```
searchKey: reflectlite_test.NotBasic
```

```Go
type NotBasic Basic
```

### <a id="DeepEqualTest" href="#DeepEqualTest">type DeepEqualTest struct</a>

```
searchKey: reflectlite_test.DeepEqualTest
```

```Go
type DeepEqualTest struct {
	a, b interface{}
	eq   bool
}
```

### <a id="self" href="#self">type self struct{}</a>

```
searchKey: reflectlite_test.self
```

```Go
type self struct{}
```

### <a id="Loop" href="#Loop">type Loop *reflectlite_test.Loop</a>

```
searchKey: reflectlite_test.Loop
```

```Go
type Loop *Loop
```

### <a id="Loopy" href="#Loopy">type Loopy interface{}</a>

```
searchKey: reflectlite_test.Loopy
```

```Go
type Loopy interface{}
```

### <a id="Point" href="#Point">type Point struct</a>

```
searchKey: reflectlite_test.Point
```

```Go
type Point struct {
	x, y int
}
```

#### <a id="Point.AnotherMethod" href="#Point.AnotherMethod">func (p Point) AnotherMethod(scale int) int</a>

```
searchKey: reflectlite_test.Point.AnotherMethod
```

```Go
func (p Point) AnotherMethod(scale int) int
```

This will be index 0. 

#### <a id="Point.Dist" href="#Point.Dist">func (p Point) Dist(scale int) int</a>

```
searchKey: reflectlite_test.Point.Dist
```

```Go
func (p Point) Dist(scale int) int
```

This will be index 1. 

#### <a id="Point.GCMethod" href="#Point.GCMethod">func (p Point) GCMethod(k int) int</a>

```
searchKey: reflectlite_test.Point.GCMethod
```

```Go
func (p Point) GCMethod(k int) int
```

This will be index 2. 

#### <a id="Point.NoArgs" href="#Point.NoArgs">func (p Point) NoArgs()</a>

```
searchKey: reflectlite_test.Point.NoArgs
```

```Go
func (p Point) NoArgs()
```

This will be index 3. 

#### <a id="Point.TotalDist" href="#Point.TotalDist">func (p Point) TotalDist(points ...Point) int</a>

```
searchKey: reflectlite_test.Point.TotalDist
```

```Go
func (p Point) TotalDist(points ...Point) int
```

This will be index 4. 

### <a id="D1" href="#D1">type D1 struct</a>

```
searchKey: reflectlite_test.D1
```

```Go
type D1 struct {
	d int
}
```

### <a id="D2" href="#D2">type D2 struct</a>

```
searchKey: reflectlite_test.D2
```

```Go
type D2 struct {
	d int
}
```

### <a id="S" href="#S">type S struct</a>

```
searchKey: reflectlite_test.S
```

```Go
type S struct {
	i1 int64
	i2 int64
}
```

### <a id="TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678" href="#TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678">type TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678 int</a>

```
searchKey: reflectlite_test.TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678
```

```Go
type TheNameOfThisTypeIsExactly255BytesLongSoWhenTheCompilerPrependsTheReflectTestPackageNameAndExtraStarTheLinkerRuntimeAndReflectPackagesWillHaveToCorrectlyDecodeTheSecondLengthByte0123456789_0123456789_0123456789_0123456789_0123456789_012345678 int
```

### <a id="nameTest" href="#nameTest">type nameTest struct</a>

```
searchKey: reflectlite_test.nameTest
```

```Go
type nameTest struct {
	v    interface{}
	want string
}
```

### <a id="Tint" href="#Tint">type Tint int</a>

```
searchKey: reflectlite_test.Tint
```

```Go
type Tint int
```

### <a id="Tint2" href="#Tint2">type Tint2 reflectlite_test.Tint</a>

```
searchKey: reflectlite_test.Tint2
```

```Go
type Tint2 = Tint
```

### <a id="Talias1" href="#Talias1">type Talias1 struct</a>

```
searchKey: reflectlite_test.Talias1
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
searchKey: reflectlite_test.Talias2
```

```Go
type Talias2 struct {
	Tint
	Tint2
}
```

### <a id="visitor" href="#visitor">type visitor struct</a>

```
searchKey: reflectlite_test.visitor
```

```Go
type visitor struct {
	m map[string]map[string]bool
}
```

#### <a id="newVisitor" href="#newVisitor">func newVisitor() visitor</a>

```
searchKey: reflectlite_test.newVisitor
```

```Go
func newVisitor() visitor
```

#### <a id="visitor.filter" href="#visitor.filter">func (v visitor) filter(name string) bool</a>

```
searchKey: reflectlite_test.visitor.filter
```

```Go
func (v visitor) filter(name string) bool
```

#### <a id="visitor.Visit" href="#visitor.Visit">func (v visitor) Visit(n ast.Node) ast.Visitor</a>

```
searchKey: reflectlite_test.visitor.Visit
```

```Go
func (v visitor) Visit(n ast.Node) ast.Visitor
```

### <a id="notAnExpr" href="#notAnExpr">type notAnExpr struct{}</a>

```
searchKey: reflectlite_test.notAnExpr
```

```Go
type notAnExpr struct{}
```

#### <a id="notAnExpr.Pos" href="#notAnExpr.Pos">func (notAnExpr) Pos() token.Pos</a>

```
searchKey: reflectlite_test.notAnExpr.Pos
```

```Go
func (notAnExpr) Pos() token.Pos
```

#### <a id="notAnExpr.End" href="#notAnExpr.End">func (notAnExpr) End() token.Pos</a>

```
searchKey: reflectlite_test.notAnExpr.End
```

```Go
func (notAnExpr) End() token.Pos
```

#### <a id="notAnExpr.exprNode" href="#notAnExpr.exprNode">func (notAnExpr) exprNode()</a>

```
searchKey: reflectlite_test.notAnExpr.exprNode
```

```Go
func (notAnExpr) exprNode()
```

### <a id="notASTExpr" href="#notASTExpr">type notASTExpr interface</a>

```
searchKey: reflectlite_test.notASTExpr
```

```Go
type notASTExpr interface {
	Pos() token.Pos
	End() token.Pos
	exprNode()
}
```

### <a id="mapError" href="#mapError">type mapError map[string]string</a>

```
searchKey: reflectlite_test.mapError
```

```Go
type mapError map[string]string
```

#### <a id="mapError.Error" href="#mapError.Error">func (mapError) Error() string</a>

```
searchKey: reflectlite_test.mapError.Error
```

```Go
func (mapError) Error() string
```

### <a id="IntPtr" href="#IntPtr">type IntPtr *int</a>

```
searchKey: reflectlite_test.IntPtr
```

```Go
type IntPtr *int
```

### <a id="IntPtr1" href="#IntPtr1">type IntPtr1 *int</a>

```
searchKey: reflectlite_test.IntPtr1
```

```Go
type IntPtr1 *int
```

### <a id="Ch" href="#Ch">type Ch <-chan interface{}</a>

```
searchKey: reflectlite_test.Ch
```

```Go
type Ch <-chan interface{}
```

## <a id="func" href="#func">Functions</a>

### <a id="ToValue" href="#ToValue">func ToValue(v Value) reflect.Value</a>

```
searchKey: reflectlite_test.ToValue
```

```Go
func ToValue(v Value) reflect.Value
```

### <a id="TypeString" href="#TypeString">func TypeString(t Type) string</a>

```
searchKey: reflectlite_test.TypeString
```

```Go
func TypeString(t Type) string
```

### <a id="assert" href="#assert">func assert(t *testing.T, s, want string)</a>

```
searchKey: reflectlite_test.assert
```

```Go
func assert(t *testing.T, s, want string)
```

### <a id="testType" href="#testType">func testType(t *testing.T, i int, typ Type, want string)</a>

```
searchKey: reflectlite_test.testType
```

```Go
func testType(t *testing.T, i int, typ Type, want string)
```

### <a id="testReflectType" href="#testReflectType">func testReflectType(t *testing.T, i int, typ Type, want string)</a>

```
searchKey: reflectlite_test.testReflectType
```

```Go
func testReflectType(t *testing.T, i int, typ Type, want string)
```

### <a id="TestTypes" href="#TestTypes">func TestTypes(t *testing.T)</a>

```
searchKey: reflectlite_test.TestTypes
```

```Go
func TestTypes(t *testing.T)
```

### <a id="TestSetValue" href="#TestSetValue">func TestSetValue(t *testing.T)</a>

```
searchKey: reflectlite_test.TestSetValue
```

```Go
func TestSetValue(t *testing.T)
```

### <a id="TestCanSetField" href="#TestCanSetField">func TestCanSetField(t *testing.T)</a>

```
searchKey: reflectlite_test.TestCanSetField
```

```Go
func TestCanSetField(t *testing.T)
```

### <a id="TestValueToString" href="#TestValueToString">func TestValueToString(t *testing.T)</a>

```
searchKey: reflectlite_test.TestValueToString
```

```Go
func TestValueToString(t *testing.T)
```

### <a id="TestPtrSetNil" href="#TestPtrSetNil">func TestPtrSetNil(t *testing.T)</a>

```
searchKey: reflectlite_test.TestPtrSetNil
```

```Go
func TestPtrSetNil(t *testing.T)
```

### <a id="TestMapSetNil" href="#TestMapSetNil">func TestMapSetNil(t *testing.T)</a>

```
searchKey: reflectlite_test.TestMapSetNil
```

```Go
func TestMapSetNil(t *testing.T)
```

### <a id="TestAll" href="#TestAll">func TestAll(t *testing.T)</a>

```
searchKey: reflectlite_test.TestAll
```

```Go
func TestAll(t *testing.T)
```

### <a id="TestInterfaceValue" href="#TestInterfaceValue">func TestInterfaceValue(t *testing.T)</a>

```
searchKey: reflectlite_test.TestInterfaceValue
```

```Go
func TestInterfaceValue(t *testing.T)
```

### <a id="TestFunctionValue" href="#TestFunctionValue">func TestFunctionValue(t *testing.T)</a>

```
searchKey: reflectlite_test.TestFunctionValue
```

```Go
func TestFunctionValue(t *testing.T)
```

### <a id="sameInts" href="#sameInts">func sameInts(x, y []int) bool</a>

```
searchKey: reflectlite_test.sameInts
```

```Go
func sameInts(x, y []int) bool
```

### <a id="TestBigUnnamedStruct" href="#TestBigUnnamedStruct">func TestBigUnnamedStruct(t *testing.T)</a>

```
searchKey: reflectlite_test.TestBigUnnamedStruct
```

```Go
func TestBigUnnamedStruct(t *testing.T)
```

### <a id="TestBigStruct" href="#TestBigStruct">func TestBigStruct(t *testing.T)</a>

```
searchKey: reflectlite_test.TestBigStruct
```

```Go
func TestBigStruct(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: reflectlite_test.init
```

```Go
func init()
```

### <a id="TestTypeOf" href="#TestTypeOf">func TestTypeOf(t *testing.T)</a>

```
searchKey: reflectlite_test.TestTypeOf
```

```Go
func TestTypeOf(t *testing.T)
```

### <a id="Nil" href="#Nil">func Nil(a interface{}, t *testing.T)</a>

```
searchKey: reflectlite_test.Nil
```

```Go
func Nil(a interface{}, t *testing.T)
```

### <a id="NotNil" href="#NotNil">func NotNil(a interface{}, t *testing.T)</a>

```
searchKey: reflectlite_test.NotNil
```

```Go
func NotNil(a interface{}, t *testing.T)
```

### <a id="TestIsNil" href="#TestIsNil">func TestIsNil(t *testing.T)</a>

```
searchKey: reflectlite_test.TestIsNil
```

```Go
func TestIsNil(t *testing.T)
```

### <a id="Indirect" href="#Indirect">func Indirect(v Value) Value</a>

```
searchKey: reflectlite_test.Indirect
```

```Go
func Indirect(v Value) Value
```

Indirect returns the value that v points to. If v is a nil pointer, Indirect returns a zero Value. If v is not a pointer, Indirect returns v. 

### <a id="TestNilPtrValueSub" href="#TestNilPtrValueSub">func TestNilPtrValueSub(t *testing.T)</a>

```
searchKey: reflectlite_test.TestNilPtrValueSub
```

```Go
func TestNilPtrValueSub(t *testing.T)
```

### <a id="TestImportPath" href="#TestImportPath">func TestImportPath(t *testing.T)</a>

```
searchKey: reflectlite_test.TestImportPath
```

```Go
func TestImportPath(t *testing.T)
```

### <a id="noAlloc" href="#noAlloc">func noAlloc(t *testing.T, n int, f func(int))</a>

```
searchKey: reflectlite_test.noAlloc
```

```Go
func noAlloc(t *testing.T, n int, f func(int))
```

### <a id="TestAllocations" href="#TestAllocations">func TestAllocations(t *testing.T)</a>

```
searchKey: reflectlite_test.TestAllocations
```

```Go
func TestAllocations(t *testing.T)
```

### <a id="TestSetPanic" href="#TestSetPanic">func TestSetPanic(t *testing.T)</a>

```
searchKey: reflectlite_test.TestSetPanic
```

```Go
func TestSetPanic(t *testing.T)
```

### <a id="shouldPanic" href="#shouldPanic">func shouldPanic(f func())</a>

```
searchKey: reflectlite_test.shouldPanic
```

```Go
func shouldPanic(f func())
```

### <a id="TestBigZero" href="#TestBigZero">func TestBigZero(t *testing.T)</a>

```
searchKey: reflectlite_test.TestBigZero
```

```Go
func TestBigZero(t *testing.T)
```

### <a id="TestInvalid" href="#TestInvalid">func TestInvalid(t *testing.T)</a>

```
searchKey: reflectlite_test.TestInvalid
```

```Go
func TestInvalid(t *testing.T)
```

### <a id="TestNames" href="#TestNames">func TestNames(t *testing.T)</a>

```
searchKey: reflectlite_test.TestNames
```

```Go
func TestNames(t *testing.T)
```

### <a id="TestUnaddressableField" href="#TestUnaddressableField">func TestUnaddressableField(t *testing.T)</a>

```
searchKey: reflectlite_test.TestUnaddressableField
```

```Go
func TestUnaddressableField(t *testing.T)
```

TestUnaddressableField tests that the reflect package will not allow a type from another package to be used as a named type with an unexported field. 

This ensures that unexported fields cannot be modified by other packages. 

### <a id="TestAliasNames" href="#TestAliasNames">func TestAliasNames(t *testing.T)</a>

```
searchKey: reflectlite_test.TestAliasNames
```

```Go
func TestAliasNames(t *testing.T)
```

### <a id="loadTypes" href="#loadTypes">func loadTypes(path, pkgName string, v visitor)</a>

```
searchKey: reflectlite_test.loadTypes
```

```Go
func loadTypes(path, pkgName string, v visitor)
```

### <a id="TestMirrorWithReflect" href="#TestMirrorWithReflect">func TestMirrorWithReflect(t *testing.T)</a>

```
searchKey: reflectlite_test.TestMirrorWithReflect
```

```Go
func TestMirrorWithReflect(t *testing.T)
```

### <a id="TestImplicitSetConversion" href="#TestImplicitSetConversion">func TestImplicitSetConversion(t *testing.T)</a>

```
searchKey: reflectlite_test.TestImplicitSetConversion
```

```Go
func TestImplicitSetConversion(t *testing.T)
```

### <a id="TestImplements" href="#TestImplements">func TestImplements(t *testing.T)</a>

```
searchKey: reflectlite_test.TestImplements
```

```Go
func TestImplements(t *testing.T)
```

### <a id="TestAssignableTo" href="#TestAssignableTo">func TestAssignableTo(t *testing.T)</a>

```
searchKey: reflectlite_test.TestAssignableTo
```

```Go
func TestAssignableTo(t *testing.T)
```

### <a id="valueToString" href="#valueToString">func valueToString(v Value) string</a>

```
searchKey: reflectlite_test.valueToString
```

```Go
func valueToString(v Value) string
```

valueToString returns a textual representation of the reflection value val. For debugging only. 

### <a id="valueToStringImpl" href="#valueToStringImpl">func valueToStringImpl(val reflect.Value) string</a>

```
searchKey: reflectlite_test.valueToStringImpl
```

```Go
func valueToStringImpl(val reflect.Value) string
```

