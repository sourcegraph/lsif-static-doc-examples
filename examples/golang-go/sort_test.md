# Package sort_test

## Index

* [Constants](#const)
    * [const _Copy](#_Copy)
    * [const _Dither](#_Dither)
    * [const _NDist](#_NDist)
    * [const _NMode](#_NMode)
    * [const _Plateau](#_Plateau)
    * [const _Rand](#_Rand)
    * [const _Reverse](#_Reverse)
    * [const _ReverseFirstHalf](#_ReverseFirstHalf)
    * [const _ReverseSecondHalf](#_ReverseSecondHalf)
    * [const _Sawtooth](#_Sawtooth)
    * [const _Shuffle](#_Shuffle)
    * [const _Sorted](#_Sorted)
    * [const _Stagger](#_Stagger)
* [Variables](#var)
    * [var changes](#changes)
    * [var countOpsSizes](#countOpsSizes)
    * [var data](#data)
    * [var fdata](#fdata)
    * [var float64s](#float64s)
    * [var ints](#ints)
    * [var planets](#planets)
    * [var sdata](#sdata)
    * [var strings](#strings)
    * [var tests](#tests)
    * [var wrappertests](#wrappertests)
* [Types](#type)
    * [type By func(p1 *std/sort_test.Planet, p2 *std/sort_test.Planet) bool](#By)
        * [func (by By) Sort(planets []Planet)](#By.Sort)
    * [type ByAge []sort_test.Person](#ByAge)
        * [func (a ByAge) Len() int](#ByAge.Len)
        * [func (a ByAge) Less(i, j int) bool](#ByAge.Less)
        * [func (a ByAge) Swap(i, j int)](#ByAge.Swap)
    * [type ByName struct](#ByName)
        * [func (s ByName) Less(i, j int) bool](#ByName.Less)
    * [type ByWeight struct](#ByWeight)
        * [func (s ByWeight) Less(i, j int) bool](#ByWeight.Less)
    * [type Change struct](#Change)
    * [type Grams int](#Grams)
        * [func (g Grams) String() string](#Grams.String)
    * [type Organ struct](#Organ)
    * [type Organs []*sort_test.Organ](#Organs)
        * [func (s Organs) Len() int](#Organs.Len)
        * [func (s Organs) Swap(i, j int)](#Organs.Swap)
    * [type Person struct](#Person)
        * [func (p Person) String() string](#Person.String)
    * [type Planet struct](#Planet)
    * [type adversaryTestingData struct](#adversaryTestingData)
        * [func newAdversaryTestingData(t *testing.T, size int, maxcmp int) *adversaryTestingData](#newAdversaryTestingData)
        * [func (d *adversaryTestingData) Len() int](#adversaryTestingData.Len)
        * [func (d *adversaryTestingData) Less(i, j int) bool](#adversaryTestingData.Less)
        * [func (d *adversaryTestingData) Swap(i, j int)](#adversaryTestingData.Swap)
    * [type au float64](#au)
    * [type earthMass float64](#earthMass)
    * [type intPairs []struct](#intPairs)
        * [func (d intPairs) Len() int](#intPairs.Len)
        * [func (d intPairs) Less(i, j int) bool](#intPairs.Less)
        * [func (d intPairs) Swap(i, j int)](#intPairs.Swap)
        * [func (d intPairs) inOrder() bool](#intPairs.inOrder)
        * [func (d intPairs) initB()](#intPairs.initB)
    * [type lessFunc func(p1 *std/sort_test.Change, p2 *std/sort_test.Change) bool](#lessFunc)
    * [type multiSorter struct](#multiSorter)
        * [func OrderedBy(less ...lessFunc) *multiSorter](#OrderedBy)
        * [func (ms *multiSorter) Len() int](#multiSorter.Len)
        * [func (ms *multiSorter) Less(i, j int) bool](#multiSorter.Less)
        * [func (ms *multiSorter) Sort(changes []Change)](#multiSorter.Sort)
        * [func (ms *multiSorter) Swap(i, j int)](#multiSorter.Swap)
    * [type nonDeterministicTestingData struct](#nonDeterministicTestingData)
        * [func (t *nonDeterministicTestingData) Len() int](#nonDeterministicTestingData.Len)
        * [func (t *nonDeterministicTestingData) Less(i, j int) bool](#nonDeterministicTestingData.Less)
        * [func (t *nonDeterministicTestingData) Swap(i, j int)](#nonDeterministicTestingData.Swap)
    * [type planetSorter struct](#planetSorter)
        * [func (s *planetSorter) Len() int](#planetSorter.Len)
        * [func (s *planetSorter) Less(i, j int) bool](#planetSorter.Less)
        * [func (s *planetSorter) Swap(i, j int)](#planetSorter.Swap)
    * [type testingData struct](#testingData)
        * [func (d *testingData) Len() int](#testingData.Len)
        * [func (d *testingData) Less(i, j int) bool](#testingData.Less)
        * [func (d *testingData) Swap(i, j int)](#testingData.Swap)
* [Functions](#func)
    * [func BenchmarkSearchWrappers(b *testing.B)](#BenchmarkSearchWrappers)
    * [func BenchmarkSort1e2(b *testing.B)](#BenchmarkSort1e2)
    * [func BenchmarkSort1e4(b *testing.B)](#BenchmarkSort1e4)
    * [func BenchmarkSort1e6(b *testing.B)](#BenchmarkSort1e6)
    * [func BenchmarkSortInt1K(b *testing.B)](#BenchmarkSortInt1K)
    * [func BenchmarkSortInt64K(b *testing.B)](#BenchmarkSortInt64K)
    * [func BenchmarkSortInt64K_Slice(b *testing.B)](#BenchmarkSortInt64K_Slice)
    * [func BenchmarkSortString1K(b *testing.B)](#BenchmarkSortString1K)
    * [func BenchmarkSortString1K_Slice(b *testing.B)](#BenchmarkSortString1K_Slice)
    * [func BenchmarkStable1e2(b *testing.B)](#BenchmarkStable1e2)
    * [func BenchmarkStable1e4(b *testing.B)](#BenchmarkStable1e4)
    * [func BenchmarkStable1e6(b *testing.B)](#BenchmarkStable1e6)
    * [func BenchmarkStableInt1K(b *testing.B)](#BenchmarkStableInt1K)
    * [func BenchmarkStableInt1K_Slice(b *testing.B)](#BenchmarkStableInt1K_Slice)
    * [func BenchmarkStableInt64K(b *testing.B)](#BenchmarkStableInt64K)
    * [func BenchmarkStableString1K(b *testing.B)](#BenchmarkStableString1K)
    * [func Example()](#Example)
    * [func ExampleFloat64s()](#ExampleFloat64s)
    * [func ExampleFloat64sAreSorted()](#ExampleFloat64sAreSorted)
    * [func ExampleInts()](#ExampleInts)
    * [func ExampleIntsAreSorted()](#ExampleIntsAreSorted)
    * [func ExampleReverse()](#ExampleReverse)
    * [func ExampleSearch()](#ExampleSearch)
    * [func ExampleSearchFloat64s()](#ExampleSearchFloat64s)
    * [func ExampleSearchInts()](#ExampleSearchInts)
    * [func ExampleSearch_descendingOrder()](#ExampleSearch_descendingOrder)
    * [func ExampleSlice()](#ExampleSlice)
    * [func ExampleSliceStable()](#ExampleSliceStable)
    * [func ExampleStrings()](#ExampleStrings)
    * [func Example_sortKeys()](#Example_sortKeys)
    * [func Example_sortMultiKeys()](#Example_sortMultiKeys)
    * [func Example_sortWrapper()](#Example_sortWrapper)
    * [func TestAdversary(t *testing.T)](#TestAdversary)
    * [func TestCountSortOps(t *testing.T)](#TestCountSortOps)
    * [func TestCountStableOps(t *testing.T)](#TestCountStableOps)
    * [func TestFloat64s(t *testing.T)](#TestFloat64s)
    * [func TestHeapsortBM(t *testing.T)](#TestHeapsortBM)
    * [func TestInts(t *testing.T)](#TestInts)
    * [func TestNonDeterministicComparison(t *testing.T)](#TestNonDeterministicComparison)
    * [func TestReverseSortIntSlice(t *testing.T)](#TestReverseSortIntSlice)
    * [func TestSearch(t *testing.T)](#TestSearch)
    * [func TestSearchEfficiency(t *testing.T)](#TestSearchEfficiency)
    * [func TestSearchExhaustive(t *testing.T)](#TestSearchExhaustive)
    * [func TestSearchWrappers(t *testing.T)](#TestSearchWrappers)
    * [func TestSearchWrappersDontAlloc(t *testing.T)](#TestSearchWrappersDontAlloc)
    * [func TestSlice(t *testing.T)](#TestSlice)
    * [func TestSortBM(t *testing.T)](#TestSortBM)
    * [func TestSortFloat64Slice(t *testing.T)](#TestSortFloat64Slice)
    * [func TestSortIntSlice(t *testing.T)](#TestSortIntSlice)
    * [func TestSortLarge_Random(t *testing.T)](#TestSortLarge_Random)
    * [func TestSortStringSlice(t *testing.T)](#TestSortStringSlice)
    * [func TestStability(t *testing.T)](#TestStability)
    * [func TestStableBM(t *testing.T)](#TestStableBM)
    * [func TestStableInts(t *testing.T)](#TestStableInts)
    * [func TestStrings(t *testing.T)](#TestStrings)
    * [func bench(b *testing.B, size int, algo func(Interface), name string)](#bench)
    * [func countOps(t *testing.T, algo func(Interface), name string)](#countOps)
    * [func f(a []int, x int) func(int) bool](#f)
    * [func lg(n int) int](#lg)
    * [func log2(x int) int](#log2)
    * [func min(a, b int) int](#min)
    * [func printOrgans(s []*Organ)](#printOrgans)
    * [func runSearchWrappers()](#runSearchWrappers)
    * [func testBentleyMcIlroy(t *testing.T, sort func(Interface), maxswap func(int) int)](#testBentleyMcIlroy)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="_Copy" href="#_Copy">const _Copy</a>

```
searchKey: sort_test._Copy
tags: [constant number private]
```

```Go
const _Copy = iota
```

### <a id="_Dither" href="#_Dither">const _Dither</a>

```
searchKey: sort_test._Dither
tags: [constant number private]
```

```Go
const _Dither
```

### <a id="_NDist" href="#_NDist">const _NDist</a>

```
searchKey: sort_test._NDist
tags: [constant number private]
```

```Go
const _NDist
```

### <a id="_NMode" href="#_NMode">const _NMode</a>

```
searchKey: sort_test._NMode
tags: [constant number private]
```

```Go
const _NMode
```

### <a id="_Plateau" href="#_Plateau">const _Plateau</a>

```
searchKey: sort_test._Plateau
tags: [constant number private]
```

```Go
const _Plateau
```

### <a id="_Rand" href="#_Rand">const _Rand</a>

```
searchKey: sort_test._Rand
tags: [constant number private]
```

```Go
const _Rand
```

### <a id="_Reverse" href="#_Reverse">const _Reverse</a>

```
searchKey: sort_test._Reverse
tags: [constant number private]
```

```Go
const _Reverse
```

### <a id="_ReverseFirstHalf" href="#_ReverseFirstHalf">const _ReverseFirstHalf</a>

```
searchKey: sort_test._ReverseFirstHalf
tags: [constant number private]
```

```Go
const _ReverseFirstHalf
```

### <a id="_ReverseSecondHalf" href="#_ReverseSecondHalf">const _ReverseSecondHalf</a>

```
searchKey: sort_test._ReverseSecondHalf
tags: [constant number private]
```

```Go
const _ReverseSecondHalf
```

### <a id="_Sawtooth" href="#_Sawtooth">const _Sawtooth</a>

```
searchKey: sort_test._Sawtooth
tags: [constant number private]
```

```Go
const _Sawtooth = iota
```

### <a id="_Shuffle" href="#_Shuffle">const _Shuffle</a>

```
searchKey: sort_test._Shuffle
tags: [constant number private]
```

```Go
const _Shuffle
```

### <a id="_Sorted" href="#_Sorted">const _Sorted</a>

```
searchKey: sort_test._Sorted
tags: [constant number private]
```

```Go
const _Sorted
```

### <a id="_Stagger" href="#_Stagger">const _Stagger</a>

```
searchKey: sort_test._Stagger
tags: [constant number private]
```

```Go
const _Stagger
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="changes" href="#changes">var changes</a>

```
searchKey: sort_test.changes
tags: [variable array struct private]
```

```Go
var changes = ...
```

### <a id="countOpsSizes" href="#countOpsSizes">var countOpsSizes</a>

```
searchKey: sort_test.countOpsSizes
tags: [variable array number private]
```

```Go
var countOpsSizes = []int{1e2, 3e2, 1e3, 3e3, 1e4, 3e4, 1e5, 3e5, 1e6}
```

### <a id="data" href="#data">var data</a>

```
searchKey: sort_test.data
tags: [variable array number private]
```

```Go
var data = ...
```

### <a id="fdata" href="#fdata">var fdata</a>

```
searchKey: sort_test.fdata
tags: [variable array number private]
```

```Go
var fdata = []float64{0: -3.14, 1: 0, 2: 1, 3: 2, 4: 1000.7}
```

### <a id="float64s" href="#float64s">var float64s</a>

```
searchKey: sort_test.float64s
tags: [variable array number private]
```

```Go
var float64s = ...
```

### <a id="ints" href="#ints">var ints</a>

```
searchKey: sort_test.ints
tags: [variable array number private]
```

```Go
var ints = [...]int{74, 59, 238, -784, 9845, 959, 905, 0, 0, 42, 7586, -5467984, 7586}
```

### <a id="planets" href="#planets">var planets</a>

```
searchKey: sort_test.planets
tags: [variable array struct private]
```

```Go
var planets = ...
```

### <a id="sdata" href="#sdata">var sdata</a>

```
searchKey: sort_test.sdata
tags: [variable array string private]
```

```Go
var sdata = []string{0: "f", 1: "foo", 2: "foobar", 3: "x"}
```

### <a id="strings" href="#strings">var strings</a>

```
searchKey: sort_test.strings
tags: [variable array string private]
```

```Go
var strings = [...]string{"", "Hello", "foo", "bar", "foo", "f00", "%*&^*&^&", "***"}
```

### <a id="tests" href="#tests">var tests</a>

```
searchKey: sort_test.tests
tags: [variable array struct private]
```

```Go
var tests = ...
```

### <a id="wrappertests" href="#wrappertests">var wrappertests</a>

```
searchKey: sort_test.wrappertests
tags: [variable array struct private]
```

```Go
var wrappertests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="By" href="#By">type By func(p1 *std/sort_test.Planet, p2 *std/sort_test.Planet) bool</a>

```
searchKey: sort_test.By
tags: [function private]
```

```Go
type By func(p1, p2 *Planet) bool
```

By is the type of a "less" function that defines the ordering of its Planet arguments. 

#### <a id="By.Sort" href="#By.Sort">func (by By) Sort(planets []Planet)</a>

```
searchKey: sort_test.By.Sort
tags: [method private]
```

```Go
func (by By) Sort(planets []Planet)
```

Sort is a method on the function type, By, that sorts the argument slice according to the function. 

### <a id="ByAge" href="#ByAge">type ByAge []sort_test.Person</a>

```
searchKey: sort_test.ByAge
tags: [array struct private]
```

```Go
type ByAge []Person
```

ByAge implements sort.Interface for []Person based on the Age field. 

#### <a id="ByAge.Len" href="#ByAge.Len">func (a ByAge) Len() int</a>

```
searchKey: sort_test.ByAge.Len
tags: [function private]
```

```Go
func (a ByAge) Len() int
```

#### <a id="ByAge.Less" href="#ByAge.Less">func (a ByAge) Less(i, j int) bool</a>

```
searchKey: sort_test.ByAge.Less
tags: [method private]
```

```Go
func (a ByAge) Less(i, j int) bool
```

#### <a id="ByAge.Swap" href="#ByAge.Swap">func (a ByAge) Swap(i, j int)</a>

```
searchKey: sort_test.ByAge.Swap
tags: [method private]
```

```Go
func (a ByAge) Swap(i, j int)
```

### <a id="ByName" href="#ByName">type ByName struct</a>

```
searchKey: sort_test.ByName
tags: [struct private]
```

```Go
type ByName struct{ Organs }
```

ByName implements sort.Interface by providing Less and using the Len and Swap methods of the embedded Organs value. 

#### <a id="ByName.Less" href="#ByName.Less">func (s ByName) Less(i, j int) bool</a>

```
searchKey: sort_test.ByName.Less
tags: [method private]
```

```Go
func (s ByName) Less(i, j int) bool
```

### <a id="ByWeight" href="#ByWeight">type ByWeight struct</a>

```
searchKey: sort_test.ByWeight
tags: [struct private]
```

```Go
type ByWeight struct{ Organs }
```

ByWeight implements sort.Interface by providing Less and using the Len and Swap methods of the embedded Organs value. 

#### <a id="ByWeight.Less" href="#ByWeight.Less">func (s ByWeight) Less(i, j int) bool</a>

```
searchKey: sort_test.ByWeight.Less
tags: [method private]
```

```Go
func (s ByWeight) Less(i, j int) bool
```

### <a id="Change" href="#Change">type Change struct</a>

```
searchKey: sort_test.Change
tags: [struct private]
```

```Go
type Change struct {
	user     string
	language string
	lines    int
}
```

A Change is a record of source code changes, recording user, language, and delta size. 

### <a id="Grams" href="#Grams">type Grams int</a>

```
searchKey: sort_test.Grams
tags: [number private]
```

```Go
type Grams int
```

#### <a id="Grams.String" href="#Grams.String">func (g Grams) String() string</a>

```
searchKey: sort_test.Grams.String
tags: [function private]
```

```Go
func (g Grams) String() string
```

### <a id="Organ" href="#Organ">type Organ struct</a>

```
searchKey: sort_test.Organ
tags: [struct private]
```

```Go
type Organ struct {
	Name   string
	Weight Grams
}
```

### <a id="Organs" href="#Organs">type Organs []*sort_test.Organ</a>

```
searchKey: sort_test.Organs
tags: [array struct private]
```

```Go
type Organs []*Organ
```

#### <a id="Organs.Len" href="#Organs.Len">func (s Organs) Len() int</a>

```
searchKey: sort_test.Organs.Len
tags: [function private]
```

```Go
func (s Organs) Len() int
```

#### <a id="Organs.Swap" href="#Organs.Swap">func (s Organs) Swap(i, j int)</a>

```
searchKey: sort_test.Organs.Swap
tags: [method private]
```

```Go
func (s Organs) Swap(i, j int)
```

### <a id="Person" href="#Person">type Person struct</a>

```
searchKey: sort_test.Person
tags: [struct private]
```

```Go
type Person struct {
	Name string
	Age  int
}
```

#### <a id="Person.String" href="#Person.String">func (p Person) String() string</a>

```
searchKey: sort_test.Person.String
tags: [function private]
```

```Go
func (p Person) String() string
```

### <a id="Planet" href="#Planet">type Planet struct</a>

```
searchKey: sort_test.Planet
tags: [struct private]
```

```Go
type Planet struct {
	name     string
	mass     earthMass
	distance au
}
```

A Planet defines the properties of a solar system object. 

### <a id="adversaryTestingData" href="#adversaryTestingData">type adversaryTestingData struct</a>

```
searchKey: sort_test.adversaryTestingData
tags: [struct private]
```

```Go
type adversaryTestingData struct {
	t         *testing.T
	data      []int // item values, initialized to special gas value and changed by Less
	maxcmp    int   // number of comparisons allowed
	ncmp      int   // number of comparisons (calls to Less)
	nsolid    int   // number of elements that have been set to non-gas values
	candidate int   // guess at current pivot
	gas       int   // special value for unset elements, higher than everything else
}
```

This is based on the "antiquicksort" implementation by M. Douglas McIlroy. See [https://www.cs.dartmouth.edu/~doug/mdmspe.pdf](https://www.cs.dartmouth.edu/~doug/mdmspe.pdf) for more info. 

#### <a id="newAdversaryTestingData" href="#newAdversaryTestingData">func newAdversaryTestingData(t *testing.T, size int, maxcmp int) *adversaryTestingData</a>

```
searchKey: sort_test.newAdversaryTestingData
tags: [method private]
```

```Go
func newAdversaryTestingData(t *testing.T, size int, maxcmp int) *adversaryTestingData
```

#### <a id="adversaryTestingData.Len" href="#adversaryTestingData.Len">func (d *adversaryTestingData) Len() int</a>

```
searchKey: sort_test.adversaryTestingData.Len
tags: [function private]
```

```Go
func (d *adversaryTestingData) Len() int
```

#### <a id="adversaryTestingData.Less" href="#adversaryTestingData.Less">func (d *adversaryTestingData) Less(i, j int) bool</a>

```
searchKey: sort_test.adversaryTestingData.Less
tags: [method private]
```

```Go
func (d *adversaryTestingData) Less(i, j int) bool
```

#### <a id="adversaryTestingData.Swap" href="#adversaryTestingData.Swap">func (d *adversaryTestingData) Swap(i, j int)</a>

```
searchKey: sort_test.adversaryTestingData.Swap
tags: [method private]
```

```Go
func (d *adversaryTestingData) Swap(i, j int)
```

### <a id="au" href="#au">type au float64</a>

```
searchKey: sort_test.au
tags: [number private]
```

```Go
type au float64
```

### <a id="earthMass" href="#earthMass">type earthMass float64</a>

```
searchKey: sort_test.earthMass
tags: [number private]
```

```Go
type earthMass float64
```

A couple of type definitions to make the units clear. 

### <a id="intPairs" href="#intPairs">type intPairs []struct</a>

```
searchKey: sort_test.intPairs
tags: [array struct private]
```

```Go
type intPairs []struct {
	a, b int
}
```

#### <a id="intPairs.Len" href="#intPairs.Len">func (d intPairs) Len() int</a>

```
searchKey: sort_test.intPairs.Len
tags: [function private]
```

```Go
func (d intPairs) Len() int
```

IntPairs compare on a only. 

#### <a id="intPairs.Less" href="#intPairs.Less">func (d intPairs) Less(i, j int) bool</a>

```
searchKey: sort_test.intPairs.Less
tags: [method private]
```

```Go
func (d intPairs) Less(i, j int) bool
```

#### <a id="intPairs.Swap" href="#intPairs.Swap">func (d intPairs) Swap(i, j int)</a>

```
searchKey: sort_test.intPairs.Swap
tags: [method private]
```

```Go
func (d intPairs) Swap(i, j int)
```

#### <a id="intPairs.inOrder" href="#intPairs.inOrder">func (d intPairs) inOrder() bool</a>

```
searchKey: sort_test.intPairs.inOrder
tags: [function private]
```

```Go
func (d intPairs) inOrder() bool
```

InOrder checks if a-equal elements were not reordered. 

#### <a id="intPairs.initB" href="#intPairs.initB">func (d intPairs) initB()</a>

```
searchKey: sort_test.intPairs.initB
tags: [function private]
```

```Go
func (d intPairs) initB()
```

Record initial order in B. 

### <a id="lessFunc" href="#lessFunc">type lessFunc func(p1 *std/sort_test.Change, p2 *std/sort_test.Change) bool</a>

```
searchKey: sort_test.lessFunc
tags: [function private]
```

```Go
type lessFunc func(p1, p2 *Change) bool
```

### <a id="multiSorter" href="#multiSorter">type multiSorter struct</a>

```
searchKey: sort_test.multiSorter
tags: [struct private]
```

```Go
type multiSorter struct {
	changes []Change
	less    []lessFunc
}
```

multiSorter implements the Sort interface, sorting the changes within. 

#### <a id="OrderedBy" href="#OrderedBy">func OrderedBy(less ...lessFunc) *multiSorter</a>

```
searchKey: sort_test.OrderedBy
tags: [method private]
```

```Go
func OrderedBy(less ...lessFunc) *multiSorter
```

OrderedBy returns a Sorter that sorts using the less functions, in order. Call its Sort method to sort the data. 

#### <a id="multiSorter.Len" href="#multiSorter.Len">func (ms *multiSorter) Len() int</a>

```
searchKey: sort_test.multiSorter.Len
tags: [function private]
```

```Go
func (ms *multiSorter) Len() int
```

Len is part of sort.Interface. 

#### <a id="multiSorter.Less" href="#multiSorter.Less">func (ms *multiSorter) Less(i, j int) bool</a>

```
searchKey: sort_test.multiSorter.Less
tags: [method private]
```

```Go
func (ms *multiSorter) Less(i, j int) bool
```

Less is part of sort.Interface. It is implemented by looping along the less functions until it finds a comparison that discriminates between the two items (one is less than the other). Note that it can call the less functions twice per call. We could change the functions to return -1, 0, 1 and reduce the number of calls for greater efficiency: an exercise for the reader. 

#### <a id="multiSorter.Sort" href="#multiSorter.Sort">func (ms *multiSorter) Sort(changes []Change)</a>

```
searchKey: sort_test.multiSorter.Sort
tags: [method private]
```

```Go
func (ms *multiSorter) Sort(changes []Change)
```

Sort sorts the argument slice according to the less functions passed to OrderedBy. 

#### <a id="multiSorter.Swap" href="#multiSorter.Swap">func (ms *multiSorter) Swap(i, j int)</a>

```
searchKey: sort_test.multiSorter.Swap
tags: [method private]
```

```Go
func (ms *multiSorter) Swap(i, j int)
```

Swap is part of sort.Interface. 

### <a id="nonDeterministicTestingData" href="#nonDeterministicTestingData">type nonDeterministicTestingData struct</a>

```
searchKey: sort_test.nonDeterministicTestingData
tags: [struct private]
```

```Go
type nonDeterministicTestingData struct {
	r *rand.Rand
}
```

#### <a id="nonDeterministicTestingData.Len" href="#nonDeterministicTestingData.Len">func (t *nonDeterministicTestingData) Len() int</a>

```
searchKey: sort_test.nonDeterministicTestingData.Len
tags: [function private]
```

```Go
func (t *nonDeterministicTestingData) Len() int
```

#### <a id="nonDeterministicTestingData.Less" href="#nonDeterministicTestingData.Less">func (t *nonDeterministicTestingData) Less(i, j int) bool</a>

```
searchKey: sort_test.nonDeterministicTestingData.Less
tags: [method private]
```

```Go
func (t *nonDeterministicTestingData) Less(i, j int) bool
```

#### <a id="nonDeterministicTestingData.Swap" href="#nonDeterministicTestingData.Swap">func (t *nonDeterministicTestingData) Swap(i, j int)</a>

```
searchKey: sort_test.nonDeterministicTestingData.Swap
tags: [method private]
```

```Go
func (t *nonDeterministicTestingData) Swap(i, j int)
```

### <a id="planetSorter" href="#planetSorter">type planetSorter struct</a>

```
searchKey: sort_test.planetSorter
tags: [struct private]
```

```Go
type planetSorter struct {
	planets []Planet
	by      func(p1, p2 *Planet) bool // Closure used in the Less method.
}
```

planetSorter joins a By function and a slice of Planets to be sorted. 

#### <a id="planetSorter.Len" href="#planetSorter.Len">func (s *planetSorter) Len() int</a>

```
searchKey: sort_test.planetSorter.Len
tags: [function private]
```

```Go
func (s *planetSorter) Len() int
```

Len is part of sort.Interface. 

#### <a id="planetSorter.Less" href="#planetSorter.Less">func (s *planetSorter) Less(i, j int) bool</a>

```
searchKey: sort_test.planetSorter.Less
tags: [method private]
```

```Go
func (s *planetSorter) Less(i, j int) bool
```

Less is part of sort.Interface. It is implemented by calling the "by" closure in the sorter. 

#### <a id="planetSorter.Swap" href="#planetSorter.Swap">func (s *planetSorter) Swap(i, j int)</a>

```
searchKey: sort_test.planetSorter.Swap
tags: [method private]
```

```Go
func (s *planetSorter) Swap(i, j int)
```

Swap is part of sort.Interface. 

### <a id="testingData" href="#testingData">type testingData struct</a>

```
searchKey: sort_test.testingData
tags: [struct private]
```

```Go
type testingData struct {
	desc        string
	t           *testing.T
	data        []int
	maxswap     int // number of swaps allowed
	ncmp, nswap int
}
```

#### <a id="testingData.Len" href="#testingData.Len">func (d *testingData) Len() int</a>

```
searchKey: sort_test.testingData.Len
tags: [function private]
```

```Go
func (d *testingData) Len() int
```

#### <a id="testingData.Less" href="#testingData.Less">func (d *testingData) Less(i, j int) bool</a>

```
searchKey: sort_test.testingData.Less
tags: [method private]
```

```Go
func (d *testingData) Less(i, j int) bool
```

#### <a id="testingData.Swap" href="#testingData.Swap">func (d *testingData) Swap(i, j int)</a>

```
searchKey: sort_test.testingData.Swap
tags: [method private]
```

```Go
func (d *testingData) Swap(i, j int)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkSearchWrappers" href="#BenchmarkSearchWrappers">func BenchmarkSearchWrappers(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkSearchWrappers
tags: [method private benchmark]
```

```Go
func BenchmarkSearchWrappers(b *testing.B)
```

### <a id="BenchmarkSort1e2" href="#BenchmarkSort1e2">func BenchmarkSort1e2(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkSort1e2
tags: [method private benchmark]
```

```Go
func BenchmarkSort1e2(b *testing.B)
```

### <a id="BenchmarkSort1e4" href="#BenchmarkSort1e4">func BenchmarkSort1e4(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkSort1e4
tags: [method private benchmark]
```

```Go
func BenchmarkSort1e4(b *testing.B)
```

### <a id="BenchmarkSort1e6" href="#BenchmarkSort1e6">func BenchmarkSort1e6(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkSort1e6
tags: [method private benchmark]
```

```Go
func BenchmarkSort1e6(b *testing.B)
```

### <a id="BenchmarkSortInt1K" href="#BenchmarkSortInt1K">func BenchmarkSortInt1K(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkSortInt1K
tags: [method private benchmark]
```

```Go
func BenchmarkSortInt1K(b *testing.B)
```

### <a id="BenchmarkSortInt64K" href="#BenchmarkSortInt64K">func BenchmarkSortInt64K(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkSortInt64K
tags: [method private benchmark]
```

```Go
func BenchmarkSortInt64K(b *testing.B)
```

### <a id="BenchmarkSortInt64K_Slice" href="#BenchmarkSortInt64K_Slice">func BenchmarkSortInt64K_Slice(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkSortInt64K_Slice
tags: [method private benchmark]
```

```Go
func BenchmarkSortInt64K_Slice(b *testing.B)
```

### <a id="BenchmarkSortString1K" href="#BenchmarkSortString1K">func BenchmarkSortString1K(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkSortString1K
tags: [method private benchmark]
```

```Go
func BenchmarkSortString1K(b *testing.B)
```

### <a id="BenchmarkSortString1K_Slice" href="#BenchmarkSortString1K_Slice">func BenchmarkSortString1K_Slice(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkSortString1K_Slice
tags: [method private benchmark]
```

```Go
func BenchmarkSortString1K_Slice(b *testing.B)
```

### <a id="BenchmarkStable1e2" href="#BenchmarkStable1e2">func BenchmarkStable1e2(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkStable1e2
tags: [method private benchmark]
```

```Go
func BenchmarkStable1e2(b *testing.B)
```

### <a id="BenchmarkStable1e4" href="#BenchmarkStable1e4">func BenchmarkStable1e4(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkStable1e4
tags: [method private benchmark]
```

```Go
func BenchmarkStable1e4(b *testing.B)
```

### <a id="BenchmarkStable1e6" href="#BenchmarkStable1e6">func BenchmarkStable1e6(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkStable1e6
tags: [method private benchmark]
```

```Go
func BenchmarkStable1e6(b *testing.B)
```

### <a id="BenchmarkStableInt1K" href="#BenchmarkStableInt1K">func BenchmarkStableInt1K(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkStableInt1K
tags: [method private benchmark]
```

```Go
func BenchmarkStableInt1K(b *testing.B)
```

### <a id="BenchmarkStableInt1K_Slice" href="#BenchmarkStableInt1K_Slice">func BenchmarkStableInt1K_Slice(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkStableInt1K_Slice
tags: [method private benchmark]
```

```Go
func BenchmarkStableInt1K_Slice(b *testing.B)
```

### <a id="BenchmarkStableInt64K" href="#BenchmarkStableInt64K">func BenchmarkStableInt64K(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkStableInt64K
tags: [method private benchmark]
```

```Go
func BenchmarkStableInt64K(b *testing.B)
```

### <a id="BenchmarkStableString1K" href="#BenchmarkStableString1K">func BenchmarkStableString1K(b *testing.B)</a>

```
searchKey: sort_test.BenchmarkStableString1K
tags: [method private benchmark]
```

```Go
func BenchmarkStableString1K(b *testing.B)
```

### <a id="Example" href="#Example">func Example()</a>

```
searchKey: sort_test.Example
tags: [function private]
```

```Go
func Example()
```

### <a id="ExampleFloat64s" href="#ExampleFloat64s">func ExampleFloat64s()</a>

```
searchKey: sort_test.ExampleFloat64s
tags: [function private]
```

```Go
func ExampleFloat64s()
```

### <a id="ExampleFloat64sAreSorted" href="#ExampleFloat64sAreSorted">func ExampleFloat64sAreSorted()</a>

```
searchKey: sort_test.ExampleFloat64sAreSorted
tags: [function private]
```

```Go
func ExampleFloat64sAreSorted()
```

### <a id="ExampleInts" href="#ExampleInts">func ExampleInts()</a>

```
searchKey: sort_test.ExampleInts
tags: [function private]
```

```Go
func ExampleInts()
```

### <a id="ExampleIntsAreSorted" href="#ExampleIntsAreSorted">func ExampleIntsAreSorted()</a>

```
searchKey: sort_test.ExampleIntsAreSorted
tags: [function private]
```

```Go
func ExampleIntsAreSorted()
```

### <a id="ExampleReverse" href="#ExampleReverse">func ExampleReverse()</a>

```
searchKey: sort_test.ExampleReverse
tags: [function private]
```

```Go
func ExampleReverse()
```

### <a id="ExampleSearch" href="#ExampleSearch">func ExampleSearch()</a>

```
searchKey: sort_test.ExampleSearch
tags: [function private]
```

```Go
func ExampleSearch()
```

This example demonstrates searching a list sorted in ascending order. 

### <a id="ExampleSearchFloat64s" href="#ExampleSearchFloat64s">func ExampleSearchFloat64s()</a>

```
searchKey: sort_test.ExampleSearchFloat64s
tags: [function private]
```

```Go
func ExampleSearchFloat64s()
```

This example demonstrates searching for float64 in a list sorted in ascending order. 

### <a id="ExampleSearchInts" href="#ExampleSearchInts">func ExampleSearchInts()</a>

```
searchKey: sort_test.ExampleSearchInts
tags: [function private]
```

```Go
func ExampleSearchInts()
```

This example demonstrates searching for int in a list sorted in ascending order. 

### <a id="ExampleSearch_descendingOrder" href="#ExampleSearch_descendingOrder">func ExampleSearch_descendingOrder()</a>

```
searchKey: sort_test.ExampleSearch_descendingOrder
tags: [function private]
```

```Go
func ExampleSearch_descendingOrder()
```

This example demonstrates searching a list sorted in descending order. The approach is the same as searching a list in ascending order, but with the condition inverted. 

### <a id="ExampleSlice" href="#ExampleSlice">func ExampleSlice()</a>

```
searchKey: sort_test.ExampleSlice
tags: [function private]
```

```Go
func ExampleSlice()
```

### <a id="ExampleSliceStable" href="#ExampleSliceStable">func ExampleSliceStable()</a>

```
searchKey: sort_test.ExampleSliceStable
tags: [function private]
```

```Go
func ExampleSliceStable()
```

### <a id="ExampleStrings" href="#ExampleStrings">func ExampleStrings()</a>

```
searchKey: sort_test.ExampleStrings
tags: [function private]
```

```Go
func ExampleStrings()
```

### <a id="Example_sortKeys" href="#Example_sortKeys">func Example_sortKeys()</a>

```
searchKey: sort_test.Example_sortKeys
tags: [function private]
```

```Go
func Example_sortKeys()
```

ExampleSortKeys demonstrates a technique for sorting a struct type using programmable sort criteria. 

### <a id="Example_sortMultiKeys" href="#Example_sortMultiKeys">func Example_sortMultiKeys()</a>

```
searchKey: sort_test.Example_sortMultiKeys
tags: [function private]
```

```Go
func Example_sortMultiKeys()
```

ExampleMultiKeys demonstrates a technique for sorting a struct type using different sets of multiple fields in the comparison. We chain together "Less" functions, each of which compares a single field. 

### <a id="Example_sortWrapper" href="#Example_sortWrapper">func Example_sortWrapper()</a>

```
searchKey: sort_test.Example_sortWrapper
tags: [function private]
```

```Go
func Example_sortWrapper()
```

### <a id="TestAdversary" href="#TestAdversary">func TestAdversary(t *testing.T)</a>

```
searchKey: sort_test.TestAdversary
tags: [method private test]
```

```Go
func TestAdversary(t *testing.T)
```

### <a id="TestCountSortOps" href="#TestCountSortOps">func TestCountSortOps(t *testing.T)</a>

```
searchKey: sort_test.TestCountSortOps
tags: [method private test]
```

```Go
func TestCountSortOps(t *testing.T)
```

### <a id="TestCountStableOps" href="#TestCountStableOps">func TestCountStableOps(t *testing.T)</a>

```
searchKey: sort_test.TestCountStableOps
tags: [method private test]
```

```Go
func TestCountStableOps(t *testing.T)
```

### <a id="TestFloat64s" href="#TestFloat64s">func TestFloat64s(t *testing.T)</a>

```
searchKey: sort_test.TestFloat64s
tags: [method private test]
```

```Go
func TestFloat64s(t *testing.T)
```

### <a id="TestHeapsortBM" href="#TestHeapsortBM">func TestHeapsortBM(t *testing.T)</a>

```
searchKey: sort_test.TestHeapsortBM
tags: [method private test]
```

```Go
func TestHeapsortBM(t *testing.T)
```

### <a id="TestInts" href="#TestInts">func TestInts(t *testing.T)</a>

```
searchKey: sort_test.TestInts
tags: [method private test]
```

```Go
func TestInts(t *testing.T)
```

### <a id="TestNonDeterministicComparison" href="#TestNonDeterministicComparison">func TestNonDeterministicComparison(t *testing.T)</a>

```
searchKey: sort_test.TestNonDeterministicComparison
tags: [method private test]
```

```Go
func TestNonDeterministicComparison(t *testing.T)
```

### <a id="TestReverseSortIntSlice" href="#TestReverseSortIntSlice">func TestReverseSortIntSlice(t *testing.T)</a>

```
searchKey: sort_test.TestReverseSortIntSlice
tags: [method private test]
```

```Go
func TestReverseSortIntSlice(t *testing.T)
```

### <a id="TestSearch" href="#TestSearch">func TestSearch(t *testing.T)</a>

```
searchKey: sort_test.TestSearch
tags: [method private test]
```

```Go
func TestSearch(t *testing.T)
```

### <a id="TestSearchEfficiency" href="#TestSearchEfficiency">func TestSearchEfficiency(t *testing.T)</a>

```
searchKey: sort_test.TestSearchEfficiency
tags: [method private test]
```

```Go
func TestSearchEfficiency(t *testing.T)
```

### <a id="TestSearchExhaustive" href="#TestSearchExhaustive">func TestSearchExhaustive(t *testing.T)</a>

```
searchKey: sort_test.TestSearchExhaustive
tags: [method private test]
```

```Go
func TestSearchExhaustive(t *testing.T)
```

Abstract exhaustive test: all sizes up to 100, all possible return values. If there are any small corner cases, this test exercises them. 

### <a id="TestSearchWrappers" href="#TestSearchWrappers">func TestSearchWrappers(t *testing.T)</a>

```
searchKey: sort_test.TestSearchWrappers
tags: [method private test]
```

```Go
func TestSearchWrappers(t *testing.T)
```

### <a id="TestSearchWrappersDontAlloc" href="#TestSearchWrappersDontAlloc">func TestSearchWrappersDontAlloc(t *testing.T)</a>

```
searchKey: sort_test.TestSearchWrappersDontAlloc
tags: [method private test]
```

```Go
func TestSearchWrappersDontAlloc(t *testing.T)
```

### <a id="TestSlice" href="#TestSlice">func TestSlice(t *testing.T)</a>

```
searchKey: sort_test.TestSlice
tags: [method private test]
```

```Go
func TestSlice(t *testing.T)
```

### <a id="TestSortBM" href="#TestSortBM">func TestSortBM(t *testing.T)</a>

```
searchKey: sort_test.TestSortBM
tags: [method private test]
```

```Go
func TestSortBM(t *testing.T)
```

### <a id="TestSortFloat64Slice" href="#TestSortFloat64Slice">func TestSortFloat64Slice(t *testing.T)</a>

```
searchKey: sort_test.TestSortFloat64Slice
tags: [method private test]
```

```Go
func TestSortFloat64Slice(t *testing.T)
```

### <a id="TestSortIntSlice" href="#TestSortIntSlice">func TestSortIntSlice(t *testing.T)</a>

```
searchKey: sort_test.TestSortIntSlice
tags: [method private test]
```

```Go
func TestSortIntSlice(t *testing.T)
```

### <a id="TestSortLarge_Random" href="#TestSortLarge_Random">func TestSortLarge_Random(t *testing.T)</a>

```
searchKey: sort_test.TestSortLarge_Random
tags: [method private test]
```

```Go
func TestSortLarge_Random(t *testing.T)
```

### <a id="TestSortStringSlice" href="#TestSortStringSlice">func TestSortStringSlice(t *testing.T)</a>

```
searchKey: sort_test.TestSortStringSlice
tags: [method private test]
```

```Go
func TestSortStringSlice(t *testing.T)
```

### <a id="TestStability" href="#TestStability">func TestStability(t *testing.T)</a>

```
searchKey: sort_test.TestStability
tags: [method private test]
```

```Go
func TestStability(t *testing.T)
```

### <a id="TestStableBM" href="#TestStableBM">func TestStableBM(t *testing.T)</a>

```
searchKey: sort_test.TestStableBM
tags: [method private test]
```

```Go
func TestStableBM(t *testing.T)
```

### <a id="TestStableInts" href="#TestStableInts">func TestStableInts(t *testing.T)</a>

```
searchKey: sort_test.TestStableInts
tags: [method private test]
```

```Go
func TestStableInts(t *testing.T)
```

### <a id="TestStrings" href="#TestStrings">func TestStrings(t *testing.T)</a>

```
searchKey: sort_test.TestStrings
tags: [method private test]
```

```Go
func TestStrings(t *testing.T)
```

### <a id="bench" href="#bench">func bench(b *testing.B, size int, algo func(Interface), name string)</a>

```
searchKey: sort_test.bench
tags: [method private]
```

```Go
func bench(b *testing.B, size int, algo func(Interface), name string)
```

### <a id="countOps" href="#countOps">func countOps(t *testing.T, algo func(Interface), name string)</a>

```
searchKey: sort_test.countOps
tags: [method private]
```

```Go
func countOps(t *testing.T, algo func(Interface), name string)
```

### <a id="f" href="#f">func f(a []int, x int) func(int) bool</a>

```
searchKey: sort_test.f
tags: [method private]
```

```Go
func f(a []int, x int) func(int) bool
```

### <a id="lg" href="#lg">func lg(n int) int</a>

```
searchKey: sort_test.lg
tags: [method private]
```

```Go
func lg(n int) int
```

### <a id="log2" href="#log2">func log2(x int) int</a>

```
searchKey: sort_test.log2
tags: [method private]
```

```Go
func log2(x int) int
```

log2 computes the binary logarithm of x, rounded up to the next integer. (log2(0) == 0, log2(1) == 0, log2(2) == 1, log2(3) == 2, etc.) 

### <a id="min" href="#min">func min(a, b int) int</a>

```
searchKey: sort_test.min
tags: [method private]
```

```Go
func min(a, b int) int
```

### <a id="printOrgans" href="#printOrgans">func printOrgans(s []*Organ)</a>

```
searchKey: sort_test.printOrgans
tags: [method private]
```

```Go
func printOrgans(s []*Organ)
```

### <a id="runSearchWrappers" href="#runSearchWrappers">func runSearchWrappers()</a>

```
searchKey: sort_test.runSearchWrappers
tags: [function private]
```

```Go
func runSearchWrappers()
```

### <a id="testBentleyMcIlroy" href="#testBentleyMcIlroy">func testBentleyMcIlroy(t *testing.T, sort func(Interface), maxswap func(int) int)</a>

```
searchKey: sort_test.testBentleyMcIlroy
tags: [method private]
```

```Go
func testBentleyMcIlroy(t *testing.T, sort func(Interface), maxswap func(int) int)
```

