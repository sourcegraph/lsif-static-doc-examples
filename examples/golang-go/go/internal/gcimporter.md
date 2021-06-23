# Package gcimporter

Package gcimporter implements Import for gc-generated object files. 

## Index

* [Constants](#const)
    * [const debug](#debug)
    * [const predeclReserved](#predeclReserved)
    * [const definedType](#definedType)
    * [const pointerType](#pointerType)
    * [const sliceType](#sliceType)
    * [const arrayType](#arrayType)
    * [const chanType](#chanType)
    * [const mapType](#mapType)
    * [const signatureType](#signatureType)
    * [const structType](#structType)
    * [const interfaceType](#interfaceType)
    * [const deltaNewFile](#deltaNewFile)
    * [const maxTime](#maxTime)
* [Variables](#var)
    * [var pkgExts](#pkgExts)
    * [var fakeLines](#fakeLines)
    * [var fakeLinesOnce](#fakeLinesOnce)
    * [var predeclared](#predeclared)
    * [var importedObjectTests](#importedObjectTests)
* [Types](#type)
    * [type byPath []*types.Package](#byPath)
        * [func (a byPath) Len() int](#byPath.Len)
        * [func (a byPath) Swap(i, j int)](#byPath.Swap)
        * [func (a byPath) Less(i, j int) bool](#byPath.Less)
    * [type intReader struct](#intReader)
        * [func (r *intReader) int64() int64](#intReader.int64)
        * [func (r *intReader) uint64() uint64](#intReader.uint64)
    * [type itag uint64](#itag)
    * [type iimporter struct](#iimporter)
        * [func (p *iimporter) doDecl(pkg *types.Package, name string)](#iimporter.doDecl)
        * [func (p *iimporter) stringAt(off uint64) string](#iimporter.stringAt)
        * [func (p *iimporter) pkgAt(off uint64) *types.Package](#iimporter.pkgAt)
        * [func (p *iimporter) typAt(off uint64, base *types.Named) types.Type](#iimporter.typAt)
    * [type importReader struct](#importReader)
        * [func (r *importReader) obj(name string)](#importReader.obj)
        * [func (r *importReader) declare(obj types.Object)](#importReader.declare)
        * [func (r *importReader) value() (typ types.Type, val constant.Value)](#importReader.value)
        * [func (r *importReader) mpint(x *big.Int, typ *types.Basic)](#importReader.mpint)
        * [func (r *importReader) mpfloat(typ *types.Basic) constant.Value](#importReader.mpfloat)
        * [func (r *importReader) ident() string](#importReader.ident)
        * [func (r *importReader) qualifiedIdent() (*types.Package, string)](#importReader.qualifiedIdent)
        * [func (r *importReader) pos() token.Pos](#importReader.pos)
        * [func (r *importReader) posv0()](#importReader.posv0)
        * [func (r *importReader) posv1()](#importReader.posv1)
        * [func (r *importReader) typ() types.Type](#importReader.typ)
        * [func (r *importReader) pkg() *types.Package](#importReader.pkg)
        * [func (r *importReader) string() string](#importReader.string)
        * [func (r *importReader) doType(base *types.Named) types.Type](#importReader.doType)
        * [func (r *importReader) kind() itag](#importReader.kind)
        * [func (r *importReader) signature(recv *types.Var) *types.Signature](#importReader.signature)
        * [func (r *importReader) paramList() *types.Tuple](#importReader.paramList)
        * [func (r *importReader) param() *types.Var](#importReader.param)
        * [func (r *importReader) bool() bool](#importReader.bool)
        * [func (r *importReader) int64() int64](#importReader.int64)
        * [func (r *importReader) uint64() uint64](#importReader.uint64)
        * [func (r *importReader) byte() byte](#importReader.byte)
    * [type fakeFileSet struct](#fakeFileSet)
        * [func (s *fakeFileSet) pos(file string, line, column int) token.Pos](#fakeFileSet.pos)
    * [type anyType struct{}](#anyType)
        * [func (t anyType) Underlying() types.Type](#anyType.Underlying)
        * [func (t anyType) String() string](#anyType.String)
* [Functions](#func)
    * [func readGopackHeader(r *bufio.Reader) (name string, size int, err error)](#readGopackHeader)
    * [func FindExportData(r *bufio.Reader) (hdr string, err error)](#FindExportData)
    * [func FindPkg(path, srcDir string) (filename, id string)](#FindPkg)
    * [func Import(fset *token.FileSet, packages map[string]*types.Package, path, srcDir string, lookup func(path string) (io.ReadCloser, error)) (pkg *types.Package, err error)](#Import)
    * [func iImportData(fset *token.FileSet, imports map[string]*types.Package, dataReader *bufio.Reader, path string) (pkg *types.Package, err error)](#iImportData)
    * [func intSize(b *types.Basic) (signed bool, maxBytes uint)](#intSize)
    * [func isInterface(t types.Type) bool](#isInterface)
    * [func errorf(format string, args ...interface{})](#errorf)
    * [func chanDir(d int) types.ChanDir](#chanDir)
    * [func skipSpecialPlatforms(t *testing.T)](#skipSpecialPlatforms)
    * [func compile(t *testing.T, dirname, filename, outdirname string) string](#compile)
    * [func testPath(t *testing.T, path, srcDir string) *types.Package](#testPath)
    * [func testDir(t *testing.T, dir string, endTime time.Time) (nimports int)](#testDir)
    * [func mktmpdir(t *testing.T) string](#mktmpdir)
    * [func TestImportTestdata(t *testing.T)](#TestImportTestdata)
    * [func TestVersionHandling(t *testing.T)](#TestVersionHandling)
    * [func TestImportStdLib(t *testing.T)](#TestImportStdLib)
    * [func TestImportedTypes(t *testing.T)](#TestImportedTypes)
    * [func verifyInterfaceMethodRecvs(t *testing.T, named *types.Named, level int)](#verifyInterfaceMethodRecvs)
    * [func TestIssue5815(t *testing.T)](#TestIssue5815)
    * [func TestCorrectMethodPackage(t *testing.T)](#TestCorrectMethodPackage)
    * [func TestIssue13566(t *testing.T)](#TestIssue13566)
    * [func TestIssue13898(t *testing.T)](#TestIssue13898)
    * [func TestIssue15517(t *testing.T)](#TestIssue15517)
    * [func TestIssue15920(t *testing.T)](#TestIssue15920)
    * [func TestIssue20046(t *testing.T)](#TestIssue20046)
    * [func TestIssue25301(t *testing.T)](#TestIssue25301)
    * [func TestIssue25596(t *testing.T)](#TestIssue25596)
    * [func importPkg(t *testing.T, path, srcDir string) *types.Package](#importPkg)
    * [func compileAndImportPkg(t *testing.T, name string) *types.Package](#compileAndImportPkg)
    * [func lookupObj(t *testing.T, scope *types.Scope, name string) types.Object](#lookupObj)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="debug" href="#debug">const debug</a>

```
searchKey: gcimporter.debug
tags: [private]
```

```Go
const debug = false
```

debugging/development support 

### <a id="predeclReserved" href="#predeclReserved">const predeclReserved</a>

```
searchKey: gcimporter.predeclReserved
tags: [private]
```

```Go
const predeclReserved = 32
```

### <a id="definedType" href="#definedType">const definedType</a>

```
searchKey: gcimporter.definedType
tags: [private]
```

```Go
const definedType itag = iota
```

Types 

### <a id="pointerType" href="#pointerType">const pointerType</a>

```
searchKey: gcimporter.pointerType
tags: [private]
```

```Go
const pointerType
```

### <a id="sliceType" href="#sliceType">const sliceType</a>

```
searchKey: gcimporter.sliceType
tags: [private]
```

```Go
const sliceType
```

### <a id="arrayType" href="#arrayType">const arrayType</a>

```
searchKey: gcimporter.arrayType
tags: [private]
```

```Go
const arrayType
```

### <a id="chanType" href="#chanType">const chanType</a>

```
searchKey: gcimporter.chanType
tags: [private]
```

```Go
const chanType
```

### <a id="mapType" href="#mapType">const mapType</a>

```
searchKey: gcimporter.mapType
tags: [private]
```

```Go
const mapType
```

### <a id="signatureType" href="#signatureType">const signatureType</a>

```
searchKey: gcimporter.signatureType
tags: [private]
```

```Go
const signatureType
```

### <a id="structType" href="#structType">const structType</a>

```
searchKey: gcimporter.structType
tags: [private]
```

```Go
const structType
```

### <a id="interfaceType" href="#interfaceType">const interfaceType</a>

```
searchKey: gcimporter.interfaceType
tags: [private]
```

```Go
const interfaceType
```

### <a id="deltaNewFile" href="#deltaNewFile">const deltaNewFile</a>

```
searchKey: gcimporter.deltaNewFile
tags: [private]
```

```Go
const deltaNewFile = -64
```

deltaNewFile is a magic line delta offset indicating a new file. We use -64 because it is rare; see issue 20080 and CL 41619. -64 is the smallest int that fits in a single byte as a varint. 

### <a id="maxTime" href="#maxTime">const maxTime</a>

```
searchKey: gcimporter.maxTime
tags: [private]
```

```Go
const maxTime = 30 * time.Second
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="pkgExts" href="#pkgExts">var pkgExts</a>

```
searchKey: gcimporter.pkgExts
tags: [private]
```

```Go
var pkgExts = [...]string{".a", ".o"}
```

### <a id="fakeLines" href="#fakeLines">var fakeLines</a>

```
searchKey: gcimporter.fakeLines
tags: [private]
```

```Go
var fakeLines []int
```

### <a id="fakeLinesOnce" href="#fakeLinesOnce">var fakeLinesOnce</a>

```
searchKey: gcimporter.fakeLinesOnce
tags: [private]
```

```Go
var fakeLinesOnce sync.Once
```

### <a id="predeclared" href="#predeclared">var predeclared</a>

```
searchKey: gcimporter.predeclared
tags: [private]
```

```Go
var predeclared = ...
```

### <a id="importedObjectTests" href="#importedObjectTests">var importedObjectTests</a>

```
searchKey: gcimporter.importedObjectTests
tags: [private]
```

```Go
var importedObjectTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="byPath" href="#byPath">type byPath []*types.Package</a>

```
searchKey: gcimporter.byPath
tags: [private]
```

```Go
type byPath []*types.Package
```

#### <a id="byPath.Len" href="#byPath.Len">func (a byPath) Len() int</a>

```
searchKey: gcimporter.byPath.Len
tags: [private]
```

```Go
func (a byPath) Len() int
```

#### <a id="byPath.Swap" href="#byPath.Swap">func (a byPath) Swap(i, j int)</a>

```
searchKey: gcimporter.byPath.Swap
tags: [private]
```

```Go
func (a byPath) Swap(i, j int)
```

#### <a id="byPath.Less" href="#byPath.Less">func (a byPath) Less(i, j int) bool</a>

```
searchKey: gcimporter.byPath.Less
tags: [private]
```

```Go
func (a byPath) Less(i, j int) bool
```

### <a id="intReader" href="#intReader">type intReader struct</a>

```
searchKey: gcimporter.intReader
tags: [private]
```

```Go
type intReader struct {
	*bufio.Reader
	path string
}
```

#### <a id="intReader.int64" href="#intReader.int64">func (r *intReader) int64() int64</a>

```
searchKey: gcimporter.intReader.int64
tags: [private]
```

```Go
func (r *intReader) int64() int64
```

#### <a id="intReader.uint64" href="#intReader.uint64">func (r *intReader) uint64() uint64</a>

```
searchKey: gcimporter.intReader.uint64
tags: [private]
```

```Go
func (r *intReader) uint64() uint64
```

### <a id="itag" href="#itag">type itag uint64</a>

```
searchKey: gcimporter.itag
tags: [private]
```

```Go
type itag uint64
```

### <a id="iimporter" href="#iimporter">type iimporter struct</a>

```
searchKey: gcimporter.iimporter
tags: [private]
```

```Go
type iimporter struct {
	ipath   string
	version int

	stringData  []byte
	stringCache map[uint64]string
	pkgCache    map[uint64]*types.Package

	declData []byte
	pkgIndex map[*types.Package]map[string]uint64
	typCache map[uint64]types.Type

	fake          fakeFileSet
	interfaceList []*types.Interface
}
```

#### <a id="iimporter.doDecl" href="#iimporter.doDecl">func (p *iimporter) doDecl(pkg *types.Package, name string)</a>

```
searchKey: gcimporter.iimporter.doDecl
tags: [private]
```

```Go
func (p *iimporter) doDecl(pkg *types.Package, name string)
```

#### <a id="iimporter.stringAt" href="#iimporter.stringAt">func (p *iimporter) stringAt(off uint64) string</a>

```
searchKey: gcimporter.iimporter.stringAt
tags: [private]
```

```Go
func (p *iimporter) stringAt(off uint64) string
```

#### <a id="iimporter.pkgAt" href="#iimporter.pkgAt">func (p *iimporter) pkgAt(off uint64) *types.Package</a>

```
searchKey: gcimporter.iimporter.pkgAt
tags: [private]
```

```Go
func (p *iimporter) pkgAt(off uint64) *types.Package
```

#### <a id="iimporter.typAt" href="#iimporter.typAt">func (p *iimporter) typAt(off uint64, base *types.Named) types.Type</a>

```
searchKey: gcimporter.iimporter.typAt
tags: [private]
```

```Go
func (p *iimporter) typAt(off uint64, base *types.Named) types.Type
```

### <a id="importReader" href="#importReader">type importReader struct</a>

```
searchKey: gcimporter.importReader
tags: [private]
```

```Go
type importReader struct {
	p          *iimporter
	declReader bytes.Reader
	currPkg    *types.Package
	prevFile   string
	prevLine   int64
	prevColumn int64
}
```

#### <a id="importReader.obj" href="#importReader.obj">func (r *importReader) obj(name string)</a>

```
searchKey: gcimporter.importReader.obj
tags: [private]
```

```Go
func (r *importReader) obj(name string)
```

#### <a id="importReader.declare" href="#importReader.declare">func (r *importReader) declare(obj types.Object)</a>

```
searchKey: gcimporter.importReader.declare
tags: [private]
```

```Go
func (r *importReader) declare(obj types.Object)
```

#### <a id="importReader.value" href="#importReader.value">func (r *importReader) value() (typ types.Type, val constant.Value)</a>

```
searchKey: gcimporter.importReader.value
tags: [private]
```

```Go
func (r *importReader) value() (typ types.Type, val constant.Value)
```

#### <a id="importReader.mpint" href="#importReader.mpint">func (r *importReader) mpint(x *big.Int, typ *types.Basic)</a>

```
searchKey: gcimporter.importReader.mpint
tags: [private]
```

```Go
func (r *importReader) mpint(x *big.Int, typ *types.Basic)
```

#### <a id="importReader.mpfloat" href="#importReader.mpfloat">func (r *importReader) mpfloat(typ *types.Basic) constant.Value</a>

```
searchKey: gcimporter.importReader.mpfloat
tags: [private]
```

```Go
func (r *importReader) mpfloat(typ *types.Basic) constant.Value
```

#### <a id="importReader.ident" href="#importReader.ident">func (r *importReader) ident() string</a>

```
searchKey: gcimporter.importReader.ident
tags: [private]
```

```Go
func (r *importReader) ident() string
```

#### <a id="importReader.qualifiedIdent" href="#importReader.qualifiedIdent">func (r *importReader) qualifiedIdent() (*types.Package, string)</a>

```
searchKey: gcimporter.importReader.qualifiedIdent
tags: [private]
```

```Go
func (r *importReader) qualifiedIdent() (*types.Package, string)
```

#### <a id="importReader.pos" href="#importReader.pos">func (r *importReader) pos() token.Pos</a>

```
searchKey: gcimporter.importReader.pos
tags: [private]
```

```Go
func (r *importReader) pos() token.Pos
```

#### <a id="importReader.posv0" href="#importReader.posv0">func (r *importReader) posv0()</a>

```
searchKey: gcimporter.importReader.posv0
tags: [private]
```

```Go
func (r *importReader) posv0()
```

#### <a id="importReader.posv1" href="#importReader.posv1">func (r *importReader) posv1()</a>

```
searchKey: gcimporter.importReader.posv1
tags: [private]
```

```Go
func (r *importReader) posv1()
```

#### <a id="importReader.typ" href="#importReader.typ">func (r *importReader) typ() types.Type</a>

```
searchKey: gcimporter.importReader.typ
tags: [private]
```

```Go
func (r *importReader) typ() types.Type
```

#### <a id="importReader.pkg" href="#importReader.pkg">func (r *importReader) pkg() *types.Package</a>

```
searchKey: gcimporter.importReader.pkg
tags: [private]
```

```Go
func (r *importReader) pkg() *types.Package
```

#### <a id="importReader.string" href="#importReader.string">func (r *importReader) string() string</a>

```
searchKey: gcimporter.importReader.string
tags: [private]
```

```Go
func (r *importReader) string() string
```

#### <a id="importReader.doType" href="#importReader.doType">func (r *importReader) doType(base *types.Named) types.Type</a>

```
searchKey: gcimporter.importReader.doType
tags: [private]
```

```Go
func (r *importReader) doType(base *types.Named) types.Type
```

#### <a id="importReader.kind" href="#importReader.kind">func (r *importReader) kind() itag</a>

```
searchKey: gcimporter.importReader.kind
tags: [private]
```

```Go
func (r *importReader) kind() itag
```

#### <a id="importReader.signature" href="#importReader.signature">func (r *importReader) signature(recv *types.Var) *types.Signature</a>

```
searchKey: gcimporter.importReader.signature
tags: [private]
```

```Go
func (r *importReader) signature(recv *types.Var) *types.Signature
```

#### <a id="importReader.paramList" href="#importReader.paramList">func (r *importReader) paramList() *types.Tuple</a>

```
searchKey: gcimporter.importReader.paramList
tags: [private]
```

```Go
func (r *importReader) paramList() *types.Tuple
```

#### <a id="importReader.param" href="#importReader.param">func (r *importReader) param() *types.Var</a>

```
searchKey: gcimporter.importReader.param
tags: [private]
```

```Go
func (r *importReader) param() *types.Var
```

#### <a id="importReader.bool" href="#importReader.bool">func (r *importReader) bool() bool</a>

```
searchKey: gcimporter.importReader.bool
tags: [private]
```

```Go
func (r *importReader) bool() bool
```

#### <a id="importReader.int64" href="#importReader.int64">func (r *importReader) int64() int64</a>

```
searchKey: gcimporter.importReader.int64
tags: [private]
```

```Go
func (r *importReader) int64() int64
```

#### <a id="importReader.uint64" href="#importReader.uint64">func (r *importReader) uint64() uint64</a>

```
searchKey: gcimporter.importReader.uint64
tags: [private]
```

```Go
func (r *importReader) uint64() uint64
```

#### <a id="importReader.byte" href="#importReader.byte">func (r *importReader) byte() byte</a>

```
searchKey: gcimporter.importReader.byte
tags: [private]
```

```Go
func (r *importReader) byte() byte
```

### <a id="fakeFileSet" href="#fakeFileSet">type fakeFileSet struct</a>

```
searchKey: gcimporter.fakeFileSet
tags: [private]
```

```Go
type fakeFileSet struct {
	fset  *token.FileSet
	files map[string]*token.File
}
```

Synthesize a token.Pos 

#### <a id="fakeFileSet.pos" href="#fakeFileSet.pos">func (s *fakeFileSet) pos(file string, line, column int) token.Pos</a>

```
searchKey: gcimporter.fakeFileSet.pos
tags: [private]
```

```Go
func (s *fakeFileSet) pos(file string, line, column int) token.Pos
```

### <a id="anyType" href="#anyType">type anyType struct{}</a>

```
searchKey: gcimporter.anyType
tags: [private]
```

```Go
type anyType struct{}
```

#### <a id="anyType.Underlying" href="#anyType.Underlying">func (t anyType) Underlying() types.Type</a>

```
searchKey: gcimporter.anyType.Underlying
tags: [private]
```

```Go
func (t anyType) Underlying() types.Type
```

#### <a id="anyType.String" href="#anyType.String">func (t anyType) String() string</a>

```
searchKey: gcimporter.anyType.String
tags: [private]
```

```Go
func (t anyType) String() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="readGopackHeader" href="#readGopackHeader">func readGopackHeader(r *bufio.Reader) (name string, size int, err error)</a>

```
searchKey: gcimporter.readGopackHeader
tags: [private]
```

```Go
func readGopackHeader(r *bufio.Reader) (name string, size int, err error)
```

### <a id="FindExportData" href="#FindExportData">func FindExportData(r *bufio.Reader) (hdr string, err error)</a>

```
searchKey: gcimporter.FindExportData
```

```Go
func FindExportData(r *bufio.Reader) (hdr string, err error)
```

FindExportData positions the reader r at the beginning of the export data section of an underlying GC-created object/archive file by reading from it. The reader must be positioned at the start of the file before calling this function. The hdr result is the string before the export data, either "$$" or "$$B". 

### <a id="FindPkg" href="#FindPkg">func FindPkg(path, srcDir string) (filename, id string)</a>

```
searchKey: gcimporter.FindPkg
```

```Go
func FindPkg(path, srcDir string) (filename, id string)
```

FindPkg returns the filename and unique package id for an import path based on package information provided by build.Import (using the build.Default build.Context). A relative srcDir is interpreted relative to the current working directory. If no file was found, an empty filename is returned. 

### <a id="Import" href="#Import">func Import(fset *token.FileSet, packages map[string]*types.Package, path, srcDir string, lookup func(path string) (io.ReadCloser, error)) (pkg *types.Package, err error)</a>

```
searchKey: gcimporter.Import
```

```Go
func Import(fset *token.FileSet, packages map[string]*types.Package, path, srcDir string, lookup func(path string) (io.ReadCloser, error)) (pkg *types.Package, err error)
```

Import imports a gc-generated package given its import path and srcDir, adds the corresponding package object to the packages map, and returns the object. The packages map must contain all packages already imported. 

### <a id="iImportData" href="#iImportData">func iImportData(fset *token.FileSet, imports map[string]*types.Package, dataReader *bufio.Reader, path string) (pkg *types.Package, err error)</a>

```
searchKey: gcimporter.iImportData
tags: [private]
```

```Go
func iImportData(fset *token.FileSet, imports map[string]*types.Package, dataReader *bufio.Reader, path string) (pkg *types.Package, err error)
```

iImportData imports a package from the serialized package data and returns the number of bytes consumed and a reference to the package. If the export data version is not recognized or the format is otherwise compromised, an error is returned. 

### <a id="intSize" href="#intSize">func intSize(b *types.Basic) (signed bool, maxBytes uint)</a>

```
searchKey: gcimporter.intSize
tags: [private]
```

```Go
func intSize(b *types.Basic) (signed bool, maxBytes uint)
```

### <a id="isInterface" href="#isInterface">func isInterface(t types.Type) bool</a>

```
searchKey: gcimporter.isInterface
tags: [private]
```

```Go
func isInterface(t types.Type) bool
```

### <a id="errorf" href="#errorf">func errorf(format string, args ...interface{})</a>

```
searchKey: gcimporter.errorf
tags: [private]
```

```Go
func errorf(format string, args ...interface{})
```

### <a id="chanDir" href="#chanDir">func chanDir(d int) types.ChanDir</a>

```
searchKey: gcimporter.chanDir
tags: [private]
```

```Go
func chanDir(d int) types.ChanDir
```

### <a id="skipSpecialPlatforms" href="#skipSpecialPlatforms">func skipSpecialPlatforms(t *testing.T)</a>

```
searchKey: gcimporter.skipSpecialPlatforms
tags: [private]
```

```Go
func skipSpecialPlatforms(t *testing.T)
```

skipSpecialPlatforms causes the test to be skipped for platforms where builders (build.golang.org) don't have access to compiled packages for import. 

### <a id="compile" href="#compile">func compile(t *testing.T, dirname, filename, outdirname string) string</a>

```
searchKey: gcimporter.compile
tags: [private]
```

```Go
func compile(t *testing.T, dirname, filename, outdirname string) string
```

compile runs the compiler on filename, with dirname as the working directory, and writes the output file to outdirname. 

### <a id="testPath" href="#testPath">func testPath(t *testing.T, path, srcDir string) *types.Package</a>

```
searchKey: gcimporter.testPath
tags: [private]
```

```Go
func testPath(t *testing.T, path, srcDir string) *types.Package
```

### <a id="testDir" href="#testDir">func testDir(t *testing.T, dir string, endTime time.Time) (nimports int)</a>

```
searchKey: gcimporter.testDir
tags: [private]
```

```Go
func testDir(t *testing.T, dir string, endTime time.Time) (nimports int)
```

### <a id="mktmpdir" href="#mktmpdir">func mktmpdir(t *testing.T) string</a>

```
searchKey: gcimporter.mktmpdir
tags: [private]
```

```Go
func mktmpdir(t *testing.T) string
```

### <a id="TestImportTestdata" href="#TestImportTestdata">func TestImportTestdata(t *testing.T)</a>

```
searchKey: gcimporter.TestImportTestdata
tags: [private]
```

```Go
func TestImportTestdata(t *testing.T)
```

### <a id="TestVersionHandling" href="#TestVersionHandling">func TestVersionHandling(t *testing.T)</a>

```
searchKey: gcimporter.TestVersionHandling
tags: [private]
```

```Go
func TestVersionHandling(t *testing.T)
```

### <a id="TestImportStdLib" href="#TestImportStdLib">func TestImportStdLib(t *testing.T)</a>

```
searchKey: gcimporter.TestImportStdLib
tags: [private]
```

```Go
func TestImportStdLib(t *testing.T)
```

### <a id="TestImportedTypes" href="#TestImportedTypes">func TestImportedTypes(t *testing.T)</a>

```
searchKey: gcimporter.TestImportedTypes
tags: [private]
```

```Go
func TestImportedTypes(t *testing.T)
```

### <a id="verifyInterfaceMethodRecvs" href="#verifyInterfaceMethodRecvs">func verifyInterfaceMethodRecvs(t *testing.T, named *types.Named, level int)</a>

```
searchKey: gcimporter.verifyInterfaceMethodRecvs
tags: [private]
```

```Go
func verifyInterfaceMethodRecvs(t *testing.T, named *types.Named, level int)
```

verifyInterfaceMethodRecvs verifies that method receiver types are named if the methods belong to a named interface type. 

### <a id="TestIssue5815" href="#TestIssue5815">func TestIssue5815(t *testing.T)</a>

```
searchKey: gcimporter.TestIssue5815
tags: [private]
```

```Go
func TestIssue5815(t *testing.T)
```

### <a id="TestCorrectMethodPackage" href="#TestCorrectMethodPackage">func TestCorrectMethodPackage(t *testing.T)</a>

```
searchKey: gcimporter.TestCorrectMethodPackage
tags: [private]
```

```Go
func TestCorrectMethodPackage(t *testing.T)
```

Smoke test to ensure that imported methods get the correct package. 

### <a id="TestIssue13566" href="#TestIssue13566">func TestIssue13566(t *testing.T)</a>

```
searchKey: gcimporter.TestIssue13566
tags: [private]
```

```Go
func TestIssue13566(t *testing.T)
```

### <a id="TestIssue13898" href="#TestIssue13898">func TestIssue13898(t *testing.T)</a>

```
searchKey: gcimporter.TestIssue13898
tags: [private]
```

```Go
func TestIssue13898(t *testing.T)
```

### <a id="TestIssue15517" href="#TestIssue15517">func TestIssue15517(t *testing.T)</a>

```
searchKey: gcimporter.TestIssue15517
tags: [private]
```

```Go
func TestIssue15517(t *testing.T)
```

### <a id="TestIssue15920" href="#TestIssue15920">func TestIssue15920(t *testing.T)</a>

```
searchKey: gcimporter.TestIssue15920
tags: [private]
```

```Go
func TestIssue15920(t *testing.T)
```

### <a id="TestIssue20046" href="#TestIssue20046">func TestIssue20046(t *testing.T)</a>

```
searchKey: gcimporter.TestIssue20046
tags: [private]
```

```Go
func TestIssue20046(t *testing.T)
```

### <a id="TestIssue25301" href="#TestIssue25301">func TestIssue25301(t *testing.T)</a>

```
searchKey: gcimporter.TestIssue25301
tags: [private]
```

```Go
func TestIssue25301(t *testing.T)
```

### <a id="TestIssue25596" href="#TestIssue25596">func TestIssue25596(t *testing.T)</a>

```
searchKey: gcimporter.TestIssue25596
tags: [private]
```

```Go
func TestIssue25596(t *testing.T)
```

### <a id="importPkg" href="#importPkg">func importPkg(t *testing.T, path, srcDir string) *types.Package</a>

```
searchKey: gcimporter.importPkg
tags: [private]
```

```Go
func importPkg(t *testing.T, path, srcDir string) *types.Package
```

### <a id="compileAndImportPkg" href="#compileAndImportPkg">func compileAndImportPkg(t *testing.T, name string) *types.Package</a>

```
searchKey: gcimporter.compileAndImportPkg
tags: [private]
```

```Go
func compileAndImportPkg(t *testing.T, name string) *types.Package
```

### <a id="lookupObj" href="#lookupObj">func lookupObj(t *testing.T, scope *types.Scope, name string) types.Object</a>

```
searchKey: gcimporter.lookupObj
tags: [private]
```

```Go
func lookupObj(t *testing.T, scope *types.Scope, name string) types.Object
```

