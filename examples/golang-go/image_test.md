# Package image_test

This example demonstrates decoding a JPEG image and examining its pixels. 

## Index

* [Constants](#const)
    * [const data](#data)
* [Variables](#var)
    * [var imageTests](#imageTests)
* [Types](#type)
    * [type imageTest struct](#imageTest)
* [Functions](#func)
    * [func Example()](#Example)
    * [func Example_decodeConfig()](#Example_decodeConfig)
    * [func TestDecode(t *testing.T)](#TestDecode)
    * [func decode(filename string) (image.Image, string, error)](#decode)
    * [func decodeConfig(filename string) (image.Config, string, error)](#decodeConfig)
    * [func delta(u0, u1 uint32) int](#delta)
    * [func withinTolerance(c0, c1 color.Color, tolerance int) bool](#withinTolerance)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="data" href="#data">const data</a>

```
searchKey: image_test.data
tags: [constant string private]
```

```Go
const data = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="imageTests" href="#imageTests">var imageTests</a>

```
searchKey: image_test.imageTests
tags: [variable array struct private]
```

```Go
var imageTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="imageTest" href="#imageTest">type imageTest struct</a>

```
searchKey: image_test.imageTest
tags: [struct private]
```

```Go
type imageTest struct {
	goldenFilename string
	filename       string
	tolerance      int
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Example" href="#Example">func Example()</a>

```
searchKey: image_test.Example
tags: [function private]
```

```Go
func Example()
```

### <a id="Example_decodeConfig" href="#Example_decodeConfig">func Example_decodeConfig()</a>

```
searchKey: image_test.Example_decodeConfig
tags: [function private]
```

```Go
func Example_decodeConfig()
```

### <a id="TestDecode" href="#TestDecode">func TestDecode(t *testing.T)</a>

```
searchKey: image_test.TestDecode
tags: [method private test]
```

```Go
func TestDecode(t *testing.T)
```

### <a id="decode" href="#decode">func decode(filename string) (image.Image, string, error)</a>

```
searchKey: image_test.decode
tags: [method private]
```

```Go
func decode(filename string) (image.Image, string, error)
```

### <a id="decodeConfig" href="#decodeConfig">func decodeConfig(filename string) (image.Config, string, error)</a>

```
searchKey: image_test.decodeConfig
tags: [method private]
```

```Go
func decodeConfig(filename string) (image.Config, string, error)
```

### <a id="delta" href="#delta">func delta(u0, u1 uint32) int</a>

```
searchKey: image_test.delta
tags: [method private]
```

```Go
func delta(u0, u1 uint32) int
```

### <a id="withinTolerance" href="#withinTolerance">func withinTolerance(c0, c1 color.Color, tolerance int) bool</a>

```
searchKey: image_test.withinTolerance
tags: [method private]
```

```Go
func withinTolerance(c0, c1 color.Color, tolerance int) bool
```

