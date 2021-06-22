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
    * [func Example_decodeConfig()](#Example_decodeConfig)
    * [func Example()](#Example)
    * [func decode(filename string) (image.Image, string, error)](#decode)
    * [func decodeConfig(filename string) (image.Config, string, error)](#decodeConfig)
    * [func delta(u0, u1 uint32) int](#delta)
    * [func withinTolerance(c0, c1 color.Color, tolerance int) bool](#withinTolerance)
    * [func TestDecode(t *testing.T)](#TestDecode)


## <a id="const" href="#const">Constants</a>

### <a id="data" href="#data">const data</a>

```
searchKey: image_test.data
```

```Go
const data = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="imageTests" href="#imageTests">var imageTests</a>

```
searchKey: image_test.imageTests
```

```Go
var imageTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="imageTest" href="#imageTest">type imageTest struct</a>

```
searchKey: image_test.imageTest
```

```Go
type imageTest struct {
	goldenFilename string
	filename       string
	tolerance      int
}
```

## <a id="func" href="#func">Functions</a>

### <a id="Example_decodeConfig" href="#Example_decodeConfig">func Example_decodeConfig()</a>

```
searchKey: image_test.Example_decodeConfig
```

```Go
func Example_decodeConfig()
```

### <a id="Example" href="#Example">func Example()</a>

```
searchKey: image_test.Example
```

```Go
func Example()
```

### <a id="decode" href="#decode">func decode(filename string) (image.Image, string, error)</a>

```
searchKey: image_test.decode
```

```Go
func decode(filename string) (image.Image, string, error)
```

### <a id="decodeConfig" href="#decodeConfig">func decodeConfig(filename string) (image.Config, string, error)</a>

```
searchKey: image_test.decodeConfig
```

```Go
func decodeConfig(filename string) (image.Config, string, error)
```

### <a id="delta" href="#delta">func delta(u0, u1 uint32) int</a>

```
searchKey: image_test.delta
```

```Go
func delta(u0, u1 uint32) int
```

### <a id="withinTolerance" href="#withinTolerance">func withinTolerance(c0, c1 color.Color, tolerance int) bool</a>

```
searchKey: image_test.withinTolerance
```

```Go
func withinTolerance(c0, c1 color.Color, tolerance int) bool
```

### <a id="TestDecode" href="#TestDecode">func TestDecode(t *testing.T)</a>

```
searchKey: image_test.TestDecode
```

```Go
func TestDecode(t *testing.T)
```

