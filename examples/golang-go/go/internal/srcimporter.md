# Package srcimporter

Package srcimporter implements importing directly from source files rather than installed packages. 

## Index

* [Constants](#const)
    * [const maxTime](#maxTime)
* [Variables](#var)
    * [var importing](#importing)
    * [var importer](#importer)
    * [var importedObjectTests](#importedObjectTests)
* [Types](#type)
    * [type Importer struct](#Importer)
        * [func New(ctxt *build.Context, fset *token.FileSet, packages map[string]*types.Package) *Importer](#New)
        * [func (p *Importer) Import(path string) (*types.Package, error)](#Importer.Import)
        * [func (p *Importer) ImportFrom(path, srcDir string, mode types.ImportMode) (*types.Package, error)](#Importer.ImportFrom)
        * [func (p *Importer) parseFiles(dir string, filenames []string) ([]*ast.File, error)](#Importer.parseFiles)
        * [func (p *Importer) cgo(bp *build.Package) (*ast.File, error)](#Importer.cgo)
        * [func (p *Importer) absPath(path string) (string, error)](#Importer.absPath)
        * [func (p *Importer) isAbsPath(path string) bool](#Importer.isAbsPath)
        * [func (p *Importer) joinPath(elem ...string) string](#Importer.joinPath)
* [Functions](#func)
    * [func setUsesCgo(conf *types.Config)](#setUsesCgo)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func doImport(t *testing.T, path, srcDir string)](#doImport)
    * [func walkDir(t *testing.T, path string, endTime time.Time) (int, bool)](#walkDir)
    * [func TestImportStdLib(t *testing.T)](#TestImportStdLib)
    * [func TestImportedTypes(t *testing.T)](#TestImportedTypes)
    * [func verifyInterfaceMethodRecvs(t *testing.T, named *types.Named, level int)](#verifyInterfaceMethodRecvs)
    * [func TestReimport(t *testing.T)](#TestReimport)
    * [func TestIssue20855(t *testing.T)](#TestIssue20855)
    * [func testImportPath(t *testing.T, pkgPath string)](#testImportPath)
    * [func TestIssue23092(t *testing.T)](#TestIssue23092)
    * [func TestIssue24392(t *testing.T)](#TestIssue24392)
    * [func TestCgo(t *testing.T)](#TestCgo)


## <a id="const" href="#const">Constants</a>

### <a id="maxTime" href="#maxTime">const maxTime</a>

```
searchKey: srcimporter.maxTime
```

```Go
const maxTime = 2 * time.Second
```

## <a id="var" href="#var">Variables</a>

### <a id="importing" href="#importing">var importing</a>

```
searchKey: srcimporter.importing
```

```Go
var importing types.Package
```

Importing is a sentinel taking the place in Importer.packages for a package that is in the process of being imported. 

### <a id="importer" href="#importer">var importer</a>

```
searchKey: srcimporter.importer
```

```Go
var importer = New(&build.Default, token.NewFileSet(), make(map[string]*types.Package))
```

### <a id="importedObjectTests" href="#importedObjectTests">var importedObjectTests</a>

```
searchKey: srcimporter.importedObjectTests
```

```Go
var importedObjectTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Importer" href="#Importer">type Importer struct</a>

```
searchKey: srcimporter.Importer
tags: [exported]
```

```Go
type Importer struct {
	ctxt     *build.Context
	fset     *token.FileSet
	sizes    types.Sizes
	packages map[string]*types.Package
}
```

An Importer provides the context for importing packages from source code. 

#### <a id="New" href="#New">func New(ctxt *build.Context, fset *token.FileSet, packages map[string]*types.Package) *Importer</a>

```
searchKey: srcimporter.New
tags: [exported]
```

```Go
func New(ctxt *build.Context, fset *token.FileSet, packages map[string]*types.Package) *Importer
```

New returns a new Importer for the given context, file set, and map of packages. The context is used to resolve import paths to package paths, and identifying the files belonging to the package. If the context provides non-nil file system functions, they are used instead of the regular package os functions. The file set is used to track position information of package files; and imported packages are added to the packages map. 

#### <a id="Importer.Import" href="#Importer.Import">func (p *Importer) Import(path string) (*types.Package, error)</a>

```
searchKey: srcimporter.Importer.Import
tags: [exported]
```

```Go
func (p *Importer) Import(path string) (*types.Package, error)
```

Import(path) is a shortcut for ImportFrom(path, ".", 0). 

#### <a id="Importer.ImportFrom" href="#Importer.ImportFrom">func (p *Importer) ImportFrom(path, srcDir string, mode types.ImportMode) (*types.Package, error)</a>

```
searchKey: srcimporter.Importer.ImportFrom
tags: [exported]
```

```Go
func (p *Importer) ImportFrom(path, srcDir string, mode types.ImportMode) (*types.Package, error)
```

ImportFrom imports the package with the given import path resolved from the given srcDir, adds the new package to the set of packages maintained by the importer, and returns the package. Package path resolution and file system operations are controlled by the context maintained with the importer. The import mode must be zero but is otherwise ignored. Packages that are not comprised entirely of pure Go files may fail to import because the type checker may not be able to determine all exported entities (e.g. due to cgo dependencies). 

#### <a id="Importer.parseFiles" href="#Importer.parseFiles">func (p *Importer) parseFiles(dir string, filenames []string) ([]*ast.File, error)</a>

```
searchKey: srcimporter.Importer.parseFiles
```

```Go
func (p *Importer) parseFiles(dir string, filenames []string) ([]*ast.File, error)
```

#### <a id="Importer.cgo" href="#Importer.cgo">func (p *Importer) cgo(bp *build.Package) (*ast.File, error)</a>

```
searchKey: srcimporter.Importer.cgo
```

```Go
func (p *Importer) cgo(bp *build.Package) (*ast.File, error)
```

#### <a id="Importer.absPath" href="#Importer.absPath">func (p *Importer) absPath(path string) (string, error)</a>

```
searchKey: srcimporter.Importer.absPath
```

```Go
func (p *Importer) absPath(path string) (string, error)
```

#### <a id="Importer.isAbsPath" href="#Importer.isAbsPath">func (p *Importer) isAbsPath(path string) bool</a>

```
searchKey: srcimporter.Importer.isAbsPath
```

```Go
func (p *Importer) isAbsPath(path string) bool
```

#### <a id="Importer.joinPath" href="#Importer.joinPath">func (p *Importer) joinPath(elem ...string) string</a>

```
searchKey: srcimporter.Importer.joinPath
```

```Go
func (p *Importer) joinPath(elem ...string) string
```

## <a id="func" href="#func">Functions</a>

### <a id="setUsesCgo" href="#setUsesCgo">func setUsesCgo(conf *types.Config)</a>

```
searchKey: srcimporter.setUsesCgo
```

```Go
func setUsesCgo(conf *types.Config)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: srcimporter.TestMain
```

```Go
func TestMain(m *testing.M)
```

### <a id="doImport" href="#doImport">func doImport(t *testing.T, path, srcDir string)</a>

```
searchKey: srcimporter.doImport
```

```Go
func doImport(t *testing.T, path, srcDir string)
```

### <a id="walkDir" href="#walkDir">func walkDir(t *testing.T, path string, endTime time.Time) (int, bool)</a>

```
searchKey: srcimporter.walkDir
```

```Go
func walkDir(t *testing.T, path string, endTime time.Time) (int, bool)
```

walkDir imports the all the packages with the given path prefix recursively. It returns the number of packages imported and whether importing was aborted because time has passed endTime. 

### <a id="TestImportStdLib" href="#TestImportStdLib">func TestImportStdLib(t *testing.T)</a>

```
searchKey: srcimporter.TestImportStdLib
```

```Go
func TestImportStdLib(t *testing.T)
```

### <a id="TestImportedTypes" href="#TestImportedTypes">func TestImportedTypes(t *testing.T)</a>

```
searchKey: srcimporter.TestImportedTypes
```

```Go
func TestImportedTypes(t *testing.T)
```

### <a id="verifyInterfaceMethodRecvs" href="#verifyInterfaceMethodRecvs">func verifyInterfaceMethodRecvs(t *testing.T, named *types.Named, level int)</a>

```
searchKey: srcimporter.verifyInterfaceMethodRecvs
```

```Go
func verifyInterfaceMethodRecvs(t *testing.T, named *types.Named, level int)
```

verifyInterfaceMethodRecvs verifies that method receiver types are named if the methods belong to a named interface type. 

### <a id="TestReimport" href="#TestReimport">func TestReimport(t *testing.T)</a>

```
searchKey: srcimporter.TestReimport
```

```Go
func TestReimport(t *testing.T)
```

### <a id="TestIssue20855" href="#TestIssue20855">func TestIssue20855(t *testing.T)</a>

```
searchKey: srcimporter.TestIssue20855
```

```Go
func TestIssue20855(t *testing.T)
```

### <a id="testImportPath" href="#testImportPath">func testImportPath(t *testing.T, pkgPath string)</a>

```
searchKey: srcimporter.testImportPath
```

```Go
func testImportPath(t *testing.T, pkgPath string)
```

### <a id="TestIssue23092" href="#TestIssue23092">func TestIssue23092(t *testing.T)</a>

```
searchKey: srcimporter.TestIssue23092
```

```Go
func TestIssue23092(t *testing.T)
```

TestIssue23092 tests relative imports. 

### <a id="TestIssue24392" href="#TestIssue24392">func TestIssue24392(t *testing.T)</a>

```
searchKey: srcimporter.TestIssue24392
```

```Go
func TestIssue24392(t *testing.T)
```

TestIssue24392 tests imports against a path containing 'testdata'. 

### <a id="TestCgo" href="#TestCgo">func TestCgo(t *testing.T)</a>

```
searchKey: srcimporter.TestCgo
```

```Go
func TestCgo(t *testing.T)
```

