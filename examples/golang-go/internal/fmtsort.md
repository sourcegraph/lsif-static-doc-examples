# Package fmtsort

Package fmtsort provides a general stable ordering mechanism for maps, on behalf of the fmt and text/template packages. It is not guaranteed to be efficient and works only for types that are valid map keys. 

## Index

* [Types](#type)
    * [type SortedMap struct](#SortedMap)
        * [func Sort(mapValue reflect.Value) *SortedMap](#Sort)
        * [func (o *SortedMap) Len() int](#SortedMap.Len)
        * [func (o *SortedMap) Less(i, j int) bool](#SortedMap.Less)
        * [func (o *SortedMap) Swap(i, j int)](#SortedMap.Swap)
* [Functions](#func)
    * [func Compare(a, b reflect.Value) int](#Compare)
    * [func compare(aVal, bVal reflect.Value) int](#compare)
    * [func floatCompare(a, b float64) int](#floatCompare)
    * [func isNaN(a float64) bool](#isNaN)
    * [func nilCompare(aVal, bVal reflect.Value) (int, bool)](#nilCompare)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="SortedMap" href="#SortedMap">type SortedMap struct</a>

```
searchKey: fmtsort.SortedMap
tags: [struct]
```

```Go
type SortedMap struct {
	Key   []reflect.Value
	Value []reflect.Value
}
```

SortedMap represents a map's keys and values. The keys and values are aligned in index order: Value[i] is the value in the map corresponding to Key[i]. 

#### <a id="Sort" href="#Sort">func Sort(mapValue reflect.Value) *SortedMap</a>

```
searchKey: fmtsort.Sort
tags: [function]
```

```Go
func Sort(mapValue reflect.Value) *SortedMap
```

Sort accepts a map and returns a SortedMap that has the same keys and values but in a stable sorted order according to the keys, modulo issues raised by unorderable key values such as NaNs. 

The ordering rules are more general than with Go's < operator: 

```
- when applicable, nil compares low
- ints, floats, and strings order by <
- NaN compares less than non-NaN floats
- bool compares false before true
- complex compares real, then imag
- pointers compare by machine address
- channel values compare by machine address
- structs compare each field in turn
- arrays compare each element in turn.
  Otherwise identical arrays compare by length.
- interface values compare first by reflect.Type describing the concrete type
  and then by concrete value as described in the previous rules.

```
#### <a id="SortedMap.Len" href="#SortedMap.Len">func (o *SortedMap) Len() int</a>

```
searchKey: fmtsort.SortedMap.Len
tags: [method]
```

```Go
func (o *SortedMap) Len() int
```

#### <a id="SortedMap.Less" href="#SortedMap.Less">func (o *SortedMap) Less(i, j int) bool</a>

```
searchKey: fmtsort.SortedMap.Less
tags: [method]
```

```Go
func (o *SortedMap) Less(i, j int) bool
```

#### <a id="SortedMap.Swap" href="#SortedMap.Swap">func (o *SortedMap) Swap(i, j int)</a>

```
searchKey: fmtsort.SortedMap.Swap
tags: [method]
```

```Go
func (o *SortedMap) Swap(i, j int)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Compare" href="#Compare">func Compare(a, b reflect.Value) int</a>

```
searchKey: fmtsort.Compare
tags: [function private]
```

```Go
func Compare(a, b reflect.Value) int
```

### <a id="compare" href="#compare">func compare(aVal, bVal reflect.Value) int</a>

```
searchKey: fmtsort.compare
tags: [function private]
```

```Go
func compare(aVal, bVal reflect.Value) int
```

compare compares two values of the same type. It returns -1, 0, 1 according to whether a > b (1), a == b (0), or a < b (-1). If the types differ, it returns -1. See the comment on Sort for the comparison rules. 

### <a id="floatCompare" href="#floatCompare">func floatCompare(a, b float64) int</a>

```
searchKey: fmtsort.floatCompare
tags: [function private]
```

```Go
func floatCompare(a, b float64) int
```

floatCompare compares two floating-point values. NaNs compare low. 

### <a id="isNaN" href="#isNaN">func isNaN(a float64) bool</a>

```
searchKey: fmtsort.isNaN
tags: [function private]
```

```Go
func isNaN(a float64) bool
```

### <a id="nilCompare" href="#nilCompare">func nilCompare(aVal, bVal reflect.Value) (int, bool)</a>

```
searchKey: fmtsort.nilCompare
tags: [function private]
```

```Go
func nilCompare(aVal, bVal reflect.Value) (int, bool)
```

nilCompare checks whether either value is nil. If not, the boolean is false. If either value is nil, the boolean is true and the integer is the comparison value. The comparison is defined to be 0 if both are nil, otherwise the one nil value compares low. Both arguments must represent a chan, func, interface, map, pointer, or slice. 

