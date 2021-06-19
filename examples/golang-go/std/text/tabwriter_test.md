# Package tabwriter_test

## Index

* [Constants](#const)
    * [const codeSnippet](#codeSnippet)
* [Variables](#var)
    * [var tests](#tests)
* [Types](#type)
    * [type buffer struct](#buffer)
        * [func (b *buffer) init(n int)](#buffer.init)
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

### <a id="codeSnippet" href="#codeSnippet">const codeSnippet</a>

```
searchKey: tabwriter_test.codeSnippet
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

### <a id="tests" href="#tests">var tests</a>

```
searchKey: tabwriter_test.tests
```

```Go
var tests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="buffer" href="#buffer">type buffer struct</a>

```
searchKey: tabwriter_test.buffer
```

```Go
type buffer struct {
	a []byte
}
```

#### <a id="buffer.init" href="#buffer.init">func (b *buffer) init(n int)</a>

```
searchKey: tabwriter_test.buffer.init
```

```Go
func (b *buffer) init(n int)
```

#### <a id="buffer.clear" href="#buffer.clear">func (b *buffer) clear()</a>

```
searchKey: tabwriter_test.buffer.clear
```

```Go
func (b *buffer) clear()
```

#### <a id="buffer.Write" href="#buffer.Write">func (b *buffer) Write(buf []byte) (written int, err error)</a>

```
searchKey: tabwriter_test.buffer.Write
```

```Go
func (b *buffer) Write(buf []byte) (written int, err error)
```

#### <a id="buffer.String" href="#buffer.String">func (b *buffer) String() string</a>

```
searchKey: tabwriter_test.buffer.String
```

```Go
func (b *buffer) String() string
```

### <a id="panicWriter" href="#panicWriter">type panicWriter struct{}</a>

```
searchKey: tabwriter_test.panicWriter
```

```Go
type panicWriter struct{}
```

#### <a id="panicWriter.Write" href="#panicWriter.Write">func (panicWriter) Write([]byte) (int, error)</a>

```
searchKey: tabwriter_test.panicWriter.Write
```

```Go
func (panicWriter) Write([]byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="ExampleWriter_Init" href="#ExampleWriter_Init">func ExampleWriter_Init()</a>

```
searchKey: tabwriter_test.ExampleWriter_Init
```

```Go
func ExampleWriter_Init()
```

### <a id="Example_elastic" href="#Example_elastic">func Example_elastic()</a>

```
searchKey: tabwriter_test.Example_elastic
```

```Go
func Example_elastic()
```

### <a id="Example_trailingTab" href="#Example_trailingTab">func Example_trailingTab()</a>

```
searchKey: tabwriter_test.Example_trailingTab
```

```Go
func Example_trailingTab()
```

### <a id="write" href="#write">func write(t *testing.T, testname string, w *Writer, src string)</a>

```
searchKey: tabwriter_test.write
```

```Go
func write(t *testing.T, testname string, w *Writer, src string)
```

### <a id="verify" href="#verify">func verify(t *testing.T, testname string, w *Writer, b *buffer, src, expected string)</a>

```
searchKey: tabwriter_test.verify
```

```Go
func verify(t *testing.T, testname string, w *Writer, b *buffer, src, expected string)
```

### <a id="check" href="#check">func check(t *testing.T, testname string, minwidth, tabwidth, padding int, padchar byte, flags uint, src, expected string)</a>

```
searchKey: tabwriter_test.check
```

```Go
func check(t *testing.T, testname string, minwidth, tabwidth, padding int, padchar byte, flags uint, src, expected string)
```

### <a id="Test" href="#Test">func Test(t *testing.T)</a>

```
searchKey: tabwriter_test.Test
```

```Go
func Test(t *testing.T)
```

### <a id="wantPanicString" href="#wantPanicString">func wantPanicString(t *testing.T, want string)</a>

```
searchKey: tabwriter_test.wantPanicString
```

```Go
func wantPanicString(t *testing.T, want string)
```

### <a id="TestPanicDuringFlush" href="#TestPanicDuringFlush">func TestPanicDuringFlush(t *testing.T)</a>

```
searchKey: tabwriter_test.TestPanicDuringFlush
```

```Go
func TestPanicDuringFlush(t *testing.T)
```

### <a id="TestPanicDuringWrite" href="#TestPanicDuringWrite">func TestPanicDuringWrite(t *testing.T)</a>

```
searchKey: tabwriter_test.TestPanicDuringWrite
```

```Go
func TestPanicDuringWrite(t *testing.T)
```

### <a id="BenchmarkTable" href="#BenchmarkTable">func BenchmarkTable(b *testing.B)</a>

```
searchKey: tabwriter_test.BenchmarkTable
```

```Go
func BenchmarkTable(b *testing.B)
```

### <a id="BenchmarkPyramid" href="#BenchmarkPyramid">func BenchmarkPyramid(b *testing.B)</a>

```
searchKey: tabwriter_test.BenchmarkPyramid
```

```Go
func BenchmarkPyramid(b *testing.B)
```

### <a id="BenchmarkRagged" href="#BenchmarkRagged">func BenchmarkRagged(b *testing.B)</a>

```
searchKey: tabwriter_test.BenchmarkRagged
```

```Go
func BenchmarkRagged(b *testing.B)
```

### <a id="BenchmarkCode" href="#BenchmarkCode">func BenchmarkCode(b *testing.B)</a>

```
searchKey: tabwriter_test.BenchmarkCode
```

```Go
func BenchmarkCode(b *testing.B)
```

