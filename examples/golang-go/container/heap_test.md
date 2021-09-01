# Package heap_test

This example demonstrates an integer heap built using the heap interface. 

This example demonstrates a priority queue built using the heap interface. 

## Index

* [Types](#type)
    * [type IntHeap []int](#IntHeap)
        * [func (h IntHeap) Len() int](#IntHeap.Len)
        * [func (h IntHeap) Less(i, j int) bool](#IntHeap.Less)
        * [func (h *IntHeap) Pop() interface{}](#IntHeap.Pop)
        * [func (h *IntHeap) Push(x interface{})](#IntHeap.Push)
        * [func (h IntHeap) Swap(i, j int)](#IntHeap.Swap)
    * [type Item struct](#Item)
    * [type PriorityQueue []*heap_test.Item](#PriorityQueue)
        * [func (pq PriorityQueue) Len() int](#PriorityQueue.Len)
        * [func (pq PriorityQueue) Less(i, j int) bool](#PriorityQueue.Less)
        * [func (pq *PriorityQueue) Pop() interface{}](#PriorityQueue.Pop)
        * [func (pq *PriorityQueue) Push(x interface{})](#PriorityQueue.Push)
        * [func (pq PriorityQueue) Swap(i, j int)](#PriorityQueue.Swap)
        * [func (pq *PriorityQueue) update(item *Item, value string, priority int)](#PriorityQueue.update)
* [Functions](#func)
    * [func Example_intHeap()](#Example_intHeap)
    * [func Example_priorityQueue()](#Example_priorityQueue)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="IntHeap" href="#IntHeap">type IntHeap []int</a>

```
searchKey: heap_test.IntHeap
tags: [array number private]
```

```Go
type IntHeap []int
```

An IntHeap is a min-heap of ints. 

#### <a id="IntHeap.Len" href="#IntHeap.Len">func (h IntHeap) Len() int</a>

```
searchKey: heap_test.IntHeap.Len
tags: [method private]
```

```Go
func (h IntHeap) Len() int
```

#### <a id="IntHeap.Less" href="#IntHeap.Less">func (h IntHeap) Less(i, j int) bool</a>

```
searchKey: heap_test.IntHeap.Less
tags: [method private]
```

```Go
func (h IntHeap) Less(i, j int) bool
```

#### <a id="IntHeap.Pop" href="#IntHeap.Pop">func (h *IntHeap) Pop() interface{}</a>

```
searchKey: heap_test.IntHeap.Pop
tags: [method private]
```

```Go
func (h *IntHeap) Pop() interface{}
```

#### <a id="IntHeap.Push" href="#IntHeap.Push">func (h *IntHeap) Push(x interface{})</a>

```
searchKey: heap_test.IntHeap.Push
tags: [method private]
```

```Go
func (h *IntHeap) Push(x interface{})
```

#### <a id="IntHeap.Swap" href="#IntHeap.Swap">func (h IntHeap) Swap(i, j int)</a>

```
searchKey: heap_test.IntHeap.Swap
tags: [method private]
```

```Go
func (h IntHeap) Swap(i, j int)
```

### <a id="Item" href="#Item">type Item struct</a>

```
searchKey: heap_test.Item
tags: [struct private]
```

```Go
type Item struct {
	value    string // The value of the item; arbitrary.
	priority int    // The priority of the item in the queue.
	// The index is needed by update and is maintained by the heap.Interface methods.
	index int // The index of the item in the heap.
}
```

An Item is something we manage in a priority queue. 

### <a id="PriorityQueue" href="#PriorityQueue">type PriorityQueue []*heap_test.Item</a>

```
searchKey: heap_test.PriorityQueue
tags: [array struct private]
```

```Go
type PriorityQueue []*Item
```

A PriorityQueue implements heap.Interface and holds Items. 

#### <a id="PriorityQueue.Len" href="#PriorityQueue.Len">func (pq PriorityQueue) Len() int</a>

```
searchKey: heap_test.PriorityQueue.Len
tags: [method private]
```

```Go
func (pq PriorityQueue) Len() int
```

#### <a id="PriorityQueue.Less" href="#PriorityQueue.Less">func (pq PriorityQueue) Less(i, j int) bool</a>

```
searchKey: heap_test.PriorityQueue.Less
tags: [method private]
```

```Go
func (pq PriorityQueue) Less(i, j int) bool
```

#### <a id="PriorityQueue.Pop" href="#PriorityQueue.Pop">func (pq *PriorityQueue) Pop() interface{}</a>

```
searchKey: heap_test.PriorityQueue.Pop
tags: [method private]
```

```Go
func (pq *PriorityQueue) Pop() interface{}
```

#### <a id="PriorityQueue.Push" href="#PriorityQueue.Push">func (pq *PriorityQueue) Push(x interface{})</a>

```
searchKey: heap_test.PriorityQueue.Push
tags: [method private]
```

```Go
func (pq *PriorityQueue) Push(x interface{})
```

#### <a id="PriorityQueue.Swap" href="#PriorityQueue.Swap">func (pq PriorityQueue) Swap(i, j int)</a>

```
searchKey: heap_test.PriorityQueue.Swap
tags: [method private]
```

```Go
func (pq PriorityQueue) Swap(i, j int)
```

#### <a id="PriorityQueue.update" href="#PriorityQueue.update">func (pq *PriorityQueue) update(item *Item, value string, priority int)</a>

```
searchKey: heap_test.PriorityQueue.update
tags: [method private]
```

```Go
func (pq *PriorityQueue) update(item *Item, value string, priority int)
```

update modifies the priority and value of an Item in the queue. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Example_intHeap" href="#Example_intHeap">func Example_intHeap()</a>

```
searchKey: heap_test.Example_intHeap
tags: [function private]
```

```Go
func Example_intHeap()
```

This example inserts several ints into an IntHeap, checks the minimum, and removes them in order of priority. 

### <a id="Example_priorityQueue" href="#Example_priorityQueue">func Example_priorityQueue()</a>

```
searchKey: heap_test.Example_priorityQueue
tags: [function private]
```

```Go
func Example_priorityQueue()
```

This example creates a PriorityQueue with some items, adds and manipulates an item, and then removes the items in priority order. 

