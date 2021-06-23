# Package tabwriter_test

## Index

* [Constants](#const)
    * [const codeSnippet](#codeSnippet)
* [Variables](#var)
    * [var tests](#tests)
* [Types](#type)
    * [type buffer struct](#buffer)
        * [func (b *buffer) init(n int)](#buffer.init.tabwriter_test.go)
        * [func (b *buffer) clear()](#buffer.clear)
        * [func (b *buffer) Write(buf []byte) (written int, err error)](#buffer.Write)
        * [func (b *buffer) String() string](#buffer.String)
    * [type panicWriter struct{}](#panicWriter)
        * [func (panicWriter) Write([]byte) (int, error)](#panicWriter.Write)
* [Functions](#func)
    * [func ExampleWriter_Init()](#ExampleWriter_Init)
    * [func Example_elastic()](#Example_elastic)
    * [func Example_trailingTab()](#Example_trailingTab)
    * [func write(t *testing.T, testname string, w *Writer, src string)](#write)
    * [func verify(t *testing.T, testname string, w *Writer, b *buffer, src, expected string)](#verify)
    * [func check(t *testing.T, testname string, minwidth, tabwidth, padding int, padchar byte, flags uint, src, expected string)](#check)
    * [func Test(t *testing.T)](#Test)
    * [func wantPanicString(t *testing.T, want string)](#wantPanicString)
    * [func TestPanicDuringFlush(t *testing.T)](#TestPanicDuringFlush)
    * [func TestPanicDuringWrite(t *testing.T)](#TestPanicDuringWrite)
    * [func BenchmarkTable(b *testing.B)](#BenchmarkTable)
    * [func BenchmarkPyramid(b *testing.B)](#BenchmarkPyramid)
    * [func BenchmarkRagged(b *testing.B)](#BenchmarkRagged)
    * [func BenchmarkCode(b *testing.B)](#BenchmarkCode)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="codeSnippet" href="#codeSnippet">const codeSnippet</a>

```
searchKey: tabwriter_test.codeSnippet
tags: [private]
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
tags: [private]
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
tags: [private]
```

```Go
type buffer struct {
	a []byte
}
```

#### <a id="buffer.init.tabwriter_test.go" href="#buffer.init.tabwriter_test.go">func (b *buffer) init(n int)</a>

```
searchKey: tabwriter_test.buffer.init
tags: [private]
```

```Go
func (b *buffer) init(n int)
```

#### <a id="buffer.clear" href="#buffer.clear">func (b *buffer) clear()</a>

```
searchKey: tabwriter_test.buffer.clear
tags: [private]
```

```Go
func (b *buffer) clear()
```

#### <a id="buffer.Write" href="#buffer.Write">func (b *buffer) Write(buf []byte) (written int, err error)</a>

```
searchKey: tabwriter_test.buffer.Write
tags: [private]
```

```Go
func (b *buffer) Write(buf []byte) (written int, err error)
```

#### <a id="buffer.String" href="#buffer.String">func (b *buffer) String() string</a>

```
searchKey: tabwriter_test.buffer.String
tags: [private]
```

```Go
func (b *buffer) String() string
```

### <a id="panicWriter" href="#panicWriter">type panicWriter struct{}</a>

```
searchKey: tabwriter_test.panicWriter
tags: [private]
```

```Go
type panicWriter struct{}
```

#### <a id="panicWriter.Write" href="#panicWriter.Write">func (panicWriter) Write([]byte) (int, error)</a>

```
searchKey: tabwriter_test.panicWriter.Write
tags: [private]
```

```Go
func (panicWriter) Write([]byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleWriter_Init" href="#ExampleWriter_Init">func ExampleWriter_Init()</a>

```
searchKey: tabwriter_test.ExampleWriter_Init
tags: [private]
```

```Go
func ExampleWriter_Init()
```

### <a id="Example_elastic" href="#Example_elastic">func Example_elastic()</a>

```
searchKey: tabwriter_test.Example_elastic
tags: [private]
```

```Go
func Example_elastic()
```

### <a id="Example_trailingTab" href="#Example_trailingTab">func Example_trailingTab()</a>

```
searchKey: tabwriter_test.Example_trailingTab
tags: [private]
```

```Go
func Example_trailingTab()
```

### <a id="write" href="#write">func write(t *testing.T, testname string, w *Writer, src string)</a>

```
searchKey: tabwriter_test.write
tags: [private]
```

```Go
func write(t *testing.T, testname string, w *Writer, src string)
```

### <a id="verify" href="#verify">func verify(t *testing.T, testname string, w *Writer, b *buffer, src, expected string)</a>

```
searchKey: tabwriter_test.verify
tags: [private]
```

```Go
func verify(t *testing.T, testname string, w *Writer, b *buffer, src, expected string)
```

### <a id="check" href="#check">func check(t *testing.T, testname string, minwidth, tabwidth, padding int, padchar byte, flags uint, src, expected string)</a>

```
searchKey: tabwriter_test.check
tags: [private]
```

```Go
func check(t *testing.T, testname string, minwidth, tabwidth, padding int, padchar byte, flags uint, src, expected string)
```

### <a id="Test" href="#Test">func Test(t *testing.T)</a>

```
searchKey: tabwriter_test.Test
tags: [private]
```

```Go
func Test(t *testing.T)
```

### <a id="wantPanicString" href="#wantPanicString">func wantPanicString(t *testing.T, want string)</a>

```
searchKey: tabwriter_test.wantPanicString
tags: [private]
```

```Go
func wantPanicString(t *testing.T, want string)
```

### <a id="TestPanicDuringFlush" href="#TestPanicDuringFlush">func TestPanicDuringFlush(t *testing.T)</a>

```
searchKey: tabwriter_test.TestPanicDuringFlush
tags: [private]
```

```Go
func TestPanicDuringFlush(t *testing.T)
```

### <a id="TestPanicDuringWrite" href="#TestPanicDuringWrite">func TestPanicDuringWrite(t *testing.T)</a>

```
searchKey: tabwriter_test.TestPanicDuringWrite
tags: [private]
```

```Go
func TestPanicDuringWrite(t *testing.T)
```

### <a id="BenchmarkTable" href="#BenchmarkTable">func BenchmarkTable(b *testing.B)</a>

```
searchKey: tabwriter_test.BenchmarkTable
tags: [private]
```

```Go
func BenchmarkTable(b *testing.B)
```

### <a id="BenchmarkPyramid" href="#BenchmarkPyramid">func BenchmarkPyramid(b *testing.B)</a>

```
searchKey: tabwriter_test.BenchmarkPyramid
tags: [private]
```

```Go
func BenchmarkPyramid(b *testing.B)
```

### <a id="BenchmarkRagged" href="#BenchmarkRagged">func BenchmarkRagged(b *testing.B)</a>

```
searchKey: tabwriter_test.BenchmarkRagged
tags: [private]
```

```Go
func BenchmarkRagged(b *testing.B)
```

### <a id="BenchmarkCode" href="#BenchmarkCode">func BenchmarkCode(b *testing.B)</a>

```
searchKey: tabwriter_test.BenchmarkCode
tags: [private]
```

```Go
func BenchmarkCode(b *testing.B)
```

