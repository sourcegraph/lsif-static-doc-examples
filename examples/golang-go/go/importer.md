# Package importer

Package importer provides access to export data importers. 

## Index

* [Types](#type)
    * [type Lookup func(path string) (io.ReadCloser, error)](#Lookup)
    * [type gccgoimports struct](#gccgoimports)
        * [func (m *gccgoimports) Import(path string) (*types.Package, error)](#gccgoimports.Import)
        * [func (m *gccgoimports) ImportFrom(path, srcDir string, mode types.ImportMode) (*types.Package, error)](#gccgoimports.ImportFrom)
    * [type gcimports struct](#gcimports)
        * [func (m *gcimports) Import(path string) (*types.Package, error)](#gcimports.Import)
        * [func (m *gcimports) ImportFrom(path, srcDir string, mode types.ImportMode) (*types.Package, error)](#gcimports.ImportFrom)
* [Functions](#func)
    * [func Default() types.Importer](#Default)
    * [func For(compiler string, lookup Lookup) types.Importer](#For)
    * [func ForCompiler(fset *token.FileSet, compiler string, lookup Lookup) types.Importer](#ForCompiler)
    * [func TestForCompiler(t *testing.T)](#TestForCompiler)


## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Lookup" href="#Lookup">type Lookup func(path string) (io.ReadCloser, error)</a>

```
searchKey: importer.Lookup
tags: [function]
```

```Go
type Lookup func(path string) (io.ReadCloser, error)
```

A Lookup function returns a reader to access package data for a given import path, or an error if no matching package is found. 

### <a id="gccgoimports" href="#gccgoimports">type gccgoimports struct</a>

```
searchKey: importer.gccgoimports
tags: [struct private]
```

```Go
type gccgoimports struct {
	packages map[string]*types.Package
	importer gccgoimporter.Importer
	lookup   Lookup
}
```

#### <a id="gccgoimports.Import" href="#gccgoimports.Import">func (m *gccgoimports) Import(path string) (*types.Package, error)</a>

```
searchKey: importer.gccgoimports.Import
tags: [method private]
```

```Go
func (m *gccgoimports) Import(path string) (*types.Package, error)
```

#### <a id="gccgoimports.ImportFrom" href="#gccgoimports.ImportFrom">func (m *gccgoimports) ImportFrom(path, srcDir string, mode types.ImportMode) (*types.Package, error)</a>

```
searchKey: importer.gccgoimports.ImportFrom
tags: [method private]
```

```Go
func (m *gccgoimports) ImportFrom(path, srcDir string, mode types.ImportMode) (*types.Package, error)
```

### <a id="gcimports" href="#gcimports">type gcimports struct</a>

```
searchKey: importer.gcimports
tags: [struct private]
```

```Go
type gcimports struct {
	fset     *token.FileSet
	packages map[string]*types.Package
	lookup   Lookup
}
```

#### <a id="gcimports.Import" href="#gcimports.Import">func (m *gcimports) Import(path string) (*types.Package, error)</a>

```
searchKey: importer.gcimports.Import
tags: [method private]
```

```Go
func (m *gcimports) Import(path string) (*types.Package, error)
```

#### <a id="gcimports.ImportFrom" href="#gcimports.ImportFrom">func (m *gcimports) ImportFrom(path, srcDir string, mode types.ImportMode) (*types.Package, error)</a>

```
searchKey: importer.gcimports.ImportFrom
tags: [method private]
```

```Go
func (m *gcimports) ImportFrom(path, srcDir string, mode types.ImportMode) (*types.Package, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="Default" href="#Default">func Default() types.Importer</a>

```
searchKey: importer.Default
tags: [function]
```

```Go
func Default() types.Importer
```

Default returns an Importer for the compiler that built the running binary. If available, the result implements types.ImporterFrom. 

### <a id="For" href="#For">func For(compiler string, lookup Lookup) types.Importer</a>

```
searchKey: importer.For
tags: [method deprecated]
```

```Go
func For(compiler string, lookup Lookup) types.Importer
```

For calls ForCompiler with a new FileSet. 

Deprecated: Use ForCompiler, which populates a FileSet with the positions of objects created by the importer. 

### <a id="ForCompiler" href="#ForCompiler">func ForCompiler(fset *token.FileSet, compiler string, lookup Lookup) types.Importer</a>

```
searchKey: importer.ForCompiler
tags: [method deprecated]
```

```Go
func ForCompiler(fset *token.FileSet, compiler string, lookup Lookup) types.Importer
```

ForCompiler returns an Importer for importing from installed packages for the compilers "gc" and "gccgo", or for importing directly from the source if the compiler argument is "source". In this latter case, importing may fail under circumstances where the exported API is not entirely defined in pure Go source code (if the package API depends on cgo-defined entities, the type checker won't have access to those). 

The lookup function is called each time the resulting importer needs to resolve an import path. In this mode the importer can only be invoked with canonical import paths (not relative or absolute ones); it is assumed that the translation to canonical import paths is being done by the client of the importer. 

A lookup function must be provided for correct module-aware operation. Deprecated: If lookup is nil, for backwards-compatibility, the importer will attempt to resolve imports in the $GOPATH workspace. 

### <a id="TestForCompiler" href="#TestForCompiler">func TestForCompiler(t *testing.T)</a>

```
searchKey: importer.TestForCompiler
tags: [method private test]
```

```Go
func TestForCompiler(t *testing.T)
```

