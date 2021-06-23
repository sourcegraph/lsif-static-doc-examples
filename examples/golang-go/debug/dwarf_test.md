# Package dwarf_test

## Index

* [Variables](#var)
    * [var file1C](#file1C)
    * [var file1H](#file1H)
    * [var file2C](#file2C)
    * [var joinTests](#joinTests)
    * [var typedefTests](#typedefTests)
    * [var machoBug](#machoBug)
    * [var unsupportedTypeTests](#unsupportedTypeTests)
* [Types](#type)
    * [type wantRange struct](#wantRange)
    * [type joinTest struct](#joinTest)
* [Functions](#func)
    * [func TestSplit(t *testing.T)](#TestSplit)
    * [func TestReaderSeek(t *testing.T)](#TestReaderSeek)
    * [func TestRangesSection(t *testing.T)](#TestRangesSection)
    * [func TestRangesRnglistx(t *testing.T)](#TestRangesRnglistx)
    * [func testRanges(t *testing.T, name string, want []wantRange)](#testRanges)
    * [func TestReaderRanges(t *testing.T)](#TestReaderRanges)
    * [func Test64Bit(t *testing.T)](#Test64Bit)
    * [func TestUnitIteration(t *testing.T)](#TestUnitIteration)
    * [func TestLineELFGCC(t *testing.T)](#TestLineELFGCC)
    * [func TestLineGCCWindows(t *testing.T)](#TestLineGCCWindows)
    * [func TestLineELFClang(t *testing.T)](#TestLineELFClang)
    * [func TestLineRnglists(t *testing.T)](#TestLineRnglists)
    * [func TestLineSeek(t *testing.T)](#TestLineSeek)
    * [func testLineTable(t *testing.T, want []LineEntry, files [][]*LineFile, d *Data)](#testLineTable)
    * [func compareFiles(a, b []*LineFile) bool](#compareFiles)
    * [func dumpFiles(t *testing.T, files []*LineFile)](#dumpFiles)
    * [func compareLines(a, b []LineEntry) bool](#compareLines)
    * [func dumpLines(t *testing.T, lines []LineEntry)](#dumpLines)
    * [func TestPathJoin(t *testing.T)](#TestPathJoin)
    * [func elfData(t *testing.T, name string) *Data](#elfData)
    * [func machoData(t *testing.T, name string) *Data](#machoData)
    * [func peData(t *testing.T, name string) *Data](#peData)
    * [func TestTypedefsELF(t *testing.T)](#TestTypedefsELF)
    * [func TestTypedefsMachO(t *testing.T)](#TestTypedefsMachO)
    * [func TestTypedefsELFDwarf4(t *testing.T)](#TestTypedefsELFDwarf4)
    * [func testTypedefs(t *testing.T, d *Data, kind string)](#testTypedefs)
    * [func TestTypedefCycle(t *testing.T)](#TestTypedefCycle)
    * [func TestUnsupportedTypes(t *testing.T)](#TestUnsupportedTypes)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="file1C" href="#file1C">var file1C</a>

```
searchKey: dwarf_test.file1C
tags: [private]
```

```Go
var file1C = &LineFile{Name: "/home/austin/go.dev/src/debug/dwarf/testdata/line1.c"}
```

### <a id="file1H" href="#file1H">var file1H</a>

```
searchKey: dwarf_test.file1H
tags: [private]
```

```Go
var file1H = &LineFile{Name: "/home/austin/go.dev/src/debug/dwarf/testdata/line1.h"}
```

### <a id="file2C" href="#file2C">var file2C</a>

```
searchKey: dwarf_test.file2C
tags: [private]
```

```Go
var file2C = &LineFile{Name: "/home/austin/go.dev/src/debug/dwarf/testdata/line2.c"}
```

### <a id="joinTests" href="#joinTests">var joinTests</a>

```
searchKey: dwarf_test.joinTests
tags: [private]
```

```Go
var joinTests = ...
```

### <a id="typedefTests" href="#typedefTests">var typedefTests</a>

```
searchKey: dwarf_test.typedefTests
tags: [private]
```

```Go
var typedefTests = ...
```

### <a id="machoBug" href="#machoBug">var machoBug</a>

```
searchKey: dwarf_test.machoBug
tags: [private]
```

```Go
var machoBug = ...
```

As Apple converts gcc to a clang-based front end they keep breaking the DWARF output. This map lists the conversion from real answer to Apple answer. 

### <a id="unsupportedTypeTests" href="#unsupportedTypeTests">var unsupportedTypeTests</a>

```
searchKey: dwarf_test.unsupportedTypeTests
tags: [private]
```

```Go
var unsupportedTypeTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="wantRange" href="#wantRange">type wantRange struct</a>

```
searchKey: dwarf_test.wantRange
tags: [private]
```

```Go
type wantRange struct {
	pc     uint64
	ranges [][2]uint64
}
```

wantRange maps from a PC to the ranges of the compilation unit containing that PC. 

### <a id="joinTest" href="#joinTest">type joinTest struct</a>

```
searchKey: dwarf_test.joinTest
tags: [private]
```

```Go
type joinTest struct {
	dirname, filename string
	path              string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestSplit" href="#TestSplit">func TestSplit(t *testing.T)</a>

```
searchKey: dwarf_test.TestSplit
tags: [private]
```

```Go
func TestSplit(t *testing.T)
```

### <a id="TestReaderSeek" href="#TestReaderSeek">func TestReaderSeek(t *testing.T)</a>

```
searchKey: dwarf_test.TestReaderSeek
tags: [private]
```

```Go
func TestReaderSeek(t *testing.T)
```

### <a id="TestRangesSection" href="#TestRangesSection">func TestRangesSection(t *testing.T)</a>

```
searchKey: dwarf_test.TestRangesSection
tags: [private]
```

```Go
func TestRangesSection(t *testing.T)
```

### <a id="TestRangesRnglistx" href="#TestRangesRnglistx">func TestRangesRnglistx(t *testing.T)</a>

```
searchKey: dwarf_test.TestRangesRnglistx
tags: [private]
```

```Go
func TestRangesRnglistx(t *testing.T)
```

### <a id="testRanges" href="#testRanges">func testRanges(t *testing.T, name string, want []wantRange)</a>

```
searchKey: dwarf_test.testRanges
tags: [private]
```

```Go
func testRanges(t *testing.T, name string, want []wantRange)
```

### <a id="TestReaderRanges" href="#TestReaderRanges">func TestReaderRanges(t *testing.T)</a>

```
searchKey: dwarf_test.TestReaderRanges
tags: [private]
```

```Go
func TestReaderRanges(t *testing.T)
```

### <a id="Test64Bit" href="#Test64Bit">func Test64Bit(t *testing.T)</a>

```
searchKey: dwarf_test.Test64Bit
tags: [private]
```

```Go
func Test64Bit(t *testing.T)
```

### <a id="TestUnitIteration" href="#TestUnitIteration">func TestUnitIteration(t *testing.T)</a>

```
searchKey: dwarf_test.TestUnitIteration
tags: [private]
```

```Go
func TestUnitIteration(t *testing.T)
```

### <a id="TestLineELFGCC" href="#TestLineELFGCC">func TestLineELFGCC(t *testing.T)</a>

```
searchKey: dwarf_test.TestLineELFGCC
tags: [private]
```

```Go
func TestLineELFGCC(t *testing.T)
```

### <a id="TestLineGCCWindows" href="#TestLineGCCWindows">func TestLineGCCWindows(t *testing.T)</a>

```
searchKey: dwarf_test.TestLineGCCWindows
tags: [private]
```

```Go
func TestLineGCCWindows(t *testing.T)
```

### <a id="TestLineELFClang" href="#TestLineELFClang">func TestLineELFClang(t *testing.T)</a>

```
searchKey: dwarf_test.TestLineELFClang
tags: [private]
```

```Go
func TestLineELFClang(t *testing.T)
```

### <a id="TestLineRnglists" href="#TestLineRnglists">func TestLineRnglists(t *testing.T)</a>

```
searchKey: dwarf_test.TestLineRnglists
tags: [private]
```

```Go
func TestLineRnglists(t *testing.T)
```

### <a id="TestLineSeek" href="#TestLineSeek">func TestLineSeek(t *testing.T)</a>

```
searchKey: dwarf_test.TestLineSeek
tags: [private]
```

```Go
func TestLineSeek(t *testing.T)
```

### <a id="testLineTable" href="#testLineTable">func testLineTable(t *testing.T, want []LineEntry, files [][]*LineFile, d *Data)</a>

```
searchKey: dwarf_test.testLineTable
tags: [private]
```

```Go
func testLineTable(t *testing.T, want []LineEntry, files [][]*LineFile, d *Data)
```

### <a id="compareFiles" href="#compareFiles">func compareFiles(a, b []*LineFile) bool</a>

```
searchKey: dwarf_test.compareFiles
tags: [private]
```

```Go
func compareFiles(a, b []*LineFile) bool
```

### <a id="dumpFiles" href="#dumpFiles">func dumpFiles(t *testing.T, files []*LineFile)</a>

```
searchKey: dwarf_test.dumpFiles
tags: [private]
```

```Go
func dumpFiles(t *testing.T, files []*LineFile)
```

### <a id="compareLines" href="#compareLines">func compareLines(a, b []LineEntry) bool</a>

```
searchKey: dwarf_test.compareLines
tags: [private]
```

```Go
func compareLines(a, b []LineEntry) bool
```

### <a id="dumpLines" href="#dumpLines">func dumpLines(t *testing.T, lines []LineEntry)</a>

```
searchKey: dwarf_test.dumpLines
tags: [private]
```

```Go
func dumpLines(t *testing.T, lines []LineEntry)
```

### <a id="TestPathJoin" href="#TestPathJoin">func TestPathJoin(t *testing.T)</a>

```
searchKey: dwarf_test.TestPathJoin
tags: [private]
```

```Go
func TestPathJoin(t *testing.T)
```

### <a id="elfData" href="#elfData">func elfData(t *testing.T, name string) *Data</a>

```
searchKey: dwarf_test.elfData
tags: [private]
```

```Go
func elfData(t *testing.T, name string) *Data
```

### <a id="machoData" href="#machoData">func machoData(t *testing.T, name string) *Data</a>

```
searchKey: dwarf_test.machoData
tags: [private]
```

```Go
func machoData(t *testing.T, name string) *Data
```

### <a id="peData" href="#peData">func peData(t *testing.T, name string) *Data</a>

```
searchKey: dwarf_test.peData
tags: [private]
```

```Go
func peData(t *testing.T, name string) *Data
```

### <a id="TestTypedefsELF" href="#TestTypedefsELF">func TestTypedefsELF(t *testing.T)</a>

```
searchKey: dwarf_test.TestTypedefsELF
tags: [private]
```

```Go
func TestTypedefsELF(t *testing.T)
```

### <a id="TestTypedefsMachO" href="#TestTypedefsMachO">func TestTypedefsMachO(t *testing.T)</a>

```
searchKey: dwarf_test.TestTypedefsMachO
tags: [private]
```

```Go
func TestTypedefsMachO(t *testing.T)
```

### <a id="TestTypedefsELFDwarf4" href="#TestTypedefsELFDwarf4">func TestTypedefsELFDwarf4(t *testing.T)</a>

```
searchKey: dwarf_test.TestTypedefsELFDwarf4
tags: [private]
```

```Go
func TestTypedefsELFDwarf4(t *testing.T)
```

### <a id="testTypedefs" href="#testTypedefs">func testTypedefs(t *testing.T, d *Data, kind string)</a>

```
searchKey: dwarf_test.testTypedefs
tags: [private]
```

```Go
func testTypedefs(t *testing.T, d *Data, kind string)
```

### <a id="TestTypedefCycle" href="#TestTypedefCycle">func TestTypedefCycle(t *testing.T)</a>

```
searchKey: dwarf_test.TestTypedefCycle
tags: [private]
```

```Go
func TestTypedefCycle(t *testing.T)
```

### <a id="TestUnsupportedTypes" href="#TestUnsupportedTypes">func TestUnsupportedTypes(t *testing.T)</a>

```
searchKey: dwarf_test.TestUnsupportedTypes
tags: [private]
```

```Go
func TestUnsupportedTypes(t *testing.T)
```

