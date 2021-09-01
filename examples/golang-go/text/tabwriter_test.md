# Package tabwriter_test

## Index

* [Constants](#const)
    * [const codeSnippet](#codeSnippet)
* [Variables](#var)
    * [var tests](#tests)
* [Types](#type)
    * [type buffer struct](#buffer)
        * [func (b *buffer) String() string](#buffer.String)
        * [func (b *buffer) Write(buf []byte) (written int, err error)](#buffer.Write)
        * [func (b *buffer) clear()](#buffer.clear)
        * [func (b *buffer) init(n int)](#buffer.init.tabwriter_test.go)
    * [type panicWriter struct{}](#panicWriter)
        * [func (panicWriter) Write([]byte) (int, error)](#panicWriter.Write)
* [Functions](#func)
    * [func BenchmarkCode(b *testing.B)](#BenchmarkCode)
    * [func BenchmarkPyramid(b *testing.B)](#BenchmarkPyramid)
    * [func BenchmarkRagged(b *testing.B)](#BenchmarkRagged)
    * [func BenchmarkTable(b *testing.B)](#BenchmarkTable)
    * [func ExampleWriter_Init()](#ExampleWriter_Init)
    * [func Example_elastic()](#Example_elastic)
    * [func Example_trailingTab()](#Example_trailingTab)
    * [func Test(t *testing.T)](#Test)
    * [func TestPanicDuringFlush(t *testing.T)](#TestPanicDuringFlush)
    * [func TestPanicDuringWrite(t *testing.T)](#TestPanicDuringWrite)
    * [func check(t *testing.T, testname string, minwidth, tabwidth, padding int, padchar byte, flags uint, src, expected string)](#check)
    * [func verify(t *testing.T, testname string, w *Writer, b *buffer, src, expected string)](#verify)
    * [func wantPanicString(t *testing.T, want string)](#wantPanicString)
    * [func write(t *testing.T, testname string, w *Writer, src string)](#write)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="codeSnippet" href="#codeSnippet">const codeSnippet</a>

```
searchKey: tabwriter_test.codeSnippet
tags: [constant string private]
```

```Go
const codeSnippet = `
some command

foo	# aligned
barbaz	# comments

but
mostly
single
cell
lines
`
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="tests" href="#tests">var tests</a>

```
searchKey: tabwriter_test.tests
tags: [variable array struct private]
```

```Go
var tests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="buffer" href="#buffer">type buffer struct</a>

```
searchKey: tabwriter_test.buffer
tags: [struct private]
```

```Go
type buffer struct {
	a []byte
}
```

#### <a id="buffer.String" href="#buffer.String">func (b *buffer) String() string</a>

```
searchKey: tabwriter_test.buffer.String
tags: [method private]
```

```Go
func (b *buffer) String() string
```

#### <a id="buffer.Write" href="#buffer.Write">func (b *buffer) Write(buf []byte) (written int, err error)</a>

```
searchKey: tabwriter_test.buffer.Write
tags: [method private]
```

```Go
func (b *buffer) Write(buf []byte) (written int, err error)
```

#### <a id="buffer.clear" href="#buffer.clear">func (b *buffer) clear()</a>

```
searchKey: tabwriter_test.buffer.clear
tags: [method private]
```

```Go
func (b *buffer) clear()
```

#### <a id="buffer.init.tabwriter_test.go" href="#buffer.init.tabwriter_test.go">func (b *buffer) init(n int)</a>

```
searchKey: tabwriter_test.buffer.init
tags: [method private]
```

```Go
func (b *buffer) init(n int)
```

### <a id="panicWriter" href="#panicWriter">type panicWriter struct{}</a>

```
searchKey: tabwriter_test.panicWriter
tags: [struct private]
```

```Go
type panicWriter struct{}
```

#### <a id="panicWriter.Write" href="#panicWriter.Write">func (panicWriter) Write([]byte) (int, error)</a>

```
searchKey: tabwriter_test.panicWriter.Write
tags: [method private]
```

```Go
func (panicWriter) Write([]byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkCode" href="#BenchmarkCode">func BenchmarkCode(b *testing.B)</a>

```
searchKey: tabwriter_test.BenchmarkCode
tags: [function private benchmark]
```

```Go
func BenchmarkCode(b *testing.B)
```

### <a id="BenchmarkPyramid" href="#BenchmarkPyramid">func BenchmarkPyramid(b *testing.B)</a>

```
searchKey: tabwriter_test.BenchmarkPyramid
tags: [function private benchmark]
```

```Go
func BenchmarkPyramid(b *testing.B)
```

### <a id="BenchmarkRagged" href="#BenchmarkRagged">func BenchmarkRagged(b *testing.B)</a>

```
searchKey: tabwriter_test.BenchmarkRagged
tags: [function private benchmark]
```

```Go
func BenchmarkRagged(b *testing.B)
```

### <a id="BenchmarkTable" href="#BenchmarkTable">func BenchmarkTable(b *testing.B)</a>

```
searchKey: tabwriter_test.BenchmarkTable
tags: [function private benchmark]
```

```Go
func BenchmarkTable(b *testing.B)
```

### <a id="ExampleWriter_Init" href="#ExampleWriter_Init">func ExampleWriter_Init()</a>

```
searchKey: tabwriter_test.ExampleWriter_Init
tags: [function private]
```

```Go
func ExampleWriter_Init()
```

### <a id="Example_elastic" href="#Example_elastic">func Example_elastic()</a>

```
searchKey: tabwriter_test.Example_elastic
tags: [function private]
```

```Go
func Example_elastic()
```

### <a id="Example_trailingTab" href="#Example_trailingTab">func Example_trailingTab()</a>

```
searchKey: tabwriter_test.Example_trailingTab
tags: [function private]
```

```Go
func Example_trailingTab()
```

### <a id="Test" href="#Test">func Test(t *testing.T)</a>

```
searchKey: tabwriter_test.Test
tags: [function private test]
```

```Go
func Test(t *testing.T)
```

### <a id="TestPanicDuringFlush" href="#TestPanicDuringFlush">func TestPanicDuringFlush(t *testing.T)</a>

```
searchKey: tabwriter_test.TestPanicDuringFlush
tags: [function private test]
```

```Go
func TestPanicDuringFlush(t *testing.T)
```

### <a id="TestPanicDuringWrite" href="#TestPanicDuringWrite">func TestPanicDuringWrite(t *testing.T)</a>

```
searchKey: tabwriter_test.TestPanicDuringWrite
tags: [function private test]
```

```Go
func TestPanicDuringWrite(t *testing.T)
```

### <a id="check" href="#check">func check(t *testing.T, testname string, minwidth, tabwidth, padding int, padchar byte, flags uint, src, expected string)</a>

```
searchKey: tabwriter_test.check
tags: [function private]
```

```Go
func check(t *testing.T, testname string, minwidth, tabwidth, padding int, padchar byte, flags uint, src, expected string)
```

### <a id="verify" href="#verify">func verify(t *testing.T, testname string, w *Writer, b *buffer, src, expected string)</a>

```
searchKey: tabwriter_test.verify
tags: [function private]
```

```Go
func verify(t *testing.T, testname string, w *Writer, b *buffer, src, expected string)
```

### <a id="wantPanicString" href="#wantPanicString">func wantPanicString(t *testing.T, want string)</a>

```
searchKey: tabwriter_test.wantPanicString
tags: [function private]
```

```Go
func wantPanicString(t *testing.T, want string)
```

### <a id="write" href="#write">func write(t *testing.T, testname string, w *Writer, src string)</a>

```
searchKey: tabwriter_test.write
tags: [function private]
```

```Go
func write(t *testing.T, testname string, w *Writer, src string)
```

