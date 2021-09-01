# Package format_test

## Index

* [Variables](#var)
    * [var debug](#debug)
    * [var sink](#sink)
    * [var tests](#tests)
* [Functions](#func)
    * [func BenchmarkFormat(b *testing.B)](#BenchmarkFormat)
    * [func ExampleNode()](#ExampleNode)
    * [func array1(buf *bytes.Buffer, n int)](#array1)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="debug" href="#debug">var debug</a>

```
searchKey: format_test.debug
tags: [variable boolean private]
```

```Go
var debug = flag.Bool("debug", false, "write .src files containing formatting input; for debugging")
```

### <a id="sink" href="#sink">var sink</a>

```
searchKey: format_test.sink
tags: [variable array number private]
```

```Go
var sink []byte
```

### <a id="tests" href="#tests">var tests</a>

```
searchKey: format_test.tests
tags: [variable array struct private]
```

```Go
var tests = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkFormat" href="#BenchmarkFormat">func BenchmarkFormat(b *testing.B)</a>

```
searchKey: format_test.BenchmarkFormat
tags: [function private benchmark]
```

```Go
func BenchmarkFormat(b *testing.B)
```

### <a id="ExampleNode" href="#ExampleNode">func ExampleNode()</a>

```
searchKey: format_test.ExampleNode
tags: [function private]
```

```Go
func ExampleNode()
```

### <a id="array1" href="#array1">func array1(buf *bytes.Buffer, n int)</a>

```
searchKey: format_test.array1
tags: [function private]
```

```Go
func array1(buf *bytes.Buffer, n int)
```

array1 generates an array literal with n elements of the form: 

var _ = [...]byte{ 

```
// 0
0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f,
0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
// 40
0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37,
...

```
