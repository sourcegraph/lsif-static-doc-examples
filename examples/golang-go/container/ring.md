# Package ring

Package ring implements operations on circular lists. 

## Index

* [Types](#type)
    * [type Ring struct](#Ring)
        * [func New(n int) *Ring](#New)
        * [func makeN(n int) *Ring](#makeN)
        * [func (r *Ring) init() *Ring](#Ring.init.ring.go)
        * [func (r *Ring) Next() *Ring](#Ring.Next)
        * [func (r *Ring) Prev() *Ring](#Ring.Prev)
        * [func (r *Ring) Move(n int) *Ring](#Ring.Move)
        * [func (r *Ring) Link(s *Ring) *Ring](#Ring.Link)
        * [func (r *Ring) Unlink(n int) *Ring](#Ring.Unlink)
        * [func (r *Ring) Len() int](#Ring.Len)
        * [func (r *Ring) Do(f func(interface{}))](#Ring.Do)
* [Functions](#func)
    * [func dump(r *Ring)](#dump)
    * [func verify(t *testing.T, r *Ring, N int, sum int)](#verify)
    * [func TestCornerCases(t *testing.T)](#TestCornerCases)
    * [func sumN(n int) int](#sumN)
    * [func TestNew(t *testing.T)](#TestNew)
    * [func TestLink1(t *testing.T)](#TestLink1)
    * [func TestLink2(t *testing.T)](#TestLink2)
    * [func TestLink3(t *testing.T)](#TestLink3)
    * [func TestUnlink(t *testing.T)](#TestUnlink)
    * [func TestLinkUnlink(t *testing.T)](#TestLinkUnlink)
    * [func TestMoveEmptyRing(t *testing.T)](#TestMoveEmptyRing)


## <a id="type" href="#type">Types</a>

### <a id="Ring" href="#Ring">type Ring struct</a>

```
searchKey: ring.Ring
```

```Go
type Ring struct {
	next, prev *Ring
	Value      interface{} // for use by client; untouched by this library
}
```

A Ring is an element of a circular list, or ring. Rings do not have a beginning or end; a pointer to any ring element serves as reference to the entire ring. Empty rings are represented as nil Ring pointers. The zero value for a Ring is a one-element ring with a nil Value. 

#### <a id="New" href="#New">func New(n int) *Ring</a>

```
searchKey: ring.New
```

```Go
func New(n int) *Ring
```

New creates a ring of n elements. 

#### <a id="makeN" href="#makeN">func makeN(n int) *Ring</a>

```
searchKey: ring.makeN
tags: [private]
```

```Go
func makeN(n int) *Ring
```

#### <a id="Ring.init.ring.go" href="#Ring.init.ring.go">func (r *Ring) init() *Ring</a>

```
searchKey: ring.Ring.init
tags: [private]
```

```Go
func (r *Ring) init() *Ring
```

#### <a id="Ring.Next" href="#Ring.Next">func (r *Ring) Next() *Ring</a>

```
searchKey: ring.Ring.Next
```

```Go
func (r *Ring) Next() *Ring
```

Next returns the next ring element. r must not be empty. 

#### <a id="Ring.Prev" href="#Ring.Prev">func (r *Ring) Prev() *Ring</a>

```
searchKey: ring.Ring.Prev
```

```Go
func (r *Ring) Prev() *Ring
```

Prev returns the previous ring element. r must not be empty. 

#### <a id="Ring.Move" href="#Ring.Move">func (r *Ring) Move(n int) *Ring</a>

```
searchKey: ring.Ring.Move
```

```Go
func (r *Ring) Move(n int) *Ring
```

Move moves n % r.Len() elements backward (n < 0) or forward (n >= 0) in the ring and returns that ring element. r must not be empty. 

#### <a id="Ring.Link" href="#Ring.Link">func (r *Ring) Link(s *Ring) *Ring</a>

```
searchKey: ring.Ring.Link
```

```Go
func (r *Ring) Link(s *Ring) *Ring
```

Link connects ring r with ring s such that r.Next() becomes s and returns the original value for r.Next(). r must not be empty. 

If r and s point to the same ring, linking them removes the elements between r and s from the ring. The removed elements form a subring and the result is a reference to that subring (if no elements were removed, the result is still the original value for r.Next(), and not nil). 

If r and s point to different rings, linking them creates a single ring with the elements of s inserted after r. The result points to the element following the last element of s after insertion. 

#### <a id="Ring.Unlink" href="#Ring.Unlink">func (r *Ring) Unlink(n int) *Ring</a>

```
searchKey: ring.Ring.Unlink
```

```Go
func (r *Ring) Unlink(n int) *Ring
```

Unlink removes n % r.Len() elements from the ring r, starting at r.Next(). If n % r.Len() == 0, r remains unchanged. The result is the removed subring. r must not be empty. 

#### <a id="Ring.Len" href="#Ring.Len">func (r *Ring) Len() int</a>

```
searchKey: ring.Ring.Len
```

```Go
func (r *Ring) Len() int
```

Len computes the number of elements in ring r. It executes in time proportional to the number of elements. 

#### <a id="Ring.Do" href="#Ring.Do">func (r *Ring) Do(f func(interface{}))</a>

```
searchKey: ring.Ring.Do
```

```Go
func (r *Ring) Do(f func(interface{}))
```

Do calls function f on each element of the ring, in forward order. The behavior of Do is undefined if f changes *r. 

## <a id="func" href="#func">Functions</a>

### <a id="dump" href="#dump">func dump(r *Ring)</a>

```
searchKey: ring.dump
tags: [private]
```

```Go
func dump(r *Ring)
```

For debugging - keep around. 

### <a id="verify" href="#verify">func verify(t *testing.T, r *Ring, N int, sum int)</a>

```
searchKey: ring.verify
tags: [private]
```

```Go
func verify(t *testing.T, r *Ring, N int, sum int)
```

### <a id="TestCornerCases" href="#TestCornerCases">func TestCornerCases(t *testing.T)</a>

```
searchKey: ring.TestCornerCases
tags: [private]
```

```Go
func TestCornerCases(t *testing.T)
```

### <a id="sumN" href="#sumN">func sumN(n int) int</a>

```
searchKey: ring.sumN
tags: [private]
```

```Go
func sumN(n int) int
```

### <a id="TestNew" href="#TestNew">func TestNew(t *testing.T)</a>

```
searchKey: ring.TestNew
tags: [private]
```

```Go
func TestNew(t *testing.T)
```

### <a id="TestLink1" href="#TestLink1">func TestLink1(t *testing.T)</a>

```
searchKey: ring.TestLink1
tags: [private]
```

```Go
func TestLink1(t *testing.T)
```

### <a id="TestLink2" href="#TestLink2">func TestLink2(t *testing.T)</a>

```
searchKey: ring.TestLink2
tags: [private]
```

```Go
func TestLink2(t *testing.T)
```

### <a id="TestLink3" href="#TestLink3">func TestLink3(t *testing.T)</a>

```
searchKey: ring.TestLink3
tags: [private]
```

```Go
func TestLink3(t *testing.T)
```

### <a id="TestUnlink" href="#TestUnlink">func TestUnlink(t *testing.T)</a>

```
searchKey: ring.TestUnlink
tags: [private]
```

```Go
func TestUnlink(t *testing.T)
```

### <a id="TestLinkUnlink" href="#TestLinkUnlink">func TestLinkUnlink(t *testing.T)</a>

```
searchKey: ring.TestLinkUnlink
tags: [private]
```

```Go
func TestLinkUnlink(t *testing.T)
```

### <a id="TestMoveEmptyRing" href="#TestMoveEmptyRing">func TestMoveEmptyRing(t *testing.T)</a>

```
searchKey: ring.TestMoveEmptyRing
tags: [private]
```

```Go
func TestMoveEmptyRing(t *testing.T)
```

Test that calling Move() on an empty Ring initializes it. 

