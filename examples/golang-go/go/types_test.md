# Package types_test

## Index

* [Constants](#const)
    * [const filename](#filename)
    * [const genericPkg](#genericPkg)
* [Variables](#var)
    * [var H](#H)
    * [var builtinCalls](#builtinCalls)
    * [var dependentTestTypes](#dependentTestTypes)
    * [var errRx](#errRx)
    * [var excluded](#excluded)
    * [var fset](#fset)
    * [var goVersion](#goVersion)
    * [var goVersionRx](#goVersionRx)
    * [var haltOnError](#haltOnError)
    * [var independentTestTypes](#independentTestTypes)
    * [var out](#out)
    * [var posMsgRx](#posMsgRx)
    * [var stdLibImporter](#stdLibImporter)
    * [var testExprs](#testExprs)
    * [var verifyErrors](#verifyErrors)
* [Types](#type)
    * [type gen struct](#gen)
        * [func (g *gen) binomials(n int)](#gen.binomials)
        * [func (g *gen) factorials(n int)](#gen.factorials)
        * [func (g *gen) hilbert(n int)](#gen.hilbert)
        * [func (g *gen) inverse(n int)](#gen.inverse)
        * [func (g *gen) p(format string, args ...interface{})](#gen.p)
        * [func (g *gen) printProduct(n int)](#gen.printProduct)
        * [func (g *gen) product(n int)](#gen.product)
        * [func (g *gen) verify(n int)](#gen.verify)
    * [type importHelper struct](#importHelper)
        * [func (h importHelper) Import(path string) (*Package, error)](#importHelper.Import)
    * [type resolveTestImporter struct](#resolveTestImporter)
        * [func (imp *resolveTestImporter) Import(string) (*Package, error)](#resolveTestImporter.Import)
        * [func (imp *resolveTestImporter) ImportFrom(path, srcDir string, mode ImportMode) (*Package, error)](#resolveTestImporter.ImportFrom)
    * [type testEntry struct](#testEntry)
        * [func dup(s string) testEntry](#dup)
    * [type testImporter map[string]*types.Package](#testImporter)
        * [func (m testImporter) Import(path string) (*Package, error)](#testImporter.Import)
    * [type walker struct](#walker)
        * [func (w *walker) walk(dir string)](#walker.walk)
* [Functions](#func)
    * [func BenchmarkCheck(b *testing.B)](#BenchmarkCheck)
    * [func ExampleInfo()](#ExampleInfo)
    * [func ExampleMethodSet()](#ExampleMethodSet)
    * [func ExampleScope()](#ExampleScope)
    * [func TestAlignofNaclSlice(t *testing.T)](#TestAlignofNaclSlice)
    * [func TestAssignableTo(t *testing.T)](#TestAssignableTo)
    * [func TestBuiltinSignatures(t *testing.T)](#TestBuiltinSignatures)
    * [func TestCheck(t *testing.T)](#TestCheck)
    * [func TestCheckExpr(t *testing.T)](#TestCheckExpr)
    * [func TestCompositeLitTypes(t *testing.T)](#TestCompositeLitTypes)
    * [func TestConvertibleTo(t *testing.T)](#TestConvertibleTo)
    * [func TestDefsInfo(t *testing.T)](#TestDefsInfo)
    * [func TestErrorCodeExamples(t *testing.T)](#TestErrorCodeExamples)
    * [func TestErrorCodeStyle(t *testing.T)](#TestErrorCodeStyle)
    * [func TestEvalArith(t *testing.T)](#TestEvalArith)
    * [func TestEvalBasic(t *testing.T)](#TestEvalBasic)
    * [func TestEvalComposite(t *testing.T)](#TestEvalComposite)
    * [func TestEvalPos(t *testing.T)](#TestEvalPos)
    * [func TestExamples(t *testing.T)](#TestExamples)
    * [func TestExprString(t *testing.T)](#TestExprString)
    * [func TestFailedImport(t *testing.T)](#TestFailedImport)
    * [func TestFiles(t *testing.T)](#TestFiles)
    * [func TestFixedbugs(t *testing.T)](#TestFixedbugs)
    * [func TestHilbert(t *testing.T)](#TestHilbert)
    * [func TestIdentical_issue15173(t *testing.T)](#TestIdentical_issue15173)
    * [func TestImplicitsInfo(t *testing.T)](#TestImplicitsInfo)
    * [func TestIncompleteInterfaces(t *testing.T)](#TestIncompleteInterfaces)
    * [func TestIndexRepresentability(t *testing.T)](#TestIndexRepresentability)
    * [func TestInitOrderInfo(t *testing.T)](#TestInitOrderInfo)
    * [func TestIssue13898(t *testing.T)](#TestIssue13898)
    * [func TestIssue15305(t *testing.T)](#TestIssue15305)
    * [func TestIssue16902(t *testing.T)](#TestIssue16902)
    * [func TestIssue22525(t *testing.T)](#TestIssue22525)
    * [func TestIssue25627(t *testing.T)](#TestIssue25627)
    * [func TestIssue28005(t *testing.T)](#TestIssue28005)
    * [func TestIssue28282(t *testing.T)](#TestIssue28282)
    * [func TestIssue29029(t *testing.T)](#TestIssue29029)
    * [func TestIssue34151(t *testing.T)](#TestIssue34151)
    * [func TestIssue34921(t *testing.T)](#TestIssue34921)
    * [func TestIssue43088(t *testing.T)](#TestIssue43088)
    * [func TestIssue43124(t *testing.T)](#TestIssue43124)
    * [func TestIssue44515(t *testing.T)](#TestIssue44515)
    * [func TestIssue46453(t *testing.T)](#TestIssue46453)
    * [func TestIssue5770(t *testing.T)](#TestIssue5770)
    * [func TestIssue5849(t *testing.T)](#TestIssue5849)
    * [func TestIssue6413(t *testing.T)](#TestIssue6413)
    * [func TestIssue7245(t *testing.T)](#TestIssue7245)
    * [func TestIssue7827(t *testing.T)](#TestIssue7827)
    * [func TestIssue8518(t *testing.T)](#TestIssue8518)
    * [func TestLongConstants(t *testing.T)](#TestLongConstants)
    * [func TestLookupFieldOrMethod(t *testing.T)](#TestLookupFieldOrMethod)
    * [func TestManual(t *testing.T)](#TestManual)
    * [func TestMultiFileInitOrder(t *testing.T)](#TestMultiFileInitOrder)
    * [func TestMultipleSizeUse(t *testing.T)](#TestMultipleSizeUse)
    * [func TestNewMethodSet(t *testing.T)](#TestNewMethodSet)
    * [func TestObjectParents(t *testing.T)](#TestObjectParents)
    * [func TestPredicatesInfo(t *testing.T)](#TestPredicatesInfo)
    * [func TestQualifiedTypeString(t *testing.T)](#TestQualifiedTypeString)
    * [func TestResolveIdents(t *testing.T)](#TestResolveIdents)
    * [func TestScopeLookupParent(t *testing.T)](#TestScopeLookupParent)
    * [func TestScopesInfo(t *testing.T)](#TestScopesInfo)
    * [func TestSelection(t *testing.T)](#TestSelection)
    * [func TestSelf(t *testing.T)](#TestSelf)
    * [func TestStdFixed(t *testing.T)](#TestStdFixed)
    * [func TestStdKen(t *testing.T)](#TestStdKen)
    * [func TestStdTest(t *testing.T)](#TestStdTest)
    * [func TestStdlib(t *testing.T)](#TestStdlib)
    * [func TestTypeString(t *testing.T)](#TestTypeString)
    * [func TestTypesInfo(t *testing.T)](#TestTypesInfo)
    * [func TestUsesInfo(t *testing.T)](#TestUsesInfo)
    * [func TestValuesInfo(t *testing.T)](#TestValuesInfo)
    * [func asGoVersion(s string) string](#asGoVersion)
    * [func checkExample(t *testing.T, example string) error](#checkExample)
    * [func checkFiles(t *testing.T, sizes Sizes, goVersion string, filenames []string, srcs [][]byte, manual bool)](#checkFiles)
    * [func eliminate(t *testing.T, errmap map[string][]string, errlist []error)](#eliminate)
    * [func errMap(t *testing.T, files []*ast.File, srcs [][]byte) map[string][]string](#errMap)
    * [func exprString(fset *token.FileSet, expr ast.Expr) string](#exprString)
    * [func findStructType(t *testing.T, src string) *types.Struct](#findStructType)
    * [func firstComment(filename string) string](#firstComment)
    * [func makePkg(src string) (*Package, error)](#makePkg)
    * [func mayTypecheck(t *testing.T, path, source string, info *Info) (string, error)](#mayTypecheck)
    * [func mode(tv types.TypeAndValue) string](#mode)
    * [func modeForSource(src string) parser.Mode](#modeForSource)
    * [func mustParse(t *testing.T, src string) *ast.File](#mustParse)
    * [func mustTypecheck(t *testing.T, path, source string, info *Info) string](#mustTypecheck)
    * [func newDefined(underlying Type) *Named](#newDefined)
    * [func parseFiles(t *testing.T, filenames []string, srcs [][]byte, mode parser.Mode) ([]*ast.File, []error)](#parseFiles)
    * [func pkgFilenames(dir string) ([]string, error)](#pkgFilenames)
    * [func pkgFiles(fset *token.FileSet, path string, mode parser.Mode) ([]*ast.File, error)](#pkgFiles)
    * [func pkgFor(path, source string, info *Info) (*Package, error)](#pkgFor)
    * [func predString(tv TypeAndValue) string](#predString)
    * [func program(n int, out string) []byte](#program)
    * [func readCode(err Error) int](#readCode)
    * [func runbench(b *testing.B, path string, ignoreFuncBodies, writeInfo bool)](#runbench)
    * [func sameSlice(a, b []int) bool](#sameSlice)
    * [func split(s, sep string) (string, string)](#split)
    * [func splitError(err error) (pos, msg string)](#splitError)
    * [func testBuiltinSignature(t *testing.T, name, src0, want string)](#testBuiltinSignature)
    * [func testDir(t *testing.T, dir string)](#testDir)
    * [func testEval(t *testing.T, fset *token.FileSet, pkg *Package, pos token.Pos, expr string, typ Type, typStr, valStr string)](#testEval)
    * [func testPkg(t *testing.T, filenames []string, goVersion string, manual bool)](#testPkg)
    * [func testTestDir(t *testing.T, path string, ignore ...string)](#testTestDir)
    * [func typecheck(t *testing.T, path string, filenames []string)](#typecheck)
    * [func walkCodes(t *testing.T, f func(string, int, *ast.ValueSpec))](#walkCodes)
    * [func walkPkgDirs(dir string, pkgh func(dir string, filenames []string), errh func(args ...interface{})) time.Duration](#walkPkgDirs)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="filename" href="#filename">const filename</a>

```
searchKey: types_test.filename
tags: [constant string private]
```

```Go
const filename = "<src>"
```

### <a id="genericPkg" href="#genericPkg">const genericPkg</a>

```
searchKey: types_test.genericPkg
tags: [constant string private]
```

```Go
const genericPkg = "package generic_"
```

genericPkg is a prefix for packages that should be type checked with generics. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="H" href="#H">var H</a>

```
searchKey: types_test.H
tags: [variable number private]
```

```Go
var H = flag.Int("H", 5, "Hilbert matrix size")
```

### <a id="builtinCalls" href="#builtinCalls">var builtinCalls</a>

```
searchKey: types_test.builtinCalls
tags: [variable array struct private]
```

```Go
var builtinCalls = ...
```

### <a id="dependentTestTypes" href="#dependentTestTypes">var dependentTestTypes</a>

```
searchKey: types_test.dependentTestTypes
tags: [variable array struct private]
```

```Go
var dependentTestTypes = ...
```

types that depend on other type declarations (src in TestTypes) 

### <a id="errRx" href="#errRx">var errRx</a>

```
searchKey: types_test.errRx
tags: [variable struct private]
```

```Go
var errRx = regexp.MustCompile(`^ *ERROR *(HERE)? *"?([^"]*)"?`)
```

ERROR comments must start with text `ERROR "rx"` or `ERROR rx` where rx is a regular expression that matches the expected error message. Space around "rx" or rx is ignored. Use the form `ERROR HERE "rx"` for error messages that are located immediately after rather than at a token's position. 

### <a id="excluded" href="#excluded">var excluded</a>

```
searchKey: types_test.excluded
tags: [variable object private]
```

```Go
var excluded = ...
```

Package paths of excluded packages. 

### <a id="fset" href="#fset">var fset</a>

```
searchKey: types_test.fset
tags: [variable struct private]
```

```Go
var fset = token.NewFileSet()
```

### <a id="goVersion" href="#goVersion">var goVersion</a>

```
searchKey: types_test.goVersion
tags: [variable string private]
```

```Go
var goVersion = flag.String("lang", "", "Go language version (e.g. \"go1.12\") for TestManual")
```

### <a id="goVersionRx" href="#goVersionRx">var goVersionRx</a>

```
searchKey: types_test.goVersionRx
tags: [variable struct private]
```

```Go
var goVersionRx = regexp.MustCompile(`^go[1-9][0-9]*_(0|[1-9][0-9]*)$`)
```

goVersionRx matches a Go version string using '_', e.g. "go1_12". 

### <a id="haltOnError" href="#haltOnError">var haltOnError</a>

```
searchKey: types_test.haltOnError
tags: [variable boolean private]
```

```Go
var haltOnError = flag.Bool("halt", false, "halt on error")
```

### <a id="independentTestTypes" href="#independentTestTypes">var independentTestTypes</a>

```
searchKey: types_test.independentTestTypes
tags: [variable array struct private]
```

```Go
var independentTestTypes = ...
```

types that don't depend on any other type declarations 

### <a id="out" href="#out">var out</a>

```
searchKey: types_test.out
tags: [variable string private]
```

```Go
var out = flag.String("out", "", "write generated program to out")
```

### <a id="posMsgRx" href="#posMsgRx">var posMsgRx</a>

```
searchKey: types_test.posMsgRx
tags: [variable struct private]
```

```Go
var posMsgRx = regexp.MustCompile(`^(.*:[0-9]+:[0-9]+): *(.*)`)
```

Positioned errors are of the form filename:line:column: message . 

### <a id="stdLibImporter" href="#stdLibImporter">var stdLibImporter</a>

```
searchKey: types_test.stdLibImporter
tags: [variable interface private]
```

```Go
var stdLibImporter = importer.Default()
```

Use the same importer for all std lib tests to avoid repeated importing of the same packages. 

### <a id="testExprs" href="#testExprs">var testExprs</a>

```
searchKey: types_test.testExprs
tags: [variable array struct private]
```

```Go
var testExprs = ...
```

### <a id="verifyErrors" href="#verifyErrors">var verifyErrors</a>

```
searchKey: types_test.verifyErrors
tags: [variable boolean private]
```

```Go
var verifyErrors = flag.Bool("verify", false, "verify errors (rather than list them) in TestManual")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="gen" href="#gen">type gen struct</a>

```
searchKey: types_test.gen
tags: [struct private]
```

```Go
type gen struct {
	bytes.Buffer
}
```

#### <a id="gen.binomials" href="#gen.binomials">func (g *gen) binomials(n int)</a>

```
searchKey: types_test.gen.binomials
tags: [method private]
```

```Go
func (g *gen) binomials(n int)
```

#### <a id="gen.factorials" href="#gen.factorials">func (g *gen) factorials(n int)</a>

```
searchKey: types_test.gen.factorials
tags: [method private]
```

```Go
func (g *gen) factorials(n int)
```

#### <a id="gen.hilbert" href="#gen.hilbert">func (g *gen) hilbert(n int)</a>

```
searchKey: types_test.gen.hilbert
tags: [method private]
```

```Go
func (g *gen) hilbert(n int)
```

#### <a id="gen.inverse" href="#gen.inverse">func (g *gen) inverse(n int)</a>

```
searchKey: types_test.gen.inverse
tags: [method private]
```

```Go
func (g *gen) inverse(n int)
```

#### <a id="gen.p" href="#gen.p">func (g *gen) p(format string, args ...interface{})</a>

```
searchKey: types_test.gen.p
tags: [method private]
```

```Go
func (g *gen) p(format string, args ...interface{})
```

#### <a id="gen.printProduct" href="#gen.printProduct">func (g *gen) printProduct(n int)</a>

```
searchKey: types_test.gen.printProduct
tags: [method private]
```

```Go
func (g *gen) printProduct(n int)
```

#### <a id="gen.product" href="#gen.product">func (g *gen) product(n int)</a>

```
searchKey: types_test.gen.product
tags: [method private]
```

```Go
func (g *gen) product(n int)
```

#### <a id="gen.verify" href="#gen.verify">func (g *gen) verify(n int)</a>

```
searchKey: types_test.gen.verify
tags: [method private]
```

```Go
func (g *gen) verify(n int)
```

### <a id="importHelper" href="#importHelper">type importHelper struct</a>

```
searchKey: types_test.importHelper
tags: [struct private]
```

```Go
type importHelper struct {
	pkg      *Package
	fallback Importer
}
```

#### <a id="importHelper.Import" href="#importHelper.Import">func (h importHelper) Import(path string) (*Package, error)</a>

```
searchKey: types_test.importHelper.Import
tags: [method private]
```

```Go
func (h importHelper) Import(path string) (*Package, error)
```

### <a id="resolveTestImporter" href="#resolveTestImporter">type resolveTestImporter struct</a>

```
searchKey: types_test.resolveTestImporter
tags: [struct private]
```

```Go
type resolveTestImporter struct {
	importer ImporterFrom
	imported map[string]bool
}
```

#### <a id="resolveTestImporter.Import" href="#resolveTestImporter.Import">func (imp *resolveTestImporter) Import(string) (*Package, error)</a>

```
searchKey: types_test.resolveTestImporter.Import
tags: [method private]
```

```Go
func (imp *resolveTestImporter) Import(string) (*Package, error)
```

#### <a id="resolveTestImporter.ImportFrom" href="#resolveTestImporter.ImportFrom">func (imp *resolveTestImporter) ImportFrom(path, srcDir string, mode ImportMode) (*Package, error)</a>

```
searchKey: types_test.resolveTestImporter.ImportFrom
tags: [method private]
```

```Go
func (imp *resolveTestImporter) ImportFrom(path, srcDir string, mode ImportMode) (*Package, error)
```

### <a id="testEntry" href="#testEntry">type testEntry struct</a>

```
searchKey: types_test.testEntry
tags: [struct private]
```

```Go
type testEntry struct {
	src, str string
}
```

#### <a id="dup" href="#dup">func dup(s string) testEntry</a>

```
searchKey: types_test.dup
tags: [function private]
```

```Go
func dup(s string) testEntry
```

dup returns a testEntry where both src and str are the same. 

### <a id="testImporter" href="#testImporter">type testImporter map[string]*types.Package</a>

```
searchKey: types_test.testImporter
tags: [object private]
```

```Go
type testImporter map[string]*Package
```

#### <a id="testImporter.Import" href="#testImporter.Import">func (m testImporter) Import(path string) (*Package, error)</a>

```
searchKey: types_test.testImporter.Import
tags: [method private]
```

```Go
func (m testImporter) Import(path string) (*Package, error)
```

### <a id="walker" href="#walker">type walker struct</a>

```
searchKey: types_test.walker
tags: [struct private]
```

```Go
type walker struct {
	start time.Time
	dmax  time.Duration
	pkgh  func(dir string, filenames []string)
	errh  func(args ...interface{})
}
```

#### <a id="walker.walk" href="#walker.walk">func (w *walker) walk(dir string)</a>

```
searchKey: types_test.walker.walk
tags: [method private]
```

```Go
func (w *walker) walk(dir string)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkCheck" href="#BenchmarkCheck">func BenchmarkCheck(b *testing.B)</a>

```
searchKey: types_test.BenchmarkCheck
tags: [function private benchmark]
```

```Go
func BenchmarkCheck(b *testing.B)
```

### <a id="ExampleInfo" href="#ExampleInfo">func ExampleInfo()</a>

```
searchKey: types_test.ExampleInfo
tags: [function private]
```

```Go
func ExampleInfo()
```

ExampleInfo prints various facts recorded by the type checker in a types.Info struct: definitions of and references to each named object, and the type, value, and mode of every expression in the package. 

### <a id="ExampleMethodSet" href="#ExampleMethodSet">func ExampleMethodSet()</a>

```
searchKey: types_test.ExampleMethodSet
tags: [function private]
```

```Go
func ExampleMethodSet()
```

ExampleMethodSet prints the method sets of various types. 

### <a id="ExampleScope" href="#ExampleScope">func ExampleScope()</a>

```
searchKey: types_test.ExampleScope
tags: [function private]
```

```Go
func ExampleScope()
```

ExampleScope prints the tree of Scopes of a package created from a set of parsed files. 

### <a id="TestAlignofNaclSlice" href="#TestAlignofNaclSlice">func TestAlignofNaclSlice(t *testing.T)</a>

```
searchKey: types_test.TestAlignofNaclSlice
tags: [function private test]
```

```Go
func TestAlignofNaclSlice(t *testing.T)
```

Issue 16464 

### <a id="TestAssignableTo" href="#TestAssignableTo">func TestAssignableTo(t *testing.T)</a>

```
searchKey: types_test.TestAssignableTo
tags: [function private test]
```

```Go
func TestAssignableTo(t *testing.T)
```

### <a id="TestBuiltinSignatures" href="#TestBuiltinSignatures">func TestBuiltinSignatures(t *testing.T)</a>

```
searchKey: types_test.TestBuiltinSignatures
tags: [function private test]
```

```Go
func TestBuiltinSignatures(t *testing.T)
```

### <a id="TestCheck" href="#TestCheck">func TestCheck(t *testing.T)</a>

```
searchKey: types_test.TestCheck
tags: [function private test]
```

```Go
func TestCheck(t *testing.T)
```

### <a id="TestCheckExpr" href="#TestCheckExpr">func TestCheckExpr(t *testing.T)</a>

```
searchKey: types_test.TestCheckExpr
tags: [function private test]
```

```Go
func TestCheckExpr(t *testing.T)
```

### <a id="TestCompositeLitTypes" href="#TestCompositeLitTypes">func TestCompositeLitTypes(t *testing.T)</a>

```
searchKey: types_test.TestCompositeLitTypes
tags: [function private test]
```

```Go
func TestCompositeLitTypes(t *testing.T)
```

TestCompositeLitTypes verifies that Info.Types registers the correct types for composite literal expressions and composite literal type expressions. 

### <a id="TestConvertibleTo" href="#TestConvertibleTo">func TestConvertibleTo(t *testing.T)</a>

```
searchKey: types_test.TestConvertibleTo
tags: [function private test]
```

```Go
func TestConvertibleTo(t *testing.T)
```

### <a id="TestDefsInfo" href="#TestDefsInfo">func TestDefsInfo(t *testing.T)</a>

```
searchKey: types_test.TestDefsInfo
tags: [function private test]
```

```Go
func TestDefsInfo(t *testing.T)
```

### <a id="TestErrorCodeExamples" href="#TestErrorCodeExamples">func TestErrorCodeExamples(t *testing.T)</a>

```
searchKey: types_test.TestErrorCodeExamples
tags: [function private test]
```

```Go
func TestErrorCodeExamples(t *testing.T)
```

### <a id="TestErrorCodeStyle" href="#TestErrorCodeStyle">func TestErrorCodeStyle(t *testing.T)</a>

```
searchKey: types_test.TestErrorCodeStyle
tags: [function private test]
```

```Go
func TestErrorCodeStyle(t *testing.T)
```

### <a id="TestEvalArith" href="#TestEvalArith">func TestEvalArith(t *testing.T)</a>

```
searchKey: types_test.TestEvalArith
tags: [function private test]
```

```Go
func TestEvalArith(t *testing.T)
```

### <a id="TestEvalBasic" href="#TestEvalBasic">func TestEvalBasic(t *testing.T)</a>

```
searchKey: types_test.TestEvalBasic
tags: [function private test]
```

```Go
func TestEvalBasic(t *testing.T)
```

### <a id="TestEvalComposite" href="#TestEvalComposite">func TestEvalComposite(t *testing.T)</a>

```
searchKey: types_test.TestEvalComposite
tags: [function private test]
```

```Go
func TestEvalComposite(t *testing.T)
```

### <a id="TestEvalPos" href="#TestEvalPos">func TestEvalPos(t *testing.T)</a>

```
searchKey: types_test.TestEvalPos
tags: [function private test]
```

```Go
func TestEvalPos(t *testing.T)
```

### <a id="TestExamples" href="#TestExamples">func TestExamples(t *testing.T)</a>

```
searchKey: types_test.TestExamples
tags: [function private test]
```

```Go
func TestExamples(t *testing.T)
```

### <a id="TestExprString" href="#TestExprString">func TestExprString(t *testing.T)</a>

```
searchKey: types_test.TestExprString
tags: [function private test]
```

```Go
func TestExprString(t *testing.T)
```

### <a id="TestFailedImport" href="#TestFailedImport">func TestFailedImport(t *testing.T)</a>

```
searchKey: types_test.TestFailedImport
tags: [function private test]
```

```Go
func TestFailedImport(t *testing.T)
```

TestFailedImport tests that we don't get follow-on errors elsewhere in a package due to failing to import a package. 

### <a id="TestFiles" href="#TestFiles">func TestFiles(t *testing.T)</a>

```
searchKey: types_test.TestFiles
tags: [function private test]
```

```Go
func TestFiles(t *testing.T)
```

### <a id="TestFixedbugs" href="#TestFixedbugs">func TestFixedbugs(t *testing.T)</a>

```
searchKey: types_test.TestFixedbugs
tags: [function private test]
```

```Go
func TestFixedbugs(t *testing.T)
```

### <a id="TestHilbert" href="#TestHilbert">func TestHilbert(t *testing.T)</a>

```
searchKey: types_test.TestHilbert
tags: [function private test]
```

```Go
func TestHilbert(t *testing.T)
```

### <a id="TestIdentical_issue15173" href="#TestIdentical_issue15173">func TestIdentical_issue15173(t *testing.T)</a>

```
searchKey: types_test.TestIdentical_issue15173
tags: [function private test]
```

```Go
func TestIdentical_issue15173(t *testing.T)
```

### <a id="TestImplicitsInfo" href="#TestImplicitsInfo">func TestImplicitsInfo(t *testing.T)</a>

```
searchKey: types_test.TestImplicitsInfo
tags: [function private test]
```

```Go
func TestImplicitsInfo(t *testing.T)
```

### <a id="TestIncompleteInterfaces" href="#TestIncompleteInterfaces">func TestIncompleteInterfaces(t *testing.T)</a>

```
searchKey: types_test.TestIncompleteInterfaces
tags: [function private test]
```

```Go
func TestIncompleteInterfaces(t *testing.T)
```

### <a id="TestIndexRepresentability" href="#TestIndexRepresentability">func TestIndexRepresentability(t *testing.T)</a>

```
searchKey: types_test.TestIndexRepresentability
tags: [function private test]
```

```Go
func TestIndexRepresentability(t *testing.T)
```

TestIndexRepresentability tests that constant index operands must be representable as int even if they already have a type that can represent larger values. 

### <a id="TestInitOrderInfo" href="#TestInitOrderInfo">func TestInitOrderInfo(t *testing.T)</a>

```
searchKey: types_test.TestInitOrderInfo
tags: [function private test]
```

```Go
func TestInitOrderInfo(t *testing.T)
```

### <a id="TestIssue13898" href="#TestIssue13898">func TestIssue13898(t *testing.T)</a>

```
searchKey: types_test.TestIssue13898
tags: [function private test]
```

```Go
func TestIssue13898(t *testing.T)
```

This tests that the package associated with the types.Object.Pkg method is the type's package independent of the order in which the imports are listed in the sources src1, src2 below. The actual issue is in go/internal/gcimporter which has a corresponding test; we leave this test here to verify correct behavior at the go/types level. 

### <a id="TestIssue15305" href="#TestIssue15305">func TestIssue15305(t *testing.T)</a>

```
searchKey: types_test.TestIssue15305
tags: [function private test]
```

```Go
func TestIssue15305(t *testing.T)
```

### <a id="TestIssue16902" href="#TestIssue16902">func TestIssue16902(t *testing.T)</a>

```
searchKey: types_test.TestIssue16902
tags: [function private test]
```

```Go
func TestIssue16902(t *testing.T)
```

### <a id="TestIssue22525" href="#TestIssue22525">func TestIssue22525(t *testing.T)</a>

```
searchKey: types_test.TestIssue22525
tags: [function private test]
```

```Go
func TestIssue22525(t *testing.T)
```

### <a id="TestIssue25627" href="#TestIssue25627">func TestIssue25627(t *testing.T)</a>

```
searchKey: types_test.TestIssue25627
tags: [function private test]
```

```Go
func TestIssue25627(t *testing.T)
```

### <a id="TestIssue28005" href="#TestIssue28005">func TestIssue28005(t *testing.T)</a>

```
searchKey: types_test.TestIssue28005
tags: [function private test]
```

```Go
func TestIssue28005(t *testing.T)
```

### <a id="TestIssue28282" href="#TestIssue28282">func TestIssue28282(t *testing.T)</a>

```
searchKey: types_test.TestIssue28282
tags: [function private test]
```

```Go
func TestIssue28282(t *testing.T)
```

### <a id="TestIssue29029" href="#TestIssue29029">func TestIssue29029(t *testing.T)</a>

```
searchKey: types_test.TestIssue29029
tags: [function private test]
```

```Go
func TestIssue29029(t *testing.T)
```

### <a id="TestIssue34151" href="#TestIssue34151">func TestIssue34151(t *testing.T)</a>

```
searchKey: types_test.TestIssue34151
tags: [function private test]
```

```Go
func TestIssue34151(t *testing.T)
```

### <a id="TestIssue34921" href="#TestIssue34921">func TestIssue34921(t *testing.T)</a>

```
searchKey: types_test.TestIssue34921
tags: [function private test]
```

```Go
func TestIssue34921(t *testing.T)
```

TestIssue34921 verifies that we don't update an imported type's underlying type when resolving an underlying type. Specifically, when determining the underlying type of b.T (which is the underlying type of a.T, which is int) we must not set the underlying type of a.T again since that would lead to a race condition if package b is imported elsewhere, in a package that is concurrently type-checked. 

### <a id="TestIssue43088" href="#TestIssue43088">func TestIssue43088(t *testing.T)</a>

```
searchKey: types_test.TestIssue43088
tags: [function private test]
```

```Go
func TestIssue43088(t *testing.T)
```

### <a id="TestIssue43124" href="#TestIssue43124">func TestIssue43124(t *testing.T)</a>

```
searchKey: types_test.TestIssue43124
tags: [function private test]
```

```Go
func TestIssue43124(t *testing.T)
```

### <a id="TestIssue44515" href="#TestIssue44515">func TestIssue44515(t *testing.T)</a>

```
searchKey: types_test.TestIssue44515
tags: [function private test]
```

```Go
func TestIssue44515(t *testing.T)
```

### <a id="TestIssue46453" href="#TestIssue46453">func TestIssue46453(t *testing.T)</a>

```
searchKey: types_test.TestIssue46453
tags: [function private test]
```

```Go
func TestIssue46453(t *testing.T)
```

### <a id="TestIssue5770" href="#TestIssue5770">func TestIssue5770(t *testing.T)</a>

```
searchKey: types_test.TestIssue5770
tags: [function private test]
```

```Go
func TestIssue5770(t *testing.T)
```

### <a id="TestIssue5849" href="#TestIssue5849">func TestIssue5849(t *testing.T)</a>

```
searchKey: types_test.TestIssue5849
tags: [function private test]
```

```Go
func TestIssue5849(t *testing.T)
```

### <a id="TestIssue6413" href="#TestIssue6413">func TestIssue6413(t *testing.T)</a>

```
searchKey: types_test.TestIssue6413
tags: [function private test]
```

```Go
func TestIssue6413(t *testing.T)
```

### <a id="TestIssue7245" href="#TestIssue7245">func TestIssue7245(t *testing.T)</a>

```
searchKey: types_test.TestIssue7245
tags: [function private test]
```

```Go
func TestIssue7245(t *testing.T)
```

### <a id="TestIssue7827" href="#TestIssue7827">func TestIssue7827(t *testing.T)</a>

```
searchKey: types_test.TestIssue7827
tags: [function private test]
```

```Go
func TestIssue7827(t *testing.T)
```

This tests that uses of existing vars on the LHS of an assignment are Uses, not Defs; and also that the (illegal) use of a non-var on the LHS of an assignment is a Use nonetheless. 

### <a id="TestIssue8518" href="#TestIssue8518">func TestIssue8518(t *testing.T)</a>

```
searchKey: types_test.TestIssue8518
tags: [function private test]
```

```Go
func TestIssue8518(t *testing.T)
```

### <a id="TestLongConstants" href="#TestLongConstants">func TestLongConstants(t *testing.T)</a>

```
searchKey: types_test.TestLongConstants
tags: [function private test]
```

```Go
func TestLongConstants(t *testing.T)
```

### <a id="TestLookupFieldOrMethod" href="#TestLookupFieldOrMethod">func TestLookupFieldOrMethod(t *testing.T)</a>

```
searchKey: types_test.TestLookupFieldOrMethod
tags: [function private test]
```

```Go
func TestLookupFieldOrMethod(t *testing.T)
```

### <a id="TestManual" href="#TestManual">func TestManual(t *testing.T)</a>

```
searchKey: types_test.TestManual
tags: [function private test]
```

```Go
func TestManual(t *testing.T)
```

TestManual is for manual testing of input files, provided as a list of arguments after the test arguments (and a separating "--"). For instance, to check the files foo.go and bar.go, use: 

```
go test -run Manual -- foo.go bar.go

```
Provide the -verify flag to verify errors against ERROR comments in the input files rather than having a list of errors reported. The accepted Go language version can be controlled with the -lang flag. 

### <a id="TestMultiFileInitOrder" href="#TestMultiFileInitOrder">func TestMultiFileInitOrder(t *testing.T)</a>

```
searchKey: types_test.TestMultiFileInitOrder
tags: [function private test]
```

```Go
func TestMultiFileInitOrder(t *testing.T)
```

### <a id="TestMultipleSizeUse" href="#TestMultipleSizeUse">func TestMultipleSizeUse(t *testing.T)</a>

```
searchKey: types_test.TestMultipleSizeUse
tags: [function private test]
```

```Go
func TestMultipleSizeUse(t *testing.T)
```

Issue 16316 

### <a id="TestNewMethodSet" href="#TestNewMethodSet">func TestNewMethodSet(t *testing.T)</a>

```
searchKey: types_test.TestNewMethodSet
tags: [function private test]
```

```Go
func TestNewMethodSet(t *testing.T)
```

### <a id="TestObjectParents" href="#TestObjectParents">func TestObjectParents(t *testing.T)</a>

```
searchKey: types_test.TestObjectParents
tags: [function private test]
```

```Go
func TestObjectParents(t *testing.T)
```

TestObjectParents verifies that objects have parent scopes or not as specified by the Object interface. 

### <a id="TestPredicatesInfo" href="#TestPredicatesInfo">func TestPredicatesInfo(t *testing.T)</a>

```
searchKey: types_test.TestPredicatesInfo
tags: [function private test]
```

```Go
func TestPredicatesInfo(t *testing.T)
```

### <a id="TestQualifiedTypeString" href="#TestQualifiedTypeString">func TestQualifiedTypeString(t *testing.T)</a>

```
searchKey: types_test.TestQualifiedTypeString
tags: [function private test]
```

```Go
func TestQualifiedTypeString(t *testing.T)
```

### <a id="TestResolveIdents" href="#TestResolveIdents">func TestResolveIdents(t *testing.T)</a>

```
searchKey: types_test.TestResolveIdents
tags: [function private test]
```

```Go
func TestResolveIdents(t *testing.T)
```

### <a id="TestScopeLookupParent" href="#TestScopeLookupParent">func TestScopeLookupParent(t *testing.T)</a>

```
searchKey: types_test.TestScopeLookupParent
tags: [function private test]
```

```Go
func TestScopeLookupParent(t *testing.T)
```

TestScopeLookupParent ensures that (*Scope).LookupParent returns the correct result at various positions with the source. 

### <a id="TestScopesInfo" href="#TestScopesInfo">func TestScopesInfo(t *testing.T)</a>

```
searchKey: types_test.TestScopesInfo
tags: [function private test]
```

```Go
func TestScopesInfo(t *testing.T)
```

### <a id="TestSelection" href="#TestSelection">func TestSelection(t *testing.T)</a>

```
searchKey: types_test.TestSelection
tags: [function private test]
```

```Go
func TestSelection(t *testing.T)
```

### <a id="TestSelf" href="#TestSelf">func TestSelf(t *testing.T)</a>

```
searchKey: types_test.TestSelf
tags: [function private test]
```

```Go
func TestSelf(t *testing.T)
```

### <a id="TestStdFixed" href="#TestStdFixed">func TestStdFixed(t *testing.T)</a>

```
searchKey: types_test.TestStdFixed
tags: [function private test]
```

```Go
func TestStdFixed(t *testing.T)
```

### <a id="TestStdKen" href="#TestStdKen">func TestStdKen(t *testing.T)</a>

```
searchKey: types_test.TestStdKen
tags: [function private test]
```

```Go
func TestStdKen(t *testing.T)
```

### <a id="TestStdTest" href="#TestStdTest">func TestStdTest(t *testing.T)</a>

```
searchKey: types_test.TestStdTest
tags: [function private test]
```

```Go
func TestStdTest(t *testing.T)
```

### <a id="TestStdlib" href="#TestStdlib">func TestStdlib(t *testing.T)</a>

```
searchKey: types_test.TestStdlib
tags: [function private test]
```

```Go
func TestStdlib(t *testing.T)
```

### <a id="TestTypeString" href="#TestTypeString">func TestTypeString(t *testing.T)</a>

```
searchKey: types_test.TestTypeString
tags: [function private test]
```

```Go
func TestTypeString(t *testing.T)
```

### <a id="TestTypesInfo" href="#TestTypesInfo">func TestTypesInfo(t *testing.T)</a>

```
searchKey: types_test.TestTypesInfo
tags: [function private test]
```

```Go
func TestTypesInfo(t *testing.T)
```

### <a id="TestUsesInfo" href="#TestUsesInfo">func TestUsesInfo(t *testing.T)</a>

```
searchKey: types_test.TestUsesInfo
tags: [function private test]
```

```Go
func TestUsesInfo(t *testing.T)
```

### <a id="TestValuesInfo" href="#TestValuesInfo">func TestValuesInfo(t *testing.T)</a>

```
searchKey: types_test.TestValuesInfo
tags: [function private test]
```

```Go
func TestValuesInfo(t *testing.T)
```

### <a id="asGoVersion" href="#asGoVersion">func asGoVersion(s string) string</a>

```
searchKey: types_test.asGoVersion
tags: [function private]
```

```Go
func asGoVersion(s string) string
```

asGoVersion returns a regular Go language version string if s is a Go version string using '_' rather than '.' to separate the major and minor version numbers (e.g. "go1_12"). Otherwise it returns the empty string. 

### <a id="checkExample" href="#checkExample">func checkExample(t *testing.T, example string) error</a>

```
searchKey: types_test.checkExample
tags: [function private]
```

```Go
func checkExample(t *testing.T, example string) error
```

### <a id="checkFiles" href="#checkFiles">func checkFiles(t *testing.T, sizes Sizes, goVersion string, filenames []string, srcs [][]byte, manual bool)</a>

```
searchKey: types_test.checkFiles
tags: [function private]
```

```Go
func checkFiles(t *testing.T, sizes Sizes, goVersion string, filenames []string, srcs [][]byte, manual bool)
```

### <a id="eliminate" href="#eliminate">func eliminate(t *testing.T, errmap map[string][]string, errlist []error)</a>

```
searchKey: types_test.eliminate
tags: [function private]
```

```Go
func eliminate(t *testing.T, errmap map[string][]string, errlist []error)
```

### <a id="errMap" href="#errMap">func errMap(t *testing.T, files []*ast.File, srcs [][]byte) map[string][]string</a>

```
searchKey: types_test.errMap
tags: [function private]
```

```Go
func errMap(t *testing.T, files []*ast.File, srcs [][]byte) map[string][]string
```

errMap collects the regular expressions of ERROR comments found in files and returns them as a map of error positions to error messages. 

srcs must be a slice of the same length as files, containing the original source for the parsed AST. 

### <a id="exprString" href="#exprString">func exprString(fset *token.FileSet, expr ast.Expr) string</a>

```
searchKey: types_test.exprString
tags: [function private]
```

```Go
func exprString(fset *token.FileSet, expr ast.Expr) string
```

### <a id="findStructType" href="#findStructType">func findStructType(t *testing.T, src string) *types.Struct</a>

```
searchKey: types_test.findStructType
tags: [function private]
```

```Go
func findStructType(t *testing.T, src string) *types.Struct
```

findStructType typechecks src and returns the first struct type encountered. 

### <a id="firstComment" href="#firstComment">func firstComment(filename string) string</a>

```
searchKey: types_test.firstComment
tags: [function private]
```

```Go
func firstComment(filename string) string
```

firstComment returns the contents of the first non-empty comment in the given file, "skip", or the empty string. No matter the present comments, if any of them contains a build tag, the result is always "skip". Only comments before the "package" token and within the first 4K of the file are considered. 

### <a id="makePkg" href="#makePkg">func makePkg(src string) (*Package, error)</a>

```
searchKey: types_test.makePkg
tags: [function private]
```

```Go
func makePkg(src string) (*Package, error)
```

### <a id="mayTypecheck" href="#mayTypecheck">func mayTypecheck(t *testing.T, path, source string, info *Info) (string, error)</a>

```
searchKey: types_test.mayTypecheck
tags: [function private]
```

```Go
func mayTypecheck(t *testing.T, path, source string, info *Info) (string, error)
```

### <a id="mode" href="#mode">func mode(tv types.TypeAndValue) string</a>

```
searchKey: types_test.mode
tags: [function private]
```

```Go
func mode(tv types.TypeAndValue) string
```

### <a id="modeForSource" href="#modeForSource">func modeForSource(src string) parser.Mode</a>

```
searchKey: types_test.modeForSource
tags: [function private]
```

```Go
func modeForSource(src string) parser.Mode
```

### <a id="mustParse" href="#mustParse">func mustParse(t *testing.T, src string) *ast.File</a>

```
searchKey: types_test.mustParse
tags: [function private]
```

```Go
func mustParse(t *testing.T, src string) *ast.File
```

### <a id="mustTypecheck" href="#mustTypecheck">func mustTypecheck(t *testing.T, path, source string, info *Info) string</a>

```
searchKey: types_test.mustTypecheck
tags: [function private]
```

```Go
func mustTypecheck(t *testing.T, path, source string, info *Info) string
```

### <a id="newDefined" href="#newDefined">func newDefined(underlying Type) *Named</a>

```
searchKey: types_test.newDefined
tags: [function private]
```

```Go
func newDefined(underlying Type) *Named
```

newDefined creates a new defined type named T with the given underlying type. Helper function for use with TestIncompleteInterfaces only. 

### <a id="parseFiles" href="#parseFiles">func parseFiles(t *testing.T, filenames []string, srcs [][]byte, mode parser.Mode) ([]*ast.File, []error)</a>

```
searchKey: types_test.parseFiles
tags: [function private]
```

```Go
func parseFiles(t *testing.T, filenames []string, srcs [][]byte, mode parser.Mode) ([]*ast.File, []error)
```

### <a id="pkgFilenames" href="#pkgFilenames">func pkgFilenames(dir string) ([]string, error)</a>

```
searchKey: types_test.pkgFilenames
tags: [function private]
```

```Go
func pkgFilenames(dir string) ([]string, error)
```

pkgFilenames returns the list of package filenames for the given directory. 

### <a id="pkgFiles" href="#pkgFiles">func pkgFiles(fset *token.FileSet, path string, mode parser.Mode) ([]*ast.File, error)</a>

```
searchKey: types_test.pkgFiles
tags: [function private]
```

```Go
func pkgFiles(fset *token.FileSet, path string, mode parser.Mode) ([]*ast.File, error)
```

### <a id="pkgFor" href="#pkgFor">func pkgFor(path, source string, info *Info) (*Package, error)</a>

```
searchKey: types_test.pkgFor
tags: [function private]
```

```Go
func pkgFor(path, source string, info *Info) (*Package, error)
```

pkgFor parses and type checks the package specified by path and source, populating info if provided. 

If source begins with "package generic_" and type parameters are enabled, generic code is permitted. 

### <a id="predString" href="#predString">func predString(tv TypeAndValue) string</a>

```
searchKey: types_test.predString
tags: [function private]
```

```Go
func predString(tv TypeAndValue) string
```

### <a id="program" href="#program">func program(n int, out string) []byte</a>

```
searchKey: types_test.program
tags: [function private]
```

```Go
func program(n int, out string) []byte
```

### <a id="readCode" href="#readCode">func readCode(err Error) int</a>

```
searchKey: types_test.readCode
tags: [function private]
```

```Go
func readCode(err Error) int
```

### <a id="runbench" href="#runbench">func runbench(b *testing.B, path string, ignoreFuncBodies, writeInfo bool)</a>

```
searchKey: types_test.runbench
tags: [function private]
```

```Go
func runbench(b *testing.B, path string, ignoreFuncBodies, writeInfo bool)
```

### <a id="sameSlice" href="#sameSlice">func sameSlice(a, b []int) bool</a>

```
searchKey: types_test.sameSlice
tags: [function private]
```

```Go
func sameSlice(a, b []int) bool
```

### <a id="split" href="#split">func split(s, sep string) (string, string)</a>

```
searchKey: types_test.split
tags: [function private]
```

```Go
func split(s, sep string) (string, string)
```

split splits string s at the first occurrence of s. 

### <a id="splitError" href="#splitError">func splitError(err error) (pos, msg string)</a>

```
searchKey: types_test.splitError
tags: [function private]
```

```Go
func splitError(err error) (pos, msg string)
```

splitError splits an error's error message into a position string and the actual error message. If there's no position information, pos is the empty string, and msg is the entire error message. 

### <a id="testBuiltinSignature" href="#testBuiltinSignature">func testBuiltinSignature(t *testing.T, name, src0, want string)</a>

```
searchKey: types_test.testBuiltinSignature
tags: [function private]
```

```Go
func testBuiltinSignature(t *testing.T, name, src0, want string)
```

### <a id="testDir" href="#testDir">func testDir(t *testing.T, dir string)</a>

```
searchKey: types_test.testDir
tags: [function private]
```

```Go
func testDir(t *testing.T, dir string)
```

### <a id="testEval" href="#testEval">func testEval(t *testing.T, fset *token.FileSet, pkg *Package, pos token.Pos, expr string, typ Type, typStr, valStr string)</a>

```
searchKey: types_test.testEval
tags: [function private]
```

```Go
func testEval(t *testing.T, fset *token.FileSet, pkg *Package, pos token.Pos, expr string, typ Type, typStr, valStr string)
```

### <a id="testPkg" href="#testPkg">func testPkg(t *testing.T, filenames []string, goVersion string, manual bool)</a>

```
searchKey: types_test.testPkg
tags: [function private]
```

```Go
func testPkg(t *testing.T, filenames []string, goVersion string, manual bool)
```

TODO(rFindley) reconcile the different test setup in go/types with types2. 

### <a id="testTestDir" href="#testTestDir">func testTestDir(t *testing.T, path string, ignore ...string)</a>

```
searchKey: types_test.testTestDir
tags: [function private]
```

```Go
func testTestDir(t *testing.T, path string, ignore ...string)
```

### <a id="typecheck" href="#typecheck">func typecheck(t *testing.T, path string, filenames []string)</a>

```
searchKey: types_test.typecheck
tags: [function private]
```

```Go
func typecheck(t *testing.T, path string, filenames []string)
```

typecheck typechecks the given package files. 

### <a id="walkCodes" href="#walkCodes">func walkCodes(t *testing.T, f func(string, int, *ast.ValueSpec))</a>

```
searchKey: types_test.walkCodes
tags: [function private]
```

```Go
func walkCodes(t *testing.T, f func(string, int, *ast.ValueSpec))
```

### <a id="walkPkgDirs" href="#walkPkgDirs">func walkPkgDirs(dir string, pkgh func(dir string, filenames []string), errh func(args ...interface{})) time.Duration</a>

```
searchKey: types_test.walkPkgDirs
tags: [function private]
```

```Go
func walkPkgDirs(dir string, pkgh func(dir string, filenames []string), errh func(args ...interface{})) time.Duration
```

