# Package sort

Package sort provides primitives for sorting slices and user-defined collections. 

## Index

* [Variables](#var)
    * [var reflectSwapper](#reflectSwapper)
    * [var reflectValueOf](#reflectValueOf)
* [Types](#type)
    * [type Float64Slice []float64](#Float64Slice)
        * [func (x Float64Slice) Len() int](#Float64Slice.Len)
        * [func (x Float64Slice) Less(i, j int) bool](#Float64Slice.Less)
        * [func (p Float64Slice) Search(x float64) int](#Float64Slice.Search)
        * [func (x Float64Slice) Sort()](#Float64Slice.Sort)
        * [func (x Float64Slice) Swap(i, j int)](#Float64Slice.Swap)
    * [type IntSlice []int](#IntSlice)
        * [func (x IntSlice) Len() int](#IntSlice.Len)
        * [func (x IntSlice) Less(i, j int) bool](#IntSlice.Less)
        * [func (p IntSlice) Search(x int) int](#IntSlice.Search)
        * [func (x IntSlice) Sort()](#IntSlice.Sort)
        * [func (x IntSlice) Swap(i, j int)](#IntSlice.Swap)
    * [type Interface interface](#Interface)
        * [func Reverse(data Interface) Interface](#Reverse)
    * [type StringSlice []string](#StringSlice)
        * [func (x StringSlice) Len() int](#StringSlice.Len)
        * [func (x StringSlice) Less(i, j int) bool](#StringSlice.Less)
        * [func (p StringSlice) Search(x string) int](#StringSlice.Search)
        * [func (x StringSlice) Sort()](#StringSlice.Sort)
        * [func (x StringSlice) Swap(i, j int)](#StringSlice.Swap)
    * [type lessSwap struct](#lessSwap)
    * [type reverse struct](#reverse)
        * [func (r reverse) Less(i, j int) bool](#reverse.Less)
* [Functions](#func)
    * [func Float64s(x []float64)](#Float64s)
    * [func Float64sAreSorted(x []float64) bool](#Float64sAreSorted)
    * [func Heapsort(data Interface)](#Heapsort)
    * [func Ints(x []int)](#Ints)
    * [func IntsAreSorted(x []int) bool](#IntsAreSorted)
    * [func IsSorted(data Interface) bool](#IsSorted)
    * [func Search(n int, f func(int) bool) int](#Search)
    * [func SearchFloat64s(a []float64, x float64) int](#SearchFloat64s)
    * [func SearchInts(a []int, x int) int](#SearchInts)
    * [func SearchStrings(a []string, x string) int](#SearchStrings)
    * [func Slice(x interface{}, less func(i, j int) bool)](#Slice)
    * [func SliceIsSorted(x interface{}, less func(i, j int) bool) bool](#SliceIsSorted)
    * [func SliceStable(x interface{}, less func(i, j int) bool)](#SliceStable)
    * [func Sort(data Interface)](#Sort)
    * [func Stable(data Interface)](#Stable)
    * [func Strings(x []string)](#Strings)
    * [func StringsAreSorted(x []string) bool](#StringsAreSorted)
    * [func doPivot(data Interface, lo, hi int) (midlo, midhi int)](#doPivot)
    * [func doPivot_func(data lessSwap, lo, hi int) (midlo, midhi int)](#doPivot_func)
    * [func heapSort(data Interface, a, b int)](#heapSort)
    * [func heapSort_func(data lessSwap, a, b int)](#heapSort_func)
    * [func insertionSort(data Interface, a, b int)](#insertionSort)
    * [func insertionSort_func(data lessSwap, a, b int)](#insertionSort_func)
    * [func isNaN(f float64) bool](#isNaN)
    * [func maxDepth(n int) int](#maxDepth)
    * [func medianOfThree(data Interface, m1, m0, m2 int)](#medianOfThree)
    * [func medianOfThree_func(data lessSwap, m1, m0, m2 int)](#medianOfThree_func)
    * [func quickSort(data Interface, a, b, maxDepth int)](#quickSort)
    * [func quickSort_func(data lessSwap, a, b, maxDepth int)](#quickSort_func)
    * [func rotate(data Interface, a, m, b int)](#rotate)
    * [func rotate_func(data lessSwap, a, m, b int)](#rotate_func)
    * [func siftDown(data Interface, lo, hi, first int)](#siftDown)
    * [func siftDown_func(data lessSwap, lo, hi, first int)](#siftDown_func)
    * [func stable(data Interface, n int)](#stable)
    * [func stable_func(data lessSwap, n int)](#stable_func)
    * [func swapRange(data Interface, a, b, n int)](#swapRange)
    * [func swapRange_func(data lessSwap, a, b, n int)](#swapRange_func)
    * [func symMerge(data Interface, a, m, b int)](#symMerge)
    * [func symMerge_func(data lessSwap, a, m, b int)](#symMerge_func)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="reflectSwapper" href="#reflectSwapper">var reflectSwapper</a>

```
searchKey: sort.reflectSwapper
tags: [variable function private]
```

```Go
var reflectSwapper = reflectlite.Swapper
```

### <a id="reflectValueOf" href="#reflectValueOf">var reflectValueOf</a>

```
searchKey: sort.reflectValueOf
tags: [variable function private]
```

```Go
var reflectValueOf = reflectlite.ValueOf
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Float64Slice" href="#Float64Slice">type Float64Slice []float64</a>

```
searchKey: sort.Float64Slice
tags: [array number]
```

```Go
type Float64Slice []float64
```

Float64Slice implements Interface for a []float64, sorting in increasing order, with not-a-number (NaN) values ordered before other values. 

#### <a id="Float64Slice.Len" href="#Float64Slice.Len">func (x Float64Slice) Len() int</a>

```
searchKey: sort.Float64Slice.Len
tags: [function]
```

```Go
func (x Float64Slice) Len() int
```

#### <a id="Float64Slice.Less" href="#Float64Slice.Less">func (x Float64Slice) Less(i, j int) bool</a>

```
searchKey: sort.Float64Slice.Less
tags: [method]
```

```Go
func (x Float64Slice) Less(i, j int) bool
```

Less reports whether x[i] should be ordered before x[j], as required by the sort Interface. Note that floating-point comparison by itself is not a transitive relation: it does not report a consistent ordering for not-a-number (NaN) values. This implementation of Less places NaN values before any others, by using: 

```
x[i] < x[j] || (math.IsNaN(x[i]) && !math.IsNaN(x[j]))

```
#### <a id="Float64Slice.Search" href="#Float64Slice.Search">func (p Float64Slice) Search(x float64) int</a>

```
searchKey: sort.Float64Slice.Search
tags: [method]
```

```Go
func (p Float64Slice) Search(x float64) int
```

Search returns the result of applying SearchFloat64s to the receiver and x. 

#### <a id="Float64Slice.Sort" href="#Float64Slice.Sort">func (x Float64Slice) Sort()</a>

```
searchKey: sort.Float64Slice.Sort
tags: [function]
```

```Go
func (x Float64Slice) Sort()
```

Sort is a convenience method: x.Sort() calls Sort(x). 

#### <a id="Float64Slice.Swap" href="#Float64Slice.Swap">func (x Float64Slice) Swap(i, j int)</a>

```
searchKey: sort.Float64Slice.Swap
tags: [method]
```

```Go
func (x Float64Slice) Swap(i, j int)
```

### <a id="IntSlice" href="#IntSlice">type IntSlice []int</a>

```
searchKey: sort.IntSlice
tags: [array number]
```

```Go
type IntSlice []int
```

IntSlice attaches the methods of Interface to []int, sorting in increasing order. 

#### <a id="IntSlice.Len" href="#IntSlice.Len">func (x IntSlice) Len() int</a>

```
searchKey: sort.IntSlice.Len
tags: [function]
```

```Go
func (x IntSlice) Len() int
```

#### <a id="IntSlice.Less" href="#IntSlice.Less">func (x IntSlice) Less(i, j int) bool</a>

```
searchKey: sort.IntSlice.Less
tags: [method]
```

```Go
func (x IntSlice) Less(i, j int) bool
```

#### <a id="IntSlice.Search" href="#IntSlice.Search">func (p IntSlice) Search(x int) int</a>

```
searchKey: sort.IntSlice.Search
tags: [method]
```

```Go
func (p IntSlice) Search(x int) int
```

Search returns the result of applying SearchInts to the receiver and x. 

#### <a id="IntSlice.Sort" href="#IntSlice.Sort">func (x IntSlice) Sort()</a>

```
searchKey: sort.IntSlice.Sort
tags: [function]
```

```Go
func (x IntSlice) Sort()
```

Sort is a convenience method: x.Sort() calls Sort(x). 

#### <a id="IntSlice.Swap" href="#IntSlice.Swap">func (x IntSlice) Swap(i, j int)</a>

```
searchKey: sort.IntSlice.Swap
tags: [method]
```

```Go
func (x IntSlice) Swap(i, j int)
```

### <a id="Interface" href="#Interface">type Interface interface</a>

```
searchKey: sort.Interface
tags: [interface]
```

```Go
type Interface interface {
	// Len is the number of elements in the collection.
	Len() int

	// Less reports whether the element with index i
	// must sort before the element with index j.
	//
	// If both Less(i, j) and Less(j, i) are false,
	// then the elements at index i and j are considered equal.
	// Sort may place equal elements in any order in the final result,
	// while Stable preserves the original input order of equal elements.
	//
	// Less must describe a transitive ordering:
	//  - if both Less(i, j) and Less(j, k) are true, then Less(i, k) must be true as well.
	//  - if both Less(i, j) and Less(j, k) are false, then Less(i, k) must be false as well.
	//
	// Note that floating-point comparison (the < operator on float32 or float64 values)
	// is not a transitive ordering when not-a-number (NaN) values are involved.
	// See Float64Slice.Less for a correct implementation for floating-point values.
	Less(i, j int) bool

	// Swap swaps the elements with indexes i and j.
	Swap(i, j int)
}
```

An implementation of Interface can be sorted by the routines in this package. The methods refer to elements of the underlying collection by integer index. 

#### <a id="Reverse" href="#Reverse">func Reverse(data Interface) Interface</a>

```
searchKey: sort.Reverse
tags: [method]
```

```Go
func Reverse(data Interface) Interface
```

Reverse returns the reverse order for data. 

### <a id="StringSlice" href="#StringSlice">type StringSlice []string</a>

```
searchKey: sort.StringSlice
tags: [array string]
```

```Go
type StringSlice []string
```

StringSlice attaches the methods of Interface to []string, sorting in increasing order. 

#### <a id="StringSlice.Len" href="#StringSlice.Len">func (x StringSlice) Len() int</a>

```
searchKey: sort.StringSlice.Len
tags: [function]
```

```Go
func (x StringSlice) Len() int
```

#### <a id="StringSlice.Less" href="#StringSlice.Less">func (x StringSlice) Less(i, j int) bool</a>

```
searchKey: sort.StringSlice.Less
tags: [method]
```

```Go
func (x StringSlice) Less(i, j int) bool
```

#### <a id="StringSlice.Search" href="#StringSlice.Search">func (p StringSlice) Search(x string) int</a>

```
searchKey: sort.StringSlice.Search
tags: [method]
```

```Go
func (p StringSlice) Search(x string) int
```

Search returns the result of applying SearchStrings to the receiver and x. 

#### <a id="StringSlice.Sort" href="#StringSlice.Sort">func (x StringSlice) Sort()</a>

```
searchKey: sort.StringSlice.Sort
tags: [function]
```

```Go
func (x StringSlice) Sort()
```

Sort is a convenience method: x.Sort() calls Sort(x). 

#### <a id="StringSlice.Swap" href="#StringSlice.Swap">func (x StringSlice) Swap(i, j int)</a>

```
searchKey: sort.StringSlice.Swap
tags: [method]
```

```Go
func (x StringSlice) Swap(i, j int)
```

### <a id="lessSwap" href="#lessSwap">type lessSwap struct</a>

```
searchKey: sort.lessSwap
tags: [struct private]
```

```Go
type lessSwap struct {
	Less func(i, j int) bool
	Swap func(i, j int)
}
```

lessSwap is a pair of Less and Swap function for use with the auto-generated func-optimized variant of sort.go in zfuncversion.go. 

### <a id="reverse" href="#reverse">type reverse struct</a>

```
searchKey: sort.reverse
tags: [struct private]
```

```Go
type reverse struct {
	// This embedded Interface permits Reverse to use the methods of
	// another Interface implementation.
	Interface
}
```

#### <a id="reverse.Less" href="#reverse.Less">func (r reverse) Less(i, j int) bool</a>

```
searchKey: sort.reverse.Less
tags: [method private]
```

```Go
func (r reverse) Less(i, j int) bool
```

Less returns the opposite of the embedded implementation's Less method. 

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="Float64s" href="#Float64s">func Float64s(x []float64)</a>

```
searchKey: sort.Float64s
tags: [method]
```

```Go
func Float64s(x []float64)
```

Float64s sorts a slice of float64s in increasing order. Not-a-number (NaN) values are ordered before other values. 

### <a id="Float64sAreSorted" href="#Float64sAreSorted">func Float64sAreSorted(x []float64) bool</a>

```
searchKey: sort.Float64sAreSorted
tags: [method]
```

```Go
func Float64sAreSorted(x []float64) bool
```

Float64sAreSorted reports whether the slice x is sorted in increasing order, with not-a-number (NaN) values before any other values. 

### <a id="Heapsort" href="#Heapsort">func Heapsort(data Interface)</a>

```
searchKey: sort.Heapsort
tags: [method private]
```

```Go
func Heapsort(data Interface)
```

### <a id="Ints" href="#Ints">func Ints(x []int)</a>

```
searchKey: sort.Ints
tags: [method]
```

```Go
func Ints(x []int)
```

Ints sorts a slice of ints in increasing order. 

### <a id="IntsAreSorted" href="#IntsAreSorted">func IntsAreSorted(x []int) bool</a>

```
searchKey: sort.IntsAreSorted
tags: [method]
```

```Go
func IntsAreSorted(x []int) bool
```

IntsAreSorted reports whether the slice x is sorted in increasing order. 

### <a id="IsSorted" href="#IsSorted">func IsSorted(data Interface) bool</a>

```
searchKey: sort.IsSorted
tags: [method]
```

```Go
func IsSorted(data Interface) bool
```

IsSorted reports whether data is sorted. 

### <a id="Search" href="#Search">func Search(n int, f func(int) bool) int</a>

```
searchKey: sort.Search
tags: [method]
```

```Go
func Search(n int, f func(int) bool) int
```

Search uses binary search to find and return the smallest index i in [0, n) at which f(i) is true, assuming that on the range [0, n), f(i) == true implies f(i+1) == true. That is, Search requires that f is false for some (possibly empty) prefix of the input range [0, n) and then true for the (possibly empty) remainder; Search returns the first true index. If there is no such index, Search returns n. (Note that the "not found" return value is not -1 as in, for instance, strings.Index.) Search calls f(i) only for i in the range [0, n). 

A common use of Search is to find the index i for a value x in a sorted, indexable data structure such as an array or slice. In this case, the argument f, typically a closure, captures the value to be searched for, and how the data structure is indexed and ordered. 

For instance, given a slice data sorted in ascending order, the call Search(len(data), func(i int) bool { return data[i] >= 23 }) returns the smallest index i such that data[i] >= 23. If the caller wants to find whether 23 is in the slice, it must test data[i] == 23 separately. 

Searching data sorted in descending order would use the <= operator instead of the >= operator. 

To complete the example above, the following code tries to find the value x in an integer slice data sorted in ascending order: 

```
x := 23
i := sort.Search(len(data), func(i int) bool { return data[i] >= x })
if i < len(data) && data[i] == x {
	// x is present at data[i]
} else {
	// x is not present in data,
	// but i is the index where it would be inserted.
}

```
As a more whimsical example, this program guesses your number: 

```
func GuessingGame() {
	var s string
	fmt.Printf("Pick an integer from 0 to 100.\n")
	answer := sort.Search(100, func(i int) bool {
		fmt.Printf("Is your number <= %d? ", i)
		fmt.Scanf("%s", &s)
		return s != "" && s[0] == 'y'
	})
	fmt.Printf("Your number is %d.\n", answer)
}

```
### <a id="SearchFloat64s" href="#SearchFloat64s">func SearchFloat64s(a []float64, x float64) int</a>

```
searchKey: sort.SearchFloat64s
tags: [method]
```

```Go
func SearchFloat64s(a []float64, x float64) int
```

SearchFloat64s searches for x in a sorted slice of float64s and returns the index as specified by Search. The return value is the index to insert x if x is not present (it could be len(a)). The slice must be sorted in ascending order. 

### <a id="SearchInts" href="#SearchInts">func SearchInts(a []int, x int) int</a>

```
searchKey: sort.SearchInts
tags: [method]
```

```Go
func SearchInts(a []int, x int) int
```

SearchInts searches for x in a sorted slice of ints and returns the index as specified by Search. The return value is the index to insert x if x is not present (it could be len(a)). The slice must be sorted in ascending order. 

### <a id="SearchStrings" href="#SearchStrings">func SearchStrings(a []string, x string) int</a>

```
searchKey: sort.SearchStrings
tags: [method]
```

```Go
func SearchStrings(a []string, x string) int
```

SearchStrings searches for x in a sorted slice of strings and returns the index as specified by Search. The return value is the index to insert x if x is not present (it could be len(a)). The slice must be sorted in ascending order. 

### <a id="Slice" href="#Slice">func Slice(x interface{}, less func(i, j int) bool)</a>

```
searchKey: sort.Slice
tags: [method]
```

```Go
func Slice(x interface{}, less func(i, j int) bool)
```

Slice sorts the slice x given the provided less function. It panics if x is not a slice. 

The sort is not guaranteed to be stable: equal elements may be reversed from their original order. For a stable sort, use SliceStable. 

The less function must satisfy the same requirements as the Interface type's Less method. 

### <a id="SliceIsSorted" href="#SliceIsSorted">func SliceIsSorted(x interface{}, less func(i, j int) bool) bool</a>

```
searchKey: sort.SliceIsSorted
tags: [method]
```

```Go
func SliceIsSorted(x interface{}, less func(i, j int) bool) bool
```

SliceIsSorted reports whether the slice x is sorted according to the provided less function. It panics if x is not a slice. 

### <a id="SliceStable" href="#SliceStable">func SliceStable(x interface{}, less func(i, j int) bool)</a>

```
searchKey: sort.SliceStable
tags: [method]
```

```Go
func SliceStable(x interface{}, less func(i, j int) bool)
```

SliceStable sorts the slice x using the provided less function, keeping equal elements in their original order. It panics if x is not a slice. 

The less function must satisfy the same requirements as the Interface type's Less method. 

### <a id="Sort" href="#Sort">func Sort(data Interface)</a>

```
searchKey: sort.Sort
tags: [method]
```

```Go
func Sort(data Interface)
```

Sort sorts data. It makes one call to data.Len to determine n and O(n*log(n)) calls to data.Less and data.Swap. The sort is not guaranteed to be stable. 

### <a id="Stable" href="#Stable">func Stable(data Interface)</a>

```
searchKey: sort.Stable
tags: [method]
```

```Go
func Stable(data Interface)
```

Stable sorts data while keeping the original order of equal elements. 

It makes one call to data.Len to determine n, O(n*log(n)) calls to data.Less and O(n*log(n)*log(n)) calls to data.Swap. 

### <a id="Strings" href="#Strings">func Strings(x []string)</a>

```
searchKey: sort.Strings
tags: [method]
```

```Go
func Strings(x []string)
```

Strings sorts a slice of strings in increasing order. 

### <a id="StringsAreSorted" href="#StringsAreSorted">func StringsAreSorted(x []string) bool</a>

```
searchKey: sort.StringsAreSorted
tags: [method]
```

```Go
func StringsAreSorted(x []string) bool
```

StringsAreSorted reports whether the slice x is sorted in increasing order. 

### <a id="doPivot" href="#doPivot">func doPivot(data Interface, lo, hi int) (midlo, midhi int)</a>

```
searchKey: sort.doPivot
tags: [method private]
```

```Go
func doPivot(data Interface, lo, hi int) (midlo, midhi int)
```

### <a id="doPivot_func" href="#doPivot_func">func doPivot_func(data lessSwap, lo, hi int) (midlo, midhi int)</a>

```
searchKey: sort.doPivot_func
tags: [method private]
```

```Go
func doPivot_func(data lessSwap, lo, hi int) (midlo, midhi int)
```

Auto-generated variant of sort.go:doPivot 

### <a id="heapSort" href="#heapSort">func heapSort(data Interface, a, b int)</a>

```
searchKey: sort.heapSort
tags: [method private]
```

```Go
func heapSort(data Interface, a, b int)
```

### <a id="heapSort_func" href="#heapSort_func">func heapSort_func(data lessSwap, a, b int)</a>

```
searchKey: sort.heapSort_func
tags: [method private]
```

```Go
func heapSort_func(data lessSwap, a, b int)
```

Auto-generated variant of sort.go:heapSort 

### <a id="insertionSort" href="#insertionSort">func insertionSort(data Interface, a, b int)</a>

```
searchKey: sort.insertionSort
tags: [method private]
```

```Go
func insertionSort(data Interface, a, b int)
```

insertionSort sorts data[a:b] using insertion sort. 

### <a id="insertionSort_func" href="#insertionSort_func">func insertionSort_func(data lessSwap, a, b int)</a>

```
searchKey: sort.insertionSort_func
tags: [method private]
```

```Go
func insertionSort_func(data lessSwap, a, b int)
```

Auto-generated variant of sort.go:insertionSort 

### <a id="isNaN" href="#isNaN">func isNaN(f float64) bool</a>

```
searchKey: sort.isNaN
tags: [method private]
```

```Go
func isNaN(f float64) bool
```

isNaN is a copy of math.IsNaN to avoid a dependency on the math package. 

### <a id="maxDepth" href="#maxDepth">func maxDepth(n int) int</a>

```
searchKey: sort.maxDepth
tags: [method private]
```

```Go
func maxDepth(n int) int
```

maxDepth returns a threshold at which quicksort should switch to heapsort. It returns 2*ceil(lg(n+1)). 

### <a id="medianOfThree" href="#medianOfThree">func medianOfThree(data Interface, m1, m0, m2 int)</a>

```
searchKey: sort.medianOfThree
tags: [method private]
```

```Go
func medianOfThree(data Interface, m1, m0, m2 int)
```

medianOfThree moves the median of the three values data[m0], data[m1], data[m2] into data[m1]. 

### <a id="medianOfThree_func" href="#medianOfThree_func">func medianOfThree_func(data lessSwap, m1, m0, m2 int)</a>

```
searchKey: sort.medianOfThree_func
tags: [method private]
```

```Go
func medianOfThree_func(data lessSwap, m1, m0, m2 int)
```

Auto-generated variant of sort.go:medianOfThree 

### <a id="quickSort" href="#quickSort">func quickSort(data Interface, a, b, maxDepth int)</a>

```
searchKey: sort.quickSort
tags: [method private]
```

```Go
func quickSort(data Interface, a, b, maxDepth int)
```

### <a id="quickSort_func" href="#quickSort_func">func quickSort_func(data lessSwap, a, b, maxDepth int)</a>

```
searchKey: sort.quickSort_func
tags: [method private]
```

```Go
func quickSort_func(data lessSwap, a, b, maxDepth int)
```

Auto-generated variant of sort.go:quickSort 

### <a id="rotate" href="#rotate">func rotate(data Interface, a, m, b int)</a>

```
searchKey: sort.rotate
tags: [method private]
```

```Go
func rotate(data Interface, a, m, b int)
```

rotate rotates two consecutive blocks u = data[a:m] and v = data[m:b] in data: Data of the form 'x u v y' is changed to 'x v u y'. rotate performs at most b-a many calls to data.Swap, and it assumes non-degenerate arguments: a < m && m < b. 

### <a id="rotate_func" href="#rotate_func">func rotate_func(data lessSwap, a, m, b int)</a>

```
searchKey: sort.rotate_func
tags: [method private]
```

```Go
func rotate_func(data lessSwap, a, m, b int)
```

Auto-generated variant of sort.go:rotate 

### <a id="siftDown" href="#siftDown">func siftDown(data Interface, lo, hi, first int)</a>

```
searchKey: sort.siftDown
tags: [method private]
```

```Go
func siftDown(data Interface, lo, hi, first int)
```

siftDown implements the heap property on data[lo:hi]. first is an offset into the array where the root of the heap lies. 

### <a id="siftDown_func" href="#siftDown_func">func siftDown_func(data lessSwap, lo, hi, first int)</a>

```
searchKey: sort.siftDown_func
tags: [method private]
```

```Go
func siftDown_func(data lessSwap, lo, hi, first int)
```

Auto-generated variant of sort.go:siftDown 

### <a id="stable" href="#stable">func stable(data Interface, n int)</a>

```
searchKey: sort.stable
tags: [method private]
```

```Go
func stable(data Interface, n int)
```

### <a id="stable_func" href="#stable_func">func stable_func(data lessSwap, n int)</a>

```
searchKey: sort.stable_func
tags: [method private]
```

```Go
func stable_func(data lessSwap, n int)
```

Auto-generated variant of sort.go:stable 

### <a id="swapRange" href="#swapRange">func swapRange(data Interface, a, b, n int)</a>

```
searchKey: sort.swapRange
tags: [method private]
```

```Go
func swapRange(data Interface, a, b, n int)
```

### <a id="swapRange_func" href="#swapRange_func">func swapRange_func(data lessSwap, a, b, n int)</a>

```
searchKey: sort.swapRange_func
tags: [method private]
```

```Go
func swapRange_func(data lessSwap, a, b, n int)
```

Auto-generated variant of sort.go:swapRange 

### <a id="symMerge" href="#symMerge">func symMerge(data Interface, a, m, b int)</a>

```
searchKey: sort.symMerge
tags: [method private]
```

```Go
func symMerge(data Interface, a, m, b int)
```

symMerge merges the two sorted subsequences data[a:m] and data[m:b] using the SymMerge algorithm from Pok-Son Kim and Arne Kutzner, "Stable Minimum Storage Merging by Symmetric Comparisons", in Susanne Albers and Tomasz Radzik, editors, Algorithms - ESA 2004, volume 3221 of Lecture Notes in Computer Science, pages 714-723. Springer, 2004. 

Let M = m-a and N = b-n. Wolog M < N. The recursion depth is bound by ceil(log(N+M)). The algorithm needs O(M*log(N/M + 1)) calls to data.Less. The algorithm needs O((M+N)*log(M)) calls to data.Swap. 

The paper gives O((M+N)*log(M)) as the number of assignments assuming a rotation algorithm which uses O(M+N+gcd(M+N)) assignments. The argumentation in the paper carries through for Swap operations, especially as the block swapping rotate uses only O(M+N) Swaps. 

symMerge assumes non-degenerate arguments: a < m && m < b. Having the caller check this condition eliminates many leaf recursion calls, which improves performance. 

### <a id="symMerge_func" href="#symMerge_func">func symMerge_func(data lessSwap, a, m, b int)</a>

```
searchKey: sort.symMerge_func
tags: [method private]
```

```Go
func symMerge_func(data lessSwap, a, m, b int)
```

Auto-generated variant of sort.go:symMerge 

