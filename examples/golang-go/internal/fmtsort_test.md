# Package fmtsort_test

## Index

* [Variables](#var)
    * [var chans](#chans)
    * [var compareTests](#compareTests)
    * [var iFace](#iFace)
    * [var ints](#ints)
    * [var sortTests](#sortTests)
* [Types](#type)
    * [type sortTest struct](#sortTest)
    * [type toy struct](#toy)
* [Functions](#func)
    * [func TestCompare(t *testing.T)](#TestCompare)
    * [func TestInterface(t *testing.T)](#TestInterface)
    * [func TestOrder(t *testing.T)](#TestOrder)
    * [func chanMap() map[chan int]string](#chanMap)
    * [func ct(typ reflect.Type, args ...interface{}) []reflect.Value](#ct)
    * [func pointerMap() map[*int]string](#pointerMap)
    * [func sprint(data interface{}) string](#sprint)
    * [func sprintKey(key reflect.Value) string](#sprintKey)
    * [func unsafePointerMap() map[unsafe.Pointer]string](#unsafePointerMap)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="chans" href="#chans">var chans</a>

```
searchKey: fmtsort_test.chans
tags: [variable array private]
```

```Go
var chans = [3]chan int{make(chan int), make(chan int), make(chan int)}
```

### <a id="compareTests" href="#compareTests">var compareTests</a>

```
searchKey: fmtsort_test.compareTests
tags: [variable array array struct private]
```

```Go
var compareTests = ...
```

### <a id="iFace" href="#iFace">var iFace</a>

```
searchKey: fmtsort_test.iFace
tags: [variable interface private]
```

```Go
var iFace interface{}
```

### <a id="ints" href="#ints">var ints</a>

```
searchKey: fmtsort_test.ints
tags: [variable array number private]
```

```Go
var ints [3]int
```

### <a id="sortTests" href="#sortTests">var sortTests</a>

```
searchKey: fmtsort_test.sortTests
tags: [variable array struct private]
```

```Go
var sortTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="sortTest" href="#sortTest">type sortTest struct</a>

```
searchKey: fmtsort_test.sortTest
tags: [struct private]
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
tags: [struct private]
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

### <a id="TestCompare" href="#TestCompare">func TestCompare(t *testing.T)</a>

```
searchKey: fmtsort_test.TestCompare
tags: [function private test]
```

```Go
func TestCompare(t *testing.T)
```

### <a id="TestInterface" href="#TestInterface">func TestInterface(t *testing.T)</a>

```
searchKey: fmtsort_test.TestInterface
tags: [function private test]
```

```Go
func TestInterface(t *testing.T)
```

### <a id="TestOrder" href="#TestOrder">func TestOrder(t *testing.T)</a>

```
searchKey: fmtsort_test.TestOrder
tags: [function private test]
```

```Go
func TestOrder(t *testing.T)
```

### <a id="chanMap" href="#chanMap">func chanMap() map[chan int]string</a>

```
searchKey: fmtsort_test.chanMap
tags: [function private]
```

```Go
func chanMap() map[chan int]string
```

### <a id="ct" href="#ct">func ct(typ reflect.Type, args ...interface{}) []reflect.Value</a>

```
searchKey: fmtsort_test.ct
tags: [function private]
```

```Go
func ct(typ reflect.Type, args ...interface{}) []reflect.Value
```

### <a id="pointerMap" href="#pointerMap">func pointerMap() map[*int]string</a>

```
searchKey: fmtsort_test.pointerMap
tags: [function private]
```

```Go
func pointerMap() map[*int]string
```

### <a id="sprint" href="#sprint">func sprint(data interface{}) string</a>

```
searchKey: fmtsort_test.sprint
tags: [function private]
```

```Go
func sprint(data interface{}) string
```

### <a id="sprintKey" href="#sprintKey">func sprintKey(key reflect.Value) string</a>

```
searchKey: fmtsort_test.sprintKey
tags: [function private]
```

```Go
func sprintKey(key reflect.Value) string
```

sprintKey formats a reflect.Value but gives reproducible values for some problematic types such as pointers. Note that it only does special handling for the troublesome types used in the test cases; it is not a general printer. 

### <a id="unsafePointerMap" href="#unsafePointerMap">func unsafePointerMap() map[unsafe.Pointer]string</a>

```
searchKey: fmtsort_test.unsafePointerMap
tags: [function private]
```

```Go
func unsafePointerMap() map[unsafe.Pointer]string
```

