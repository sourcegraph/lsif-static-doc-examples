# Package dwarf_test

## Index

* [Variables](#var)
    * [var file1C](#file1C)
    * [var file1H](#file1H)
    * [var file2C](#file2C)
    * [var joinTests](#joinTests)
    * [var machoBug](#machoBug)
    * [var typedefTests](#typedefTests)
    * [var unsupportedTypeTests](#unsupportedTypeTests)
* [Types](#type)
    * [type joinTest struct](#joinTest)
    * [type wantRange struct](#wantRange)
* [Functions](#func)
    * [func Test64Bit(t *testing.T)](#Test64Bit)
    * [func TestLineELFClang(t *testing.T)](#TestLineELFClang)
    * [func TestLineELFGCC(t *testing.T)](#TestLineELFGCC)
    * [func TestLineGCCWindows(t *testing.T)](#TestLineGCCWindows)
    * [func TestLineRnglists(t *testing.T)](#TestLineRnglists)
    * [func TestLineSeek(t *testing.T)](#TestLineSeek)
    * [func TestPathJoin(t *testing.T)](#TestPathJoin)
    * [func TestRangesRnglistx(t *testing.T)](#TestRangesRnglistx)
    * [func TestRangesSection(t *testing.T)](#TestRangesSection)
    * [func TestReaderRanges(t *testing.T)](#TestReaderRanges)
    * [func TestReaderSeek(t *testing.T)](#TestReaderSeek)
    * [func TestSplit(t *testing.T)](#TestSplit)
    * [func TestTypedefCycle(t *testing.T)](#TestTypedefCycle)
    * [func TestTypedefsELF(t *testing.T)](#TestTypedefsELF)
    * [func TestTypedefsELFDwarf4(t *testing.T)](#TestTypedefsELFDwarf4)
    * [func TestTypedefsMachO(t *testing.T)](#TestTypedefsMachO)
    * [func TestUnitIteration(t *testing.T)](#TestUnitIteration)
    * [func TestUnsupportedTypes(t *testing.T)](#TestUnsupportedTypes)
    * [func compareFiles(a, b []*LineFile) bool](#compareFiles)
    * [func compareLines(a, b []LineEntry) bool](#compareLines)
    * [func dumpFiles(t *testing.T, files []*LineFile)](#dumpFiles)
    * [func dumpLines(t *testing.T, lines []LineEntry)](#dumpLines)
    * [func elfData(t *testing.T, name string) *Data](#elfData)
    * [func machoData(t *testing.T, name string) *Data](#machoData)
    * [func peData(t *testing.T, name string) *Data](#peData)
    * [func testLineTable(t *testing.T, want []LineEntry, files [][]*LineFile, d *Data)](#testLineTable)
    * [func testRanges(t *testing.T, name string, want []wantRange)](#testRanges)
    * [func testTypedefs(t *testing.T, d *Data, kind string)](#testTypedefs)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="file1C" href="#file1C">var file1C</a>

```
searchKey: dwarf_test.file1C
tags: [variable struct private]
```

```Go
var file1C = &LineFile{Name: "/home/austin/go.dev/src/debug/dwarf/testdata/line1.c"}
```

### <a id="file1H" href="#file1H">var file1H</a>

```
searchKey: dwarf_test.file1H
tags: [variable struct private]
```

```Go
var file1H = &LineFile{Name: "/home/austin/go.dev/src/debug/dwarf/testdata/line1.h"}
```

### <a id="file2C" href="#file2C">var file2C</a>

```
searchKey: dwarf_test.file2C
tags: [variable struct private]
```

```Go
var file2C = &LineFile{Name: "/home/austin/go.dev/src/debug/dwarf/testdata/line2.c"}
```

### <a id="joinTests" href="#joinTests">var joinTests</a>

```
searchKey: dwarf_test.joinTests
tags: [variable array struct private]
```

```Go
var joinTests = ...
```

### <a id="machoBug" href="#machoBug">var machoBug</a>

```
searchKey: dwarf_test.machoBug
tags: [variable object private]
```

```Go
var machoBug = ...
```

As Apple converts gcc to a clang-based front end they keep breaking the DWARF output. This map lists the conversion from real answer to Apple answer. 

### <a id="typedefTests" href="#typedefTests">var typedefTests</a>

```
searchKey: dwarf_test.typedefTests
tags: [variable object private]
```

```Go
var typedefTests = ...
```

### <a id="unsupportedTypeTests" href="#unsupportedTypeTests">var unsupportedTypeTests</a>

```
searchKey: dwarf_test.unsupportedTypeTests
tags: [variable array string private]
```

```Go
var unsupportedTypeTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="joinTest" href="#joinTest">type joinTest struct</a>

```
searchKey: dwarf_test.joinTest
tags: [struct private]
```

```Go
type joinTest struct {
	dirname, filename string
	path              string
}
```

### <a id="wantRange" href="#wantRange">type wantRange struct</a>

```
searchKey: dwarf_test.wantRange
tags: [struct private]
```

```Go
type wantRange struct {
	pc     uint64
	ranges [][2]uint64
}
```

wantRange maps from a PC to the ranges of the compilation unit containing that PC. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Test64Bit" href="#Test64Bit">func Test64Bit(t *testing.T)</a>

```
searchKey: dwarf_test.Test64Bit
tags: [method private test]
```

```Go
func Test64Bit(t *testing.T)
```

### <a id="TestLineELFClang" href="#TestLineELFClang">func TestLineELFClang(t *testing.T)</a>

```
searchKey: dwarf_test.TestLineELFClang
tags: [method private test]
```

```Go
func TestLineELFClang(t *testing.T)
```

### <a id="TestLineELFGCC" href="#TestLineELFGCC">func TestLineELFGCC(t *testing.T)</a>

```
searchKey: dwarf_test.TestLineELFGCC
tags: [method private test]
```

```Go
func TestLineELFGCC(t *testing.T)
```

### <a id="TestLineGCCWindows" href="#TestLineGCCWindows">func TestLineGCCWindows(t *testing.T)</a>

```
searchKey: dwarf_test.TestLineGCCWindows
tags: [method private test]
```

```Go
func TestLineGCCWindows(t *testing.T)
```

### <a id="TestLineRnglists" href="#TestLineRnglists">func TestLineRnglists(t *testing.T)</a>

```
searchKey: dwarf_test.TestLineRnglists
tags: [method private test]
```

```Go
func TestLineRnglists(t *testing.T)
```

### <a id="TestLineSeek" href="#TestLineSeek">func TestLineSeek(t *testing.T)</a>

```
searchKey: dwarf_test.TestLineSeek
tags: [method private test]
```

```Go
func TestLineSeek(t *testing.T)
```

### <a id="TestPathJoin" href="#TestPathJoin">func TestPathJoin(t *testing.T)</a>

```
searchKey: dwarf_test.TestPathJoin
tags: [method private test]
```

```Go
func TestPathJoin(t *testing.T)
```

### <a id="TestRangesRnglistx" href="#TestRangesRnglistx">func TestRangesRnglistx(t *testing.T)</a>

```
searchKey: dwarf_test.TestRangesRnglistx
tags: [method private test]
```

```Go
func TestRangesRnglistx(t *testing.T)
```

### <a id="TestRangesSection" href="#TestRangesSection">func TestRangesSection(t *testing.T)</a>

```
searchKey: dwarf_test.TestRangesSection
tags: [method private test]
```

```Go
func TestRangesSection(t *testing.T)
```

### <a id="TestReaderRanges" href="#TestReaderRanges">func TestReaderRanges(t *testing.T)</a>

```
searchKey: dwarf_test.TestReaderRanges
tags: [method private test]
```

```Go
func TestReaderRanges(t *testing.T)
```

### <a id="TestReaderSeek" href="#TestReaderSeek">func TestReaderSeek(t *testing.T)</a>

```
searchKey: dwarf_test.TestReaderSeek
tags: [method private test]
```

```Go
func TestReaderSeek(t *testing.T)
```

### <a id="TestSplit" href="#TestSplit">func TestSplit(t *testing.T)</a>

```
searchKey: dwarf_test.TestSplit
tags: [method private test]
```

```Go
func TestSplit(t *testing.T)
```

### <a id="TestTypedefCycle" href="#TestTypedefCycle">func TestTypedefCycle(t *testing.T)</a>

```
searchKey: dwarf_test.TestTypedefCycle
tags: [method private test]
```

```Go
func TestTypedefCycle(t *testing.T)
```

### <a id="TestTypedefsELF" href="#TestTypedefsELF">func TestTypedefsELF(t *testing.T)</a>

```
searchKey: dwarf_test.TestTypedefsELF
tags: [method private test]
```

```Go
func TestTypedefsELF(t *testing.T)
```

### <a id="TestTypedefsELFDwarf4" href="#TestTypedefsELFDwarf4">func TestTypedefsELFDwarf4(t *testing.T)</a>

```
searchKey: dwarf_test.TestTypedefsELFDwarf4
tags: [method private test]
```

```Go
func TestTypedefsELFDwarf4(t *testing.T)
```

### <a id="TestTypedefsMachO" href="#TestTypedefsMachO">func TestTypedefsMachO(t *testing.T)</a>

```
searchKey: dwarf_test.TestTypedefsMachO
tags: [method private test]
```

```Go
func TestTypedefsMachO(t *testing.T)
```

### <a id="TestUnitIteration" href="#TestUnitIteration">func TestUnitIteration(t *testing.T)</a>

```
searchKey: dwarf_test.TestUnitIteration
tags: [method private test]
```

```Go
func TestUnitIteration(t *testing.T)
```

### <a id="TestUnsupportedTypes" href="#TestUnsupportedTypes">func TestUnsupportedTypes(t *testing.T)</a>

```
searchKey: dwarf_test.TestUnsupportedTypes
tags: [method private test]
```

```Go
func TestUnsupportedTypes(t *testing.T)
```

### <a id="compareFiles" href="#compareFiles">func compareFiles(a, b []*LineFile) bool</a>

```
searchKey: dwarf_test.compareFiles
tags: [method private]
```

```Go
func compareFiles(a, b []*LineFile) bool
```

### <a id="compareLines" href="#compareLines">func compareLines(a, b []LineEntry) bool</a>

```
searchKey: dwarf_test.compareLines
tags: [method private]
```

```Go
func compareLines(a, b []LineEntry) bool
```

### <a id="dumpFiles" href="#dumpFiles">func dumpFiles(t *testing.T, files []*LineFile)</a>

```
searchKey: dwarf_test.dumpFiles
tags: [method private]
```

```Go
func dumpFiles(t *testing.T, files []*LineFile)
```

### <a id="dumpLines" href="#dumpLines">func dumpLines(t *testing.T, lines []LineEntry)</a>

```
searchKey: dwarf_test.dumpLines
tags: [method private]
```

```Go
func dumpLines(t *testing.T, lines []LineEntry)
```

### <a id="elfData" href="#elfData">func elfData(t *testing.T, name string) *Data</a>

```
searchKey: dwarf_test.elfData
tags: [method private]
```

```Go
func elfData(t *testing.T, name string) *Data
```

### <a id="machoData" href="#machoData">func machoData(t *testing.T, name string) *Data</a>

```
searchKey: dwarf_test.machoData
tags: [method private]
```

```Go
func machoData(t *testing.T, name string) *Data
```

### <a id="peData" href="#peData">func peData(t *testing.T, name string) *Data</a>

```
searchKey: dwarf_test.peData
tags: [method private]
```

```Go
func peData(t *testing.T, name string) *Data
```

### <a id="testLineTable" href="#testLineTable">func testLineTable(t *testing.T, want []LineEntry, files [][]*LineFile, d *Data)</a>

```
searchKey: dwarf_test.testLineTable
tags: [method private]
```

```Go
func testLineTable(t *testing.T, want []LineEntry, files [][]*LineFile, d *Data)
```

### <a id="testRanges" href="#testRanges">func testRanges(t *testing.T, name string, want []wantRange)</a>

```
searchKey: dwarf_test.testRanges
tags: [method private]
```

```Go
func testRanges(t *testing.T, name string, want []wantRange)
```

### <a id="testTypedefs" href="#testTypedefs">func testTypedefs(t *testing.T, d *Data, kind string)</a>

```
searchKey: dwarf_test.testTypedefs
tags: [method private]
```

```Go
func testTypedefs(t *testing.T, d *Data, kind string)
```

