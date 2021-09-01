# Package build

Package build gathers information about Go packages. 

### hdr-Go_PathGo Path
The Go path is a list of directory trees containing Go source code. It is consulted to resolve imports that cannot be found in the standard Go tree. The default path is the value of the GOPATH environment variable, interpreted as a path list appropriate to the operating system (on Unix, the variable is a colon-separated string; on Windows, a semicolon-separated string; on Plan 9, a list). 

Each directory listed in the Go path must have a prescribed structure: 

The src/ directory holds source code. The path below 'src' determines the import path or executable name. 

The pkg/ directory holds installed package objects. As in the Go tree, each target operating system and architecture pair has its own subdirectory of pkg (pkg/GOOS_GOARCH). 

If DIR is a directory listed in the Go path, a package with source in DIR/src/foo/bar can be imported as "foo/bar" and has its compiled form installed to "DIR/pkg/GOOS_GOARCH/foo/bar.a" (or, for gccgo, "DIR/pkg/gccgo/foo/libbar.a"). 

The bin/ directory holds compiled commands. Each command is named for its source directory, but only using the final element, not the entire path. That is, the command with source in DIR/src/foo/quux is installed into DIR/bin/quux, not DIR/bin/foo/quux. The foo/ is stripped so that you can add DIR/bin to your PATH to get at the installed commands. 

Here's an example directory layout: 

```
GOPATH=/home/user/gocode

/home/user/gocode/
    src/
        foo/
            bar/               (go code in package bar)
                x.go
            quux/              (go code in package main)
                y.go
    bin/
        quux                   (installed command)
    pkg/
        linux_amd64/
            foo/
                bar.a          (installed package object)

```
### hdr-Build_ConstraintsBuild Constraints
A build constraint, also known as a build tag, is a line comment that begins 

```
//go:build

```
that lists the conditions under which a file should be included in the package. Build constraints may also be part of a file's name (for example, source_windows.go will only be included if the target operating system is windows). 

