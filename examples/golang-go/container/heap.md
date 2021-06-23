# Package heap

Package heap provides heap operations for any type that implements heap.Interface. A heap is a tree with the property that each node is the minimum-valued node in its subtree. 

The minimum element in the tree is the root, at index 0. 

A heap is a common way to implement a priority queue. To build a priority queue, implement the Heap interface with the (negative) priority as the ordering for the Less method, so Push adds items while Pop removes the highest-priority item from the queue. The Examples include such an implementation; the file example_pq_test.go has the complete source. 

## Index

* [Types](#type)
    * [type Interface interface](#Interface)
    * [type myHeap []int](#myHeap)
        * [func (h *myHeap) Less(i, j int) bool](#myHeap.Less)
        * [func (h *myHeap) Swap(i, j int)](#myHeap.Swap)
        * [func (h *myHeap) Len() int](#myHeap.Len)
        * [func (h *myHeap) Pop() (v interface{})](#myHeap.Pop)
        * [func (h *myHeap) Push(v interface{})](#myHeap.Push)
        * [func (h myHeap) verify(t *testing.T, i int)](#myHeap.verify)
* [Functions](#func)
    * [func Init(h Interface)](#Init)
    * [func Push(h Interface, x interface{})](#Push)
    * [func Pop(h Interface) interface{}](#Pop)
    * [func Remove(h Interface, i int) interface{}](#Remove)
    * [func Fix(h Interface, i int)](#Fix)
    * [func up(h Interface, j int)](#up)
    * [func down(h Interface, i0, n int) bool](#down)
    * [func TestInit0(t *testing.T)](#TestInit0)
    * [func TestInit1(t *testing.T)](#TestInit1)
    * [func Test(t *testing.T)](#Test)
    * [func TestRemove0(t *testing.T)](#TestRemove0)
    * [func TestRemove1(t *testing.T)](#TestRemove1)
    * [func TestRemove2(t *testing.T)](#TestRemove2)
    * [func BenchmarkDup(b *testing.B)](#BenchmarkDup)
    * [func TestFix(t *testing.T)](#TestFix)


## <a id="type" href="#type">Types</a>

### <a id="Interface" href="#Interface">type Interface interface</a>

```
searchKey: heap.Interface
```

```Go
type Interface interface {
	sort.Interface
	Push(x interface{}) // add x as element Len()
	Pop() interface{}   // remove and return element Len() - 1.
}
```

The Interface type describes the requirements for a type using the routines in this package. Any type that implements it may be used as a min-heap with the following invariants (established after Init has been called or if the data is empty or sorted): 

```
!h.Less(j, i) for 0 <= i < h.Len() and 2*i+1 <= j <= 2*i+2 and j < h.Len()

```
Note that Push and Pop in this interface are for package heap's implementation to call. To add and remove things from the heap, use heap.Push and heap.Pop. 

### <a id="myHeap" href="#myHeap">type myHeap []int</a>

```
searchKey: heap.myHeap
tags: [private]
```

```Go
type myHeap []int
```

#### <a id="myHeap.Less" href="#myHeap.Less">func (h *myHeap) Less(i, j int) bool</a>

```
searchKey: heap.myHeap.Less
tags: [private]
```

```Go
func (h *myHeap) Less(i, j int) bool
```

#### <a id="myHeap.Swap" href="#myHeap.Swap">func (h *myHeap) Swap(i, j int)</a>

```
searchKey: heap.myHeap.Swap
tags: [private]
```

```Go
func (h *myHeap) Swap(i, j int)
```

#### <a id="myHeap.Len" href="#myHeap.Len">func (h *myHeap) Len() int</a>

```
searchKey: heap.myHeap.Len
tags: [private]
```

```Go
func (h *myHeap) Len() int
```

#### <a id="myHeap.Pop" href="#myHeap.Pop">func (h *myHeap) Pop() (v interface{})</a>

```
searchKey: heap.myHeap.Pop
tags: [private]
```

```Go
func (h *myHeap) Pop() (v interface{})
```

#### <a id="myHeap.Push" href="#myHeap.Push">func (h *myHeap) Push(v interface{})</a>

```
searchKey: heap.myHeap.Push
tags: [private]
```

```Go
func (h *myHeap) Push(v interface{})
```

#### <a id="myHeap.verify" href="#myHeap.verify">func (h myHeap) verify(t *testing.T, i int)</a>

```
searchKey: heap.myHeap.verify
tags: [private]
```

```Go
func (h myHeap) verify(t *testing.T, i int)
```

## <a id="func" href="#func">Functions</a>

### <a id="Init" href="#Init">func Init(h Interface)</a>

```
searchKey: heap.Init
```

```Go
func Init(h Interface)
```

Init establishes the heap invariants required by the other routines in this package. Init is idempotent with respect to the heap invariants and may be called whenever the heap invariants may have been invalidated. The complexity is O(n) where n = h.Len(). 

### <a id="Push" href="#Push">func Push(h Interface, x interface{})</a>

```
searchKey: heap.Push
```

```Go
func Push(h Interface, x interface{})
```

Push pushes the element x onto the heap. The complexity is O(log n) where n = h.Len(). 

### <a id="Pop" href="#Pop">func Pop(h Interface) interface{}</a>

```
searchKey: heap.Pop
```

```Go
func Pop(h Interface) interface{}
```

Pop removes and returns the minimum element (according to Less) from the heap. The complexity is O(log n) where n = h.Len(). Pop is equivalent to Remove(h, 0). 

### <a id="Remove" href="#Remove">func Remove(h Interface, i int) interface{}</a>

```
searchKey: heap.Remove
```

```Go
func Remove(h Interface, i int) interface{}
```

Remove removes and returns the element at index i from the heap. The complexity is O(log n) where n = h.Len(). 

### <a id="Fix" href="#Fix">func Fix(h Interface, i int)</a>

```
searchKey: heap.Fix
```

```Go
func Fix(h Interface, i int)
```

Fix re-establishes the heap ordering after the element at index i has changed its value. Changing the value of the element at index i and then calling Fix is equivalent to, but less expensive than, calling Remove(h, i) followed by a Push of the new value. The complexity is O(log n) where n = h.Len(). 

### <a id="up" href="#up">func up(h Interface, j int)</a>

```
searchKey: heap.up
tags: [private]
```

```Go
func up(h Interface, j int)
```

### <a id="down" href="#down">func down(h Interface, i0, n int) bool</a>

```
searchKey: heap.down
tags: [private]
```

```Go
func down(h Interface, i0, n int) bool
```

### <a id="TestInit0" href="#TestInit0">func TestInit0(t *testing.T)</a>

```
searchKey: heap.TestInit0
tags: [private]
```

```Go
func TestInit0(t *testing.T)
```

### <a id="TestInit1" href="#TestInit1">func TestInit1(t *testing.T)</a>

```
searchKey: heap.TestInit1
tags: [private]
```

```Go
func TestInit1(t *testing.T)
```

### <a id="Test" href="#Test">func Test(t *testing.T)</a>

```
searchKey: heap.Test
tags: [private]
```

```Go
func Test(t *testing.T)
```

### <a id="TestRemove0" href="#TestRemove0">func TestRemove0(t *testing.T)</a>

```
searchKey: heap.TestRemove0
tags: [private]
```

```Go
func TestRemove0(t *testing.T)
```

### <a id="TestRemove1" href="#TestRemove1">func TestRemove1(t *testing.T)</a>

```
searchKey: heap.TestRemove1
tags: [private]
```

```Go
func TestRemove1(t *testing.T)
```

### <a id="TestRemove2" href="#TestRemove2">func TestRemove2(t *testing.T)</a>

```
searchKey: heap.TestRemove2
tags: [private]
```

```Go
func TestRemove2(t *testing.T)
```

### <a id="BenchmarkDup" href="#BenchmarkDup">func BenchmarkDup(b *testing.B)</a>

```
searchKey: heap.BenchmarkDup
tags: [private]
```

```Go
func BenchmarkDup(b *testing.B)
```

### <a id="TestFix" href="#TestFix">func TestFix(t *testing.T)</a>

```
searchKey: heap.TestFix
tags: [private]
```

```Go
func TestFix(t *testing.T)
```

