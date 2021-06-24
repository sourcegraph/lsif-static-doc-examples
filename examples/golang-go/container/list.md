# Package list

Package list implements a doubly linked list. 

To iterate over a list (where l is a *List): 

```
for e := l.Front(); e != nil; e = e.Next() {
	// do something with e.Value
}

```
## Index

* [Types](#type)
    * [type Element struct](#Element)
        * [func (e *Element) Next() *Element](#Element.Next)
        * [func (e *Element) Prev() *Element](#Element.Prev)
    * [type List struct](#List)
        * [func New() *List](#New)
        * [func (l *List) Back() *Element](#List.Back)
        * [func (l *List) Front() *Element](#List.Front)
        * [func (l *List) Init() *List](#List.Init)
        * [func (l *List) InsertAfter(v interface{}, mark *Element) *Element](#List.InsertAfter)
        * [func (l *List) InsertBefore(v interface{}, mark *Element) *Element](#List.InsertBefore)
        * [func (l *List) Len() int](#List.Len)
        * [func (l *List) MoveAfter(e, mark *Element)](#List.MoveAfter)
        * [func (l *List) MoveBefore(e, mark *Element)](#List.MoveBefore)
        * [func (l *List) MoveToBack(e *Element)](#List.MoveToBack)
        * [func (l *List) MoveToFront(e *Element)](#List.MoveToFront)
        * [func (l *List) PushBack(v interface{}) *Element](#List.PushBack)
        * [func (l *List) PushBackList(other *List)](#List.PushBackList)
        * [func (l *List) PushFront(v interface{}) *Element](#List.PushFront)
        * [func (l *List) PushFrontList(other *List)](#List.PushFrontList)
        * [func (l *List) Remove(e *Element) interface{}](#List.Remove)
        * [func (l *List) insert(e, at *Element) *Element](#List.insert)
        * [func (l *List) insertValue(v interface{}, at *Element) *Element](#List.insertValue)
        * [func (l *List) lazyInit()](#List.lazyInit)
        * [func (l *List) move(e, at *Element) *Element](#List.move)
        * [func (l *List) remove(e *Element) *Element](#List.remove)
* [Functions](#func)
    * [func TestExtending(t *testing.T)](#TestExtending)
    * [func TestInsertAfterUnknownMark(t *testing.T)](#TestInsertAfterUnknownMark)
    * [func TestInsertBeforeUnknownMark(t *testing.T)](#TestInsertBeforeUnknownMark)
    * [func TestIssue4103(t *testing.T)](#TestIssue4103)
    * [func TestIssue6349(t *testing.T)](#TestIssue6349)
    * [func TestList(t *testing.T)](#TestList)
    * [func TestMove(t *testing.T)](#TestMove)
    * [func TestMoveUnknownMark(t *testing.T)](#TestMoveUnknownMark)
    * [func TestRemove(t *testing.T)](#TestRemove)
    * [func TestZeroList(t *testing.T)](#TestZeroList)
    * [func checkList(t *testing.T, l *List, es []interface{})](#checkList)
    * [func checkListLen(t *testing.T, l *List, len int) bool](#checkListLen)
    * [func checkListPointers(t *testing.T, l *List, es []*Element)](#checkListPointers)


## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Element" href="#Element">type Element struct</a>

```
searchKey: list.Element
tags: [struct]
```

```Go
type Element struct {
	// Next and previous pointers in the doubly-linked list of elements.
	// To simplify the implementation, internally a list l is implemented
	// as a ring, such that &l.root is both the next element of the last
	// list element (l.Back()) and the previous element of the first list
	// element (l.Front()).
	next, prev *Element

	// The list to which this element belongs.
	list *List

	// The value stored with this element.
	Value interface{}
}
```

Element is an element of a linked list. 

#### <a id="Element.Next" href="#Element.Next">func (e *Element) Next() *Element</a>

```
searchKey: list.Element.Next
tags: [function]
```

```Go
func (e *Element) Next() *Element
```

Next returns the next list element or nil. 

#### <a id="Element.Prev" href="#Element.Prev">func (e *Element) Prev() *Element</a>

```
searchKey: list.Element.Prev
tags: [function]
```

```Go
func (e *Element) Prev() *Element
```

Prev returns the previous list element or nil. 

### <a id="List" href="#List">type List struct</a>

```
searchKey: list.List
tags: [struct]
```

```Go
type List struct {
	root Element // sentinel list element, only &root, root.prev, and root.next are used
	len  int     // current list length excluding (this) sentinel element
}
```

List represents a doubly linked list. The zero value for List is an empty list ready to use. 

#### <a id="New" href="#New">func New() *List</a>

```
searchKey: list.New
tags: [function]
```

```Go
func New() *List
```

New returns an initialized list. 

#### <a id="List.Back" href="#List.Back">func (l *List) Back() *Element</a>

```
searchKey: list.List.Back
tags: [function]
```

```Go
func (l *List) Back() *Element
```

Back returns the last element of list l or nil if the list is empty. 

#### <a id="List.Front" href="#List.Front">func (l *List) Front() *Element</a>

```
searchKey: list.List.Front
tags: [function]
```

```Go
func (l *List) Front() *Element
```

Front returns the first element of list l or nil if the list is empty. 

#### <a id="List.Init" href="#List.Init">func (l *List) Init() *List</a>

```
searchKey: list.List.Init
tags: [function]
```

```Go
func (l *List) Init() *List
```

Init initializes or clears list l. 

#### <a id="List.InsertAfter" href="#List.InsertAfter">func (l *List) InsertAfter(v interface{}, mark *Element) *Element</a>

```
searchKey: list.List.InsertAfter
tags: [method]
```

```Go
func (l *List) InsertAfter(v interface{}, mark *Element) *Element
```

InsertAfter inserts a new element e with value v immediately after mark and returns e. If mark is not an element of l, the list is not modified. The mark must not be nil. 

#### <a id="List.InsertBefore" href="#List.InsertBefore">func (l *List) InsertBefore(v interface{}, mark *Element) *Element</a>

```
searchKey: list.List.InsertBefore
tags: [method]
```

```Go
func (l *List) InsertBefore(v interface{}, mark *Element) *Element
```

InsertBefore inserts a new element e with value v immediately before mark and returns e. If mark is not an element of l, the list is not modified. The mark must not be nil. 

#### <a id="List.Len" href="#List.Len">func (l *List) Len() int</a>

```
searchKey: list.List.Len
tags: [function]
```

```Go
func (l *List) Len() int
```

Len returns the number of elements of list l. The complexity is O(1). 

#### <a id="List.MoveAfter" href="#List.MoveAfter">func (l *List) MoveAfter(e, mark *Element)</a>

```
searchKey: list.List.MoveAfter
tags: [method]
```

```Go
func (l *List) MoveAfter(e, mark *Element)
```

MoveAfter moves element e to its new position after mark. If e or mark is not an element of l, or e == mark, the list is not modified. The element and mark must not be nil. 

#### <a id="List.MoveBefore" href="#List.MoveBefore">func (l *List) MoveBefore(e, mark *Element)</a>

```
searchKey: list.List.MoveBefore
tags: [method]
```

```Go
func (l *List) MoveBefore(e, mark *Element)
```

MoveBefore moves element e to its new position before mark. If e or mark is not an element of l, or e == mark, the list is not modified. The element and mark must not be nil. 

#### <a id="List.MoveToBack" href="#List.MoveToBack">func (l *List) MoveToBack(e *Element)</a>

```
searchKey: list.List.MoveToBack
tags: [method]
```

```Go
func (l *List) MoveToBack(e *Element)
```

MoveToBack moves element e to the back of list l. If e is not an element of l, the list is not modified. The element must not be nil. 

#### <a id="List.MoveToFront" href="#List.MoveToFront">func (l *List) MoveToFront(e *Element)</a>

```
searchKey: list.List.MoveToFront
tags: [method]
```

```Go
func (l *List) MoveToFront(e *Element)
```

MoveToFront moves element e to the front of list l. If e is not an element of l, the list is not modified. The element must not be nil. 

#### <a id="List.PushBack" href="#List.PushBack">func (l *List) PushBack(v interface{}) *Element</a>

```
searchKey: list.List.PushBack
tags: [method]
```

```Go
func (l *List) PushBack(v interface{}) *Element
```

PushBack inserts a new element e with value v at the back of list l and returns e. 

#### <a id="List.PushBackList" href="#List.PushBackList">func (l *List) PushBackList(other *List)</a>

```
searchKey: list.List.PushBackList
tags: [method]
```

```Go
func (l *List) PushBackList(other *List)
```

PushBackList inserts a copy of another list at the back of list l. The lists l and other may be the same. They must not be nil. 

#### <a id="List.PushFront" href="#List.PushFront">func (l *List) PushFront(v interface{}) *Element</a>

```
searchKey: list.List.PushFront
tags: [method]
```

```Go
func (l *List) PushFront(v interface{}) *Element
```

PushFront inserts a new element e with value v at the front of list l and returns e. 

#### <a id="List.PushFrontList" href="#List.PushFrontList">func (l *List) PushFrontList(other *List)</a>

```
searchKey: list.List.PushFrontList
tags: [method]
```

```Go
func (l *List) PushFrontList(other *List)
```

PushFrontList inserts a copy of another list at the front of list l. The lists l and other may be the same. They must not be nil. 

#### <a id="List.Remove" href="#List.Remove">func (l *List) Remove(e *Element) interface{}</a>

```
searchKey: list.List.Remove
tags: [method]
```

```Go
func (l *List) Remove(e *Element) interface{}
```

Remove removes e from l if e is an element of list l. It returns the element value e.Value. The element must not be nil. 

#### <a id="List.insert" href="#List.insert">func (l *List) insert(e, at *Element) *Element</a>

```
searchKey: list.List.insert
tags: [method private]
```

```Go
func (l *List) insert(e, at *Element) *Element
```

insert inserts e after at, increments l.len, and returns e. 

#### <a id="List.insertValue" href="#List.insertValue">func (l *List) insertValue(v interface{}, at *Element) *Element</a>

```
searchKey: list.List.insertValue
tags: [method private]
```

```Go
func (l *List) insertValue(v interface{}, at *Element) *Element
```

insertValue is a convenience wrapper for insert(&Element{Value: v}, at). 

#### <a id="List.lazyInit" href="#List.lazyInit">func (l *List) lazyInit()</a>

```
searchKey: list.List.lazyInit
tags: [function private]
```

```Go
func (l *List) lazyInit()
```

lazyInit lazily initializes a zero List value. 

#### <a id="List.move" href="#List.move">func (l *List) move(e, at *Element) *Element</a>

```
searchKey: list.List.move
tags: [method private]
```

```Go
func (l *List) move(e, at *Element) *Element
```

move moves e to next to at and returns e. 

#### <a id="List.remove" href="#List.remove">func (l *List) remove(e *Element) *Element</a>

```
searchKey: list.List.remove
tags: [method private]
```

```Go
func (l *List) remove(e *Element) *Element
```

remove removes e from its list, decrements l.len, and returns e. 

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="TestExtending" href="#TestExtending">func TestExtending(t *testing.T)</a>

```
searchKey: list.TestExtending
tags: [method private test]
```

```Go
func TestExtending(t *testing.T)
```

### <a id="TestInsertAfterUnknownMark" href="#TestInsertAfterUnknownMark">func TestInsertAfterUnknownMark(t *testing.T)</a>

```
searchKey: list.TestInsertAfterUnknownMark
tags: [method private test]
```

```Go
func TestInsertAfterUnknownMark(t *testing.T)
```

Test that a list l is not modified when calling InsertAfter with a mark that is not an element of l. 

### <a id="TestInsertBeforeUnknownMark" href="#TestInsertBeforeUnknownMark">func TestInsertBeforeUnknownMark(t *testing.T)</a>

```
searchKey: list.TestInsertBeforeUnknownMark
tags: [method private test]
```

```Go
func TestInsertBeforeUnknownMark(t *testing.T)
```

Test that a list l is not modified when calling InsertBefore with a mark that is not an element of l. 

### <a id="TestIssue4103" href="#TestIssue4103">func TestIssue4103(t *testing.T)</a>

```
searchKey: list.TestIssue4103
tags: [method private test]
```

```Go
func TestIssue4103(t *testing.T)
```

### <a id="TestIssue6349" href="#TestIssue6349">func TestIssue6349(t *testing.T)</a>

```
searchKey: list.TestIssue6349
tags: [method private test]
```

```Go
func TestIssue6349(t *testing.T)
```

### <a id="TestList" href="#TestList">func TestList(t *testing.T)</a>

```
searchKey: list.TestList
tags: [method private test]
```

```Go
func TestList(t *testing.T)
```

### <a id="TestMove" href="#TestMove">func TestMove(t *testing.T)</a>

```
searchKey: list.TestMove
tags: [method private test]
```

```Go
func TestMove(t *testing.T)
```

### <a id="TestMoveUnknownMark" href="#TestMoveUnknownMark">func TestMoveUnknownMark(t *testing.T)</a>

```
searchKey: list.TestMoveUnknownMark
tags: [method private test]
```

```Go
func TestMoveUnknownMark(t *testing.T)
```

Test that a list l is not modified when calling MoveAfter or MoveBefore with a mark that is not an element of l. 

### <a id="TestRemove" href="#TestRemove">func TestRemove(t *testing.T)</a>

```
searchKey: list.TestRemove
tags: [method private test]
```

```Go
func TestRemove(t *testing.T)
```

### <a id="TestZeroList" href="#TestZeroList">func TestZeroList(t *testing.T)</a>

```
searchKey: list.TestZeroList
tags: [method private test]
```

```Go
func TestZeroList(t *testing.T)
```

Test PushFront, PushBack, PushFrontList, PushBackList with uninitialized List 

### <a id="checkList" href="#checkList">func checkList(t *testing.T, l *List, es []interface{})</a>

```
searchKey: list.checkList
tags: [method private]
```

```Go
func checkList(t *testing.T, l *List, es []interface{})
```

### <a id="checkListLen" href="#checkListLen">func checkListLen(t *testing.T, l *List, len int) bool</a>

```
searchKey: list.checkListLen
tags: [method private]
```

```Go
func checkListLen(t *testing.T, l *List, len int) bool
```

### <a id="checkListPointers" href="#checkListPointers">func checkListPointers(t *testing.T, l *List, es []*Element)</a>

```
searchKey: list.checkListPointers
tags: [method private]
```

```Go
func checkListPointers(t *testing.T, l *List, es []*Element)
```