See 'go help buildconstraint' ([https://golang.org/cmd/go/#hdr-Build_constraints](https://golang.org/cmd/go/#hdr-Build_constraints)) for details. 

### hdr-Binary_Only_PackagesBinary-Only Packages
In Go 1.12 and earlier, it was possible to distribute packages in binary form without including the source code used for compiling the package. The package was distributed with a source file not excluded by build constraints and containing a "//go:binary-only-package" comment. Like a build constraint, this comment appeared at the top of a file, preceded only by blank lines and other line comments and with a blank line following the comment, to separate it from the package documentation. Unlike build constraints, this comment is only recognized in non-test Go source files. 

The minimal source code for a binary-only package was therefore: 

```
//go:binary-only-package

package mypkg

```
The source code could include additional Go code. That code was never compiled but would be processed by tools like godoc and might be useful as end-user documentation. 

"go build" and other commands no longer support binary-only-packages. Import and ImportDir will still set the BinaryOnly flag in packages containing these comments for use in tools and error messages. 

## Index

* Subpages
  * [go/build/constraint](build/constraint.md)
* [Constants](#const)
    * [const AllowBinary](#AllowBinary)
    * [const FindOnly](#FindOnly)
    * [const IgnoreVendor](#IgnoreVendor)
    * [const ImportComment](#ImportComment)
    * [const goarchList](#goarchList)
    * [const goosList](#goosList)
    * [const quote](#quote)
    * [const safeString](#safeString)
* [Variables](#var)
    * [var Default](#Default)
    * [var ToolDir](#ToolDir)
    * [var bPlusBuild](#bPlusBuild)
    * [var bSlashSlash](#bSlashSlash)
    * [var bSlashStar](#bSlashStar)
    * [var bStarSlash](#bStarSlash)
    * [var binaryOnlyComment](#binaryOnlyComment)
    * [var bom](#bom)
    * [var buildIgnore](#buildIgnore)
    * [var ctxtAndroid](#ctxtAndroid)
    * [var ctxtP9](#ctxtP9)
    * [var defaultReleaseTags](#defaultReleaseTags)
    * [var defaultToolTags](#defaultToolTags)
    * [var depsRules](#depsRules)
    * [var dummyPkg](#dummyPkg)
    * [var errGoBuildWithoutBuild](#errGoBuildWithoutBuild)
    * [var errMultipleGoBuild](#errMultipleGoBuild)
    * [var errNUL](#errNUL)
    * [var errNoModules](#errNoModules)
    * [var errSyntax](#errSyntax)
    * [var expandSrcDirPath](#expandSrcDirPath)
    * [var expandSrcDirTests](#expandSrcDirTests)
    * [var goBuildComment](#goBuildComment)
    * [var goEmbed](#goEmbed)
    * [var knownArch](#knownArch)
    * [var knownOS](#knownOS)
    * [var matchFileTests](#matchFileTests)
    * [var newline](#newline)
    * [var otherArch](#otherArch)
    * [var otherOS](#otherOS)
    * [var readCommentsTests](#readCommentsTests)
    * [var readEmbedTests](#readEmbedTests)
    * [var readFailuresTests](#readFailuresTests)
    * [var readGoInfoTests](#readGoInfoTests)
    * [var shouldBuildTests](#shouldBuildTests)
    * [var slashSlash](#slashSlash)
    * [var slashStar](#slashStar)
    * [var starSlash](#starSlash)
    * [var tests](#tests)
    * [var thisArch](#thisArch)
    * [var thisOS](#thisOS)
* [Types](#type)
    * [type Context struct](#Context)
        * [func defaultContext() Context](#defaultContext)
        * [func (ctxt *Context) Import(path string, srcDir string, mode ImportMode) (*Package, error)](#Context.Import)
        * [func (ctxt *Context) ImportDir(dir string, mode ImportMode) (*Package, error)](#Context.ImportDir)
        * [func (ctxt *Context) MatchFile(dir, name string) (match bool, err error)](#Context.MatchFile)
        * [func (ctxt *Context) SrcDirs() []string](#Context.SrcDirs)
        * [func (ctxt *Context) eval(x constraint.Expr, allTags map[string]bool) bool](#Context.eval)
        * [func (ctxt *Context) goodOSArchFile(name string, allTags map[string]bool) bool](#Context.goodOSArchFile)
        * [func (ctxt *Context) gopath() []string](#Context.gopath)
        * [func (ctxt *Context) hasSubdir(root, dir string) (rel string, ok bool)](#Context.hasSubdir)
        * [func (ctxt *Context) importGo(p *Package, path, srcDir string, mode ImportMode) error](#Context.importGo)
        * [func (ctxt *Context) isAbsPath(path string) bool](#Context.isAbsPath)
        * [func (ctxt *Context) isDir(path string) bool](#Context.isDir)
        * [func (ctxt *Context) isFile(path string) bool](#Context.isFile)
        * [func (ctxt *Context) joinPath(elem ...string) string](#Context.joinPath)
        * [func (ctxt *Context) makePathsAbsolute(args []string, srcDir string)](#Context.makePathsAbsolute)
        * [func (ctxt *Context) matchAuto(text string, allTags map[string]bool) bool](#Context.matchAuto)
        * [func (ctxt *Context) matchFile(dir, name string, allTags map[string]bool, binaryOnly *bool, fset *token.FileSet) (*fileInfo, error)](#Context.matchFile)
        * [func (ctxt *Context) matchTag(name string, allTags map[string]bool) bool](#Context.matchTag)
        * [func (ctxt *Context) openFile(path string) (io.ReadCloser, error)](#Context.openFile)
        * [func (ctxt *Context) readDir(path string) ([]fs.FileInfo, error)](#Context.readDir)
        * [func (ctxt *Context) saveCgo(filename string, di *Package, cg *ast.CommentGroup) error](#Context.saveCgo)
        * [func (ctxt *Context) shouldBuild(content []byte, allTags map[string]bool) (shouldBuild, binaryOnly bool, err error)](#Context.shouldBuild)
        * [func (ctxt *Context) splitPathList(s string) []string](#Context.splitPathList)
    * [type GoodFileTest struct](#GoodFileTest)
    * [type ImportMode uint](#ImportMode)
    * [type MultiplePackageError struct](#MultiplePackageError)
        * [func (e *MultiplePackageError) Error() string](#MultiplePackageError.Error)
    * [type NoGoError struct](#NoGoError)
        * [func (e *NoGoError) Error() string](#NoGoError.Error)
    * [type Package struct](#Package)
        * [func Import(path, srcDir string, mode ImportMode) (*Package, error)](#Import)
        * [func ImportDir(dir string, mode ImportMode) (*Package, error)](#ImportDir)
        * [func (p *Package) IsCommand() bool](#Package.IsCommand)
    * [type depsParser struct](#depsParser)
        * [func (p *depsParser) nextList() (list []string, token string)](#depsParser.nextList)
        * [func (p *depsParser) nextToken() string](#depsParser.nextToken)
        * [func (p *depsParser) syntaxError(msg string)](#depsParser.syntaxError)
    * [type fileEmbed struct](#fileEmbed)
    * [type fileImport struct](#fileImport)
    * [type fileInfo struct](#fileInfo)
    * [type importReader struct](#importReader)
        * [func newImportReader(name string, r io.Reader) *importReader](#newImportReader)
        * [func (r *importReader) findEmbed(first bool) bool](#importReader.findEmbed)
        * [func (r *importReader) nextByte(skipSpace bool) byte](#importReader.nextByte)
        * [func (r *importReader) peekByte(skipSpace bool) byte](#importReader.peekByte)
        * [func (r *importReader) readByte() byte](#importReader.readByte)
        * [func (r *importReader) readByteNoBuf() byte](#importReader.readByteNoBuf)
        * [func (r *importReader) readIdent()](#importReader.readIdent)
        * [func (r *importReader) readImport()](#importReader.readImport)
        * [func (r *importReader) readKeyword(kw string)](#importReader.readKeyword)
        * [func (r *importReader) readString()](#importReader.readString)
        * [func (r *importReader) syntaxError()](#importReader.syntaxError)
    * [type readNopCloser struct](#readNopCloser)
        * [func (r readNopCloser) Close() error](#readNopCloser.Close)
    * [type readTest struct](#readTest)
* [Functions](#func)
    * [func ArchChar(goarch string) (string, error)](#ArchChar)
    * [func IsLocalImport(path string) bool](#IsLocalImport)
    * [func TestCgoImportsIgnored(t *testing.T)](#TestCgoImportsIgnored)
    * [func TestDependencies(t *testing.T)](#TestDependencies)
    * [func TestDotSlashImport(t *testing.T)](#TestDotSlashImport)
    * [func TestEmptyFolderImport(t *testing.T)](#TestEmptyFolderImport)
    * [func TestEmptyImport(t *testing.T)](#TestEmptyImport)
    * [func TestExpandSrcDir(t *testing.T)](#TestExpandSrcDir)
    * [func TestFindImports(t *testing.T)](#TestFindImports)
    * [func TestGoodOSArch(t *testing.T)](#TestGoodOSArch)
    * [func TestGoodOSArchFile(t *testing.T)](#TestGoodOSArchFile)
    * [func TestImportCmd(t *testing.T)](#TestImportCmd)
    * [func TestImportDirNotExist(t *testing.T)](#TestImportDirNotExist)
    * [func TestImportDirTarget(t *testing.T)](#TestImportDirTarget)
    * [func TestImportPackageOutsideModule(t *testing.T)](#TestImportPackageOutsideModule)
    * [func TestImportVendor(t *testing.T)](#TestImportVendor)
    * [func TestImportVendorFailure(t *testing.T)](#TestImportVendorFailure)
    * [func TestImportVendorParentFailure(t *testing.T)](#TestImportVendorParentFailure)
    * [func TestIssue23594(t *testing.T)](#TestIssue23594)
    * [func TestLocalDirectory(t *testing.T)](#TestLocalDirectory)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestMatch(t *testing.T)](#TestMatch)
    * [func TestMatchFile(t *testing.T)](#TestMatchFile)
    * [func TestMissingImportErrorRepetition(t *testing.T)](#TestMissingImportErrorRepetition)
    * [func TestMultiplePackageImport(t *testing.T)](#TestMultiplePackageImport)
    * [func TestReadComments(t *testing.T)](#TestReadComments)
    * [func TestReadEmbed(t *testing.T)](#TestReadEmbed)
    * [func TestReadFailuresIgnored(t *testing.T)](#TestReadFailuresIgnored)
    * [func TestReadGoInfo(t *testing.T)](#TestReadGoInfo)
    * [func TestShellSafety(t *testing.T)](#TestShellSafety)
    * [func TestShouldBuild(t *testing.T)](#TestShouldBuild)
    * [func TestStdlibLowercase(t *testing.T)](#TestStdlibLowercase)
    * [func anotherArch() string](#anotherArch)
    * [func anotherOS() string](#anotherOS)
    * [func cleanDecls(m map[string][]token.Position) ([]string, map[string][]token.Position)](#cleanDecls)
    * [func defaultGOPATH() string](#defaultGOPATH)
    * [func depsPolicy(t *testing.T) map[string]map[string]bool](#depsPolicy)
    * [func envOr(name, def string) string](#envOr)
    * [func equal(x, y []string) bool](#equal)
    * [func expandSrcDir(str string, srcdir string) (string, bool)](#expandSrcDir)
    * [func fileListForExt(p *Package, ext string) *[]string](#fileListForExt)
    * [func findImportComment(data []byte) (s string, line int)](#findImportComment)
    * [func findImports(pkg string) ([]string, error)](#findImports)
    * [func getToolDir() string](#getToolDir)
    * [func hasGoFiles(ctxt *Context, dir string) bool](#hasGoFiles)
    * [func hasSubdir(root, dir string) (rel string, ok bool)](#hasSubdir)
    * [func init()](#init.build.go)
    * [func isGoBuildComment(line []byte) bool](#isGoBuildComment)
    * [func isIdent(c byte) bool](#isIdent)
    * [func listStdPkgs(goroot string) ([]string, error)](#listStdPkgs)
    * [func nameExt(name string) string](#nameExt)
    * [func parseDepsRules(t *testing.T, save func(deps []string, op string, users []string))](#parseDepsRules)
    * [func parseFileHeader(content []byte) (trimmed, goBuild []byte, sawBinaryOnly bool, err error)](#parseFileHeader)
    * [func parseGoEmbed(args string, pos token.Position) ([]fileEmbed, error)](#parseGoEmbed)
    * [func parseWord(data []byte) (word, rest []byte)](#parseWord)
    * [func readComments(f io.Reader) ([]byte, error)](#readComments)
    * [func readGoInfo(f io.Reader, info *fileInfo) error](#readGoInfo)
    * [func safeCgoName(s string) bool](#safeCgoName)
    * [func skipSpaceOrComment(data []byte) []byte](#skipSpaceOrComment)
    * [func splitQuoted(s string) (r []string, err error)](#splitQuoted)
    * [func testRead(t *testing.T, tests []readTest, read func(io.Reader) ([]byte, error))](#testRead)
    * [func uniq(list []string) []string](#uniq)


## <a id="const" href="#const">Constants</a>

### <a id="AllowBinary" href="#AllowBinary">const AllowBinary</a>

```
searchKey: build.AllowBinary
tags: [constant number deprecated]
```

```Go
const AllowBinary
```

If AllowBinary is set, Import can be satisfied by a compiled package object without corresponding sources. 

Deprecated: The supported way to create a compiled-only package is to write source code containing a //go:binary-only-package comment at the top of the file. Such a package will be recognized regardless of this flag setting (because it has source code) and will have BinaryOnly set to true in the returned Package. 

### <a id="FindOnly" href="#FindOnly">const FindOnly</a>

```
searchKey: build.FindOnly
tags: [constant number]
```

```Go
const FindOnly ImportMode = 1 << iota
```

If FindOnly is set, Import stops after locating the directory that should contain the sources for a package. It does not read any files in the directory. 

### <a id="IgnoreVendor" href="#IgnoreVendor">const IgnoreVendor</a>

```
searchKey: build.IgnoreVendor
tags: [constant number]
```

```Go
const IgnoreVendor
```

By default, Import searches vendor directories that apply in the given source directory before searching the GOROOT and GOPATH roots. If an Import finds and returns a package using a vendor directory, the resulting ImportPath is the complete path to the package, including the path elements leading up to and including "vendor". For example, if Import("y", "x/subdir", 0) finds "x/vendor/y", the returned package's ImportPath is "x/vendor/y", not plain "y". See golang.org/s/go15vendor for more information. 

Setting IgnoreVendor ignores vendor directories. 

In contrast to the package's ImportPath, the returned package's Imports, TestImports, and XTestImports are always the exact import paths from the source files: Import makes no attempt to resolve or check those paths. 

### <a id="ImportComment" href="#ImportComment">const ImportComment</a>

```
searchKey: build.ImportComment
tags: [constant number]
```

```Go
const ImportComment
```

If ImportComment is set, parse import comments on package statements. Import returns an error if it finds a comment it cannot understand or finds conflicting comments in multiple source files. See golang.org/s/go14customimport for more information. 

### <a id="goarchList" href="#goarchList">const goarchList</a>

```
searchKey: build.goarchList
tags: [constant string private]
```

```Go
const goarchList = ...
```

### <a id="goosList" href="#goosList">const goosList</a>

```
searchKey: build.goosList
tags: [constant string private]
```

```Go
const goosList = ...
```

### <a id="quote" href="#quote">const quote</a>

```
searchKey: build.quote
tags: [constant string private]
```

```Go
const quote = "`"
```

### <a id="safeString" href="#safeString">const safeString</a>

```
searchKey: build.safeString
tags: [constant string private]
```

```Go
const safeString = "+-.,/0123456789=ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz:$@%! ~^"
```

NOTE: $ is not safe for the shell, but it is allowed here because of linker options like -Wl,$ORIGIN. We never pass these arguments to a shell (just to programs we construct argv for), so this should be okay. See golang.org/issue/6038. The @ is for OS X. See golang.org/issue/13720. The % is for Jenkins. See golang.org/issue/16959. The ! is because module paths may use them. See golang.org/issue/26716. The ~ and ^ are for sr.ht. See golang.org/issue/32260. 

## <a id="var" href="#var">Variables</a>

### <a id="Default" href="#Default">var Default</a>

```
searchKey: build.Default
tags: [variable struct]
```

```Go
var Default Context = defaultContext()
```

Default is the default Context for builds. It uses the GOARCH, GOOS, GOROOT, and GOPATH environment variables if set, or else the compiled code's GOARCH, GOOS, and GOROOT. 

### <a id="ToolDir" href="#ToolDir">var ToolDir</a>

```
searchKey: build.ToolDir
tags: [variable string]
```

```Go
var ToolDir = getToolDir()
```

ToolDir is the directory containing build tools. 

### <a id="bPlusBuild" href="#bPlusBuild">var bPlusBuild</a>

```
searchKey: build.bPlusBuild
tags: [variable array number private]
```

```Go
var bPlusBuild = []byte("+build")
```

### <a id="bSlashSlash" href="#bSlashSlash">var bSlashSlash</a>

```
searchKey: build.bSlashSlash
tags: [variable array number private]
```

```Go
var bSlashSlash = []byte(slashSlash)
```

### <a id="bSlashStar" href="#bSlashStar">var bSlashStar</a>

```
searchKey: build.bSlashStar
tags: [variable array number private]
```

```Go
var bSlashStar = []byte(slashStar)
```

### <a id="bStarSlash" href="#bStarSlash">var bStarSlash</a>

```
searchKey: build.bStarSlash
tags: [variable array number private]
```

```Go
var bStarSlash = []byte(starSlash)
```

### <a id="binaryOnlyComment" href="#binaryOnlyComment">var binaryOnlyComment</a>

```
searchKey: build.binaryOnlyComment
tags: [variable array number private]
```

```Go
var binaryOnlyComment = []byte("//go:binary-only-package")
```

Special comment denoting a binary-only package. See [https://golang.org/design/2775-binary-only-packages](https://golang.org/design/2775-binary-only-packages) for more about the design of binary-only packages. 

### <a id="bom" href="#bom">var bom</a>

```
searchKey: build.bom
tags: [variable array number private]
```

```Go
var bom = []byte{0xef, 0xbb, 0xbf}
```

### <a id="buildIgnore" href="#buildIgnore">var buildIgnore</a>

```
searchKey: build.buildIgnore
tags: [variable array number private]
```

```Go
var buildIgnore = []byte("\n// +build ignore")
```

### <a id="ctxtAndroid" href="#ctxtAndroid">var ctxtAndroid</a>

```
searchKey: build.ctxtAndroid
tags: [variable struct private]
```

```Go
var ctxtAndroid = Context{GOARCH: "arm", GOOS: "android"}
```

### <a id="ctxtP9" href="#ctxtP9">var ctxtP9</a>

```
searchKey: build.ctxtP9
tags: [variable struct private]
```

```Go
var ctxtP9 = Context{GOARCH: "arm", GOOS: "plan9"}
```

### <a id="defaultReleaseTags" href="#defaultReleaseTags">var defaultReleaseTags</a>

```
searchKey: build.defaultReleaseTags
tags: [variable array string private]
```

```Go
var defaultToolTags, defaultReleaseTags []string
```

### <a id="defaultToolTags" href="#defaultToolTags">var defaultToolTags</a>

```
searchKey: build.defaultToolTags
tags: [variable array string private]
```

```Go
var defaultToolTags, defaultReleaseTags []string
```

### <a id="depsRules" href="#depsRules">var depsRules</a>

```
searchKey: build.depsRules
tags: [variable string private]
```

```Go
var depsRules = ...
```

depsRules defines the expected dependencies between packages in the Go source tree. It is a statement of policy. 

DO NOT CHANGE THIS DATA TO FIX BUILDS. Existing packages should not have their constraints relaxed without prior discussion. Negative assertions should almost never be removed. 

The general syntax of a rule is: 

```
a, b < c, d;

```
which means c and d come after a and b in the partial order (that is, c and d can import a and b), but doesn't provide a relative order between a vs b or c vs d. 

The rules can chain together, as in: 

```
e < f, g < h;

```
which is equivalent to 

```
e < f, g;
f, g < h;

```
Except for the special bottom element "NONE", each name must appear exactly once on the right-hand side of a rule. That rule serves as the definition of the allowed dependencies for that name. The definition must appear before any uses of the name on the left-hand side of a rule. (That is, the rules themselves must be ordered according to the partial order, for easier reading by people.) 

Negative assertions double-check the partial order: 

```
i !< j

```
means that it must NOT be the case that i < j. Negative assertions may appear anywhere in the rules, even before i and j have been defined. 

Comments begin with #. 

All-caps names are pseudo-names for specific points in the dependency lattice. 

### <a id="dummyPkg" href="#dummyPkg">var dummyPkg</a>

```
searchKey: build.dummyPkg
tags: [variable struct private]
```

```Go
var dummyPkg Package
```

### <a id="errGoBuildWithoutBuild" href="#errGoBuildWithoutBuild">var errGoBuildWithoutBuild</a>

```
searchKey: build.errGoBuildWithoutBuild
tags: [variable interface private]
```

```Go
var errGoBuildWithoutBuild = errors.New("//go:build comment without // +build comment")
```

### <a id="errMultipleGoBuild" href="#errMultipleGoBuild">var errMultipleGoBuild</a>

```
searchKey: build.errMultipleGoBuild
tags: [variable interface private]
```

```Go
var errMultipleGoBuild = errors.New("multiple //go:build comments")
```

### <a id="errNUL" href="#errNUL">var errNUL</a>

```
searchKey: build.errNUL
tags: [variable interface private]
```

```Go
var errNUL = errors.New("unexpected NUL in input")
```

### <a id="errNoModules" href="#errNoModules">var errNoModules</a>

```
searchKey: build.errNoModules
tags: [variable interface private]
```

```Go
var errNoModules = errors.New("not using modules")
```

### <a id="errSyntax" href="#errSyntax">var errSyntax</a>

```
searchKey: build.errSyntax
tags: [variable interface private]
```

```Go
var errSyntax = errors.New("syntax error")
```

### <a id="expandSrcDirPath" href="#expandSrcDirPath">var expandSrcDirPath</a>

```
searchKey: build.expandSrcDirPath
tags: [variable string private]
```

```Go
var expandSrcDirPath = filepath.Join(string(filepath.Separator)+"projects", "src", "add")
```

### <a id="expandSrcDirTests" href="#expandSrcDirTests">var expandSrcDirTests</a>

```
searchKey: build.expandSrcDirTests
tags: [variable array struct private]
```

```Go
var expandSrcDirTests = ...
```

### <a id="goBuildComment" href="#goBuildComment">var goBuildComment</a>

```
searchKey: build.goBuildComment
tags: [variable array number private]
```

```Go
var goBuildComment = []byte("//go:build")
```

### <a id="goEmbed" href="#goEmbed">var goEmbed</a>

```
searchKey: build.goEmbed
tags: [variable array number private]
```

```Go
var goEmbed = []byte("go:embed")
```

### <a id="knownArch" href="#knownArch">var knownArch</a>

```
searchKey: build.knownArch
tags: [variable object private]
```

```Go
var knownArch = make(map[string]bool)
```

### <a id="knownOS" href="#knownOS">var knownOS</a>

```
searchKey: build.knownOS
tags: [variable object private]
```

```Go
var knownOS = make(map[string]bool)
```

### <a id="matchFileTests" href="#matchFileTests">var matchFileTests</a>

```
searchKey: build.matchFileTests
tags: [variable array struct private]
```

```Go
var matchFileTests = ...
```

### <a id="newline" href="#newline">var newline</a>

```
searchKey: build.newline
tags: [variable array number private]
```

```Go
var newline = []byte("\n")
```

### <a id="otherArch" href="#otherArch">var otherArch</a>

```
searchKey: build.otherArch
tags: [variable string private]
```

```Go
var otherArch = anotherArch()
```

### <a id="otherOS" href="#otherOS">var otherOS</a>

```
searchKey: build.otherOS
tags: [variable string private]
```

```Go
var otherOS = anotherOS()
```

### <a id="readCommentsTests" href="#readCommentsTests">var readCommentsTests</a>

```
searchKey: build.readCommentsTests
tags: [variable array struct private]
```

```Go
var readCommentsTests = ...
```

### <a id="readEmbedTests" href="#readEmbedTests">var readEmbedTests</a>

```
searchKey: build.readEmbedTests
tags: [variable array struct private]
```

```Go
var readEmbedTests = ...
```

### <a id="readFailuresTests" href="#readFailuresTests">var readFailuresTests</a>

```
searchKey: build.readFailuresTests
tags: [variable array struct private]
```

```Go
var readFailuresTests = ...
```

### <a id="readGoInfoTests" href="#readGoInfoTests">var readGoInfoTests</a>

```
searchKey: build.readGoInfoTests
tags: [variable array struct private]
```

```Go
var readGoInfoTests = ...
```

### <a id="shouldBuildTests" href="#shouldBuildTests">var shouldBuildTests</a>

```
searchKey: build.shouldBuildTests
tags: [variable array struct private]
```

```Go
var shouldBuildTests = ...
```

### <a id="slashSlash" href="#slashSlash">var slashSlash</a>

```
searchKey: build.slashSlash
tags: [variable array number private]
```

```Go
var slashSlash = []byte("//")
```

### <a id="slashStar" href="#slashStar">var slashStar</a>

```
searchKey: build.slashStar
tags: [variable array number private]
```

```Go
var slashStar = []byte("/*")
```

### <a id="starSlash" href="#starSlash">var starSlash</a>

```
searchKey: build.starSlash
tags: [variable array number private]
```

```Go
var starSlash = []byte("*/")
```

### <a id="tests" href="#tests">var tests</a>

```
searchKey: build.tests
tags: [variable array struct private]
```

```Go
var tests = ...
```

### <a id="thisArch" href="#thisArch">var thisArch</a>

```
searchKey: build.thisArch
tags: [variable string private]
```

```Go
var thisArch = runtime.GOARCH
```

### <a id="thisOS" href="#thisOS">var thisOS</a>

```
searchKey: build.thisOS
tags: [variable string private]
```

```Go
var thisOS = runtime.GOOS
```

## <a id="type" href="#type">Types</a>

### <a id="Context" href="#Context">type Context struct</a>

```
searchKey: build.Context
tags: [struct]
```

```Go
type Context struct {
	GOARCH string // target architecture
	GOOS   string // target operating system
	GOROOT string // Go root
	GOPATH string // Go path

	// Dir is the caller's working directory, or the empty string to use
	// the current directory of the running process. In module mode, this is used
	// to locate the main module.
	//
	// If Dir is non-empty, directories passed to Import and ImportDir must
	// be absolute.
	Dir string

	CgoEnabled  bool   // whether cgo files are included
	UseAllFiles bool   // use files regardless of +build lines, file names
	Compiler    string // compiler to assume when computing target paths

	// The build, tool, and release tags specify build constraints
	// that should be considered satisfied when processing +build lines.
	// Clients creating a new context may customize BuildTags, which
	// defaults to empty, but it is usually an error to customize ToolTags or ReleaseTags.
	// ToolTags defaults to build tags appropriate to the current Go toolchain configuration.
	// ReleaseTags defaults to the list of Go releases the current release is compatible with.
	// BuildTags is not set for the Default build Context.
	// In addition to the BuildTags, ToolTags, and ReleaseTags, build constraints
	// consider the values of GOARCH and GOOS as satisfied tags.
	// The last element in ReleaseTags is assumed to be the current release.
	BuildTags   []string
	ToolTags    []string
	ReleaseTags []string

	// The install suffix specifies a suffix to use in the name of the installation
	// directory. By default it is empty, but custom builds that need to keep
	// their outputs separate can set InstallSuffix to do so. For example, when
	// using the race detector, the go command uses InstallSuffix = "race", so
	// that on a Linux/386 system, packages are written to a directory named
	// "linux_386_race" instead of the usual "linux_386".
	InstallSuffix string

	// JoinPath joins the sequence of path fragments into a single path.
	// If JoinPath is nil, Import uses filepath.Join.
	JoinPath func(elem ...string) string

	// SplitPathList splits the path list into a slice of individual paths.
	// If SplitPathList is nil, Import uses filepath.SplitList.
	SplitPathList func(list string) []string

	// IsAbsPath reports whether path is an absolute path.
	// If IsAbsPath is nil, Import uses filepath.IsAbs.
	IsAbsPath func(path string) bool

	// IsDir reports whether the path names a directory.
	// If IsDir is nil, Import calls os.Stat and uses the result's IsDir method.
	IsDir func(path string) bool

	// HasSubdir reports whether dir is lexically a subdirectory of
	// root, perhaps multiple levels below. It does not try to check
	// whether dir exists.
	// If so, HasSubdir sets rel to a slash-separated path that
	// can be joined to root to produce a path equivalent to dir.
	// If HasSubdir is nil, Import uses an implementation built on
	// filepath.EvalSymlinks.
	HasSubdir func(root, dir string) (rel string, ok bool)

	// ReadDir returns a slice of fs.FileInfo, sorted by Name,
	// describing the content of the named directory.
	// If ReadDir is nil, Import uses ioutil.ReadDir.
	ReadDir func(dir string) ([]fs.FileInfo, error)

	// OpenFile opens a file (not a directory) for reading.
	// If OpenFile is nil, Import uses os.Open.
	OpenFile func(path string) (io.ReadCloser, error)
}
```

A Context specifies the supporting context for a build. 

#### <a id="defaultContext" href="#defaultContext">func defaultContext() Context</a>

```
searchKey: build.defaultContext
tags: [function private]
```

```Go
func defaultContext() Context
```

#### <a id="Context.Import" href="#Context.Import">func (ctxt *Context) Import(path string, srcDir string, mode ImportMode) (*Package, error)</a>

```
searchKey: build.Context.Import
tags: [method]
```

```Go
func (ctxt *Context) Import(path string, srcDir string, mode ImportMode) (*Package, error)
```

Import returns details about the Go package named by the import path, interpreting local import paths relative to the srcDir directory. If the path is a local import path naming a package that can be imported using a standard import path, the returned package will set p.ImportPath to that path. 

In the directory containing the package, .go, .c, .h, and .s files are considered part of the package except for: 

```
- .go files in package documentation
- files starting with _ or . (likely editor temporary files)
- files with build constraints not satisfied by the context

```
If an error occurs, Import returns a non-nil error and a non-nil *Package containing partial information. 

#### <a id="Context.ImportDir" href="#Context.ImportDir">func (ctxt *Context) ImportDir(dir string, mode ImportMode) (*Package, error)</a>

```
searchKey: build.Context.ImportDir
tags: [method]
```

```Go
func (ctxt *Context) ImportDir(dir string, mode ImportMode) (*Package, error)
```

ImportDir is like Import but processes the Go package found in the named directory. 

#### <a id="Context.MatchFile" href="#Context.MatchFile">func (ctxt *Context) MatchFile(dir, name string) (match bool, err error)</a>

```
searchKey: build.Context.MatchFile
tags: [method]
```

```Go
func (ctxt *Context) MatchFile(dir, name string) (match bool, err error)
```

MatchFile reports whether the file with the given name in the given directory matches the context and would be included in a Package created by ImportDir of that directory. 

MatchFile considers the name of the file and may use ctxt.OpenFile to read some or all of the file's content. 

#### <a id="Context.SrcDirs" href="#Context.SrcDirs">func (ctxt *Context) SrcDirs() []string</a>

```
searchKey: build.Context.SrcDirs
tags: [method]
```

```Go
func (ctxt *Context) SrcDirs() []string
```

SrcDirs returns a list of package source root directories. It draws from the current Go root and Go path but omits directories that do not exist. 

#### <a id="Context.eval" href="#Context.eval">func (ctxt *Context) eval(x constraint.Expr, allTags map[string]bool) bool</a>

```
searchKey: build.Context.eval
tags: [method private]
```

```Go
func (ctxt *Context) eval(x constraint.Expr, allTags map[string]bool) bool
```

#### <a id="Context.goodOSArchFile" href="#Context.goodOSArchFile">func (ctxt *Context) goodOSArchFile(name string, allTags map[string]bool) bool</a>

```
searchKey: build.Context.goodOSArchFile
tags: [method private]
```

```Go
func (ctxt *Context) goodOSArchFile(name string, allTags map[string]bool) bool
```

goodOSArchFile returns false if the name contains a $GOOS or $GOARCH suffix which does not match the current system. The recognized name formats are: 

```
name_$(GOOS).*
name_$(GOARCH).*
name_$(GOOS)_$(GOARCH).*
name_$(GOOS)_test.*
name_$(GOARCH)_test.*
name_$(GOOS)_$(GOARCH)_test.*

```
Exceptions: if GOOS=android, then files with GOOS=linux are also matched. if GOOS=illumos, then files with GOOS=solaris are also matched. if GOOS=ios, then files with GOOS=darwin are also matched. 

#### <a id="Context.gopath" href="#Context.gopath">func (ctxt *Context) gopath() []string</a>

```
searchKey: build.Context.gopath
tags: [method private]
```

```Go
func (ctxt *Context) gopath() []string
```

gopath returns the list of Go path directories. 

#### <a id="Context.hasSubdir" href="#Context.hasSubdir">func (ctxt *Context) hasSubdir(root, dir string) (rel string, ok bool)</a>

```
searchKey: build.Context.hasSubdir
tags: [method private]
```

```Go
func (ctxt *Context) hasSubdir(root, dir string) (rel string, ok bool)
```

hasSubdir calls ctxt.HasSubdir (if not nil) or else uses the local file system to answer the question. 

#### <a id="Context.importGo" href="#Context.importGo">func (ctxt *Context) importGo(p *Package, path, srcDir string, mode ImportMode) error</a>

```
searchKey: build.Context.importGo
tags: [method private]
```

```Go
func (ctxt *Context) importGo(p *Package, path, srcDir string, mode ImportMode) error
```

importGo checks whether it can use the go command to find the directory for path. If using the go command is not appropriate, importGo returns errNoModules. Otherwise, importGo tries using the go command and reports whether that succeeded. Using the go command lets build.Import and build.Context.Import find code in Go modules. In the long term we want tools to use go/packages (currently golang.org/x/tools/go/packages), which will also use the go command. Invoking the go command here is not very efficient in that it computes information about the requested package and all dependencies and then only reports about the requested package. Then we reinvoke it for every dependency. But this is still better than not working at all. See golang.org/issue/26504. 

#### <a id="Context.isAbsPath" href="#Context.isAbsPath">func (ctxt *Context) isAbsPath(path string) bool</a>

```
searchKey: build.Context.isAbsPath
tags: [method private]
```

```Go
func (ctxt *Context) isAbsPath(path string) bool
```

isAbsPath calls ctxt.IsAbsPath (if not nil) or else filepath.IsAbs. 

#### <a id="Context.isDir" href="#Context.isDir">func (ctxt *Context) isDir(path string) bool</a>

```
searchKey: build.Context.isDir
tags: [method private]
```

```Go
func (ctxt *Context) isDir(path string) bool
```

isDir calls ctxt.IsDir (if not nil) or else uses os.Stat. 

#### <a id="Context.isFile" href="#Context.isFile">func (ctxt *Context) isFile(path string) bool</a>

```
searchKey: build.Context.isFile
tags: [method private]
```

```Go
func (ctxt *Context) isFile(path string) bool
```

isFile determines whether path is a file by trying to open it. It reuses openFile instead of adding another function to the list in Context. 

#### <a id="Context.joinPath" href="#Context.joinPath">func (ctxt *Context) joinPath(elem ...string) string</a>

```
searchKey: build.Context.joinPath
tags: [method private]
```

```Go
func (ctxt *Context) joinPath(elem ...string) string
```

joinPath calls ctxt.JoinPath (if not nil) or else filepath.Join. 

#### <a id="Context.makePathsAbsolute" href="#Context.makePathsAbsolute">func (ctxt *Context) makePathsAbsolute(args []string, srcDir string)</a>

```
searchKey: build.Context.makePathsAbsolute
tags: [method private]
```

```Go
func (ctxt *Context) makePathsAbsolute(args []string, srcDir string)
```

makePathsAbsolute looks for compiler options that take paths and makes them absolute. We do this because through the 1.8 release we ran the compiler in the package directory, so any relative -I or -L options would be relative to that directory. In 1.9 we changed to running the compiler in the build directory, to get consistent build results (issue #19964). To keep builds working, we change any relative -I or -L options to be absolute. 

Using filepath.IsAbs and filepath.Join here means the results will be different on different systems, but that's OK: -I and -L options are inherently system-dependent. 

#### <a id="Context.matchAuto" href="#Context.matchAuto">func (ctxt *Context) matchAuto(text string, allTags map[string]bool) bool</a>

```
searchKey: build.Context.matchAuto
tags: [method private]
```

```Go
func (ctxt *Context) matchAuto(text string, allTags map[string]bool) bool
```

matchAuto interprets text as either a +build or //go:build expression (whichever works), reporting whether the expression matches the build context. 

matchAuto is only used for testing of tag evaluation and in #cgo lines, which accept either syntax. 

#### <a id="Context.matchFile" href="#Context.matchFile">func (ctxt *Context) matchFile(dir, name string, allTags map[string]bool, binaryOnly *bool, fset *token.FileSet) (*fileInfo, error)</a>

```
searchKey: build.Context.matchFile
tags: [method private]
```

```Go
func (ctxt *Context) matchFile(dir, name string, allTags map[string]bool, binaryOnly *bool, fset *token.FileSet) (*fileInfo, error)
```

matchFile determines whether the file with the given name in the given directory should be included in the package being constructed. If the file should be included, matchFile returns a non-nil *fileInfo (and a nil error). Non-nil errors are reserved for unexpected problems. 

If name denotes a Go program, matchFile reads until the end of the imports and returns that section of the file in the fileInfo's header field, even though it only considers text until the first non-comment for +build lines. 

If allTags is non-nil, matchFile records any encountered build tag by setting allTags[tag] = true. 

#### <a id="Context.matchTag" href="#Context.matchTag">func (ctxt *Context) matchTag(name string, allTags map[string]bool) bool</a>

```
searchKey: build.Context.matchTag
tags: [method private]
```

```Go
func (ctxt *Context) matchTag(name string, allTags map[string]bool) bool
```

matchTag reports whether the name is one of: 

```
cgo (if cgo is enabled)
$GOOS
$GOARCH
ctxt.Compiler
linux (if GOOS = android)
solaris (if GOOS = illumos)
tag (if tag is listed in ctxt.BuildTags or ctxt.ReleaseTags)

```
It records all consulted tags in allTags. 

#### <a id="Context.openFile" href="#Context.openFile">func (ctxt *Context) openFile(path string) (io.ReadCloser, error)</a>

```
searchKey: build.Context.openFile
tags: [method private]
```

```Go
func (ctxt *Context) openFile(path string) (io.ReadCloser, error)
```

openFile calls ctxt.OpenFile (if not nil) or else os.Open. 

#### <a id="Context.readDir" href="#Context.readDir">func (ctxt *Context) readDir(path string) ([]fs.FileInfo, error)</a>

```
searchKey: build.Context.readDir
tags: [method private]
```

```Go
func (ctxt *Context) readDir(path string) ([]fs.FileInfo, error)
```

readDir calls ctxt.ReadDir (if not nil) or else ioutil.ReadDir. 

#### <a id="Context.saveCgo" href="#Context.saveCgo">func (ctxt *Context) saveCgo(filename string, di *Package, cg *ast.CommentGroup) error</a>

```
searchKey: build.Context.saveCgo
tags: [method private]
```

```Go
func (ctxt *Context) saveCgo(filename string, di *Package, cg *ast.CommentGroup) error
```

saveCgo saves the information from the #cgo lines in the import "C" comment. These lines set CFLAGS, CPPFLAGS, CXXFLAGS and LDFLAGS and pkg-config directives that affect the way cgo's C code is built. 

#### <a id="Context.shouldBuild" href="#Context.shouldBuild">func (ctxt *Context) shouldBuild(content []byte, allTags map[string]bool) (shouldBuild, binaryOnly bool, err error)</a>

```
searchKey: build.Context.shouldBuild
tags: [method private]
```

```Go
func (ctxt *Context) shouldBuild(content []byte, allTags map[string]bool) (shouldBuild, binaryOnly bool, err error)
```

shouldBuild reports whether it is okay to use this file, The rule is that in the file's leading run of // comments and blank lines, which must be followed by a blank line (to avoid including a Go package clause doc comment), lines beginning with '// +build' are taken as build directives. 

The file is accepted only if each such line lists something matching the file. For example: 

```
// +build windows linux

```
marks the file as applicable only on Windows and Linux. 

For each build tag it consults, shouldBuild sets allTags[tag] = true. 

shouldBuild reports whether the file should be built and whether a //go:binary-only-package comment was found. 

#### <a id="Context.splitPathList" href="#Context.splitPathList">func (ctxt *Context) splitPathList(s string) []string</a>

```
searchKey: build.Context.splitPathList
tags: [method private]
```

```Go
func (ctxt *Context) splitPathList(s string) []string
```

splitPathList calls ctxt.SplitPathList (if not nil) or else filepath.SplitList. 

### <a id="GoodFileTest" href="#GoodFileTest">type GoodFileTest struct</a>

```
searchKey: build.GoodFileTest
tags: [struct private]
```

```Go
type GoodFileTest struct {
	name   string
	result bool
}
```

### <a id="ImportMode" href="#ImportMode">type ImportMode uint</a>

```
searchKey: build.ImportMode
tags: [number]
```

```Go
type ImportMode uint
```

An ImportMode controls the behavior of the Import method. 

### <a id="MultiplePackageError" href="#MultiplePackageError">type MultiplePackageError struct</a>

```
searchKey: build.MultiplePackageError
tags: [struct]
```

```Go
type MultiplePackageError struct {
	Dir      string   // directory containing files
	Packages []string // package names found
	Files    []string // corresponding files: Files[i] declares package Packages[i]
}
```

MultiplePackageError describes a directory containing multiple buildable Go source files for multiple packages. 

#### <a id="MultiplePackageError.Error" href="#MultiplePackageError.Error">func (e *MultiplePackageError) Error() string</a>

```
searchKey: build.MultiplePackageError.Error
tags: [method]
```

```Go
func (e *MultiplePackageError) Error() string
```

### <a id="NoGoError" href="#NoGoError">type NoGoError struct</a>

```
searchKey: build.NoGoError
tags: [struct]
```

```Go
type NoGoError struct {
	Dir string
}
```

NoGoError is the error used by Import to describe a directory containing no buildable Go source files. (It may still contain test files, files hidden by build tags, and so on.) 

#### <a id="NoGoError.Error" href="#NoGoError.Error">func (e *NoGoError) Error() string</a>

```
searchKey: build.NoGoError.Error
tags: [method]
```

```Go
func (e *NoGoError) Error() string
```

### <a id="Package" href="#Package">type Package struct</a>

```
searchKey: build.Package
tags: [struct]
```

```Go
type Package struct {
	Dir           string   // directory containing package sources
	Name          string   // package name
	ImportComment string   // path in import comment on package statement
	Doc           string   // documentation synopsis
	ImportPath    string   // import path of package ("" if unknown)
	Root          string   // root of Go tree where this package lives
	SrcRoot       string   // package source root directory ("" if unknown)
	PkgRoot       string   // package install root directory ("" if unknown)
	PkgTargetRoot string   // architecture dependent install root directory ("" if unknown)
	BinDir        string   // command install directory ("" if unknown)
	Goroot        bool     // package found in Go root
	PkgObj        string   // installed .a file
	AllTags       []string // tags that can influence file selection in this directory
	ConflictDir   string   // this directory shadows Dir in $GOPATH
	BinaryOnly    bool     // cannot be rebuilt from source (has //go:binary-only-package comment)

	// Source files
	GoFiles           []string // .go source files (excluding CgoFiles, TestGoFiles, XTestGoFiles)
	CgoFiles          []string // .go source files that import "C"
	IgnoredGoFiles    []string // .go source files ignored for this build (including ignored _test.go files)
	InvalidGoFiles    []string // .go source files with detected problems (parse error, wrong package name, and so on)
	IgnoredOtherFiles []string // non-.go source files ignored for this build
	CFiles            []string // .c source files
	CXXFiles          []string // .cc, .cpp and .cxx source files
	MFiles            []string // .m (Objective-C) source files
	HFiles            []string // .h, .hh, .hpp and .hxx source files
	FFiles            []string // .f, .F, .for and .f90 Fortran source files
	SFiles            []string // .s source files
	SwigFiles         []string // .swig files
	SwigCXXFiles      []string // .swigcxx files
	SysoFiles         []string // .syso system object files to add to archive

	// Cgo directives
	CgoCFLAGS    []string // Cgo CFLAGS directives
	CgoCPPFLAGS  []string // Cgo CPPFLAGS directives
	CgoCXXFLAGS  []string // Cgo CXXFLAGS directives
	CgoFFLAGS    []string // Cgo FFLAGS directives
	CgoLDFLAGS   []string // Cgo LDFLAGS directives
	CgoPkgConfig []string // Cgo pkg-config directives

	// Test information
	TestGoFiles  []string // _test.go files in package
	XTestGoFiles []string // _test.go files outside package

	// Dependency information
	Imports        []string                    // import paths from GoFiles, CgoFiles
	ImportPos      map[string][]token.Position // line information for Imports
	TestImports    []string                    // import paths from TestGoFiles
	TestImportPos  map[string][]token.Position // line information for TestImports
	XTestImports   []string                    // import paths from XTestGoFiles
	XTestImportPos map[string][]token.Position // line information for XTestImports

	// //go:embed patterns found in Go source files
	// For example, if a source file says
	//	//go:embed a* b.c
	// then the list will contain those two strings as separate entries.
	// (See package embed for more details about //go:embed.)
	EmbedPatterns        []string                    // patterns from GoFiles, CgoFiles
	EmbedPatternPos      map[string][]token.Position // line information for EmbedPatterns
	TestEmbedPatterns    []string                    // patterns from TestGoFiles
	TestEmbedPatternPos  map[string][]token.Position // line information for TestEmbedPatterns
	XTestEmbedPatterns   []string                    // patterns from XTestGoFiles
	XTestEmbedPatternPos map[string][]token.Position // line information for XTestEmbedPatternPos
}
```

A Package describes the Go package found in a directory. 

#### <a id="Import" href="#Import">func Import(path, srcDir string, mode ImportMode) (*Package, error)</a>

```
searchKey: build.Import
tags: [function]
```

```Go
func Import(path, srcDir string, mode ImportMode) (*Package, error)
```

Import is shorthand for Default.Import. 

#### <a id="ImportDir" href="#ImportDir">func ImportDir(dir string, mode ImportMode) (*Package, error)</a>

```
searchKey: build.ImportDir
tags: [function]
```

```Go
func ImportDir(dir string, mode ImportMode) (*Package, error)
```

ImportDir is shorthand for Default.ImportDir. 

#### <a id="Package.IsCommand" href="#Package.IsCommand">func (p *Package) IsCommand() bool</a>

```
searchKey: build.Package.IsCommand
tags: [method]
```

```Go
func (p *Package) IsCommand() bool
```

IsCommand reports whether the package is considered a command to be installed (not just a library). Packages named "main" are treated as commands. 

### <a id="depsParser" href="#depsParser">type depsParser struct</a>

```
searchKey: build.depsParser
tags: [struct private]
```

```Go
type depsParser struct {
	t        *testing.T
	lineno   int
	lastWord string
	text     string
}
```

A depsParser parses the depsRules syntax described above. 

#### <a id="depsParser.nextList" href="#depsParser.nextList">func (p *depsParser) nextList() (list []string, token string)</a>

```
searchKey: build.depsParser.nextList
tags: [method private]
```

```Go
func (p *depsParser) nextList() (list []string, token string)
```

nextList parses and returns a comma-separated list of names. 

#### <a id="depsParser.nextToken" href="#depsParser.nextToken">func (p *depsParser) nextToken() string</a>

```
searchKey: build.depsParser.nextToken
tags: [method private]
```

```Go
func (p *depsParser) nextToken() string
```

nextToken returns the next token in the deps rules, one of ";" "," "<" "!<" or a name. 

#### <a id="depsParser.syntaxError" href="#depsParser.syntaxError">func (p *depsParser) syntaxError(msg string)</a>

```
searchKey: build.depsParser.syntaxError
tags: [method private]
```

```Go
func (p *depsParser) syntaxError(msg string)
```

syntaxError reports a parsing error. 

### <a id="fileEmbed" href="#fileEmbed">type fileEmbed struct</a>

```
searchKey: build.fileEmbed
tags: [struct private]
```

```Go
type fileEmbed struct {
	pattern string
	pos     token.Position
}
```

### <a id="fileImport" href="#fileImport">type fileImport struct</a>

```
searchKey: build.fileImport
tags: [struct private]
```

```Go
type fileImport struct {
	path string
	pos  token.Pos
	doc  *ast.CommentGroup
}
```

### <a id="fileInfo" href="#fileInfo">type fileInfo struct</a>

```
searchKey: build.fileInfo
tags: [struct private]
```

```Go
type fileInfo struct {
	name     string // full name including dir
	header   []byte
	fset     *token.FileSet
	parsed   *ast.File
	parseErr error
	imports  []fileImport
	embeds   []fileEmbed
	embedErr error
}
```

fileInfo records information learned about a file included in a build. 

### <a id="importReader" href="#importReader">type importReader struct</a>

```
searchKey: build.importReader
tags: [struct private]
```

```Go
type importReader struct {
	b    *bufio.Reader
	buf  []byte
	peek byte
	err  error
	eof  bool
	nerr int
	pos  token.Position
}
```

#### <a id="newImportReader" href="#newImportReader">func newImportReader(name string, r io.Reader) *importReader</a>

```
searchKey: build.newImportReader
tags: [function private]
```

```Go
func newImportReader(name string, r io.Reader) *importReader
```

#### <a id="importReader.findEmbed" href="#importReader.findEmbed">func (r *importReader) findEmbed(first bool) bool</a>

```
searchKey: build.importReader.findEmbed
tags: [method private]
```

```Go
func (r *importReader) findEmbed(first bool) bool
```

findEmbed advances the input reader to the next //go:embed comment. It reports whether it found a comment. (Otherwise it found an error or EOF.) 

#### <a id="importReader.nextByte" href="#importReader.nextByte">func (r *importReader) nextByte(skipSpace bool) byte</a>

```
searchKey: build.importReader.nextByte
tags: [method private]
```

```Go
func (r *importReader) nextByte(skipSpace bool) byte
```

nextByte is like peekByte but advances beyond the returned byte. 

#### <a id="importReader.peekByte" href="#importReader.peekByte">func (r *importReader) peekByte(skipSpace bool) byte</a>

```
searchKey: build.importReader.peekByte
tags: [method private]
```

```Go
func (r *importReader) peekByte(skipSpace bool) byte
```

peekByte returns the next byte from the input reader but does not advance beyond it. If skipSpace is set, peekByte skips leading spaces and comments. 

#### <a id="importReader.readByte" href="#importReader.readByte">func (r *importReader) readByte() byte</a>

```
searchKey: build.importReader.readByte
tags: [method private]
```

```Go
func (r *importReader) readByte() byte
```

readByte reads the next byte from the input, saves it in buf, and returns it. If an error occurs, readByte records the error in r.err and returns 0. 

#### <a id="importReader.readByteNoBuf" href="#importReader.readByteNoBuf">func (r *importReader) readByteNoBuf() byte</a>

```
searchKey: build.importReader.readByteNoBuf
tags: [method private]
```

```Go
func (r *importReader) readByteNoBuf() byte
```

readByteNoBuf is like readByte but doesn't buffer the byte. It exhausts r.buf before reading from r.b. 

#### <a id="importReader.readIdent" href="#importReader.readIdent">func (r *importReader) readIdent()</a>

```
searchKey: build.importReader.readIdent
tags: [method private]
```

```Go
func (r *importReader) readIdent()
```

readIdent reads an identifier from the input. If an identifier is not present, readIdent records a syntax error. 

#### <a id="importReader.readImport" href="#importReader.readImport">func (r *importReader) readImport()</a>

```
searchKey: build.importReader.readImport
tags: [method private]
```

```Go
func (r *importReader) readImport()
```

readImport reads an import clause - optional identifier followed by quoted string - from the input. 

#### <a id="importReader.readKeyword" href="#importReader.readKeyword">func (r *importReader) readKeyword(kw string)</a>

```
searchKey: build.importReader.readKeyword
tags: [method private]
```

```Go
func (r *importReader) readKeyword(kw string)
```

readKeyword reads the given keyword from the input. If the keyword is not present, readKeyword records a syntax error. 

#### <a id="importReader.readString" href="#importReader.readString">func (r *importReader) readString()</a>

```
searchKey: build.importReader.readString
tags: [method private]
```

```Go
func (r *importReader) readString()
```

readString reads a quoted string literal from the input. If an identifier is not present, readString records a syntax error. 

#### <a id="importReader.syntaxError" href="#importReader.syntaxError">func (r *importReader) syntaxError()</a>

```
searchKey: build.importReader.syntaxError
tags: [method private]
```

```Go
func (r *importReader) syntaxError()
```

syntaxError records a syntax error, but only if an I/O error has not already been recorded. 

### <a id="readNopCloser" href="#readNopCloser">type readNopCloser struct</a>

```
searchKey: build.readNopCloser
tags: [struct private]
```

```Go
type readNopCloser struct {
	io.Reader
}
```

#### <a id="readNopCloser.Close" href="#readNopCloser.Close">func (r readNopCloser) Close() error</a>

```
searchKey: build.readNopCloser.Close
tags: [method private]
```

```Go
func (r readNopCloser) Close() error
```

### <a id="readTest" href="#readTest">type readTest struct</a>

```
searchKey: build.readTest
tags: [struct private]
```

```Go
type readTest struct {
	// Test input contains ℙ where readGoInfo should stop.
	in  string
	err string
}
```

## <a id="func" href="#func">Functions</a>

### <a id="ArchChar" href="#ArchChar">func ArchChar(goarch string) (string, error)</a>

```
searchKey: build.ArchChar
tags: [function]
```

```Go
func ArchChar(goarch string) (string, error)
```

ArchChar returns "?" and an error. In earlier versions of Go, the returned string was used to derive the compiler and linker tool names, the default object file suffix, and the default linker output name. As of Go 1.5, those strings no longer vary by architecture; they are compile, link, .o, and a.out, respectively. 

### <a id="IsLocalImport" href="#IsLocalImport">func IsLocalImport(path string) bool</a>

```
searchKey: build.IsLocalImport
tags: [function]
```

```Go
func IsLocalImport(path string) bool
```

IsLocalImport reports whether the import path is a local import path, like ".", "..", "./foo", or "../foo". 

### <a id="TestCgoImportsIgnored" href="#TestCgoImportsIgnored">func TestCgoImportsIgnored(t *testing.T)</a>

```
searchKey: build.TestCgoImportsIgnored
tags: [function private test]
```

```Go
func TestCgoImportsIgnored(t *testing.T)
```

TestCgoImportsIgnored checks that imports in cgo files are not included in the imports list when cgo is disabled. Verifies golang.org/issue/35946. 

### <a id="TestDependencies" href="#TestDependencies">func TestDependencies(t *testing.T)</a>

```
searchKey: build.TestDependencies
tags: [function private test]
```

```Go
func TestDependencies(t *testing.T)
```

### <a id="TestDotSlashImport" href="#TestDotSlashImport">func TestDotSlashImport(t *testing.T)</a>

```
searchKey: build.TestDotSlashImport
tags: [function private test]
```

```Go
func TestDotSlashImport(t *testing.T)
```

### <a id="TestEmptyFolderImport" href="#TestEmptyFolderImport">func TestEmptyFolderImport(t *testing.T)</a>

```
searchKey: build.TestEmptyFolderImport
tags: [function private test]
```

```Go
func TestEmptyFolderImport(t *testing.T)
```

### <a id="TestEmptyImport" href="#TestEmptyImport">func TestEmptyImport(t *testing.T)</a>

```
searchKey: build.TestEmptyImport
tags: [function private test]
```

```Go
func TestEmptyImport(t *testing.T)
```

### <a id="TestExpandSrcDir" href="#TestExpandSrcDir">func TestExpandSrcDir(t *testing.T)</a>

```
searchKey: build.TestExpandSrcDir
tags: [function private test]
```

```Go
func TestExpandSrcDir(t *testing.T)
```

### <a id="TestFindImports" href="#TestFindImports">func TestFindImports(t *testing.T)</a>

```
searchKey: build.TestFindImports
tags: [function private test]
```

```Go
func TestFindImports(t *testing.T)
```

TestFindImports tests that findImports works.  See #43249. 

### <a id="TestGoodOSArch" href="#TestGoodOSArch">func TestGoodOSArch(t *testing.T)</a>

```
searchKey: build.TestGoodOSArch
tags: [function private test]
```

```Go
func TestGoodOSArch(t *testing.T)
```

### <a id="TestGoodOSArchFile" href="#TestGoodOSArchFile">func TestGoodOSArchFile(t *testing.T)</a>

```
searchKey: build.TestGoodOSArchFile
tags: [function private test]
```

```Go
func TestGoodOSArchFile(t *testing.T)
```

### <a id="TestImportCmd" href="#TestImportCmd">func TestImportCmd(t *testing.T)</a>

```
searchKey: build.TestImportCmd
tags: [function private test]
```

```Go
func TestImportCmd(t *testing.T)
```

### <a id="TestImportDirNotExist" href="#TestImportDirNotExist">func TestImportDirNotExist(t *testing.T)</a>

```
searchKey: build.TestImportDirNotExist
tags: [function private test]
```

```Go
func TestImportDirNotExist(t *testing.T)
```

Want to get a "cannot find package" error when directory for package does not exist. There should be valid partial information in the returned non-nil *Package. 

### <a id="TestImportDirTarget" href="#TestImportDirTarget">func TestImportDirTarget(t *testing.T)</a>

```
searchKey: build.TestImportDirTarget
tags: [function private test]
```

```Go
func TestImportDirTarget(t *testing.T)
```

### <a id="TestImportPackageOutsideModule" href="#TestImportPackageOutsideModule">func TestImportPackageOutsideModule(t *testing.T)</a>

```
searchKey: build.TestImportPackageOutsideModule
tags: [function private test]
```

```Go
func TestImportPackageOutsideModule(t *testing.T)
```

Check that a package is loaded in module mode if GO111MODULE=on, even when no go.mod file is present. It should fail to resolve packages outside std. Verifies golang.org/issue/34669. 

### <a id="TestImportVendor" href="#TestImportVendor">func TestImportVendor(t *testing.T)</a>

```
searchKey: build.TestImportVendor
tags: [function private test]
```

```Go
func TestImportVendor(t *testing.T)
```

### <a id="TestImportVendorFailure" href="#TestImportVendorFailure">func TestImportVendorFailure(t *testing.T)</a>

```
searchKey: build.TestImportVendorFailure
tags: [function private test]
```

```Go
func TestImportVendorFailure(t *testing.T)
```

### <a id="TestImportVendorParentFailure" href="#TestImportVendorParentFailure">func TestImportVendorParentFailure(t *testing.T)</a>

```
searchKey: build.TestImportVendorParentFailure
tags: [function private test]
```

```Go
func TestImportVendorParentFailure(t *testing.T)
```

### <a id="TestIssue23594" href="#TestIssue23594">func TestIssue23594(t *testing.T)</a>

```
searchKey: build.TestIssue23594
tags: [function private test]
```

```Go
func TestIssue23594(t *testing.T)
```

TestIssue23594 prevents go/build from regressing and populating Package.Doc from comments in test files. 

### <a id="TestLocalDirectory" href="#TestLocalDirectory">func TestLocalDirectory(t *testing.T)</a>

```
searchKey: build.TestLocalDirectory
tags: [function private test]
```

```Go
func TestLocalDirectory(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: build.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestMatch" href="#TestMatch">func TestMatch(t *testing.T)</a>

```
searchKey: build.TestMatch
tags: [function private test]
```

```Go
func TestMatch(t *testing.T)
```

### <a id="TestMatchFile" href="#TestMatchFile">func TestMatchFile(t *testing.T)</a>

```
searchKey: build.TestMatchFile
tags: [function private test]
```

```Go
func TestMatchFile(t *testing.T)
```

### <a id="TestMissingImportErrorRepetition" href="#TestMissingImportErrorRepetition">func TestMissingImportErrorRepetition(t *testing.T)</a>

```
searchKey: build.TestMissingImportErrorRepetition
tags: [function private test]
```

```Go
func TestMissingImportErrorRepetition(t *testing.T)
```

TestMissingImportErrorRepetition checks that when an unknown package is imported, the package path is only shown once in the error. Verifies golang.org/issue/34752. 

### <a id="TestMultiplePackageImport" href="#TestMultiplePackageImport">func TestMultiplePackageImport(t *testing.T)</a>

```
searchKey: build.TestMultiplePackageImport
tags: [function private test]
```

```Go
func TestMultiplePackageImport(t *testing.T)
```

### <a id="TestReadComments" href="#TestReadComments">func TestReadComments(t *testing.T)</a>

```
searchKey: build.TestReadComments
tags: [function private test]
```

```Go
func TestReadComments(t *testing.T)
```

### <a id="TestReadEmbed" href="#TestReadEmbed">func TestReadEmbed(t *testing.T)</a>

```
searchKey: build.TestReadEmbed
tags: [function private test]
```

```Go
func TestReadEmbed(t *testing.T)
```

### <a id="TestReadFailuresIgnored" href="#TestReadFailuresIgnored">func TestReadFailuresIgnored(t *testing.T)</a>

```
searchKey: build.TestReadFailuresIgnored
tags: [function private test]
```

```Go
func TestReadFailuresIgnored(t *testing.T)
```

### <a id="TestReadGoInfo" href="#TestReadGoInfo">func TestReadGoInfo(t *testing.T)</a>

```
searchKey: build.TestReadGoInfo
tags: [function private test]
```

```Go
func TestReadGoInfo(t *testing.T)
```

### <a id="TestShellSafety" href="#TestShellSafety">func TestShellSafety(t *testing.T)</a>

```
searchKey: build.TestShellSafety
tags: [function private test]
```

```Go
func TestShellSafety(t *testing.T)
```

### <a id="TestShouldBuild" href="#TestShouldBuild">func TestShouldBuild(t *testing.T)</a>

```
searchKey: build.TestShouldBuild
tags: [function private test]
```

```Go
func TestShouldBuild(t *testing.T)
```

### <a id="TestStdlibLowercase" href="#TestStdlibLowercase">func TestStdlibLowercase(t *testing.T)</a>

```
searchKey: build.TestStdlibLowercase
tags: [function private test]
```

```Go
func TestStdlibLowercase(t *testing.T)
```

TestStdlibLowercase tests that all standard library package names are lowercase. See Issue 40065. 

### <a id="anotherArch" href="#anotherArch">func anotherArch() string</a>

```
searchKey: build.anotherArch
tags: [function private]
```

```Go
func anotherArch() string
```

### <a id="anotherOS" href="#anotherOS">func anotherOS() string</a>

```
searchKey: build.anotherOS
tags: [function private]
```

```Go
func anotherOS() string
```

### <a id="cleanDecls" href="#cleanDecls">func cleanDecls(m map[string][]token.Position) ([]string, map[string][]token.Position)</a>

```
searchKey: build.cleanDecls
tags: [function private]
```

```Go
func cleanDecls(m map[string][]token.Position) ([]string, map[string][]token.Position)
```

### <a id="defaultGOPATH" href="#defaultGOPATH">func defaultGOPATH() string</a>

```
searchKey: build.defaultGOPATH
tags: [function private]
```

```Go
func defaultGOPATH() string
```

### <a id="depsPolicy" href="#depsPolicy">func depsPolicy(t *testing.T) map[string]map[string]bool</a>

```
searchKey: build.depsPolicy
tags: [function private]
```

```Go
func depsPolicy(t *testing.T) map[string]map[string]bool
```

depsPolicy returns a map m such that m[p][d] == true when p can import d. 

### <a id="envOr" href="#envOr">func envOr(name, def string) string</a>

```
searchKey: build.envOr
tags: [function private]
```

```Go
func envOr(name, def string) string
```

### <a id="equal" href="#equal">func equal(x, y []string) bool</a>

```
searchKey: build.equal
tags: [function private]
```

```Go
func equal(x, y []string) bool
```

### <a id="expandSrcDir" href="#expandSrcDir">func expandSrcDir(str string, srcdir string) (string, bool)</a>

```
searchKey: build.expandSrcDir
tags: [function private]
```

```Go
func expandSrcDir(str string, srcdir string) (string, bool)
```

expandSrcDir expands any occurrence of ${SRCDIR}, making sure the result is safe for the shell. 

### <a id="fileListForExt" href="#fileListForExt">func fileListForExt(p *Package, ext string) *[]string</a>

```
searchKey: build.fileListForExt
tags: [function private]
```

```Go
func fileListForExt(p *Package, ext string) *[]string
```

### <a id="findImportComment" href="#findImportComment">func findImportComment(data []byte) (s string, line int)</a>

```
searchKey: build.findImportComment
tags: [function private]
```

```Go
func findImportComment(data []byte) (s string, line int)
```

### <a id="findImports" href="#findImports">func findImports(pkg string) ([]string, error)</a>

```
searchKey: build.findImports
tags: [function private]
```

```Go
func findImports(pkg string) ([]string, error)
```

### <a id="getToolDir" href="#getToolDir">func getToolDir() string</a>

```
searchKey: build.getToolDir
tags: [function private]
```

```Go
func getToolDir() string
```

getToolDir returns the default value of ToolDir. 

### <a id="hasGoFiles" href="#hasGoFiles">func hasGoFiles(ctxt *Context, dir string) bool</a>

```
searchKey: build.hasGoFiles
tags: [function private]
```

```Go
func hasGoFiles(ctxt *Context, dir string) bool
```

hasGoFiles reports whether dir contains any files with names ending in .go. For a vendor check we must exclude directories that contain no .go files. Otherwise it is not possible to vendor just a/b/c and still import the non-vendored a/b. See golang.org/issue/13832. 

### <a id="hasSubdir" href="#hasSubdir">func hasSubdir(root, dir string) (rel string, ok bool)</a>

```
searchKey: build.hasSubdir
tags: [function private]
```

```Go
func hasSubdir(root, dir string) (rel string, ok bool)
```

hasSubdir reports if dir is within root by performing lexical analysis only. 

### <a id="init.build.go" href="#init.build.go">func init()</a>

```
searchKey: build.init
tags: [function private]
```

```Go
func init()
```

### <a id="isGoBuildComment" href="#isGoBuildComment">func isGoBuildComment(line []byte) bool</a>

```
searchKey: build.isGoBuildComment
tags: [function private]
```

```Go
func isGoBuildComment(line []byte) bool
```

### <a id="isIdent" href="#isIdent">func isIdent(c byte) bool</a>

```
searchKey: build.isIdent
tags: [function private]
```

```Go
func isIdent(c byte) bool
```

### <a id="listStdPkgs" href="#listStdPkgs">func listStdPkgs(goroot string) ([]string, error)</a>

```
searchKey: build.listStdPkgs
tags: [function private]
```

```Go
func listStdPkgs(goroot string) ([]string, error)
```

listStdPkgs returns the same list of packages as "go list std". 

### <a id="nameExt" href="#nameExt">func nameExt(name string) string</a>

```
searchKey: build.nameExt
tags: [function private]
```

```Go
func nameExt(name string) string
```

### <a id="parseDepsRules" href="#parseDepsRules">func parseDepsRules(t *testing.T, save func(deps []string, op string, users []string))</a>

```
searchKey: build.parseDepsRules
tags: [function private]
```

```Go
func parseDepsRules(t *testing.T, save func(deps []string, op string, users []string))
```

parseDepsRules parses depsRules, calling save(deps, op, users) for each deps < users or deps !< users rule (op is "<" or "!<"). 

### <a id="parseFileHeader" href="#parseFileHeader">func parseFileHeader(content []byte) (trimmed, goBuild []byte, sawBinaryOnly bool, err error)</a>

```
searchKey: build.parseFileHeader
tags: [function private]
```

```Go
func parseFileHeader(content []byte) (trimmed, goBuild []byte, sawBinaryOnly bool, err error)
```

### <a id="parseGoEmbed" href="#parseGoEmbed">func parseGoEmbed(args string, pos token.Position) ([]fileEmbed, error)</a>

```
searchKey: build.parseGoEmbed
tags: [function private]
```

```Go
func parseGoEmbed(args string, pos token.Position) ([]fileEmbed, error)
```

parseGoEmbed parses the text following "//go:embed" to extract the glob patterns. It accepts unquoted space-separated patterns as well as double-quoted and back-quoted Go strings. This is based on a similar function in cmd/compile/internal/gc/noder.go; this version calculates position information as well. 

### <a id="parseWord" href="#parseWord">func parseWord(data []byte) (word, rest []byte)</a>

```
searchKey: build.parseWord
tags: [function private]
```

```Go
func parseWord(data []byte) (word, rest []byte)
```

parseWord skips any leading spaces or comments in data and then parses the beginning of data as an identifier or keyword, returning that word and what remains after the word. 

### <a id="readComments" href="#readComments">func readComments(f io.Reader) ([]byte, error)</a>

```
searchKey: build.readComments
tags: [function private]
```

```Go
func readComments(f io.Reader) ([]byte, error)
```

readComments is like io.ReadAll, except that it only reads the leading block of comments in the file. 

### <a id="readGoInfo" href="#readGoInfo">func readGoInfo(f io.Reader, info *fileInfo) error</a>

```
searchKey: build.readGoInfo
tags: [function private]
```

```Go
func readGoInfo(f io.Reader, info *fileInfo) error
```

readGoInfo expects a Go file as input and reads the file up to and including the import section. It records what it learned in *info. If info.fset is non-nil, readGoInfo parses the file and sets info.parsed, info.parseErr, info.imports, info.embeds, and info.embedErr. 

It only returns an error if there are problems reading the file, not for syntax errors in the file itself. 

### <a id="safeCgoName" href="#safeCgoName">func safeCgoName(s string) bool</a>

```
searchKey: build.safeCgoName
tags: [function private]
```

```Go
func safeCgoName(s string) bool
```

### <a id="skipSpaceOrComment" href="#skipSpaceOrComment">func skipSpaceOrComment(data []byte) []byte</a>

```
searchKey: build.skipSpaceOrComment
tags: [function private]
```

```Go
func skipSpaceOrComment(data []byte) []byte
```

skipSpaceOrComment returns data with any leading spaces or comments removed. 

### <a id="splitQuoted" href="#splitQuoted">func splitQuoted(s string) (r []string, err error)</a>

```
searchKey: build.splitQuoted
tags: [function private]
```

```Go
func splitQuoted(s string) (r []string, err error)
```

splitQuoted splits the string s around each instance of one or more consecutive white space characters while taking into account quotes and escaping, and returns an array of substrings of s or an empty list if s contains only white space. Single quotes and double quotes are recognized to prevent splitting within the quoted region, and are removed from the resulting substrings. If a quote in s isn't closed err will be set and r will have the unclosed argument as the last element. The backslash is used for escaping. 

For example, the following string: 

```
a b:"c d" 'e''f'  "g\""

```
Would be parsed as: 

```
[]string{"a", "b:c d", "ef", `g"`}

```
### <a id="testRead" href="#testRead">func testRead(t *testing.T, tests []readTest, read func(io.Reader) ([]byte, error))</a>

```
searchKey: build.testRead
tags: [function private]
```

```Go
func testRead(t *testing.T, tests []readTest, read func(io.Reader) ([]byte, error))
```

### <a id="uniq" href="#uniq">func uniq(list []string) []string</a>

```
searchKey: build.uniq
tags: [function private]
```

```Go
func uniq(list []string) []string
```

