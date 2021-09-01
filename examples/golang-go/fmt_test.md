# Package fmt_test

## Index

* [Constants](#const)
    * [const intCount](#intCount)
* [Variables](#var)
    * [var NaN](#NaN)
    * [var array](#array)
    * [var barray](#barray)
    * [var boolVal](#boolVal)
    * [var bslice](#bslice)
    * [var byteFormatterSlice](#byteFormatterSlice)
    * [var byteStringerSlice](#byteStringerSlice)
    * [var bytesVal](#bytesVal)
    * [var c](#c)
    * [var complex128Val](#complex128Val)
    * [var complex64Val](#complex64Val)
    * [var eofTests](#eofTests)
    * [var f](#f)
    * [var flagtests](#flagtests)
    * [var float32Val](#float32Val)
    * [var float64Val](#float64Val)
    * [var fmtTests](#fmtTests)
    * [var formatterFlagTests](#formatterFlagTests)
    * [var i](#i)
    * [var iarray](#iarray)
    * [var int16Val](#int16Val)
    * [var int32Val](#int32Val)
    * [var int64Val](#int64Val)
    * [var int8Val](#int8Val)
    * [var intStringVal](#intStringVal)
    * [var intVal](#intVal)
    * [var intVar](#intVar)
    * [var islice](#islice)
    * [var j](#j)
    * [var k](#k)
    * [var mallocBuf](#mallocBuf)
    * [var mallocPointer](#mallocPointer)
    * [var mallocTest](#mallocTest)
    * [var multiTests](#multiTests)
    * [var negInf](#negInf)
    * [var overflowTests](#overflowTests)
    * [var pValue](#pValue)
    * [var panictests](#panictests)
    * [var posInf](#posInf)
    * [var r1](#r1)
    * [var r2](#r2)
    * [var r3](#r3)
    * [var readers](#readers)
    * [var recurCount](#recurCount)
    * [var renamedBoolVal](#renamedBoolVal)
    * [var renamedBytesVal](#renamedBytesVal)
    * [var renamedComplex128Val](#renamedComplex128Val)
    * [var renamedComplex64Val](#renamedComplex64Val)
    * [var renamedFloat32Val](#renamedFloat32Val)
    * [var renamedFloat64Val](#renamedFloat64Val)
    * [var renamedInt16Val](#renamedInt16Val)
    * [var renamedInt32Val](#renamedInt32Val)
    * [var renamedInt64Val](#renamedInt64Val)
    * [var renamedInt8Val](#renamedInt8Val)
    * [var renamedIntVal](#renamedIntVal)
    * [var renamedStringVal](#renamedStringVal)
    * [var renamedUint16Val](#renamedUint16Val)
    * [var renamedUint32Val](#renamedUint32Val)
    * [var renamedUint64Val](#renamedUint64Val)
    * [var renamedUint8Val](#renamedUint8Val)
    * [var renamedUintVal](#renamedUintVal)
    * [var renamedUintptrVal](#renamedUintptrVal)
    * [var reorderTests](#reorderTests)
    * [var runeVal](#runeVal)
    * [var s](#s)
    * [var scanTests](#scanTests)
    * [var scanfTests](#scanfTests)
    * [var slice](#slice)
    * [var startests](#startests)
    * [var stringVal](#stringVal)
    * [var t](#t)
    * [var truth](#truth)
    * [var uint16Val](#uint16Val)
    * [var uint32Val](#uint32Val)
    * [var uint64Val](#uint64Val)
    * [var uint8Val](#uint8Val)
    * [var uintVal](#uintVal)
    * [var x](#x)
    * [var xVal](#xVal)
    * [var y](#y)
    * [var z](#z)
* [Types](#type)
    * [type A struct](#A)
    * [type Address struct](#Address)
    * [type Animal struct](#Animal)
        * [func (a Animal) String() string](#Animal.String)
    * [type B struct](#B)
    * [type C struct](#C)
    * [type F int](#F)
        * [func (f F) Format(s State, c rune)](#F.Format)
    * [type G int](#G)
        * [func (g G) GoString() string](#G.GoString)
    * [type I int](#I)
        * [func (i I) String() string](#I.String)
    * [type IntString struct](#IntString)
        * [func (s *IntString) Scan(state ScanState, verb rune) error](#IntString.Scan)
    * [type P int](#P)
        * [func (p *P) String() string](#P.String)
    * [type PanicF struct](#PanicF)
        * [func (p PanicF) Format(f State, c rune)](#PanicF.Format)
    * [type PanicGo struct](#PanicGo)
        * [func (p PanicGo) GoString() string](#PanicGo.GoString)
    * [type PanicS struct](#PanicS)
        * [func (p PanicS) String() string](#PanicS.String)
    * [type Person struct](#Person)
        * [func (p Person) GoString() string](#Person.GoString)
    * [type Recur struct](#Recur)
        * [func (r *Recur) String() string](#Recur.String)
    * [type RecursiveInt struct](#RecursiveInt)
        * [func (r *RecursiveInt) Scan(state ScanState, verb rune) (err error)](#RecursiveInt.Scan)
    * [type S struct](#S)
    * [type SE []interface{}](#SE)
    * [type SI struct](#SI)
    * [type ScanTest struct](#ScanTest)
    * [type ScanfMultiTest struct](#ScanfMultiTest)
    * [type ScanfTest struct](#ScanfTest)
    * [type TB bool](#TB)
        * [func (v TB) String() string](#TB.String)
    * [type TF float64](#TF)
        * [func (v TF) String() string](#TF.String)
    * [type TF32 float32](#TF32)
        * [func (v TF32) String() string](#TF32.String)
    * [type TF64 float64](#TF64)
        * [func (v TF64) String() string](#TF64.String)
    * [type TI int](#TI)
        * [func (v TI) String() string](#TI.String)
    * [type TI16 int16](#TI16)
        * [func (v TI16) String() string](#TI16.String)
    * [type TI32 int32](#TI32)
        * [func (v TI32) String() string](#TI32.String)
    * [type TI64 int64](#TI64)
        * [func (v TI64) String() string](#TI64.String)
    * [type TI8 int8](#TI8)
        * [func (v TI8) String() string](#TI8.String)
    * [type TS string](#TS)
        * [func (v TS) String() string](#TS.String)
    * [type TU uint](#TU)
        * [func (v TU) String() string](#TU.String)
    * [type TU16 uint16](#TU16)
        * [func (v TU16) String() string](#TU16.String)
    * [type TU32 uint32](#TU32)
        * [func (v TU32) String() string](#TU32.String)
    * [type TU64 uint64](#TU64)
        * [func (v TU64) String() string](#TU64.String)
    * [type TU8 uint8](#TU8)
        * [func (v TU8) String() string](#TU8.String)
    * [type TUI uintptr](#TUI)
        * [func (v TUI) String() string](#TUI.String)
    * [type TwoLines string](#TwoLines)
        * [func (t *TwoLines) Scan(state ScanState, verb rune) error](#TwoLines.Scan)
    * [type Xs string](#Xs)
        * [func (x *Xs) Scan(state ScanState, verb rune) error](#Xs.Scan)
    * [type byteFormatter byte](#byteFormatter)
        * [func (byteFormatter) Format(f State, _ rune)](#byteFormatter.Format)
    * [type byteStringer byte](#byteStringer)
        * [func (byteStringer) String() string](#byteStringer.String)
    * [type eofCounter struct](#eofCounter)
        * [func (ec *eofCounter) Read(b []byte) (n int, err error)](#eofCounter.Read)
    * [type errString string](#errString)
        * [func (e errString) Error() string](#errString.Error)
    * [type flagPrinter struct{}](#flagPrinter)
        * [func (flagPrinter) Format(f State, c rune)](#flagPrinter.Format)
    * [type hexBytes [2]byte](#hexBytes)
        * [func (h *hexBytes) Scan(ss ScanState, verb rune) error](#hexBytes.Scan)
    * [type renamedBool bool](#renamedBool)
    * [type renamedBytes []byte](#renamedBytes)
    * [type renamedComplex128 complex128](#renamedComplex128)
    * [type renamedComplex64 complex64](#renamedComplex64)
    * [type renamedFloat32 float32](#renamedFloat32)
    * [type renamedFloat64 float64](#renamedFloat64)
    * [type renamedInt int](#renamedInt)
    * [type renamedInt16 int16](#renamedInt16)
    * [type renamedInt32 int32](#renamedInt32)
    * [type renamedInt64 int64](#renamedInt64)
    * [type renamedInt8 int8](#renamedInt8)
    * [type renamedString string](#renamedString)
    * [type renamedUint uint](#renamedUint)
    * [type renamedUint16 uint16](#renamedUint16)
    * [type renamedUint32 uint32](#renamedUint32)
    * [type renamedUint64 uint64](#renamedUint64)
    * [type renamedUint8 uint8](#renamedUint8)
    * [type renamedUintptr uintptr](#renamedUintptr)
    * [type runeScanner struct](#runeScanner)
        * [func (rs *runeScanner) Scan(state ScanState, verb rune) error](#runeScanner.Scan)
    * [type writeStringFormatter string](#writeStringFormatter)
        * [func (sf writeStringFormatter) Format(f State, c rune)](#writeStringFormatter.Format)
* [Functions](#func)
    * [func BenchmarkFprintInt(b *testing.B)](#BenchmarkFprintInt)
    * [func BenchmarkFprintIntNoAlloc(b *testing.B)](#BenchmarkFprintIntNoAlloc)
    * [func BenchmarkFprintfBytes(b *testing.B)](#BenchmarkFprintfBytes)
    * [func BenchmarkManyArgs(b *testing.B)](#BenchmarkManyArgs)
    * [func BenchmarkScanInts(b *testing.B)](#BenchmarkScanInts)
    * [func BenchmarkScanRecursiveInt(b *testing.B)](#BenchmarkScanRecursiveInt)
    * [func BenchmarkScanRecursiveIntReaderWrapper(b *testing.B)](#BenchmarkScanRecursiveIntReaderWrapper)
    * [func BenchmarkSprintfBoolean(b *testing.B)](#BenchmarkSprintfBoolean)
    * [func BenchmarkSprintfBytes(b *testing.B)](#BenchmarkSprintfBytes)
    * [func BenchmarkSprintfComplex(b *testing.B)](#BenchmarkSprintfComplex)
    * [func BenchmarkSprintfEmpty(b *testing.B)](#BenchmarkSprintfEmpty)
    * [func BenchmarkSprintfFloat(b *testing.B)](#BenchmarkSprintfFloat)
    * [func BenchmarkSprintfHexBytes(b *testing.B)](#BenchmarkSprintfHexBytes)
    * [func BenchmarkSprintfHexString(b *testing.B)](#BenchmarkSprintfHexString)
    * [func BenchmarkSprintfInt(b *testing.B)](#BenchmarkSprintfInt)
    * [func BenchmarkSprintfIntInt(b *testing.B)](#BenchmarkSprintfIntInt)
    * [func BenchmarkSprintfPadding(b *testing.B)](#BenchmarkSprintfPadding)
    * [func BenchmarkSprintfPrefixedInt(b *testing.B)](#BenchmarkSprintfPrefixedInt)
    * [func BenchmarkSprintfQuoteString(b *testing.B)](#BenchmarkSprintfQuoteString)
    * [func BenchmarkSprintfSlowParsingPath(b *testing.B)](#BenchmarkSprintfSlowParsingPath)
    * [func BenchmarkSprintfString(b *testing.B)](#BenchmarkSprintfString)
    * [func BenchmarkSprintfStringer(b *testing.B)](#BenchmarkSprintfStringer)
    * [func BenchmarkSprintfStructure(b *testing.B)](#BenchmarkSprintfStructure)
    * [func BenchmarkSprintfTruncateBytes(b *testing.B)](#BenchmarkSprintfTruncateBytes)
    * [func BenchmarkSprintfTruncateString(b *testing.B)](#BenchmarkSprintfTruncateString)
    * [func ExampleErrorf()](#ExampleErrorf)
    * [func ExampleFprint()](#ExampleFprint)
    * [func ExampleFprintf()](#ExampleFprintf)
    * [func ExampleFprintln()](#ExampleFprintln)
    * [func ExampleFscanf()](#ExampleFscanf)
    * [func ExampleFscanln()](#ExampleFscanln)
    * [func ExampleGoStringer()](#ExampleGoStringer)
    * [func ExamplePrint()](#ExamplePrint)
    * [func ExamplePrintf()](#ExamplePrintf)
    * [func ExamplePrintln()](#ExamplePrintln)
    * [func ExampleSprint()](#ExampleSprint)
    * [func ExampleSprintf()](#ExampleSprintf)
    * [func ExampleSprintln()](#ExampleSprintln)
    * [func ExampleSscanf()](#ExampleSscanf)
    * [func ExampleStringer()](#ExampleStringer)
    * [func Example_formats()](#Example_formats)
    * [func Example_printers()](#Example_printers)
    * [func TestBadVerbRecursion(t *testing.T)](#TestBadVerbRecursion)
    * [func TestBlank(t *testing.T)](#TestBlank)
    * [func TestBlankln(t *testing.T)](#TestBlankln)
    * [func TestComplexFormatting(t *testing.T)](#TestComplexFormatting)
    * [func TestCountMallocs(t *testing.T)](#TestCountMallocs)
    * [func TestEOF(t *testing.T)](#TestEOF)
    * [func TestEOFAllTypes(t *testing.T)](#TestEOFAllTypes)
    * [func TestEOFAtEndOfInput(t *testing.T)](#TestEOFAtEndOfInput)
    * [func TestEmptyMap(t *testing.T)](#TestEmptyMap)
    * [func TestErrorf(t *testing.T)](#TestErrorf)
    * [func TestFlagParser(t *testing.T)](#TestFlagParser)
    * [func TestFmtInterface(t *testing.T)](#TestFmtInterface)
    * [func TestFormatterFlags(t *testing.T)](#TestFormatterFlags)
    * [func TestFormatterPrintln(t *testing.T)](#TestFormatterPrintln)
    * [func TestHexByte(t *testing.T)](#TestHexByte)
    * [func TestHexBytes(t *testing.T)](#TestHexBytes)
    * [func TestInf(t *testing.T)](#TestInf)
    * [func TestIsSpace(t *testing.T)](#TestIsSpace)
    * [func TestLineByLineFscanf(t *testing.T)](#TestLineByLineFscanf)
    * [func TestMapPrinter(t *testing.T)](#TestMapPrinter)
    * [func TestMultiLine(t *testing.T)](#TestMultiLine)
    * [func TestNaN(t *testing.T)](#TestNaN)
    * [func TestNilDoesNotBecomeTyped(t *testing.T)](#TestNilDoesNotBecomeTyped)
    * [func TestPanics(t *testing.T)](#TestPanics)
    * [func TestParsenum(t *testing.T)](#TestParsenum)
    * [func TestReorder(t *testing.T)](#TestReorder)
    * [func TestScan(t *testing.T)](#TestScan)
    * [func TestScanEmpty(t *testing.T)](#TestScanEmpty)
    * [func TestScanInts(t *testing.T)](#TestScanInts)
    * [func TestScanMultiple(t *testing.T)](#TestScanMultiple)
    * [func TestScanNewlinesAreSpaces(t *testing.T)](#TestScanNewlinesAreSpaces)
    * [func TestScanNotPointer(t *testing.T)](#TestScanNotPointer)
    * [func TestScanOverflow(t *testing.T)](#TestScanOverflow)
    * [func TestScanStateCount(t *testing.T)](#TestScanStateCount)
    * [func TestScanf(t *testing.T)](#TestScanf)
    * [func TestScanfMulti(t *testing.T)](#TestScanfMulti)
    * [func TestScanfNewlineMatchFormat(t *testing.T)](#TestScanfNewlineMatchFormat)
    * [func TestScanln(t *testing.T)](#TestScanln)
    * [func TestScanlnNewlinesTerminate(t *testing.T)](#TestScanlnNewlinesTerminate)
    * [func TestScanlnNoNewline(t *testing.T)](#TestScanlnNoNewline)
    * [func TestScanlnWithMiddleNewline(t *testing.T)](#TestScanlnWithMiddleNewline)
    * [func TestSlicePrinter(t *testing.T)](#TestSlicePrinter)
    * [func TestSprintf(t *testing.T)](#TestSprintf)
    * [func TestStringer(t *testing.T)](#TestStringer)
    * [func TestStructPrinter(t *testing.T)](#TestStructPrinter)
    * [func TestUnreadRuneWithBufio(t *testing.T)](#TestUnreadRuneWithBufio)
    * [func TestWidthAndPrecision(t *testing.T)](#TestWidthAndPrecision)
    * [func args(a ...interface{}) []interface{}](#args)
    * [func check(t *testing.T, got, want string)](#check)
    * [func hideFromVet(s string) string](#hideFromVet)
    * [func makeInts(n int) []byte](#makeInts)
    * [func presentInMap(s string, a []string, t *testing.T)](#presentInMap)
    * [func scanInts(r *RecursiveInt, b *bytes.Buffer) (err error)](#scanInts)
    * [func testScan(t *testing.T, f func(string) io.Reader, scan func(r io.Reader, a ...interface{}) (int, error))](#testScan)
    * [func testScanInts(t *testing.T, scan func(*RecursiveInt, *bytes.Buffer) error)](#testScanInts)
    * [func testScanfMulti(t *testing.T, f func(string) io.Reader)](#testScanfMulti)
    * [func verifyInf(str string, t *testing.T)](#verifyInf)
    * [func verifyNaN(str string, t *testing.T)](#verifyNaN)
    * [func zeroFill(prefix string, width int, suffix string) string](#zeroFill)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="intCount" href="#intCount">const intCount</a>

```
searchKey: fmt_test.intCount
tags: [constant number private]
```

```Go
const intCount = 800
```

800 is small enough to not overflow the stack when using gccgo on a platform that does not support split stack. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="NaN" href="#NaN">var NaN</a>

```
searchKey: fmt_test.NaN
tags: [variable number private]
```

```Go
var NaN = math.NaN()
```

### <a id="array" href="#array">var array</a>

```
searchKey: fmt_test.array
tags: [variable array number private]
```

```Go
var array = [5]int{1, 2, 3, 4, 5}
```

### <a id="barray" href="#barray">var barray</a>

```
searchKey: fmt_test.barray
tags: [variable array number private]
```

```Go
var barray = [5]renamedUint8{1, 2, 3, 4, 5}
```

### <a id="boolVal" href="#boolVal">var boolVal</a>

```
searchKey: fmt_test.boolVal
tags: [variable boolean private]
```

```Go
var boolVal bool
```

### <a id="bslice" href="#bslice">var bslice</a>

```
searchKey: fmt_test.bslice
tags: [variable array number private]
```

```Go
var bslice = barray[:]
```

### <a id="byteFormatterSlice" href="#byteFormatterSlice">var byteFormatterSlice</a>

```
searchKey: fmt_test.byteFormatterSlice
tags: [variable array number private]
```

```Go
var byteFormatterSlice = []byteFormatter{'h', 'e', 'l', 'l', 'o'}
```

### <a id="byteStringerSlice" href="#byteStringerSlice">var byteStringerSlice</a>

```
searchKey: fmt_test.byteStringerSlice
tags: [variable array number private]
```

```Go
var byteStringerSlice = []byteStringer{'h', 'e', 'l', 'l', 'o'}
```

### <a id="bytesVal" href="#bytesVal">var bytesVal</a>

```
searchKey: fmt_test.bytesVal
tags: [variable array number private]
```

```Go
var bytesVal []byte
```

### <a id="c" href="#c">var c</a>

```
searchKey: fmt_test.c
tags: [variable number private]
```

```Go
var c complex128
```

### <a id="complex128Val" href="#complex128Val">var complex128Val</a>

```
searchKey: fmt_test.complex128Val
tags: [variable number private]
```

```Go
var complex128Val complex128
```

### <a id="complex64Val" href="#complex64Val">var complex64Val</a>

```
searchKey: fmt_test.complex64Val
tags: [variable number private]
```

```Go
var complex64Val complex64
```

### <a id="eofTests" href="#eofTests">var eofTests</a>

```
searchKey: fmt_test.eofTests
tags: [variable array struct private]
```

```Go
var eofTests = ...
```

### <a id="f" href="#f">var f</a>

```
searchKey: fmt_test.f
tags: [variable number private]
```

```Go
var f float64
```

### <a id="flagtests" href="#flagtests">var flagtests</a>

```
searchKey: fmt_test.flagtests
tags: [variable array struct private]
```

```Go
var flagtests = ...
```

### <a id="float32Val" href="#float32Val">var float32Val</a>

```
searchKey: fmt_test.float32Val
tags: [variable number private]
```

```Go
var float32Val float32
```

### <a id="float64Val" href="#float64Val">var float64Val</a>

```
searchKey: fmt_test.float64Val
tags: [variable number private]
```

```Go
var float64Val float64
```

### <a id="fmtTests" href="#fmtTests">var fmtTests</a>

```
searchKey: fmt_test.fmtTests
tags: [variable array struct private]
```

```Go
var fmtTests = ...
```

### <a id="formatterFlagTests" href="#formatterFlagTests">var formatterFlagTests</a>

```
searchKey: fmt_test.formatterFlagTests
tags: [variable array struct private]
```

```Go
var formatterFlagTests = ...
```

### <a id="i" href="#i">var i</a>

```
searchKey: fmt_test.i
tags: [variable number private]
```

```Go
var i, j, k int
```

### <a id="iarray" href="#iarray">var iarray</a>

```
searchKey: fmt_test.iarray
tags: [variable array interface private]
```

```Go
var iarray = [4]interface{}{1, "hello", 2.5, nil}
```

### <a id="int16Val" href="#int16Val">var int16Val</a>

```
searchKey: fmt_test.int16Val
tags: [variable number private]
```

```Go
var int16Val int16
```

### <a id="int32Val" href="#int32Val">var int32Val</a>

```
searchKey: fmt_test.int32Val
tags: [variable number private]
```

```Go
var int32Val int32
```

### <a id="int64Val" href="#int64Val">var int64Val</a>

```
searchKey: fmt_test.int64Val
tags: [variable number private]
```

```Go
var int64Val int64
```

### <a id="int8Val" href="#int8Val">var int8Val</a>

```
searchKey: fmt_test.int8Val
tags: [variable number private]
```

```Go
var int8Val int8
```

### <a id="intStringVal" href="#intStringVal">var intStringVal</a>

```
searchKey: fmt_test.intStringVal
tags: [variable struct private]
```

```Go
var intStringVal IntString
```

### <a id="intVal" href="#intVal">var intVal</a>

```
searchKey: fmt_test.intVal
tags: [variable number private]
```

```Go
var intVal int
```

### <a id="intVar" href="#intVar">var intVar</a>

```
searchKey: fmt_test.intVar
tags: [variable number private]
```

```Go
var intVar = 0
```

### <a id="islice" href="#islice">var islice</a>

```
searchKey: fmt_test.islice
tags: [variable array interface private]
```

```Go
var islice = iarray[:]
```

### <a id="j" href="#j">var j</a>

```
searchKey: fmt_test.j
tags: [variable number private]
```

```Go
var i, j, k int
```

### <a id="k" href="#k">var k</a>

```
searchKey: fmt_test.k
tags: [variable number private]
```

```Go
var i, j, k int
```

### <a id="mallocBuf" href="#mallocBuf">var mallocBuf</a>

```
searchKey: fmt_test.mallocBuf
tags: [variable struct private]
```

```Go
var mallocBuf bytes.Buffer
```

### <a id="mallocPointer" href="#mallocPointer">var mallocPointer</a>

```
searchKey: fmt_test.mallocPointer
tags: [variable number private]
```

```Go
var mallocPointer *int // A pointer so we know the interface value won't allocate.

```

### <a id="mallocTest" href="#mallocTest">var mallocTest</a>

```
searchKey: fmt_test.mallocTest
tags: [variable array struct private]
```

```Go
var mallocTest = ...
```

### <a id="multiTests" href="#multiTests">var multiTests</a>

```
searchKey: fmt_test.multiTests
tags: [variable array struct private]
```

```Go
var multiTests = ...
```

### <a id="negInf" href="#negInf">var negInf</a>

```
searchKey: fmt_test.negInf
tags: [variable number private]
```

```Go
var negInf = math.Inf(-1)
```

### <a id="overflowTests" href="#overflowTests">var overflowTests</a>

```
searchKey: fmt_test.overflowTests
tags: [variable array struct private]
```

```Go
var overflowTests = ...
```

### <a id="pValue" href="#pValue">var pValue</a>

```
searchKey: fmt_test.pValue
tags: [variable number private]
```

```Go
var pValue P
```

### <a id="panictests" href="#panictests">var panictests</a>

```
searchKey: fmt_test.panictests
tags: [variable array struct private]
```

```Go
var panictests = ...
```

### <a id="posInf" href="#posInf">var posInf</a>

```
searchKey: fmt_test.posInf
tags: [variable number private]
```

```Go
var posInf = math.Inf(1)
```

### <a id="r1" href="#r1">var r1</a>

```
searchKey: fmt_test.r1
tags: [variable number private]
```

```Go
var r1, r2, r3 rune
```

### <a id="r2" href="#r2">var r2</a>

```
searchKey: fmt_test.r2
tags: [variable number private]
```

```Go
var r1, r2, r3 rune
```

### <a id="r3" href="#r3">var r3</a>

```
searchKey: fmt_test.r3
tags: [variable number private]
```

```Go
var r1, r2, r3 rune
```

### <a id="readers" href="#readers">var readers</a>

```
searchKey: fmt_test.readers
tags: [variable array struct private]
```

```Go
var readers = ...
```

### <a id="recurCount" href="#recurCount">var recurCount</a>

```
searchKey: fmt_test.recurCount
tags: [variable number private]
```

```Go
var recurCount = 0
```

recurCount tests that erroneous String routine doesn't cause fatal recursion. 

### <a id="renamedBoolVal" href="#renamedBoolVal">var renamedBoolVal</a>

```
searchKey: fmt_test.renamedBoolVal
tags: [variable boolean private]
```

```Go
var renamedBoolVal renamedBool
```

### <a id="renamedBytesVal" href="#renamedBytesVal">var renamedBytesVal</a>

```
searchKey: fmt_test.renamedBytesVal
tags: [variable array number private]
```

```Go
var renamedBytesVal renamedBytes
```

### <a id="renamedComplex128Val" href="#renamedComplex128Val">var renamedComplex128Val</a>

```
searchKey: fmt_test.renamedComplex128Val
tags: [variable number private]
```

```Go
var renamedComplex128Val renamedComplex128
```

### <a id="renamedComplex64Val" href="#renamedComplex64Val">var renamedComplex64Val</a>

```
searchKey: fmt_test.renamedComplex64Val
tags: [variable number private]
```

```Go
var renamedComplex64Val renamedComplex64
```

### <a id="renamedFloat32Val" href="#renamedFloat32Val">var renamedFloat32Val</a>

```
searchKey: fmt_test.renamedFloat32Val
tags: [variable number private]
```

```Go
var renamedFloat32Val renamedFloat32
```

### <a id="renamedFloat64Val" href="#renamedFloat64Val">var renamedFloat64Val</a>

```
searchKey: fmt_test.renamedFloat64Val
tags: [variable number private]
```

```Go
var renamedFloat64Val renamedFloat64
```

### <a id="renamedInt16Val" href="#renamedInt16Val">var renamedInt16Val</a>

```
searchKey: fmt_test.renamedInt16Val
tags: [variable number private]
```

```Go
var renamedInt16Val renamedInt16
```

### <a id="renamedInt32Val" href="#renamedInt32Val">var renamedInt32Val</a>

```
searchKey: fmt_test.renamedInt32Val
tags: [variable number private]
```

```Go
var renamedInt32Val renamedInt32
```

### <a id="renamedInt64Val" href="#renamedInt64Val">var renamedInt64Val</a>

```
searchKey: fmt_test.renamedInt64Val
tags: [variable number private]
```

```Go
var renamedInt64Val renamedInt64
```

### <a id="renamedInt8Val" href="#renamedInt8Val">var renamedInt8Val</a>

```
searchKey: fmt_test.renamedInt8Val
tags: [variable number private]
```

```Go
var renamedInt8Val renamedInt8
```

### <a id="renamedIntVal" href="#renamedIntVal">var renamedIntVal</a>

```
searchKey: fmt_test.renamedIntVal
tags: [variable number private]
```

```Go
var renamedIntVal renamedInt
```

### <a id="renamedStringVal" href="#renamedStringVal">var renamedStringVal</a>

```
searchKey: fmt_test.renamedStringVal
tags: [variable string private]
```

```Go
var renamedStringVal renamedString
```

### <a id="renamedUint16Val" href="#renamedUint16Val">var renamedUint16Val</a>

```
searchKey: fmt_test.renamedUint16Val
tags: [variable number private]
```

```Go
var renamedUint16Val renamedUint16
```

### <a id="renamedUint32Val" href="#renamedUint32Val">var renamedUint32Val</a>

```
searchKey: fmt_test.renamedUint32Val
tags: [variable number private]
```

```Go
var renamedUint32Val renamedUint32
```

### <a id="renamedUint64Val" href="#renamedUint64Val">var renamedUint64Val</a>

```
searchKey: fmt_test.renamedUint64Val
tags: [variable number private]
```

```Go
var renamedUint64Val renamedUint64
```

### <a id="renamedUint8Val" href="#renamedUint8Val">var renamedUint8Val</a>

```
searchKey: fmt_test.renamedUint8Val
tags: [variable number private]
```

```Go
var renamedUint8Val renamedUint8
```

### <a id="renamedUintVal" href="#renamedUintVal">var renamedUintVal</a>

```
searchKey: fmt_test.renamedUintVal
tags: [variable number private]
```

```Go
var renamedUintVal renamedUint
```

### <a id="renamedUintptrVal" href="#renamedUintptrVal">var renamedUintptrVal</a>

```
searchKey: fmt_test.renamedUintptrVal
tags: [variable number private]
```

```Go
var renamedUintptrVal renamedUintptr
```

### <a id="reorderTests" href="#reorderTests">var reorderTests</a>

```
searchKey: fmt_test.reorderTests
tags: [variable array struct private]
```

```Go
var reorderTests = ...
```

### <a id="runeVal" href="#runeVal">var runeVal</a>

```
searchKey: fmt_test.runeVal
tags: [variable number private]
```

```Go
var runeVal rune
```

### <a id="s" href="#s">var s</a>

```
searchKey: fmt_test.s
tags: [variable string private]
```

```Go
var s, t string
```

### <a id="scanTests" href="#scanTests">var scanTests</a>

```
searchKey: fmt_test.scanTests
tags: [variable array struct private]
```

```Go
var scanTests = ...
```

### <a id="scanfTests" href="#scanfTests">var scanfTests</a>

```
searchKey: fmt_test.scanfTests
tags: [variable array struct private]
```

```Go
var scanfTests = ...
```

### <a id="slice" href="#slice">var slice</a>

```
searchKey: fmt_test.slice
tags: [variable array number private]
```

```Go
var slice = array[:]
```

### <a id="startests" href="#startests">var startests</a>

```
searchKey: fmt_test.startests
tags: [variable array struct private]
```

```Go
var startests = ...
```

### <a id="stringVal" href="#stringVal">var stringVal</a>

```
searchKey: fmt_test.stringVal
tags: [variable string private]
```

```Go
var stringVal string
```

### <a id="t" href="#t">var t</a>

```
searchKey: fmt_test.t
tags: [variable string private]
```

```Go
var s, t string
```

### <a id="truth" href="#truth">var truth</a>

```
searchKey: fmt_test.truth
tags: [variable boolean private]
```

```Go
var truth bool
```

### <a id="uint16Val" href="#uint16Val">var uint16Val</a>

```
searchKey: fmt_test.uint16Val
tags: [variable number private]
```

```Go
var uint16Val uint16
```

### <a id="uint32Val" href="#uint32Val">var uint32Val</a>

```
searchKey: fmt_test.uint32Val
tags: [variable number private]
```

```Go
var uint32Val uint32
```

### <a id="uint64Val" href="#uint64Val">var uint64Val</a>

```
searchKey: fmt_test.uint64Val
tags: [variable number private]
```

```Go
var uint64Val uint64
```

### <a id="uint8Val" href="#uint8Val">var uint8Val</a>

```
searchKey: fmt_test.uint8Val
tags: [variable number private]
```

```Go
var uint8Val uint8
```

### <a id="uintVal" href="#uintVal">var uintVal</a>

```
searchKey: fmt_test.uintVal
tags: [variable number private]
```

```Go
var uintVal uint
```

### <a id="x" href="#x">var x</a>

```
searchKey: fmt_test.x
tags: [variable string private]
```

```Go
var x, y Xs
```

### <a id="xVal" href="#xVal">var xVal</a>

```
searchKey: fmt_test.xVal
tags: [variable string private]
```

```Go
var xVal Xs
```

### <a id="y" href="#y">var y</a>

```
searchKey: fmt_test.y
tags: [variable string private]
```

```Go
var x, y Xs
```

### <a id="z" href="#z">var z</a>

```
searchKey: fmt_test.z
tags: [variable struct private]
```

```Go
var z IntString
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="A" href="#A">type A struct</a>

```
searchKey: fmt_test.A
tags: [struct private]
```

```Go
type A struct {
	i int
	j uint
	s string
	x []int
}
```

### <a id="Address" href="#Address">type Address struct</a>

```
searchKey: fmt_test.Address
tags: [struct private]
```

```Go
type Address struct {
	City    string
	State   string
	Country string
}
```

Address has a City, State and a Country. 

### <a id="Animal" href="#Animal">type Animal struct</a>

```
searchKey: fmt_test.Animal
tags: [struct private]
```

```Go
type Animal struct {
	Name string
	Age  uint
}
```

Animal has a Name and an Age to represent an animal. 

#### <a id="Animal.String" href="#Animal.String">func (a Animal) String() string</a>

```
searchKey: fmt_test.Animal.String
tags: [method private]
```

```Go
func (a Animal) String() string
```

String makes Animal satisfy the Stringer interface. 

### <a id="B" href="#B">type B struct</a>

```
searchKey: fmt_test.B
tags: [struct private]
```

```Go
type B struct {
	I I
	j int
}
```

### <a id="C" href="#C">type C struct</a>

```
searchKey: fmt_test.C
tags: [struct private]
```

```Go
type C struct {
	i int
	B
}
```

### <a id="F" href="#F">type F int</a>

```
searchKey: fmt_test.F
tags: [number private]
```

```Go
type F int
```

#### <a id="F.Format" href="#F.Format">func (f F) Format(s State, c rune)</a>

```
searchKey: fmt_test.F.Format
tags: [method private]
```

```Go
func (f F) Format(s State, c rune)
```

### <a id="G" href="#G">type G int</a>

```
searchKey: fmt_test.G
tags: [number private]
```

```Go
type G int
```

#### <a id="G.GoString" href="#G.GoString">func (g G) GoString() string</a>

```
searchKey: fmt_test.G.GoString
tags: [method private]
```

```Go
func (g G) GoString() string
```

### <a id="I" href="#I">type I int</a>

```
searchKey: fmt_test.I
tags: [number private]
```

```Go
type I int
```

#### <a id="I.String" href="#I.String">func (i I) String() string</a>

```
searchKey: fmt_test.I.String
tags: [method private]
```

```Go
func (i I) String() string
```

### <a id="IntString" href="#IntString">type IntString struct</a>

```
searchKey: fmt_test.IntString
tags: [struct private]
```

```Go
type IntString struct {
	i int
	s string
}
```

IntString accepts an integer followed immediately by a string. It tests the embedding of a scan within a scan. 

#### <a id="IntString.Scan" href="#IntString.Scan">func (s *IntString) Scan(state ScanState, verb rune) error</a>

```
searchKey: fmt_test.IntString.Scan
tags: [method private]
```

```Go
func (s *IntString) Scan(state ScanState, verb rune) error
```

### <a id="P" href="#P">type P int</a>

```
searchKey: fmt_test.P
tags: [number private]
```

```Go
type P int
```

P is a type with a String method with pointer receiver for testing %p. 

#### <a id="P.String" href="#P.String">func (p *P) String() string</a>

```
searchKey: fmt_test.P.String
tags: [method private]
```

```Go
func (p *P) String() string
```

### <a id="PanicF" href="#PanicF">type PanicF struct</a>

```
searchKey: fmt_test.PanicF
tags: [struct private]
```

```Go
type PanicF struct {
	message interface{}
}
```

PanicF is a type that panics in Format. 

#### <a id="PanicF.Format" href="#PanicF.Format">func (p PanicF) Format(f State, c rune)</a>

```
searchKey: fmt_test.PanicF.Format
tags: [method private]
```

```Go
func (p PanicF) Format(f State, c rune)
```

Value receiver. 

### <a id="PanicGo" href="#PanicGo">type PanicGo struct</a>

```
searchKey: fmt_test.PanicGo
tags: [struct private]
```

```Go
type PanicGo struct {
	message interface{}
}
```

PanicGo is a type that panics in GoString. 

#### <a id="PanicGo.GoString" href="#PanicGo.GoString">func (p PanicGo) GoString() string</a>

```
searchKey: fmt_test.PanicGo.GoString
tags: [method private]
```

```Go
func (p PanicGo) GoString() string
```

Value receiver. 

### <a id="PanicS" href="#PanicS">type PanicS struct</a>

```
searchKey: fmt_test.PanicS
tags: [struct private]
```

```Go
type PanicS struct {
	message interface{}
}
```

PanicS is a type that panics in String. 

#### <a id="PanicS.String" href="#PanicS.String">func (p PanicS) String() string</a>

```
searchKey: fmt_test.PanicS.String
tags: [method private]
```

```Go
func (p PanicS) String() string
```

Value receiver. 

### <a id="Person" href="#Person">type Person struct</a>

```
searchKey: fmt_test.Person
tags: [struct private]
```

```Go
type Person struct {
	Name string
	Age  uint
	Addr *Address
}
```

Person has a Name, Age and Address. 

#### <a id="Person.GoString" href="#Person.GoString">func (p Person) GoString() string</a>

```
searchKey: fmt_test.Person.GoString
tags: [method private]
```

```Go
func (p Person) GoString() string
```

GoString makes Person satisfy the GoStringer interface. The return value is valid Go code that can be used to reproduce the Person struct. 

### <a id="Recur" href="#Recur">type Recur struct</a>

```
searchKey: fmt_test.Recur
tags: [struct private]
```

```Go
type Recur struct {
	i      int
	failed *bool
}
```

#### <a id="Recur.String" href="#Recur.String">func (r *Recur) String() string</a>

```
searchKey: fmt_test.Recur.String
tags: [method private]
```

```Go
func (r *Recur) String() string
```

### <a id="RecursiveInt" href="#RecursiveInt">type RecursiveInt struct</a>

```
searchKey: fmt_test.RecursiveInt
tags: [struct private]
```

```Go
type RecursiveInt struct {
	i    int
	next *RecursiveInt
}
```

RecursiveInt accepts a string matching %d.%d.%d.... and parses it into a linked list. It allows us to benchmark recursive descent style scanners. 

#### <a id="RecursiveInt.Scan" href="#RecursiveInt.Scan">func (r *RecursiveInt) Scan(state ScanState, verb rune) (err error)</a>

```
searchKey: fmt_test.RecursiveInt.Scan
tags: [method private]
```

```Go
func (r *RecursiveInt) Scan(state ScanState, verb rune) (err error)
```

### <a id="S" href="#S">type S struct</a>

```
searchKey: fmt_test.S
tags: [struct private]
```

```Go
type S struct {
	F F // a struct field that Formats
	G G // a struct field that GoStrings
}
```

### <a id="SE" href="#SE">type SE []interface{}</a>

```
searchKey: fmt_test.SE
tags: [array interface private]
```

```Go
type SE []interface{} // slice of empty; notational compactness.

```

### <a id="SI" href="#SI">type SI struct</a>

```
searchKey: fmt_test.SI
tags: [struct private]
```

```Go
type SI struct {
	I interface{}
}
```

### <a id="ScanTest" href="#ScanTest">type ScanTest struct</a>

```
searchKey: fmt_test.ScanTest
tags: [struct private]
```

```Go
type ScanTest struct {
	text string
	in   interface{}
	out  interface{}
}
```

### <a id="ScanfMultiTest" href="#ScanfMultiTest">type ScanfMultiTest struct</a>

```
searchKey: fmt_test.ScanfMultiTest
tags: [struct private]
```

```Go
type ScanfMultiTest struct {
	format string
	text   string
	in     []interface{}
	out    []interface{}
	err    string
}
```

### <a id="ScanfTest" href="#ScanfTest">type ScanfTest struct</a>

```
searchKey: fmt_test.ScanfTest
tags: [struct private]
```

```Go
type ScanfTest struct {
	format string
	text   string
	in     interface{}
	out    interface{}
}
```

### <a id="TB" href="#TB">type TB bool</a>

```
searchKey: fmt_test.TB
tags: [boolean private]
```

```Go
type TB bool
```

#### <a id="TB.String" href="#TB.String">func (v TB) String() string</a>

```
searchKey: fmt_test.TB.String
tags: [method private]
```

```Go
func (v TB) String() string
```

### <a id="TF" href="#TF">type TF float64</a>

```
searchKey: fmt_test.TF
tags: [number private]
```

```Go
type TF float64
```

#### <a id="TF.String" href="#TF.String">func (v TF) String() string</a>

```
searchKey: fmt_test.TF.String
tags: [method private]
```

```Go
func (v TF) String() string
```

### <a id="TF32" href="#TF32">type TF32 float32</a>

```
searchKey: fmt_test.TF32
tags: [number private]
```

```Go
type TF32 float32
```

#### <a id="TF32.String" href="#TF32.String">func (v TF32) String() string</a>

```
searchKey: fmt_test.TF32.String
tags: [method private]
```

```Go
func (v TF32) String() string
```

### <a id="TF64" href="#TF64">type TF64 float64</a>

```
searchKey: fmt_test.TF64
tags: [number private]
```

```Go
type TF64 float64
```

#### <a id="TF64.String" href="#TF64.String">func (v TF64) String() string</a>

```
searchKey: fmt_test.TF64.String
tags: [method private]
```

```Go
func (v TF64) String() string
```

### <a id="TI" href="#TI">type TI int</a>

```
searchKey: fmt_test.TI
tags: [number private]
```

```Go
type TI int
```

#### <a id="TI.String" href="#TI.String">func (v TI) String() string</a>

```
searchKey: fmt_test.TI.String
tags: [method private]
```

```Go
func (v TI) String() string
```

### <a id="TI16" href="#TI16">type TI16 int16</a>

```
searchKey: fmt_test.TI16
tags: [number private]
```

```Go
type TI16 int16
```

#### <a id="TI16.String" href="#TI16.String">func (v TI16) String() string</a>

```
searchKey: fmt_test.TI16.String
tags: [method private]
```

```Go
func (v TI16) String() string
```

### <a id="TI32" href="#TI32">type TI32 int32</a>

```
searchKey: fmt_test.TI32
tags: [number private]
```

```Go
type TI32 int32
```

#### <a id="TI32.String" href="#TI32.String">func (v TI32) String() string</a>

```
searchKey: fmt_test.TI32.String
tags: [method private]
```

```Go
func (v TI32) String() string
```

### <a id="TI64" href="#TI64">type TI64 int64</a>

```
searchKey: fmt_test.TI64
tags: [number private]
```

```Go
type TI64 int64
```

#### <a id="TI64.String" href="#TI64.String">func (v TI64) String() string</a>

```
searchKey: fmt_test.TI64.String
tags: [method private]
```

```Go
func (v TI64) String() string
```

### <a id="TI8" href="#TI8">type TI8 int8</a>

```
searchKey: fmt_test.TI8
tags: [number private]
```

```Go
type TI8 int8
```

#### <a id="TI8.String" href="#TI8.String">func (v TI8) String() string</a>

```
searchKey: fmt_test.TI8.String
tags: [method private]
```

```Go
func (v TI8) String() string
```

### <a id="TS" href="#TS">type TS string</a>

```
searchKey: fmt_test.TS
tags: [string private]
```

```Go
type TS string
```

#### <a id="TS.String" href="#TS.String">func (v TS) String() string</a>

```
searchKey: fmt_test.TS.String
tags: [method private]
```

```Go
func (v TS) String() string
```

### <a id="TU" href="#TU">type TU uint</a>

```
searchKey: fmt_test.TU
tags: [number private]
```

```Go
type TU uint
```

#### <a id="TU.String" href="#TU.String">func (v TU) String() string</a>

```
searchKey: fmt_test.TU.String
tags: [method private]
```

```Go
func (v TU) String() string
```

### <a id="TU16" href="#TU16">type TU16 uint16</a>

```
searchKey: fmt_test.TU16
tags: [number private]
```

```Go
type TU16 uint16
```

#### <a id="TU16.String" href="#TU16.String">func (v TU16) String() string</a>

```
searchKey: fmt_test.TU16.String
tags: [method private]
```

```Go
func (v TU16) String() string
```

### <a id="TU32" href="#TU32">type TU32 uint32</a>

```
searchKey: fmt_test.TU32
tags: [number private]
```

```Go
type TU32 uint32
```

#### <a id="TU32.String" href="#TU32.String">func (v TU32) String() string</a>

```
searchKey: fmt_test.TU32.String
tags: [method private]
```

```Go
func (v TU32) String() string
```

### <a id="TU64" href="#TU64">type TU64 uint64</a>

```
searchKey: fmt_test.TU64
tags: [number private]
```

```Go
type TU64 uint64
```

#### <a id="TU64.String" href="#TU64.String">func (v TU64) String() string</a>

```
searchKey: fmt_test.TU64.String
tags: [method private]
```

```Go
func (v TU64) String() string
```

### <a id="TU8" href="#TU8">type TU8 uint8</a>

```
searchKey: fmt_test.TU8
tags: [number private]
```

```Go
type TU8 uint8
```

#### <a id="TU8.String" href="#TU8.String">func (v TU8) String() string</a>

```
searchKey: fmt_test.TU8.String
tags: [method private]
```

```Go
func (v TU8) String() string
```

### <a id="TUI" href="#TUI">type TUI uintptr</a>

```
searchKey: fmt_test.TUI
tags: [number private]
```

```Go
type TUI uintptr
```

#### <a id="TUI.String" href="#TUI.String">func (v TUI) String() string</a>

```
searchKey: fmt_test.TUI.String
tags: [method private]
```

```Go
func (v TUI) String() string
```

### <a id="TwoLines" href="#TwoLines">type TwoLines string</a>

```
searchKey: fmt_test.TwoLines
tags: [string private]
```

```Go
type TwoLines string
```

#### <a id="TwoLines.Scan" href="#TwoLines.Scan">func (t *TwoLines) Scan(state ScanState, verb rune) error</a>

```
searchKey: fmt_test.TwoLines.Scan
tags: [method private]
```

```Go
func (t *TwoLines) Scan(state ScanState, verb rune) error
```

Scan attempts to read two lines into the object. Scanln should prevent this because it stops at newline; Scan and Scanf should be fine. 

### <a id="Xs" href="#Xs">type Xs string</a>

```
searchKey: fmt_test.Xs
tags: [string private]
```

```Go
type Xs string
```

Xs accepts any non-empty run of the verb character 

#### <a id="Xs.Scan" href="#Xs.Scan">func (x *Xs) Scan(state ScanState, verb rune) error</a>

```
searchKey: fmt_test.Xs.Scan
tags: [method private]
```

```Go
func (x *Xs) Scan(state ScanState, verb rune) error
```

### <a id="byteFormatter" href="#byteFormatter">type byteFormatter byte</a>

```
searchKey: fmt_test.byteFormatter
tags: [number private]
```

```Go
type byteFormatter byte
```

#### <a id="byteFormatter.Format" href="#byteFormatter.Format">func (byteFormatter) Format(f State, _ rune)</a>

```
searchKey: fmt_test.byteFormatter.Format
tags: [method private]
```

```Go
func (byteFormatter) Format(f State, _ rune)
```

### <a id="byteStringer" href="#byteStringer">type byteStringer byte</a>

```
searchKey: fmt_test.byteStringer
tags: [number private]
```

```Go
type byteStringer byte
```

#### <a id="byteStringer.String" href="#byteStringer.String">func (byteStringer) String() string</a>

```
searchKey: fmt_test.byteStringer.String
tags: [method private]
```

```Go
func (byteStringer) String() string
```

### <a id="eofCounter" href="#eofCounter">type eofCounter struct</a>

```
searchKey: fmt_test.eofCounter
tags: [struct private]
```

```Go
type eofCounter struct {
	reader   *strings.Reader
	eofCount int
}
```

eofCounter is a special Reader that counts reads at end of file. 

#### <a id="eofCounter.Read" href="#eofCounter.Read">func (ec *eofCounter) Read(b []byte) (n int, err error)</a>

```
searchKey: fmt_test.eofCounter.Read
tags: [method private]
```

```Go
func (ec *eofCounter) Read(b []byte) (n int, err error)
```

### <a id="errString" href="#errString">type errString string</a>

```
searchKey: fmt_test.errString
tags: [string private]
```

```Go
type errString string
```

#### <a id="errString.Error" href="#errString.Error">func (e errString) Error() string</a>

```
searchKey: fmt_test.errString.Error
tags: [method private]
```

```Go
func (e errString) Error() string
```

### <a id="flagPrinter" href="#flagPrinter">type flagPrinter struct{}</a>

```
searchKey: fmt_test.flagPrinter
tags: [struct private]
```

```Go
type flagPrinter struct{}
```

#### <a id="flagPrinter.Format" href="#flagPrinter.Format">func (flagPrinter) Format(f State, c rune)</a>

```
searchKey: fmt_test.flagPrinter.Format
tags: [method private]
```

```Go
func (flagPrinter) Format(f State, c rune)
```

### <a id="hexBytes" href="#hexBytes">type hexBytes [2]byte</a>

```
searchKey: fmt_test.hexBytes
tags: [array number private]
```

```Go
type hexBytes [2]byte
```

#### <a id="hexBytes.Scan" href="#hexBytes.Scan">func (h *hexBytes) Scan(ss ScanState, verb rune) error</a>

```
searchKey: fmt_test.hexBytes.Scan
tags: [method private]
```

```Go
func (h *hexBytes) Scan(ss ScanState, verb rune) error
```

### <a id="renamedBool" href="#renamedBool">type renamedBool bool</a>

```
searchKey: fmt_test.renamedBool
tags: [boolean private]
```

```Go
type renamedBool bool
```

### <a id="renamedBytes" href="#renamedBytes">type renamedBytes []byte</a>

```
searchKey: fmt_test.renamedBytes
tags: [array number private]
```

```Go
type renamedBytes []byte
```

### <a id="renamedComplex128" href="#renamedComplex128">type renamedComplex128 complex128</a>

```
searchKey: fmt_test.renamedComplex128
tags: [number private]
```

```Go
type renamedComplex128 complex128
```

### <a id="renamedComplex64" href="#renamedComplex64">type renamedComplex64 complex64</a>

```
searchKey: fmt_test.renamedComplex64
tags: [number private]
```

```Go
type renamedComplex64 complex64
```

### <a id="renamedFloat32" href="#renamedFloat32">type renamedFloat32 float32</a>

```
searchKey: fmt_test.renamedFloat32
tags: [number private]
```

```Go
type renamedFloat32 float32
```

### <a id="renamedFloat64" href="#renamedFloat64">type renamedFloat64 float64</a>

```
searchKey: fmt_test.renamedFloat64
tags: [number private]
```

```Go
type renamedFloat64 float64
```

### <a id="renamedInt" href="#renamedInt">type renamedInt int</a>

```
searchKey: fmt_test.renamedInt
tags: [number private]
```

```Go
type renamedInt int
```

### <a id="renamedInt16" href="#renamedInt16">type renamedInt16 int16</a>

```
searchKey: fmt_test.renamedInt16
tags: [number private]
```

```Go
type renamedInt16 int16
```

### <a id="renamedInt32" href="#renamedInt32">type renamedInt32 int32</a>

```
searchKey: fmt_test.renamedInt32
tags: [number private]
```

```Go
type renamedInt32 int32
```

### <a id="renamedInt64" href="#renamedInt64">type renamedInt64 int64</a>

```
searchKey: fmt_test.renamedInt64
tags: [number private]
```

```Go
type renamedInt64 int64
```

### <a id="renamedInt8" href="#renamedInt8">type renamedInt8 int8</a>

```
searchKey: fmt_test.renamedInt8
tags: [number private]
```

```Go
type renamedInt8 int8
```

### <a id="renamedString" href="#renamedString">type renamedString string</a>

```
searchKey: fmt_test.renamedString
tags: [string private]
```

```Go
type renamedString string
```

### <a id="renamedUint" href="#renamedUint">type renamedUint uint</a>

```
searchKey: fmt_test.renamedUint
tags: [number private]
```

```Go
type renamedUint uint
```

### <a id="renamedUint16" href="#renamedUint16">type renamedUint16 uint16</a>

```
searchKey: fmt_test.renamedUint16
tags: [number private]
```

```Go
type renamedUint16 uint16
```

### <a id="renamedUint32" href="#renamedUint32">type renamedUint32 uint32</a>

```
searchKey: fmt_test.renamedUint32
tags: [number private]
```

```Go
type renamedUint32 uint32
```

### <a id="renamedUint64" href="#renamedUint64">type renamedUint64 uint64</a>

```
searchKey: fmt_test.renamedUint64
tags: [number private]
```

```Go
type renamedUint64 uint64
```

### <a id="renamedUint8" href="#renamedUint8">type renamedUint8 uint8</a>

```
searchKey: fmt_test.renamedUint8
tags: [number private]
```

```Go
type renamedUint8 uint8
```

### <a id="renamedUintptr" href="#renamedUintptr">type renamedUintptr uintptr</a>

```
searchKey: fmt_test.renamedUintptr
tags: [number private]
```

```Go
type renamedUintptr uintptr
```

### <a id="runeScanner" href="#runeScanner">type runeScanner struct</a>

```
searchKey: fmt_test.runeScanner
tags: [struct private]
```

```Go
type runeScanner struct {
	rune rune
	size int
}
```

runeScanner implements the Scanner interface for TestScanStateCount. 

#### <a id="runeScanner.Scan" href="#runeScanner.Scan">func (rs *runeScanner) Scan(state ScanState, verb rune) error</a>

```
searchKey: fmt_test.runeScanner.Scan
tags: [method private]
```

```Go
func (rs *runeScanner) Scan(state ScanState, verb rune) error
```

### <a id="writeStringFormatter" href="#writeStringFormatter">type writeStringFormatter string</a>

```
searchKey: fmt_test.writeStringFormatter
tags: [string private]
```

```Go
type writeStringFormatter string
```

#### <a id="writeStringFormatter.Format" href="#writeStringFormatter.Format">func (sf writeStringFormatter) Format(f State, c rune)</a>

```
searchKey: fmt_test.writeStringFormatter.Format
tags: [method private]
```

```Go
func (sf writeStringFormatter) Format(f State, c rune)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkFprintInt" href="#BenchmarkFprintInt">func BenchmarkFprintInt(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkFprintInt
tags: [function private benchmark]
```

```Go
func BenchmarkFprintInt(b *testing.B)
```

### <a id="BenchmarkFprintIntNoAlloc" href="#BenchmarkFprintIntNoAlloc">func BenchmarkFprintIntNoAlloc(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkFprintIntNoAlloc
tags: [function private benchmark]
```

```Go
func BenchmarkFprintIntNoAlloc(b *testing.B)
```

### <a id="BenchmarkFprintfBytes" href="#BenchmarkFprintfBytes">func BenchmarkFprintfBytes(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkFprintfBytes
tags: [function private benchmark]
```

```Go
func BenchmarkFprintfBytes(b *testing.B)
```

### <a id="BenchmarkManyArgs" href="#BenchmarkManyArgs">func BenchmarkManyArgs(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkManyArgs
tags: [function private benchmark]
```

```Go
func BenchmarkManyArgs(b *testing.B)
```

### <a id="BenchmarkScanInts" href="#BenchmarkScanInts">func BenchmarkScanInts(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkScanInts
tags: [function private benchmark]
```

```Go
func BenchmarkScanInts(b *testing.B)
```

### <a id="BenchmarkScanRecursiveInt" href="#BenchmarkScanRecursiveInt">func BenchmarkScanRecursiveInt(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkScanRecursiveInt
tags: [function private benchmark]
```

```Go
func BenchmarkScanRecursiveInt(b *testing.B)
```

### <a id="BenchmarkScanRecursiveIntReaderWrapper" href="#BenchmarkScanRecursiveIntReaderWrapper">func BenchmarkScanRecursiveIntReaderWrapper(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkScanRecursiveIntReaderWrapper
tags: [function private benchmark]
```

```Go
func BenchmarkScanRecursiveIntReaderWrapper(b *testing.B)
```

### <a id="BenchmarkSprintfBoolean" href="#BenchmarkSprintfBoolean">func BenchmarkSprintfBoolean(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfBoolean
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfBoolean(b *testing.B)
```

### <a id="BenchmarkSprintfBytes" href="#BenchmarkSprintfBytes">func BenchmarkSprintfBytes(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfBytes
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfBytes(b *testing.B)
```

### <a id="BenchmarkSprintfComplex" href="#BenchmarkSprintfComplex">func BenchmarkSprintfComplex(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfComplex
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfComplex(b *testing.B)
```

### <a id="BenchmarkSprintfEmpty" href="#BenchmarkSprintfEmpty">func BenchmarkSprintfEmpty(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfEmpty
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfEmpty(b *testing.B)
```

### <a id="BenchmarkSprintfFloat" href="#BenchmarkSprintfFloat">func BenchmarkSprintfFloat(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfFloat
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfFloat(b *testing.B)
```

### <a id="BenchmarkSprintfHexBytes" href="#BenchmarkSprintfHexBytes">func BenchmarkSprintfHexBytes(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfHexBytes
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfHexBytes(b *testing.B)
```

### <a id="BenchmarkSprintfHexString" href="#BenchmarkSprintfHexString">func BenchmarkSprintfHexString(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfHexString
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfHexString(b *testing.B)
```

### <a id="BenchmarkSprintfInt" href="#BenchmarkSprintfInt">func BenchmarkSprintfInt(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfInt
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfInt(b *testing.B)
```

### <a id="BenchmarkSprintfIntInt" href="#BenchmarkSprintfIntInt">func BenchmarkSprintfIntInt(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfIntInt
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfIntInt(b *testing.B)
```

### <a id="BenchmarkSprintfPadding" href="#BenchmarkSprintfPadding">func BenchmarkSprintfPadding(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfPadding
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfPadding(b *testing.B)
```

### <a id="BenchmarkSprintfPrefixedInt" href="#BenchmarkSprintfPrefixedInt">func BenchmarkSprintfPrefixedInt(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfPrefixedInt
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfPrefixedInt(b *testing.B)
```

### <a id="BenchmarkSprintfQuoteString" href="#BenchmarkSprintfQuoteString">func BenchmarkSprintfQuoteString(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfQuoteString
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfQuoteString(b *testing.B)
```

### <a id="BenchmarkSprintfSlowParsingPath" href="#BenchmarkSprintfSlowParsingPath">func BenchmarkSprintfSlowParsingPath(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfSlowParsingPath
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfSlowParsingPath(b *testing.B)
```

### <a id="BenchmarkSprintfString" href="#BenchmarkSprintfString">func BenchmarkSprintfString(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfString
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfString(b *testing.B)
```

### <a id="BenchmarkSprintfStringer" href="#BenchmarkSprintfStringer">func BenchmarkSprintfStringer(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfStringer
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfStringer(b *testing.B)
```

### <a id="BenchmarkSprintfStructure" href="#BenchmarkSprintfStructure">func BenchmarkSprintfStructure(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfStructure
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfStructure(b *testing.B)
```

### <a id="BenchmarkSprintfTruncateBytes" href="#BenchmarkSprintfTruncateBytes">func BenchmarkSprintfTruncateBytes(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfTruncateBytes
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfTruncateBytes(b *testing.B)
```

### <a id="BenchmarkSprintfTruncateString" href="#BenchmarkSprintfTruncateString">func BenchmarkSprintfTruncateString(b *testing.B)</a>

```
searchKey: fmt_test.BenchmarkSprintfTruncateString
tags: [function private benchmark]
```

```Go
func BenchmarkSprintfTruncateString(b *testing.B)
```

### <a id="ExampleErrorf" href="#ExampleErrorf">func ExampleErrorf()</a>

```
searchKey: fmt_test.ExampleErrorf
tags: [function private]
```

```Go
func ExampleErrorf()
```

The Errorf function lets us use formatting features to create descriptive error messages. 

### <a id="ExampleFprint" href="#ExampleFprint">func ExampleFprint()</a>

```
searchKey: fmt_test.ExampleFprint
tags: [function private]
```

```Go
func ExampleFprint()
```

### <a id="ExampleFprintf" href="#ExampleFprintf">func ExampleFprintf()</a>

```
searchKey: fmt_test.ExampleFprintf
tags: [function private]
```

```Go
func ExampleFprintf()
```

### <a id="ExampleFprintln" href="#ExampleFprintln">func ExampleFprintln()</a>

```
searchKey: fmt_test.ExampleFprintln
tags: [function private]
```

```Go
func ExampleFprintln()
```

### <a id="ExampleFscanf" href="#ExampleFscanf">func ExampleFscanf()</a>

```
searchKey: fmt_test.ExampleFscanf
tags: [function private]
```

```Go
func ExampleFscanf()
```

### <a id="ExampleFscanln" href="#ExampleFscanln">func ExampleFscanln()</a>

```
searchKey: fmt_test.ExampleFscanln
tags: [function private]
```

```Go
func ExampleFscanln()
```

### <a id="ExampleGoStringer" href="#ExampleGoStringer">func ExampleGoStringer()</a>

```
searchKey: fmt_test.ExampleGoStringer
tags: [function private]
```

```Go
func ExampleGoStringer()
```

### <a id="ExamplePrint" href="#ExamplePrint">func ExamplePrint()</a>

```
searchKey: fmt_test.ExamplePrint
tags: [function private]
```

```Go
func ExamplePrint()
```

### <a id="ExamplePrintf" href="#ExamplePrintf">func ExamplePrintf()</a>

```
searchKey: fmt_test.ExamplePrintf
tags: [function private]
```

```Go
func ExamplePrintf()
```

### <a id="ExamplePrintln" href="#ExamplePrintln">func ExamplePrintln()</a>

```
searchKey: fmt_test.ExamplePrintln
tags: [function private]
```

```Go
func ExamplePrintln()
```

### <a id="ExampleSprint" href="#ExampleSprint">func ExampleSprint()</a>

```
searchKey: fmt_test.ExampleSprint
tags: [function private]
```

```Go
func ExampleSprint()
```

### <a id="ExampleSprintf" href="#ExampleSprintf">func ExampleSprintf()</a>

```
searchKey: fmt_test.ExampleSprintf
tags: [function private]
```

```Go
func ExampleSprintf()
```

### <a id="ExampleSprintln" href="#ExampleSprintln">func ExampleSprintln()</a>

```
searchKey: fmt_test.ExampleSprintln
tags: [function private]
```

```Go
func ExampleSprintln()
```

### <a id="ExampleSscanf" href="#ExampleSscanf">func ExampleSscanf()</a>

```
searchKey: fmt_test.ExampleSscanf
tags: [function private]
```

```Go
func ExampleSscanf()
```

### <a id="ExampleStringer" href="#ExampleStringer">func ExampleStringer()</a>

```
searchKey: fmt_test.ExampleStringer
tags: [function private]
```

```Go
func ExampleStringer()
```

### <a id="Example_formats" href="#Example_formats">func Example_formats()</a>

```
searchKey: fmt_test.Example_formats
tags: [function private]
```

```Go
func Example_formats()
```

These examples demonstrate the basics of printing using a format string. Printf, Sprintf, and Fprintf all take a format string that specifies how to format the subsequent arguments. For example, %d (we call that a 'verb') says to print the corresponding argument, which must be an integer (or something containing an integer, such as a slice of ints) in decimal. The verb %v ('v' for 'value') always formats the argument in its default form, just how Print or Println would show it. The special verb %T ('T' for 'Type') prints the type of the argument rather than its value. The examples are not exhaustive; see the package comment for all the details. 

### <a id="Example_printers" href="#Example_printers">func Example_printers()</a>

```
searchKey: fmt_test.Example_printers
tags: [function private]
```

```Go
func Example_printers()
```

Print, Println, and Printf lay out their arguments differently. In this example we can compare their behaviors. Println always adds blanks between the items it prints, while Print adds blanks only between non-string arguments and Printf does exactly what it is told. Sprint, Sprintln, Sprintf, Fprint, Fprintln, and Fprintf behave the same as their corresponding Print, Println, and Printf functions shown here. 

### <a id="TestBadVerbRecursion" href="#TestBadVerbRecursion">func TestBadVerbRecursion(t *testing.T)</a>

```
searchKey: fmt_test.TestBadVerbRecursion
tags: [function private test]
```

```Go
func TestBadVerbRecursion(t *testing.T)
```

### <a id="TestBlank" href="#TestBlank">func TestBlank(t *testing.T)</a>

```
searchKey: fmt_test.TestBlank
tags: [function private test]
```

```Go
func TestBlank(t *testing.T)
```

TestBlank checks that Sprint (and hence Print, Fprint) puts spaces in the right places, that is, between arg pairs in which neither is a string. 

### <a id="TestBlankln" href="#TestBlankln">func TestBlankln(t *testing.T)</a>

```
searchKey: fmt_test.TestBlankln
tags: [function private test]
```

```Go
func TestBlankln(t *testing.T)
```

TestBlankln checks that Sprintln (and hence Println, Fprintln) puts spaces in the right places, that is, between all arg pairs. 

### <a id="TestComplexFormatting" href="#TestComplexFormatting">func TestComplexFormatting(t *testing.T)</a>

```
searchKey: fmt_test.TestComplexFormatting
tags: [function private test]
```

```Go
func TestComplexFormatting(t *testing.T)
```

TestComplexFormatting checks that a complex always formats to the same thing as if done by hand with two singleton prints. 

### <a id="TestCountMallocs" href="#TestCountMallocs">func TestCountMallocs(t *testing.T)</a>

```
searchKey: fmt_test.TestCountMallocs
tags: [function private test]
```

```Go
func TestCountMallocs(t *testing.T)
```

### <a id="TestEOF" href="#TestEOF">func TestEOF(t *testing.T)</a>

```
searchKey: fmt_test.TestEOF
tags: [function private test]
```

```Go
func TestEOF(t *testing.T)
```

TestEOF verifies that when we scan, we see at most EOF once per call to a Scan function, and then only when it's really an EOF. 

### <a id="TestEOFAllTypes" href="#TestEOFAllTypes">func TestEOFAllTypes(t *testing.T)</a>

```
searchKey: fmt_test.TestEOFAllTypes
tags: [function private test]
```

```Go
func TestEOFAllTypes(t *testing.T)
```

### <a id="TestEOFAtEndOfInput" href="#TestEOFAtEndOfInput">func TestEOFAtEndOfInput(t *testing.T)</a>

```
searchKey: fmt_test.TestEOFAtEndOfInput
tags: [function private test]
```

```Go
func TestEOFAtEndOfInput(t *testing.T)
```

TestEOFAtEndOfInput verifies that we see an EOF error if we run out of input. This was a buglet: we used to get "expected integer". 

### <a id="TestEmptyMap" href="#TestEmptyMap">func TestEmptyMap(t *testing.T)</a>

```
searchKey: fmt_test.TestEmptyMap
tags: [function private test]
```

```Go
func TestEmptyMap(t *testing.T)
```

### <a id="TestErrorf" href="#TestErrorf">func TestErrorf(t *testing.T)</a>

```
searchKey: fmt_test.TestErrorf
tags: [function private test]
```

```Go
func TestErrorf(t *testing.T)
```

### <a id="TestFlagParser" href="#TestFlagParser">func TestFlagParser(t *testing.T)</a>

```
searchKey: fmt_test.TestFlagParser
tags: [function private test]
```

```Go
func TestFlagParser(t *testing.T)
```

### <a id="TestFmtInterface" href="#TestFmtInterface">func TestFmtInterface(t *testing.T)</a>

```
searchKey: fmt_test.TestFmtInterface
tags: [function private test]
```

```Go
func TestFmtInterface(t *testing.T)
```

### <a id="TestFormatterFlags" href="#TestFormatterFlags">func TestFormatterFlags(t *testing.T)</a>

```
searchKey: fmt_test.TestFormatterFlags
tags: [function private test]
```

```Go
func TestFormatterFlags(t *testing.T)
```

### <a id="TestFormatterPrintln" href="#TestFormatterPrintln">func TestFormatterPrintln(t *testing.T)</a>

```
searchKey: fmt_test.TestFormatterPrintln
tags: [function private test]
```

```Go
func TestFormatterPrintln(t *testing.T)
```

TestFormatterPrintln checks Formatter with Sprint, Sprintln, Sprintf. 

### <a id="TestHexByte" href="#TestHexByte">func TestHexByte(t *testing.T)</a>

```
searchKey: fmt_test.TestHexByte
tags: [function private test]
```

```Go
func TestHexByte(t *testing.T)
```

### <a id="TestHexBytes" href="#TestHexBytes">func TestHexBytes(t *testing.T)</a>

```
searchKey: fmt_test.TestHexBytes
tags: [function private test]
```

```Go
func TestHexBytes(t *testing.T)
```

Issue 9124. %x on bytes couldn't handle non-space bytes terminating the scan. 

### <a id="TestInf" href="#TestInf">func TestInf(t *testing.T)</a>

```
searchKey: fmt_test.TestInf
tags: [function private test]
```

```Go
func TestInf(t *testing.T)
```

### <a id="TestIsSpace" href="#TestIsSpace">func TestIsSpace(t *testing.T)</a>

```
searchKey: fmt_test.TestIsSpace
tags: [function private test]
```

```Go
func TestIsSpace(t *testing.T)
```

### <a id="TestLineByLineFscanf" href="#TestLineByLineFscanf">func TestLineByLineFscanf(t *testing.T)</a>

```
searchKey: fmt_test.TestLineByLineFscanf
tags: [function private test]
```

```Go
func TestLineByLineFscanf(t *testing.T)
```

TestLineByLineFscanf tests that Fscanf does not read past newline. Issue 3481. 

### <a id="TestMapPrinter" href="#TestMapPrinter">func TestMapPrinter(t *testing.T)</a>

```
searchKey: fmt_test.TestMapPrinter
tags: [function private test]
```

```Go
func TestMapPrinter(t *testing.T)
```

### <a id="TestMultiLine" href="#TestMultiLine">func TestMultiLine(t *testing.T)</a>

```
searchKey: fmt_test.TestMultiLine
tags: [function private test]
```

```Go
func TestMultiLine(t *testing.T)
```

### <a id="TestNaN" href="#TestNaN">func TestNaN(t *testing.T)</a>

```
searchKey: fmt_test.TestNaN
tags: [function private test]
```

```Go
func TestNaN(t *testing.T)
```

### <a id="TestNilDoesNotBecomeTyped" href="#TestNilDoesNotBecomeTyped">func TestNilDoesNotBecomeTyped(t *testing.T)</a>

```
searchKey: fmt_test.TestNilDoesNotBecomeTyped
tags: [function private test]
```

```Go
func TestNilDoesNotBecomeTyped(t *testing.T)
```

### <a id="TestPanics" href="#TestPanics">func TestPanics(t *testing.T)</a>

```
searchKey: fmt_test.TestPanics
tags: [function private test]
```

```Go
func TestPanics(t *testing.T)
```

### <a id="TestParsenum" href="#TestParsenum">func TestParsenum(t *testing.T)</a>

```
searchKey: fmt_test.TestParsenum
tags: [function private test]
```

```Go
func TestParsenum(t *testing.T)
```

### <a id="TestReorder" href="#TestReorder">func TestReorder(t *testing.T)</a>

```
searchKey: fmt_test.TestReorder
tags: [function private test]
```

```Go
func TestReorder(t *testing.T)
```

### <a id="TestScan" href="#TestScan">func TestScan(t *testing.T)</a>

```
searchKey: fmt_test.TestScan
tags: [function private test]
```

```Go
func TestScan(t *testing.T)
```

### <a id="TestScanEmpty" href="#TestScanEmpty">func TestScanEmpty(t *testing.T)</a>

```
searchKey: fmt_test.TestScanEmpty
tags: [function private test]
```

```Go
func TestScanEmpty(t *testing.T)
```

Empty strings are not valid input when scanning a string. 

### <a id="TestScanInts" href="#TestScanInts">func TestScanInts(t *testing.T)</a>

```
searchKey: fmt_test.TestScanInts
tags: [function private test]
```

```Go
func TestScanInts(t *testing.T)
```

### <a id="TestScanMultiple" href="#TestScanMultiple">func TestScanMultiple(t *testing.T)</a>

```
searchKey: fmt_test.TestScanMultiple
tags: [function private test]
```

```Go
func TestScanMultiple(t *testing.T)
```

### <a id="TestScanNewlinesAreSpaces" href="#TestScanNewlinesAreSpaces">func TestScanNewlinesAreSpaces(t *testing.T)</a>

```
searchKey: fmt_test.TestScanNewlinesAreSpaces
tags: [function private test]
```

```Go
func TestScanNewlinesAreSpaces(t *testing.T)
```

### <a id="TestScanNotPointer" href="#TestScanNotPointer">func TestScanNotPointer(t *testing.T)</a>

```
searchKey: fmt_test.TestScanNotPointer
tags: [function private test]
```

```Go
func TestScanNotPointer(t *testing.T)
```

### <a id="TestScanOverflow" href="#TestScanOverflow">func TestScanOverflow(t *testing.T)</a>

```
searchKey: fmt_test.TestScanOverflow
tags: [function private test]
```

```Go
func TestScanOverflow(t *testing.T)
```

### <a id="TestScanStateCount" href="#TestScanStateCount">func TestScanStateCount(t *testing.T)</a>

```
searchKey: fmt_test.TestScanStateCount
tags: [function private test]
```

```Go
func TestScanStateCount(t *testing.T)
```

### <a id="TestScanf" href="#TestScanf">func TestScanf(t *testing.T)</a>

```
searchKey: fmt_test.TestScanf
tags: [function private test]
```

```Go
func TestScanf(t *testing.T)
```

### <a id="TestScanfMulti" href="#TestScanfMulti">func TestScanfMulti(t *testing.T)</a>

```
searchKey: fmt_test.TestScanfMulti
tags: [function private test]
```

```Go
func TestScanfMulti(t *testing.T)
```

### <a id="TestScanfNewlineMatchFormat" href="#TestScanfNewlineMatchFormat">func TestScanfNewlineMatchFormat(t *testing.T)</a>

```
searchKey: fmt_test.TestScanfNewlineMatchFormat
tags: [function private test]
```

```Go
func TestScanfNewlineMatchFormat(t *testing.T)
```

### <a id="TestScanln" href="#TestScanln">func TestScanln(t *testing.T)</a>

```
searchKey: fmt_test.TestScanln
tags: [function private test]
```

```Go
func TestScanln(t *testing.T)
```

### <a id="TestScanlnNewlinesTerminate" href="#TestScanlnNewlinesTerminate">func TestScanlnNewlinesTerminate(t *testing.T)</a>

```
searchKey: fmt_test.TestScanlnNewlinesTerminate
tags: [function private test]
```

```Go
func TestScanlnNewlinesTerminate(t *testing.T)
```

### <a id="TestScanlnNoNewline" href="#TestScanlnNoNewline">func TestScanlnNoNewline(t *testing.T)</a>

```
searchKey: fmt_test.TestScanlnNoNewline
tags: [function private test]
```

```Go
func TestScanlnNoNewline(t *testing.T)
```

### <a id="TestScanlnWithMiddleNewline" href="#TestScanlnWithMiddleNewline">func TestScanlnWithMiddleNewline(t *testing.T)</a>

```
searchKey: fmt_test.TestScanlnWithMiddleNewline
tags: [function private test]
```

```Go
func TestScanlnWithMiddleNewline(t *testing.T)
```

### <a id="TestSlicePrinter" href="#TestSlicePrinter">func TestSlicePrinter(t *testing.T)</a>

```
searchKey: fmt_test.TestSlicePrinter
tags: [function private test]
```

```Go
func TestSlicePrinter(t *testing.T)
```

### <a id="TestSprintf" href="#TestSprintf">func TestSprintf(t *testing.T)</a>

```
searchKey: fmt_test.TestSprintf
tags: [function private test]
```

```Go
func TestSprintf(t *testing.T)
```

### <a id="TestStringer" href="#TestStringer">func TestStringer(t *testing.T)</a>

```
searchKey: fmt_test.TestStringer
tags: [function private test]
```

```Go
func TestStringer(t *testing.T)
```

### <a id="TestStructPrinter" href="#TestStructPrinter">func TestStructPrinter(t *testing.T)</a>

```
searchKey: fmt_test.TestStructPrinter
tags: [function private test]
```

```Go
func TestStructPrinter(t *testing.T)
```

### <a id="TestUnreadRuneWithBufio" href="#TestUnreadRuneWithBufio">func TestUnreadRuneWithBufio(t *testing.T)</a>

```
searchKey: fmt_test.TestUnreadRuneWithBufio
tags: [function private test]
```

```Go
func TestUnreadRuneWithBufio(t *testing.T)
```

TestUnreadRuneWithBufio verifies that, at least when using bufio, successive calls to Fscan do not lose runes. 

### <a id="TestWidthAndPrecision" href="#TestWidthAndPrecision">func TestWidthAndPrecision(t *testing.T)</a>

```
searchKey: fmt_test.TestWidthAndPrecision
tags: [function private test]
```

```Go
func TestWidthAndPrecision(t *testing.T)
```

### <a id="args" href="#args">func args(a ...interface{}) []interface{}</a>

```
searchKey: fmt_test.args
tags: [function private]
```

```Go
func args(a ...interface{}) []interface{}
```

### <a id="check" href="#check">func check(t *testing.T, got, want string)</a>

```
searchKey: fmt_test.check
tags: [function private]
```

```Go
func check(t *testing.T, got, want string)
```

### <a id="hideFromVet" href="#hideFromVet">func hideFromVet(s string) string</a>

```
searchKey: fmt_test.hideFromVet
tags: [function private]
```

```Go
func hideFromVet(s string) string
```

### <a id="makeInts" href="#makeInts">func makeInts(n int) []byte</a>

```
searchKey: fmt_test.makeInts
tags: [function private]
```

```Go
func makeInts(n int) []byte
```

### <a id="presentInMap" href="#presentInMap">func presentInMap(s string, a []string, t *testing.T)</a>

```
searchKey: fmt_test.presentInMap
tags: [function private]
```

```Go
func presentInMap(s string, a []string, t *testing.T)
```

presentInMap checks map printing using substrings so we don't depend on the print order. 

### <a id="scanInts" href="#scanInts">func scanInts(r *RecursiveInt, b *bytes.Buffer) (err error)</a>

```
searchKey: fmt_test.scanInts
tags: [function private]
```

```Go
func scanInts(r *RecursiveInt, b *bytes.Buffer) (err error)
```

scanInts performs the same scanning task as RecursiveInt.Scan but without recurring through scanner, so we can compare performance more directly. 

### <a id="testScan" href="#testScan">func testScan(t *testing.T, f func(string) io.Reader, scan func(r io.Reader, a ...interface{}) (int, error))</a>

```
searchKey: fmt_test.testScan
tags: [function private]
```

```Go
func testScan(t *testing.T, f func(string) io.Reader, scan func(r io.Reader, a ...interface{}) (int, error))
```

### <a id="testScanInts" href="#testScanInts">func testScanInts(t *testing.T, scan func(*RecursiveInt, *bytes.Buffer) error)</a>

```
searchKey: fmt_test.testScanInts
tags: [function private]
```

```Go
func testScanInts(t *testing.T, scan func(*RecursiveInt, *bytes.Buffer) error)
```

### <a id="testScanfMulti" href="#testScanfMulti">func testScanfMulti(t *testing.T, f func(string) io.Reader)</a>

```
searchKey: fmt_test.testScanfMulti
tags: [function private]
```

```Go
func testScanfMulti(t *testing.T, f func(string) io.Reader)
```

### <a id="verifyInf" href="#verifyInf">func verifyInf(str string, t *testing.T)</a>

```
searchKey: fmt_test.verifyInf
tags: [function private]
```

```Go
func verifyInf(str string, t *testing.T)
```

### <a id="verifyNaN" href="#verifyNaN">func verifyNaN(str string, t *testing.T)</a>

```
searchKey: fmt_test.verifyNaN
tags: [function private]
```

```Go
func verifyNaN(str string, t *testing.T)
```

### <a id="zeroFill" href="#zeroFill">func zeroFill(prefix string, width int, suffix string) string</a>

```
searchKey: fmt_test.zeroFill
tags: [function private]
```

```Go
func zeroFill(prefix string, width int, suffix string) string
```

zeroFill generates zero-filled strings of the specified width. The length of the suffix (but not the prefix) is compensated for in the width calculation. 

