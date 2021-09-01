# Package gosrc

## Index

* [Variables](#var)
    * [var RuntimeVersion](#RuntimeVersion)
    * [var errNoMatch](#errNoMatch)
    * [var gopkgSrcTemplate](#gopkgSrcTemplate)
    * [var stdlibInternalPackagePrefixes](#stdlibInternalPackagePrefixes)
    * [var stdlibPackagePaths](#stdlibPackagePaths)
* [Types](#type)
    * [type Directory struct](#Directory)
        * [func ResolveImportPath(client httpcli.Doer, importPath string) (*Directory, error)](#ResolveImportPath)
        * [func resolveDynamicImportPath(client httpcli.Doer, importPath string) (*Directory, error)](#resolveDynamicImportPath)
        * [func resolveStaticImportPath(importPath string) (*Directory, error)](#resolveStaticImportPath)
    * [type importMeta struct](#importMeta)
        * [func fetchMeta(client httpcli.Doer, importPath string) (scheme string, im *importMeta, sm *sourceMeta, err error)](#fetchMeta)
        * [func parseMeta(scheme, importPath string, r io.Reader) (im *importMeta, sm *sourceMeta, err error)](#parseMeta)
    * [type sourceMeta struct](#sourceMeta)
    * [type testTransport map[string]string](#testTransport)
        * [func (t testTransport) RoundTrip(req *http.Request) (*http.Response, error)](#testTransport.RoundTrip)
* [Functions](#func)
    * [func IsStdlibPkg(importPath string) bool](#IsStdlibPkg)
    * [func TestResolveImportPath(t *testing.T)](#TestResolveImportPath)
    * [func attrValue(attrs []xml.Attr, name string) string](#attrValue)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="RuntimeVersion" href="#RuntimeVersion">var RuntimeVersion</a>

```
searchKey: gosrc.RuntimeVersion
tags: [variable string]
```

```Go
var RuntimeVersion = runtime.Version()
```

RuntimeVersion is the version of go stdlib to use. We allow it to be different to runtime.Version for test data. 

### <a id="errNoMatch" href="#errNoMatch">var errNoMatch</a>

```
searchKey: gosrc.errNoMatch
tags: [variable interface private]
```

```Go
var errNoMatch = errors.New("no match")
```

### <a id="gopkgSrcTemplate" href="#gopkgSrcTemplate">var gopkgSrcTemplate</a>

```
searchKey: gosrc.gopkgSrcTemplate
tags: [variable struct private]
```

```Go
var gopkgSrcTemplate = lazyregexp.New(`https://(github.com/[^/]*/[^/]*)/tree/([^/]*)\{/dir\}`)
```

gopkgSrcTemplate matches the go-source dir templates specified by the popular gopkg.in 

### <a id="stdlibInternalPackagePrefixes" href="#stdlibInternalPackagePrefixes">var stdlibInternalPackagePrefixes</a>

```
searchKey: gosrc.stdlibInternalPackagePrefixes
tags: [variable array string private]
```

```Go
var stdlibInternalPackagePrefixes = ...
```

find path/to/golang/source -name internal | awk -F '/' '{ print "\"" $2 "/\"," }' | sort | uniq | grep -v vendor 

### <a id="stdlibPackagePaths" href="#stdlibPackagePaths">var stdlibPackagePaths</a>

```
searchKey: gosrc.stdlibPackagePaths
tags: [variable object private]
```

```Go
var stdlibPackagePaths = ...
```

go list std | awk '{ print "\"" $1 "\": struct{}{}," }' 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Directory" href="#Directory">type Directory struct</a>

```
searchKey: gosrc.Directory
tags: [struct]
```

```Go
type Directory struct {
	ImportPath  string // the Go import path for this package
	ProjectRoot string // import path prefix for all packages in the project
	CloneURL    string // the VCS clone URL
	RepoPrefix  string // the path to this directory inside the repo, if set
	VCS         string // one of "git", "hg", "svn", etc.
	Rev         string // the VCS revision specifier, if any
}
```

#### <a id="ResolveImportPath" href="#ResolveImportPath">func ResolveImportPath(client httpcli.Doer, importPath string) (*Directory, error)</a>

```
searchKey: gosrc.ResolveImportPath
tags: [function]
```

```Go
func ResolveImportPath(client httpcli.Doer, importPath string) (*Directory, error)
```

#### <a id="resolveDynamicImportPath" href="#resolveDynamicImportPath">func resolveDynamicImportPath(client httpcli.Doer, importPath string) (*Directory, error)</a>

```
searchKey: gosrc.resolveDynamicImportPath
tags: [function private]
```

```Go
func resolveDynamicImportPath(client httpcli.Doer, importPath string) (*Directory, error)
```

#### <a id="resolveStaticImportPath" href="#resolveStaticImportPath">func resolveStaticImportPath(importPath string) (*Directory, error)</a>

```
searchKey: gosrc.resolveStaticImportPath
tags: [function private]
```

```Go
func resolveStaticImportPath(importPath string) (*Directory, error)
```

### <a id="importMeta" href="#importMeta">type importMeta struct</a>

```
searchKey: gosrc.importMeta
tags: [struct private]
```

```Go
type importMeta struct {
	prefix string // the import path corresponding to the repository root
	vcs    string // one of "git", "hg", "svn", etc.
	repo   string // root of the VCS repo containing a scheme and not containing a .vcs qualifier
}
```

importMeta represents the values in a go-import meta tag. 

See [https://golang.org/cmd/go/#hdr-Remote_import_paths](https://golang.org/cmd/go/#hdr-Remote_import_paths). 

#### <a id="fetchMeta" href="#fetchMeta">func fetchMeta(client httpcli.Doer, importPath string) (scheme string, im *importMeta, sm *sourceMeta, err error)</a>

```
searchKey: gosrc.fetchMeta
tags: [function private]
```

```Go
func fetchMeta(client httpcli.Doer, importPath string) (scheme string, im *importMeta, sm *sourceMeta, err error)
```

#### <a id="parseMeta" href="#parseMeta">func parseMeta(scheme, importPath string, r io.Reader) (im *importMeta, sm *sourceMeta, err error)</a>

```
searchKey: gosrc.parseMeta
tags: [function private]
```

```Go
func parseMeta(scheme, importPath string, r io.Reader) (im *importMeta, sm *sourceMeta, err error)
```

### <a id="sourceMeta" href="#sourceMeta">type sourceMeta struct</a>

```
searchKey: gosrc.sourceMeta
tags: [struct private]
```

```Go
type sourceMeta struct {
	prefix       string
	projectURL   string
	dirTemplate  string
	fileTemplate string
}
```

sourceMeta represents the values in a go-source meta tag. 

### <a id="testTransport" href="#testTransport">type testTransport map[string]string</a>

```
searchKey: gosrc.testTransport
tags: [object private]
```

```Go
type testTransport map[string]string
```

#### <a id="testTransport.RoundTrip" href="#testTransport.RoundTrip">func (t testTransport) RoundTrip(req *http.Request) (*http.Response, error)</a>

```
searchKey: gosrc.testTransport.RoundTrip
tags: [method private]
```

```Go
func (t testTransport) RoundTrip(req *http.Request) (*http.Response, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="IsStdlibPkg" href="#IsStdlibPkg">func IsStdlibPkg(importPath string) bool</a>

```
searchKey: gosrc.IsStdlibPkg
tags: [function]
```

```Go
func IsStdlibPkg(importPath string) bool
```

IsStdlibPkg returns true if the package path is part of the stdlib. This uses a static copy of the output of "go list std", so may be out of date as new versions of Go are released. 

### <a id="TestResolveImportPath" href="#TestResolveImportPath">func TestResolveImportPath(t *testing.T)</a>

```
searchKey: gosrc.TestResolveImportPath
tags: [function private test]
```

```Go
func TestResolveImportPath(t *testing.T)
```

### <a id="attrValue" href="#attrValue">func attrValue(attrs []xml.Attr, name string) string</a>

```
searchKey: gosrc.attrValue
tags: [function private]
```

```Go
func attrValue(attrs []xml.Attr, name string) string
```

