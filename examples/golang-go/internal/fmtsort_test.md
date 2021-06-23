# Package fmtsort_test

## Index

* [Variables](#var)
    * [var compareTests](#compareTests)
    * [var iFace](#iFace)
    * [var sortTests](#sortTests)
    * [var ints](#ints)
    * [var chans](#chans)
* [Types](#type)
    * [type sortTest struct](#sortTest)
    * [type toy struct](#toy)
* [Functions](#func)
    * [func ct(typ reflect.Type, args ...interface{}) []reflect.Value](#ct)
    * [func TestCompare(t *testing.T)](#TestCompare)
    * [func sprint(data interface{}) string](#sprint)
    * [func sprintKey(key reflect.Value) string](#sprintKey)
    * [func pointerMap() map[*int]string](#pointerMap)
    * [func unsafePointerMap() map[unsafe.Pointer]string](#unsafePointerMap)
    * [func chanMap() map[chan int]string](#chanMap)
    * [func TestOrder(t *testing.T)](#TestOrder)
    * [func TestInterface(t *testing.T)](#TestInterface)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="compareTests" href="#compareTests">var compareTests</a>

```
searchKey: fmtsort_test.compareTests
tags: [private]
```

```Go
var compareTests = ...
```

### <a id="iFace" href="#iFace">var iFace</a>

```
searchKey: fmtsort_test.iFace
tags: [private]
```

```Go
var iFace interface{}
```

### <a id="sortTests" href="#sortTests">var sortTests</a>

```
searchKey: fmtsort_test.sortTests
tags: [private]
```

```Go
var sortTests = ...
```

### <a id="ints" href="#ints">var ints</a>

```
searchKey: fmtsort_test.ints
tags: [private]
```

```Go
var ints [3]int
```

### <a id="chans" href="#chans">var chans</a>

```
searchKey: fmtsort_test.chans
tags: [private]
```

```Go
var chans = [3]chan int{make(chan int), make(chan int), make(chan int)}
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="sortTest" href="#sortTest">type sortTest struct</a>

```
searchKey: fmtsort_test.sortTest
tags: [private]
```

```Go
type sortTest struct {
	data  interface{} // Always a map.
	print string      // Printed result using our custom printer.
}
```

### <a id="toy" href="#toy">type toy struct</a>

```
searchKey: fmtsort_test.toy
tags: [private]
```

```Go
type toy struct {
	A int // Exported.
	b int // Unexported.
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ct" href="#ct">func ct(typ reflect.Type, args ...interface{}) []reflect.Value</a>

```
searchKey: fmtsort_test.ct
tags: [private]
```

```Go
func ct(typ reflect.Type, args ...interface{}) []reflect.Value
```

### <a id="TestCompare" href="#TestCompare">func TestCompare(t *testing.T)</a>

```
searchKey: fmtsort_test.TestCompare
tags: [private]
```

```Go
func TestCompare(t *testing.T)
```

### <a id="sprint" href="#sprint">func sprint(data interface{}) string</a>

```
searchKey: fmtsort_test.sprint
tags: [private]
```

```Go
func sprint(data interface{}) string
```

### <a id="sprintKey" href="#sprintKey">func sprintKey(key reflect.Value) string</a>

```
searchKey: fmtsort_test.sprintKey
tags: [private]
```

```Go
func sprintKey(key reflect.Value) string
```

sprintKey formats a reflect.Value but gives reproducible values for some problematic types such as pointers. Note that it only does special handling for the troublesome types used in the test cases; it is not a general printer. 

### <a id="pointerMap" href="#pointerMap">func pointerMap() map[*int]string</a>

```
searchKey: fmtsort_test.pointerMap
tags: [private]
```

```Go
func pointerMap() map[*int]string
```

### <a id="unsafePointerMap" href="#unsafePointerMap">func unsafePointerMap() map[unsafe.Pointer]string</a>

```
searchKey: fmtsort_test.unsafePointerMap
tags: [private]
```

```Go
func unsafePointerMap() map[unsafe.Pointer]string
```

### <a id="chanMap" href="#chanMap">func chanMap() map[chan int]string</a>

```
searchKey: fmtsort_test.chanMap
tags: [private]
```

```Go
func chanMap() map[chan int]string
```

### <a id="TestOrder" href="#TestOrder">func TestOrder(t *testing.T)</a>

```
searchKey: fmtsort_test.TestOrder
tags: [private]
```

```Go
func TestOrder(t *testing.T)
```

### <a id="TestInterface" href="#TestInterface">func TestInterface(t *testing.T)</a>

```
searchKey: fmtsort_test.TestInterface
tags: [private]
```

```Go
func TestInterface(t *testing.T)
```

