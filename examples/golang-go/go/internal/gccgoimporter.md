# Package gccgoimporter

Package gccgoimporter implements Import for gccgo-generated object files. 

## Index

* [Constants](#const)
    * [const armag](#armag)
    * [const armagt](#armagt)
    * [const armagb](#armagb)
    * [const arNameOff](#arNameOff)
    * [const arNameSize](#arNameSize)
    * [const arDateOff](#arDateOff)
    * [const arDateSize](#arDateSize)
    * [const arUIDOff](#arUIDOff)
    * [const arUIDSize](#arUIDSize)
    * [const arGIDOff](#arGIDOff)
    * [const arGIDSize](#arGIDSize)
    * [const arModeOff](#arModeOff)
    * [const arModeSize](#arModeSize)
    * [const arSizeOff](#arSizeOff)
    * [const arSizeSize](#arSizeSize)
    * [const arFmagOff](#arFmagOff)
    * [const arFmagSize](#arFmagSize)
    * [const arHdrSize](#arHdrSize)
    * [const arfmag](#arfmag)
    * [const gccgov1Magic](#gccgov1Magic)
    * [const gccgov2Magic](#gccgov2Magic)
    * [const gccgov3Magic](#gccgov3Magic)
    * [const goimporterMagic](#goimporterMagic)
    * [const archiveMagic](#archiveMagic)
    * [const aixbigafMagic](#aixbigafMagic)
    * [const gccgoBuiltinINT8](#gccgoBuiltinINT8)
    * [const gccgoBuiltinINT16](#gccgoBuiltinINT16)
    * [const gccgoBuiltinINT32](#gccgoBuiltinINT32)
    * [const gccgoBuiltinINT64](#gccgoBuiltinINT64)
    * [const gccgoBuiltinUINT8](#gccgoBuiltinUINT8)
    * [const gccgoBuiltinUINT16](#gccgoBuiltinUINT16)
    * [const gccgoBuiltinUINT32](#gccgoBuiltinUINT32)
    * [const gccgoBuiltinUINT64](#gccgoBuiltinUINT64)
    * [const gccgoBuiltinFLOAT32](#gccgoBuiltinFLOAT32)
    * [const gccgoBuiltinFLOAT64](#gccgoBuiltinFLOAT64)
    * [const gccgoBuiltinINT](#gccgoBuiltinINT)
    * [const gccgoBuiltinUINT](#gccgoBuiltinUINT)
    * [const gccgoBuiltinUINTPTR](#gccgoBuiltinUINTPTR)
    * [const gccgoBuiltinBOOL](#gccgoBuiltinBOOL)
    * [const gccgoBuiltinSTRING](#gccgoBuiltinSTRING)
    * [const gccgoBuiltinCOMPLEX64](#gccgoBuiltinCOMPLEX64)
    * [const gccgoBuiltinCOMPLEX128](#gccgoBuiltinCOMPLEX128)
    * [const gccgoBuiltinERROR](#gccgoBuiltinERROR)
    * [const gccgoBuiltinBYTE](#gccgoBuiltinBYTE)
    * [const gccgoBuiltinRUNE](#gccgoBuiltinRUNE)
* [Variables](#var)
    * [var reserved](#reserved)
    * [var importablePackages](#importablePackages)
    * [var importerTests](#importerTests)
    * [var typeParserTests](#typeParserTests)
* [Types](#type)
    * [type seekerReadAt struct](#seekerReadAt)
        * [func (sra seekerReadAt) ReadAt(p []byte, off int64) (int, error)](#seekerReadAt.ReadAt)
    * [type GccgoInstallation struct](#GccgoInstallation)
        * [func (inst *GccgoInstallation) InitFromDriver(gccgoPath string, args ...string) (err error)](#GccgoInstallation.InitFromDriver)
        * [func (inst *GccgoInstallation) SearchPaths() (paths []string)](#GccgoInstallation.SearchPaths)
        * [func (inst *GccgoInstallation) GetImporter(incpaths []string, initmap map[*types.Package]InitData) Importer](#GccgoInstallation.GetImporter)
    * [type PackageInit struct](#PackageInit)
    * [type InitData struct](#InitData)
    * [type Importer func(imports map[string]*go/types.Package, path string, srcDir string, lookup func(string) (io.ReadCloser, error)) (*go/types.Package, error)](#Importer)
        * [func GetImporter(searchpaths []string, initmap map[*types.Package]InitData) Importer](#GetImporter)
    * [type parser struct](#parser)
        * [func (p *parser) init(filename string, src io.Reader, imports map[string]*types.Package)](#parser.init.parser.go)
        * [func (p *parser) initScanner(filename string, src io.Reader)](#parser.initScanner)
        * [func (p *parser) error(err interface{})](#parser.error)
        * [func (p *parser) errorf(format string, args ...interface{})](#parser.errorf)
        * [func (p *parser) expect(tok rune) string](#parser.expect)
        * [func (p *parser) expectEOL()](#parser.expectEOL)
        * [func (p *parser) expectKeyword(keyword string)](#parser.expectKeyword)
        * [func (p *parser) parseString() string](#parser.parseString)
        * [func (p *parser) parseUnquotedString() string](#parser.parseUnquotedString)
        * [func (p *parser) next()](#parser.next)
        * [func (p *parser) parseQualifiedName() (path, name string)](#parser.parseQualifiedName)
        * [func (p *parser) parseUnquotedQualifiedName() (path, name string)](#parser.parseUnquotedQualifiedName)
        * [func (p *parser) parseQualifiedNameStr(unquotedName string) (pkgpath, name string)](#parser.parseQualifiedNameStr)
        * [func (p *parser) getPkg(pkgpath, name string) *types.Package](#parser.getPkg)
        * [func (p *parser) parseExportedName() (pkg *types.Package, name string)](#parser.parseExportedName)
        * [func (p *parser) parseName() string](#parser.parseName)
        * [func (p *parser) parseField(pkg *types.Package) (field *types.Var, tag string)](#parser.parseField)
        * [func (p *parser) parseParam(pkg *types.Package) (param *types.Var, isVariadic bool)](#parser.parseParam)
        * [func (p *parser) parseVar(pkg *types.Package) *types.Var](#parser.parseVar)
        * [func (p *parser) parseConversion(pkg *types.Package) (val constant.Value, typ types.Type)](#parser.parseConversion)
        * [func (p *parser) parseConstValue(pkg *types.Package) (val constant.Value, typ types.Type)](#parser.parseConstValue)
        * [func (p *parser) parseConst(pkg *types.Package) *types.Const](#parser.parseConst)
        * [func (p *parser) reserve(n int)](#parser.reserve)
        * [func (p *parser) update(t types.Type, nlist []interface{})](#parser.update)
        * [func (p *parser) parseNamedType(nlist []interface{}) types.Type](#parser.parseNamedType)
        * [func (p *parser) parseInt64() int64](#parser.parseInt64)
        * [func (p *parser) parseInt() int](#parser.parseInt)
        * [func (p *parser) parseArrayOrSliceType(pkg *types.Package, nlist []interface{}) types.Type](#parser.parseArrayOrSliceType)
        * [func (p *parser) parseMapType(pkg *types.Package, nlist []interface{}) types.Type](#parser.parseMapType)
        * [func (p *parser) parseChanType(pkg *types.Package, nlist []interface{}) types.Type](#parser.parseChanType)
        * [func (p *parser) parseStructType(pkg *types.Package, nlist []interface{}) types.Type](#parser.parseStructType)
        * [func (p *parser) parseParamList(pkg *types.Package) (*types.Tuple, bool)](#parser.parseParamList)
        * [func (p *parser) parseResultList(pkg *types.Package) *types.Tuple](#parser.parseResultList)
        * [func (p *parser) parseFunctionType(pkg *types.Package, nlist []interface{}) *types.Signature](#parser.parseFunctionType)
        * [func (p *parser) parseFunc(pkg *types.Package) *types.Func](#parser.parseFunc)
        * [func (p *parser) parseInterfaceType(pkg *types.Package, nlist []interface{}) types.Type](#parser.parseInterfaceType)
        * [func (p *parser) parsePointerType(pkg *types.Package, nlist []interface{}) types.Type](#parser.parsePointerType)
        * [func (p *parser) parseTypeSpec(pkg *types.Package, nlist []interface{}) types.Type](#parser.parseTypeSpec)
        * [func (p *parser) parseType(pkg *types.Package, n ...interface{}) types.Type](#parser.parseType)
        * [func (p *parser) parseTypeAfterAngle(pkg *types.Package, n ...interface{}) (t types.Type, n1 int)](#parser.parseTypeAfterAngle)
        * [func (p *parser) parseTypeExtended(pkg *types.Package, n ...interface{}) (t types.Type, n1 int)](#parser.parseTypeExtended)
        * [func (p *parser) skipInlineBody()](#parser.skipInlineBody)
        * [func (p *parser) parseTypes(pkg *types.Package)](#parser.parseTypes)
        * [func (p *parser) parseSavedType(pkg *types.Package, i int, nlist []interface{})](#parser.parseSavedType)
        * [func (p *parser) parsePackageInit() PackageInit](#parser.parsePackageInit)
        * [func (p *parser) maybeCreatePackage()](#parser.maybeCreatePackage)
        * [func (p *parser) parseInitDataDirective()](#parser.parseInitDataDirective)
        * [func (p *parser) parseDirective()](#parser.parseDirective)
        * [func (p *parser) parsePackage() *types.Package](#parser.parsePackage)
    * [type fixupRecord struct](#fixupRecord)
    * [type importError struct](#importError)
        * [func (e importError) Error() string](#importError.Error)
    * [type importerTest struct](#importerTest)
* [Functions](#func)
    * [func arExportData(archive io.ReadSeeker) (io.ReadSeeker, error)](#arExportData)
    * [func standardArExportData(archive io.ReadSeeker) (io.ReadSeeker, error)](#standardArExportData)
    * [func elfFromAr(member *io.SectionReader) (io.ReadSeeker, error)](#elfFromAr)
    * [func aixBigArExportData(archive io.ReadSeeker) (io.ReadSeeker, error)](#aixBigArExportData)
    * [func readerAtFromSeeker(rs io.ReadSeeker) io.ReaderAt](#readerAtFromSeeker)
    * [func findExportFile(searchpaths []string, pkgpath string) (string, error)](#findExportFile)
    * [func openExportFile(fpath string) (reader io.ReadSeeker, closer io.Closer, err error)](#openExportFile)
    * [func readMagic(reader io.ReadSeeker) (string, error)](#readMagic)
    * [func deref(typ types.Type) types.Type](#deref)
    * [func lookupBuiltinType(typ int) types.Type](#lookupBuiltinType)
    * [func TestInstallationImporter(t *testing.T)](#TestInstallationImporter)
    * [func runImporterTest(t *testing.T, imp Importer, initmap map[*types.Package]InitData, test *importerTest)](#runImporterTest)
    * [func TestGoxImporter(t *testing.T)](#TestGoxImporter)
    * [func gccgoPath() string](#gccgoPath)
    * [func TestObjImporter(t *testing.T)](#TestObjImporter)
    * [func TestTypeParser(t *testing.T)](#TestTypeParser)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="armag" href="#armag">const armag</a>

```
searchKey: gccgoimporter.armag
tags: [private]
```

```Go
const armag = "!<arch>\n"
```

Magic strings for different archive file formats. 

### <a id="armagt" href="#armagt">const armagt</a>

```
searchKey: gccgoimporter.armagt
tags: [private]
```

```Go
const armagt = "!<thin>\n"
```

Magic strings for different archive file formats. 

### <a id="armagb" href="#armagb">const armagb</a>

```
searchKey: gccgoimporter.armagb
tags: [private]
```

```Go
const armagb = "<bigaf>\n"
```

Magic strings for different archive file formats. 

### <a id="arNameOff" href="#arNameOff">const arNameOff</a>

```
searchKey: gccgoimporter.arNameOff
tags: [private]
```

```Go
const arNameOff = 0
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arNameSize" href="#arNameSize">const arNameSize</a>

```
searchKey: gccgoimporter.arNameSize
tags: [private]
```

```Go
const arNameSize = 16
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arDateOff" href="#arDateOff">const arDateOff</a>

```
searchKey: gccgoimporter.arDateOff
tags: [private]
```

```Go
const arDateOff = arNameOff + arNameSize
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arDateSize" href="#arDateSize">const arDateSize</a>

```
searchKey: gccgoimporter.arDateSize
tags: [private]
```

```Go
const arDateSize = 12
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arUIDOff" href="#arUIDOff">const arUIDOff</a>

```
searchKey: gccgoimporter.arUIDOff
tags: [private]
```

```Go
const arUIDOff = arDateOff + arDateSize
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arUIDSize" href="#arUIDSize">const arUIDSize</a>

```
searchKey: gccgoimporter.arUIDSize
tags: [private]
```

```Go
const arUIDSize = 6
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arGIDOff" href="#arGIDOff">const arGIDOff</a>

```
searchKey: gccgoimporter.arGIDOff
tags: [private]
```

```Go
const arGIDOff = arUIDOff + arUIDSize
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arGIDSize" href="#arGIDSize">const arGIDSize</a>

```
searchKey: gccgoimporter.arGIDSize
tags: [private]
```

```Go
const arGIDSize = 6
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arModeOff" href="#arModeOff">const arModeOff</a>

```
searchKey: gccgoimporter.arModeOff
tags: [private]
```

```Go
const arModeOff = arGIDOff + arGIDSize
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arModeSize" href="#arModeSize">const arModeSize</a>

```
searchKey: gccgoimporter.arModeSize
tags: [private]
```

```Go
const arModeSize = 8
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arSizeOff" href="#arSizeOff">const arSizeOff</a>

```
searchKey: gccgoimporter.arSizeOff
tags: [private]
```

```Go
const arSizeOff = arModeOff + arModeSize
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arSizeSize" href="#arSizeSize">const arSizeSize</a>

```
searchKey: gccgoimporter.arSizeSize
tags: [private]
```

```Go
const arSizeSize = 10
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arFmagOff" href="#arFmagOff">const arFmagOff</a>

```
searchKey: gccgoimporter.arFmagOff
tags: [private]
```

```Go
const arFmagOff = arSizeOff + arSizeSize
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arFmagSize" href="#arFmagSize">const arFmagSize</a>

```
searchKey: gccgoimporter.arFmagSize
tags: [private]
```

```Go
const arFmagSize = 2
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arHdrSize" href="#arHdrSize">const arHdrSize</a>

```
searchKey: gccgoimporter.arHdrSize
tags: [private]
```

```Go
const arHdrSize = arFmagOff + arFmagSize
```

Offsets and sizes for fields in a standard archive header. 

### <a id="arfmag" href="#arfmag">const arfmag</a>

```
searchKey: gccgoimporter.arfmag
tags: [private]
```

```Go
const arfmag = "`\n"
```

The contents of the fmag field of a standard archive header. 

### <a id="gccgov1Magic" href="#gccgov1Magic">const gccgov1Magic</a>

```
searchKey: gccgoimporter.gccgov1Magic
tags: [private]
```

```Go
const gccgov1Magic = "v1;\n"
```

### <a id="gccgov2Magic" href="#gccgov2Magic">const gccgov2Magic</a>

```
searchKey: gccgoimporter.gccgov2Magic
tags: [private]
```

```Go
const gccgov2Magic = "v2;\n"
```

### <a id="gccgov3Magic" href="#gccgov3Magic">const gccgov3Magic</a>

```
searchKey: gccgoimporter.gccgov3Magic
tags: [private]
```

```Go
const gccgov3Magic = "v3;\n"
```

### <a id="goimporterMagic" href="#goimporterMagic">const goimporterMagic</a>

```
searchKey: gccgoimporter.goimporterMagic
tags: [private]
```

```Go
const goimporterMagic = "\n$$ "
```

### <a id="archiveMagic" href="#archiveMagic">const archiveMagic</a>

```
searchKey: gccgoimporter.archiveMagic
tags: [private]
```

```Go
const archiveMagic = "!<ar"
```

### <a id="aixbigafMagic" href="#aixbigafMagic">const aixbigafMagic</a>

```
searchKey: gccgoimporter.aixbigafMagic
tags: [private]
```

```Go
const aixbigafMagic = "<big"
```

### <a id="gccgoBuiltinINT8" href="#gccgoBuiltinINT8">const gccgoBuiltinINT8</a>

```
searchKey: gccgoimporter.gccgoBuiltinINT8
tags: [private]
```

```Go
const gccgoBuiltinINT8 = 1
```

From gofrontend/go/export.h Note that these values are negative in the gofrontend and have been made positive in the gccgoimporter. 

### <a id="gccgoBuiltinINT16" href="#gccgoBuiltinINT16">const gccgoBuiltinINT16</a>

```
searchKey: gccgoimporter.gccgoBuiltinINT16
tags: [private]
```

```Go
const gccgoBuiltinINT16 = 2
```

### <a id="gccgoBuiltinINT32" href="#gccgoBuiltinINT32">const gccgoBuiltinINT32</a>

```
searchKey: gccgoimporter.gccgoBuiltinINT32
tags: [private]
```

```Go
const gccgoBuiltinINT32 = 3
```

### <a id="gccgoBuiltinINT64" href="#gccgoBuiltinINT64">const gccgoBuiltinINT64</a>

```
searchKey: gccgoimporter.gccgoBuiltinINT64
tags: [private]
```

```Go
const gccgoBuiltinINT64 = 4
```

### <a id="gccgoBuiltinUINT8" href="#gccgoBuiltinUINT8">const gccgoBuiltinUINT8</a>

```
searchKey: gccgoimporter.gccgoBuiltinUINT8
tags: [private]
```

```Go
const gccgoBuiltinUINT8 = 5
```

### <a id="gccgoBuiltinUINT16" href="#gccgoBuiltinUINT16">const gccgoBuiltinUINT16</a>

```
searchKey: gccgoimporter.gccgoBuiltinUINT16
tags: [private]
```

```Go
const gccgoBuiltinUINT16 = 6
```

### <a id="gccgoBuiltinUINT32" href="#gccgoBuiltinUINT32">const gccgoBuiltinUINT32</a>

```
searchKey: gccgoimporter.gccgoBuiltinUINT32
tags: [private]
```

```Go
const gccgoBuiltinUINT32 = 7
```

### <a id="gccgoBuiltinUINT64" href="#gccgoBuiltinUINT64">const gccgoBuiltinUINT64</a>

```
searchKey: gccgoimporter.gccgoBuiltinUINT64
tags: [private]
```

```Go
const gccgoBuiltinUINT64 = 8
```

### <a id="gccgoBuiltinFLOAT32" href="#gccgoBuiltinFLOAT32">const gccgoBuiltinFLOAT32</a>

```
searchKey: gccgoimporter.gccgoBuiltinFLOAT32
tags: [private]
```

```Go
const gccgoBuiltinFLOAT32 = 9
```

### <a id="gccgoBuiltinFLOAT64" href="#gccgoBuiltinFLOAT64">const gccgoBuiltinFLOAT64</a>

```
searchKey: gccgoimporter.gccgoBuiltinFLOAT64
tags: [private]
```

```Go
const gccgoBuiltinFLOAT64 = 10
```

### <a id="gccgoBuiltinINT" href="#gccgoBuiltinINT">const gccgoBuiltinINT</a>

```
searchKey: gccgoimporter.gccgoBuiltinINT
tags: [private]
```

```Go
const gccgoBuiltinINT = 11
```

### <a id="gccgoBuiltinUINT" href="#gccgoBuiltinUINT">const gccgoBuiltinUINT</a>

```
searchKey: gccgoimporter.gccgoBuiltinUINT
tags: [private]
```

```Go
const gccgoBuiltinUINT = 12
```

### <a id="gccgoBuiltinUINTPTR" href="#gccgoBuiltinUINTPTR">const gccgoBuiltinUINTPTR</a>

```
searchKey: gccgoimporter.gccgoBuiltinUINTPTR
tags: [private]
```

```Go
const gccgoBuiltinUINTPTR = 13
```

### <a id="gccgoBuiltinBOOL" href="#gccgoBuiltinBOOL">const gccgoBuiltinBOOL</a>

```
searchKey: gccgoimporter.gccgoBuiltinBOOL
tags: [private]
```

```Go
const gccgoBuiltinBOOL = 15
```

### <a id="gccgoBuiltinSTRING" href="#gccgoBuiltinSTRING">const gccgoBuiltinSTRING</a>

```
searchKey: gccgoimporter.gccgoBuiltinSTRING
tags: [private]
```

```Go
const gccgoBuiltinSTRING = 16
```

### <a id="gccgoBuiltinCOMPLEX64" href="#gccgoBuiltinCOMPLEX64">const gccgoBuiltinCOMPLEX64</a>

```
searchKey: gccgoimporter.gccgoBuiltinCOMPLEX64
tags: [private]
```

```Go
const gccgoBuiltinCOMPLEX64 = 17
```

### <a id="gccgoBuiltinCOMPLEX128" href="#gccgoBuiltinCOMPLEX128">const gccgoBuiltinCOMPLEX128</a>

```
searchKey: gccgoimporter.gccgoBuiltinCOMPLEX128
tags: [private]
```

```Go
const gccgoBuiltinCOMPLEX128 = 18
```

### <a id="gccgoBuiltinERROR" href="#gccgoBuiltinERROR">const gccgoBuiltinERROR</a>

```
searchKey: gccgoimporter.gccgoBuiltinERROR
tags: [private]
```

```Go
const gccgoBuiltinERROR = 19
```

### <a id="gccgoBuiltinBYTE" href="#gccgoBuiltinBYTE">const gccgoBuiltinBYTE</a>

```
searchKey: gccgoimporter.gccgoBuiltinBYTE
tags: [private]
```

```Go
const gccgoBuiltinBYTE = 20
```

### <a id="gccgoBuiltinRUNE" href="#gccgoBuiltinRUNE">const gccgoBuiltinRUNE</a>

```
searchKey: gccgoimporter.gccgoBuiltinRUNE
tags: [private]
```

```Go
const gccgoBuiltinRUNE = 21
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="reserved" href="#reserved">var reserved</a>

```
searchKey: gccgoimporter.reserved
tags: [private]
```

```Go
var reserved = new(struct{ types.Type })
```

reserved is a singleton type used to fill type map slots that have been reserved (i.e., for which a type number has been parsed) but which don't have their actual type yet. When the type map is updated, the actual type must replace a reserved entry (or we have an internal error). Used for self-verification only - not required for correctness. 

### <a id="importablePackages" href="#importablePackages">var importablePackages</a>

```
searchKey: gccgoimporter.importablePackages
tags: [private]
```

```Go
var importablePackages = ...
```

importablePackages is a list of packages that we verify that we can import. This should be all standard library packages in all relevant versions of gccgo. Note that since gccgo follows a different release cycle, and since different systems have different versions installed, we can't use the last-two-versions rule of the gc toolchain. 

### <a id="importerTests" href="#importerTests">var importerTests</a>

```
searchKey: gccgoimporter.importerTests
tags: [private]
```

```Go
var importerTests = ...
```

When adding tests to this list, be sure to set the 'gccgoVersion' field if the testcases uses a "recent" Go addition (ex: aliases). 

### <a id="typeParserTests" href="#typeParserTests">var typeParserTests</a>

```
searchKey: gccgoimporter.typeParserTests
tags: [private]
```

```Go
var typeParserTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="seekerReadAt" href="#seekerReadAt">type seekerReadAt struct</a>

```
searchKey: gccgoimporter.seekerReadAt
tags: [private]
```

```Go
type seekerReadAt struct {
	seeker io.ReadSeeker
}
```

#### <a id="seekerReadAt.ReadAt" href="#seekerReadAt.ReadAt">func (sra seekerReadAt) ReadAt(p []byte, off int64) (int, error)</a>

```
searchKey: gccgoimporter.seekerReadAt.ReadAt
tags: [private]
```

```Go
func (sra seekerReadAt) ReadAt(p []byte, off int64) (int, error)
```

### <a id="GccgoInstallation" href="#GccgoInstallation">type GccgoInstallation struct</a>

```
searchKey: gccgoimporter.GccgoInstallation
```

```Go
type GccgoInstallation struct {
	// Version of gcc (e.g. 4.8.0).
	GccVersion string

	// Target triple (e.g. x86_64-unknown-linux-gnu).
	TargetTriple string

	// Built-in library paths used by this installation.
	LibPaths []string
}
```

Information about a specific installation of gccgo. 

#### <a id="GccgoInstallation.InitFromDriver" href="#GccgoInstallation.InitFromDriver">func (inst *GccgoInstallation) InitFromDriver(gccgoPath string, args ...string) (err error)</a>

```
searchKey: gccgoimporter.GccgoInstallation.InitFromDriver
```

```Go
func (inst *GccgoInstallation) InitFromDriver(gccgoPath string, args ...string) (err error)
```

Ask the driver at the given path for information for this GccgoInstallation. The given arguments are passed directly to the call of the driver. 

#### <a id="GccgoInstallation.SearchPaths" href="#GccgoInstallation.SearchPaths">func (inst *GccgoInstallation) SearchPaths() (paths []string)</a>

```
searchKey: gccgoimporter.GccgoInstallation.SearchPaths
```

```Go
func (inst *GccgoInstallation) SearchPaths() (paths []string)
```

Return the list of export search paths for this GccgoInstallation. 

#### <a id="GccgoInstallation.GetImporter" href="#GccgoInstallation.GetImporter">func (inst *GccgoInstallation) GetImporter(incpaths []string, initmap map[*types.Package]InitData) Importer</a>

```
searchKey: gccgoimporter.GccgoInstallation.GetImporter
```

```Go
func (inst *GccgoInstallation) GetImporter(incpaths []string, initmap map[*types.Package]InitData) Importer
```

Return an importer that searches incpaths followed by the gcc installation's built-in search paths and the current directory. 

### <a id="PackageInit" href="#PackageInit">type PackageInit struct</a>

```
searchKey: gccgoimporter.PackageInit
```

```Go
type PackageInit struct {
	Name     string // short package name
	InitFunc string // name of init function
	Priority int    // priority of init function, see InitData.Priority
}
```

A PackageInit describes an imported package that needs initialization. 

### <a id="InitData" href="#InitData">type InitData struct</a>

```
searchKey: gccgoimporter.InitData
```

```Go
type InitData struct {
	// Initialization priority of this package relative to other packages.
	// This is based on the maximum depth of the package's dependency graph;
	// it is guaranteed to be greater than that of its dependencies.
	Priority int

	// The list of packages which this package depends on to be initialized,
	// including itself if needed. This is the subset of the transitive closure of
	// the package's dependencies that need initialization.
	Inits []PackageInit
}
```

The gccgo-specific init data for a package. 

### <a id="Importer" href="#Importer">type Importer func(imports map[string]*go/types.Package, path string, srcDir string, lookup func(string) (io.ReadCloser, error)) (*go/types.Package, error)</a>

```
searchKey: gccgoimporter.Importer
```

```Go
type Importer func(imports map[string]*types.Package, path, srcDir string, lookup func(string) (io.ReadCloser, error)) (*types.Package, error)
```

An Importer resolves import paths to Packages. The imports map records packages already known, indexed by package path. An importer must determine the canonical package path and check imports to see if it is already present in the map. If so, the Importer can return the map entry. Otherwise, the importer must load the package data for the given path into a new *Package, record it in imports map, and return the package. 

#### <a id="GetImporter" href="#GetImporter">func GetImporter(searchpaths []string, initmap map[*types.Package]InitData) Importer</a>

```
searchKey: gccgoimporter.GetImporter
```

```Go
func GetImporter(searchpaths []string, initmap map[*types.Package]InitData) Importer
```

### <a id="parser" href="#parser">type parser struct</a>

```
searchKey: gccgoimporter.parser
tags: [private]
```

```Go
type parser struct {
	scanner  *scanner.Scanner
	version  string                    // format version
	tok      rune                      // current token
	lit      string                    // literal string; only valid for Ident, Int, String tokens
	pkgpath  string                    // package path of imported package
	pkgname  string                    // name of imported package
	pkg      *types.Package            // reference to imported package
	imports  map[string]*types.Package // package path -> package object
	typeList []types.Type              // type number -> type
	typeData []string                  // unparsed type data (v3 and later)
	fixups   []fixupRecord             // fixups to apply at end of parsing
	initdata InitData                  // package init priority data
	aliases  map[int]string            // maps saved type number to alias name
}
```

#### <a id="parser.init.parser.go" href="#parser.init.parser.go">func (p *parser) init(filename string, src io.Reader, imports map[string]*types.Package)</a>

```
searchKey: gccgoimporter.parser.init
tags: [private]
```

```Go
func (p *parser) init(filename string, src io.Reader, imports map[string]*types.Package)
```

#### <a id="parser.initScanner" href="#parser.initScanner">func (p *parser) initScanner(filename string, src io.Reader)</a>

```
searchKey: gccgoimporter.parser.initScanner
tags: [private]
```

```Go
func (p *parser) initScanner(filename string, src io.Reader)
```

#### <a id="parser.error" href="#parser.error">func (p *parser) error(err interface{})</a>

```
searchKey: gccgoimporter.parser.error
tags: [private]
```

```Go
func (p *parser) error(err interface{})
```

#### <a id="parser.errorf" href="#parser.errorf">func (p *parser) errorf(format string, args ...interface{})</a>

```
searchKey: gccgoimporter.parser.errorf
tags: [private]
```

```Go
func (p *parser) errorf(format string, args ...interface{})
```

#### <a id="parser.expect" href="#parser.expect">func (p *parser) expect(tok rune) string</a>

```
searchKey: gccgoimporter.parser.expect
tags: [private]
```

```Go
func (p *parser) expect(tok rune) string
```

#### <a id="parser.expectEOL" href="#parser.expectEOL">func (p *parser) expectEOL()</a>

```
searchKey: gccgoimporter.parser.expectEOL
tags: [private]
```

```Go
func (p *parser) expectEOL()
```

#### <a id="parser.expectKeyword" href="#parser.expectKeyword">func (p *parser) expectKeyword(keyword string)</a>

```
searchKey: gccgoimporter.parser.expectKeyword
tags: [private]
```

```Go
func (p *parser) expectKeyword(keyword string)
```

#### <a id="parser.parseString" href="#parser.parseString">func (p *parser) parseString() string</a>

```
searchKey: gccgoimporter.parser.parseString
tags: [private]
```

```Go
func (p *parser) parseString() string
```

#### <a id="parser.parseUnquotedString" href="#parser.parseUnquotedString">func (p *parser) parseUnquotedString() string</a>

```
searchKey: gccgoimporter.parser.parseUnquotedString
tags: [private]
```

```Go
func (p *parser) parseUnquotedString() string
```

unquotedString     = { unquotedStringChar } . unquotedStringChar = <neither a whitespace nor a ';' char> . 

#### <a id="parser.next" href="#parser.next">func (p *parser) next()</a>

```
searchKey: gccgoimporter.parser.next
tags: [private]
```

```Go
func (p *parser) next()
```

#### <a id="parser.parseQualifiedName" href="#parser.parseQualifiedName">func (p *parser) parseQualifiedName() (path, name string)</a>

```
searchKey: gccgoimporter.parser.parseQualifiedName
tags: [private]
```

```Go
func (p *parser) parseQualifiedName() (path, name string)
```

#### <a id="parser.parseUnquotedQualifiedName" href="#parser.parseUnquotedQualifiedName">func (p *parser) parseUnquotedQualifiedName() (path, name string)</a>

```
searchKey: gccgoimporter.parser.parseUnquotedQualifiedName
tags: [private]
```

```Go
func (p *parser) parseUnquotedQualifiedName() (path, name string)
```

#### <a id="parser.parseQualifiedNameStr" href="#parser.parseQualifiedNameStr">func (p *parser) parseQualifiedNameStr(unquotedName string) (pkgpath, name string)</a>

```
searchKey: gccgoimporter.parser.parseQualifiedNameStr
tags: [private]
```

```Go
func (p *parser) parseQualifiedNameStr(unquotedName string) (pkgpath, name string)
```

qualifiedName = [ ["."] unquotedString "." ] unquotedString . 

The above production uses greedy matching. 

#### <a id="parser.getPkg" href="#parser.getPkg">func (p *parser) getPkg(pkgpath, name string) *types.Package</a>

```
searchKey: gccgoimporter.parser.getPkg
tags: [private]
```

```Go
func (p *parser) getPkg(pkgpath, name string) *types.Package
```

getPkg returns the package for a given path. If the package is not found but we have a package name, create the package and add it to the p.imports map. 

#### <a id="parser.parseExportedName" href="#parser.parseExportedName">func (p *parser) parseExportedName() (pkg *types.Package, name string)</a>

```
searchKey: gccgoimporter.parser.parseExportedName
tags: [private]
```

```Go
func (p *parser) parseExportedName() (pkg *types.Package, name string)
```

parseExportedName is like parseQualifiedName, but the package path is resolved to an imported *types.Package. 

ExportedName = string [string] . 

#### <a id="parser.parseName" href="#parser.parseName">func (p *parser) parseName() string</a>

```
searchKey: gccgoimporter.parser.parseName
tags: [private]
```

```Go
func (p *parser) parseName() string
```

Name = QualifiedName | "?" . 

#### <a id="parser.parseField" href="#parser.parseField">func (p *parser) parseField(pkg *types.Package) (field *types.Var, tag string)</a>

```
searchKey: gccgoimporter.parser.parseField
tags: [private]
```

```Go
func (p *parser) parseField(pkg *types.Package) (field *types.Var, tag string)
```

Field = Name Type [string] . 

#### <a id="parser.parseParam" href="#parser.parseParam">func (p *parser) parseParam(pkg *types.Package) (param *types.Var, isVariadic bool)</a>

```
searchKey: gccgoimporter.parser.parseParam
tags: [private]
```

```Go
func (p *parser) parseParam(pkg *types.Package) (param *types.Var, isVariadic bool)
```

Param = Name ["..."] Type . 

#### <a id="parser.parseVar" href="#parser.parseVar">func (p *parser) parseVar(pkg *types.Package) *types.Var</a>

```
searchKey: gccgoimporter.parser.parseVar
tags: [private]
```

```Go
func (p *parser) parseVar(pkg *types.Package) *types.Var
```

Var = Name Type . 

#### <a id="parser.parseConversion" href="#parser.parseConversion">func (p *parser) parseConversion(pkg *types.Package) (val constant.Value, typ types.Type)</a>

```
searchKey: gccgoimporter.parser.parseConversion
tags: [private]
```

```Go
func (p *parser) parseConversion(pkg *types.Package) (val constant.Value, typ types.Type)
```

Conversion = "convert" "(" Type "," ConstValue ")" . 

#### <a id="parser.parseConstValue" href="#parser.parseConstValue">func (p *parser) parseConstValue(pkg *types.Package) (val constant.Value, typ types.Type)</a>

```
searchKey: gccgoimporter.parser.parseConstValue
tags: [private]
```

```Go
func (p *parser) parseConstValue(pkg *types.Package) (val constant.Value, typ types.Type)
```

ConstValue     = string | "false" | "true" | ["-"] (int ["'"] | FloatOrComplex) | Conversion . FloatOrComplex = float ["i" | ("+"|"-") float "i"] . 

#### <a id="parser.parseConst" href="#parser.parseConst">func (p *parser) parseConst(pkg *types.Package) *types.Const</a>

```
searchKey: gccgoimporter.parser.parseConst
tags: [private]
```

```Go
func (p *parser) parseConst(pkg *types.Package) *types.Const
```

Const = Name [Type] "=" ConstValue . 

#### <a id="parser.reserve" href="#parser.reserve">func (p *parser) reserve(n int)</a>

```
searchKey: gccgoimporter.parser.reserve
tags: [private]
```

```Go
func (p *parser) reserve(n int)
```

reserve reserves the type map entry n for future use. 

#### <a id="parser.update" href="#parser.update">func (p *parser) update(t types.Type, nlist []interface{})</a>

```
searchKey: gccgoimporter.parser.update
tags: [private]
```

```Go
func (p *parser) update(t types.Type, nlist []interface{})
```

update sets the type map entries for the entries in nlist to t. An entry in nlist can be a type number in p.typeList, used to resolve named types, or it can be a *types.Pointer, used to resolve pointers to named types in case they are referenced by embedded fields. 

#### <a id="parser.parseNamedType" href="#parser.parseNamedType">func (p *parser) parseNamedType(nlist []interface{}) types.Type</a>

```
searchKey: gccgoimporter.parser.parseNamedType
tags: [private]
```

```Go
func (p *parser) parseNamedType(nlist []interface{}) types.Type
```

NamedType = TypeName [ "=" ] Type { Method } . TypeName  = ExportedName . Method    = "func" "(" Param ")" Name ParamList ResultList [InlineBody] ";" . 

#### <a id="parser.parseInt64" href="#parser.parseInt64">func (p *parser) parseInt64() int64</a>

```
searchKey: gccgoimporter.parser.parseInt64
tags: [private]
```

```Go
func (p *parser) parseInt64() int64
```

#### <a id="parser.parseInt" href="#parser.parseInt">func (p *parser) parseInt() int</a>

```
searchKey: gccgoimporter.parser.parseInt
tags: [private]
```

```Go
func (p *parser) parseInt() int
```

#### <a id="parser.parseArrayOrSliceType" href="#parser.parseArrayOrSliceType">func (p *parser) parseArrayOrSliceType(pkg *types.Package, nlist []interface{}) types.Type</a>

```
searchKey: gccgoimporter.parser.parseArrayOrSliceType
tags: [private]
```

```Go
func (p *parser) parseArrayOrSliceType(pkg *types.Package, nlist []interface{}) types.Type
```

ArrayOrSliceType = "[" [ int ] "]" Type . 

#### <a id="parser.parseMapType" href="#parser.parseMapType">func (p *parser) parseMapType(pkg *types.Package, nlist []interface{}) types.Type</a>

```
searchKey: gccgoimporter.parser.parseMapType
tags: [private]
```

```Go
func (p *parser) parseMapType(pkg *types.Package, nlist []interface{}) types.Type
```

MapType = "map" "[" Type "]" Type . 

#### <a id="parser.parseChanType" href="#parser.parseChanType">func (p *parser) parseChanType(pkg *types.Package, nlist []interface{}) types.Type</a>

```
searchKey: gccgoimporter.parser.parseChanType
tags: [private]
```

```Go
func (p *parser) parseChanType(pkg *types.Package, nlist []interface{}) types.Type
```

ChanType = "chan" ["<-" | "-<"] Type . 

#### <a id="parser.parseStructType" href="#parser.parseStructType">func (p *parser) parseStructType(pkg *types.Package, nlist []interface{}) types.Type</a>

```
searchKey: gccgoimporter.parser.parseStructType
tags: [private]
```

```Go
func (p *parser) parseStructType(pkg *types.Package, nlist []interface{}) types.Type
```

StructType = "struct" "{" { Field } "}" . 

#### <a id="parser.parseParamList" href="#parser.parseParamList">func (p *parser) parseParamList(pkg *types.Package) (*types.Tuple, bool)</a>

```
searchKey: gccgoimporter.parser.parseParamList
tags: [private]
```

```Go
func (p *parser) parseParamList(pkg *types.Package) (*types.Tuple, bool)
```

ParamList = "(" [ { Parameter "," } Parameter ] ")" . 

#### <a id="parser.parseResultList" href="#parser.parseResultList">func (p *parser) parseResultList(pkg *types.Package) *types.Tuple</a>

```
searchKey: gccgoimporter.parser.parseResultList
tags: [private]
```

```Go
func (p *parser) parseResultList(pkg *types.Package) *types.Tuple
```

ResultList = Type | ParamList . 

#### <a id="parser.parseFunctionType" href="#parser.parseFunctionType">func (p *parser) parseFunctionType(pkg *types.Package, nlist []interface{}) *types.Signature</a>

```
searchKey: gccgoimporter.parser.parseFunctionType
tags: [private]
```

```Go
func (p *parser) parseFunctionType(pkg *types.Package, nlist []interface{}) *types.Signature
```

FunctionType = ParamList ResultList . 

#### <a id="parser.parseFunc" href="#parser.parseFunc">func (p *parser) parseFunc(pkg *types.Package) *types.Func</a>

```
searchKey: gccgoimporter.parser.parseFunc
tags: [private]
```

```Go
func (p *parser) parseFunc(pkg *types.Package) *types.Func
```

Func = Name FunctionType [InlineBody] . 

#### <a id="parser.parseInterfaceType" href="#parser.parseInterfaceType">func (p *parser) parseInterfaceType(pkg *types.Package, nlist []interface{}) types.Type</a>

```
searchKey: gccgoimporter.parser.parseInterfaceType
tags: [private]
```

```Go
func (p *parser) parseInterfaceType(pkg *types.Package, nlist []interface{}) types.Type
```

InterfaceType = "interface" "{" { ("?" Type | Func) ";" } "}" . 

#### <a id="parser.parsePointerType" href="#parser.parsePointerType">func (p *parser) parsePointerType(pkg *types.Package, nlist []interface{}) types.Type</a>

```
searchKey: gccgoimporter.parser.parsePointerType
tags: [private]
```

```Go
func (p *parser) parsePointerType(pkg *types.Package, nlist []interface{}) types.Type
```

PointerType = "*" ("any" | Type) . 

#### <a id="parser.parseTypeSpec" href="#parser.parseTypeSpec">func (p *parser) parseTypeSpec(pkg *types.Package, nlist []interface{}) types.Type</a>

```
searchKey: gccgoimporter.parser.parseTypeSpec
tags: [private]
```

```Go
func (p *parser) parseTypeSpec(pkg *types.Package, nlist []interface{}) types.Type
```

TypeSpec = NamedType | MapType | ChanType | StructType | InterfaceType | PointerType | ArrayOrSliceType | FunctionType . 

#### <a id="parser.parseType" href="#parser.parseType">func (p *parser) parseType(pkg *types.Package, n ...interface{}) types.Type</a>

```
searchKey: gccgoimporter.parser.parseType
tags: [private]
```

```Go
func (p *parser) parseType(pkg *types.Package, n ...interface{}) types.Type
```

Type = "<" "type" ( "-" int | int [ TypeSpec ] ) ">" . 

parseType updates the type map to t for all type numbers n. 

#### <a id="parser.parseTypeAfterAngle" href="#parser.parseTypeAfterAngle">func (p *parser) parseTypeAfterAngle(pkg *types.Package, n ...interface{}) (t types.Type, n1 int)</a>

```
searchKey: gccgoimporter.parser.parseTypeAfterAngle
tags: [private]
```

```Go
func (p *parser) parseTypeAfterAngle(pkg *types.Package, n ...interface{}) (t types.Type, n1 int)
```

(*parser).Type after reading the "<". 

#### <a id="parser.parseTypeExtended" href="#parser.parseTypeExtended">func (p *parser) parseTypeExtended(pkg *types.Package, n ...interface{}) (t types.Type, n1 int)</a>

```
searchKey: gccgoimporter.parser.parseTypeExtended
tags: [private]
```

```Go
func (p *parser) parseTypeExtended(pkg *types.Package, n ...interface{}) (t types.Type, n1 int)
```

parseTypeExtended is identical to parseType, but if the type in question is a saved type, returns the index as well as the type pointer (index returned is zero if we parsed a builtin). 

#### <a id="parser.skipInlineBody" href="#parser.skipInlineBody">func (p *parser) skipInlineBody()</a>

```
searchKey: gccgoimporter.parser.skipInlineBody
tags: [private]
```

```Go
func (p *parser) skipInlineBody()
```

InlineBody = "<inl:NN>" .{NN} Reports whether a body was skipped. 

#### <a id="parser.parseTypes" href="#parser.parseTypes">func (p *parser) parseTypes(pkg *types.Package)</a>

```
searchKey: gccgoimporter.parser.parseTypes
tags: [private]
```

```Go
func (p *parser) parseTypes(pkg *types.Package)
```

Types = "types" maxp1 exportedp1 (offset length)* . 

#### <a id="parser.parseSavedType" href="#parser.parseSavedType">func (p *parser) parseSavedType(pkg *types.Package, i int, nlist []interface{})</a>

```
searchKey: gccgoimporter.parser.parseSavedType
tags: [private]
```

```Go
func (p *parser) parseSavedType(pkg *types.Package, i int, nlist []interface{})
```

parseSavedType parses one saved type definition. 

#### <a id="parser.parsePackageInit" href="#parser.parsePackageInit">func (p *parser) parsePackageInit() PackageInit</a>

```
searchKey: gccgoimporter.parser.parsePackageInit
tags: [private]
```

```Go
func (p *parser) parsePackageInit() PackageInit
```

PackageInit = unquotedString unquotedString int . 

#### <a id="parser.maybeCreatePackage" href="#parser.maybeCreatePackage">func (p *parser) maybeCreatePackage()</a>

```
searchKey: gccgoimporter.parser.maybeCreatePackage
tags: [private]
```

```Go
func (p *parser) maybeCreatePackage()
```

Create the package if we have parsed both the package path and package name. 

#### <a id="parser.parseInitDataDirective" href="#parser.parseInitDataDirective">func (p *parser) parseInitDataDirective()</a>

```
searchKey: gccgoimporter.parser.parseInitDataDirective
tags: [private]
```

```Go
func (p *parser) parseInitDataDirective()
```

InitDataDirective = ( "v1" | "v2" | "v3" ) ";" | 

```
"priority" int ";" |
"init" { PackageInit } ";" |
"checksum" unquotedString ";" .

```
#### <a id="parser.parseDirective" href="#parser.parseDirective">func (p *parser) parseDirective()</a>

```
searchKey: gccgoimporter.parser.parseDirective
tags: [private]
```

```Go
func (p *parser) parseDirective()
```

Directive = InitDataDirective | 

```
"package" unquotedString [ unquotedString ] [ unquotedString ] ";" |
"pkgpath" unquotedString ";" |
"prefix" unquotedString ";" |
"import" unquotedString unquotedString string ";" |
"indirectimport" unquotedString unquotedstring ";" |
"func" Func ";" |
"type" Type ";" |
"var" Var ";" |
"const" Const ";" .

```
#### <a id="parser.parsePackage" href="#parser.parsePackage">func (p *parser) parsePackage() *types.Package</a>

```
searchKey: gccgoimporter.parser.parsePackage
tags: [private]
```

```Go
func (p *parser) parsePackage() *types.Package
```

Package = { Directive } . 

### <a id="fixupRecord" href="#fixupRecord">type fixupRecord struct</a>

```
searchKey: gccgoimporter.fixupRecord
tags: [private]
```

```Go
type fixupRecord struct {
	toUpdate *types.Named // type to modify when fixup is processed
	target   types.Type   // type that was incomplete when fixup was created
}
```

### <a id="importError" href="#importError">type importError struct</a>

```
searchKey: gccgoimporter.importError
tags: [private]
```

```Go
type importError struct {
	pos scanner.Position
	err error
}
```

#### <a id="importError.Error" href="#importError.Error">func (e importError) Error() string</a>

```
searchKey: gccgoimporter.importError.Error
tags: [private]
```

```Go
func (e importError) Error() string
```

### <a id="importerTest" href="#importerTest">type importerTest struct</a>

```
searchKey: gccgoimporter.importerTest
tags: [private]
```

```Go
type importerTest struct {
	pkgpath, name, want, wantval string
	wantinits                    []string
	gccgoVersion                 int // minimum gccgo version (0 => any)
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="arExportData" href="#arExportData">func arExportData(archive io.ReadSeeker) (io.ReadSeeker, error)</a>

```
searchKey: gccgoimporter.arExportData
tags: [private]
```

```Go
func arExportData(archive io.ReadSeeker) (io.ReadSeeker, error)
```

arExportData takes an archive file and returns a ReadSeeker for the export data in that file. This assumes that there is only one object in the archive containing export data, which is not quite what gccgo does; gccgo concatenates together all the export data for all the objects in the file.  In practice that case does not arise. 

### <a id="standardArExportData" href="#standardArExportData">func standardArExportData(archive io.ReadSeeker) (io.ReadSeeker, error)</a>

```
searchKey: gccgoimporter.standardArExportData
tags: [private]
```

```Go
func standardArExportData(archive io.ReadSeeker) (io.ReadSeeker, error)
```

standardArExportData returns export data from a standard archive. 

### <a id="elfFromAr" href="#elfFromAr">func elfFromAr(member *io.SectionReader) (io.ReadSeeker, error)</a>

```
searchKey: gccgoimporter.elfFromAr
tags: [private]
```

```Go
func elfFromAr(member *io.SectionReader) (io.ReadSeeker, error)
```

elfFromAr tries to get export data from an archive member as an ELF file. If there is no export data, this returns nil, nil. 

### <a id="aixBigArExportData" href="#aixBigArExportData">func aixBigArExportData(archive io.ReadSeeker) (io.ReadSeeker, error)</a>

```
searchKey: gccgoimporter.aixBigArExportData
tags: [private]
```

```Go
func aixBigArExportData(archive io.ReadSeeker) (io.ReadSeeker, error)
```

aixBigArExportData returns export data from an AIX big archive. 

### <a id="readerAtFromSeeker" href="#readerAtFromSeeker">func readerAtFromSeeker(rs io.ReadSeeker) io.ReaderAt</a>

```
searchKey: gccgoimporter.readerAtFromSeeker
tags: [private]
```

```Go
func readerAtFromSeeker(rs io.ReadSeeker) io.ReaderAt
```

readerAtFromSeeker turns an io.ReadSeeker into an io.ReaderAt. This is only safe because there won't be any concurrent seeks while this code is executing. 

### <a id="findExportFile" href="#findExportFile">func findExportFile(searchpaths []string, pkgpath string) (string, error)</a>

```
searchKey: gccgoimporter.findExportFile
tags: [private]
```

```Go
func findExportFile(searchpaths []string, pkgpath string) (string, error)
```

Locate the file from which to read export data. This is intended to replicate the logic in gofrontend. 

### <a id="openExportFile" href="#openExportFile">func openExportFile(fpath string) (reader io.ReadSeeker, closer io.Closer, err error)</a>

```
searchKey: gccgoimporter.openExportFile
tags: [private]
```

```Go
func openExportFile(fpath string) (reader io.ReadSeeker, closer io.Closer, err error)
```

Opens the export data file at the given path. If this is an ELF file, searches for and opens the .go_export section. If this is an archive, reads the export data from the first member, which is assumed to be an ELF file. This is intended to replicate the logic in gofrontend. 

### <a id="readMagic" href="#readMagic">func readMagic(reader io.ReadSeeker) (string, error)</a>

```
searchKey: gccgoimporter.readMagic
tags: [private]
```

```Go
func readMagic(reader io.ReadSeeker) (string, error)
```

readMagic reads the four bytes at the start of a ReadSeeker and returns them as a string. 

### <a id="deref" href="#deref">func deref(typ types.Type) types.Type</a>

```
searchKey: gccgoimporter.deref
tags: [private]
```

```Go
func deref(typ types.Type) types.Type
```

### <a id="lookupBuiltinType" href="#lookupBuiltinType">func lookupBuiltinType(typ int) types.Type</a>

```
searchKey: gccgoimporter.lookupBuiltinType
tags: [private]
```

```Go
func lookupBuiltinType(typ int) types.Type
```

### <a id="TestInstallationImporter" href="#TestInstallationImporter">func TestInstallationImporter(t *testing.T)</a>

```
searchKey: gccgoimporter.TestInstallationImporter
tags: [private]
```

```Go
func TestInstallationImporter(t *testing.T)
```

### <a id="runImporterTest" href="#runImporterTest">func runImporterTest(t *testing.T, imp Importer, initmap map[*types.Package]InitData, test *importerTest)</a>

```
searchKey: gccgoimporter.runImporterTest
tags: [private]
```

```Go
func runImporterTest(t *testing.T, imp Importer, initmap map[*types.Package]InitData, test *importerTest)
```

### <a id="TestGoxImporter" href="#TestGoxImporter">func TestGoxImporter(t *testing.T)</a>

```
searchKey: gccgoimporter.TestGoxImporter
tags: [private]
```

```Go
func TestGoxImporter(t *testing.T)
```

### <a id="gccgoPath" href="#gccgoPath">func gccgoPath() string</a>

```
searchKey: gccgoimporter.gccgoPath
tags: [private]
```

```Go
func gccgoPath() string
```

gccgoPath returns a path to gccgo if it is present (either in path or specified via GCCGO environment variable), or an empty string if no gccgo is available. 

### <a id="TestObjImporter" href="#TestObjImporter">func TestObjImporter(t *testing.T)</a>

```
searchKey: gccgoimporter.TestObjImporter
tags: [private]
```

```Go
func TestObjImporter(t *testing.T)
```

### <a id="TestTypeParser" href="#TestTypeParser">func TestTypeParser(t *testing.T)</a>

```
searchKey: gccgoimporter.TestTypeParser
tags: [private]
```

```Go
func TestTypeParser(t *testing.T)
```

