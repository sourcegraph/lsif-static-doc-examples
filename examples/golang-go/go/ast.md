# Package ast

Package ast declares the types used to represent syntax trees for Go packages. 

## Index

* [Constants](#const)
    * [const SEND](#SEND)
    * [const RECV](#RECV)
    * [const FilterFuncDuplicates](#FilterFuncDuplicates)
    * [const FilterUnassociatedComments](#FilterUnassociatedComments)
    * [const FilterImportDuplicates](#FilterImportDuplicates)
    * [const Bad](#Bad)
    * [const Pkg](#Pkg)
    * [const Con](#Con)
    * [const Typ](#Typ)
    * [const Var](#Var)
    * [const Fun](#Fun)
    * [const Lbl](#Lbl)
* [Variables](#var)
    * [var separator](#separator)
    * [var indent](#indent)
    * [var objKindStrings](#objKindStrings)
    * [var comments](#comments)
    * [var isDirectiveTests](#isDirectiveTests)
    * [var tests](#tests)
* [Types](#type)
    * [type Node interface](#Node)
    * [type Expr interface](#Expr)
    * [type Stmt interface](#Stmt)
    * [type Decl interface](#Decl)
    * [type Comment struct](#Comment)
        * [func (c *Comment) Pos() token.Pos](#Comment.Pos)
        * [func (c *Comment) End() token.Pos](#Comment.End)
    * [type CommentGroup struct](#CommentGroup)
        * [func (g *CommentGroup) Pos() token.Pos](#CommentGroup.Pos)
        * [func (g *CommentGroup) End() token.Pos](#CommentGroup.End)
        * [func (g *CommentGroup) Text() string](#CommentGroup.Text)
    * [type Field struct](#Field)
        * [func (f *Field) Pos() token.Pos](#Field.Pos)
        * [func (f *Field) End() token.Pos](#Field.End)
    * [type FieldList struct](#FieldList)
        * [func (f *FieldList) Pos() token.Pos](#FieldList.Pos)
        * [func (f *FieldList) End() token.Pos](#FieldList.End)
        * [func (f *FieldList) NumFields() int](#FieldList.NumFields)
    * [type BadExpr struct](#BadExpr)
        * [func (x *BadExpr) Pos() token.Pos](#BadExpr.Pos)
        * [func (x *BadExpr) End() token.Pos](#BadExpr.End)
        * [func (*BadExpr) exprNode()](#BadExpr.exprNode)
    * [type Ident struct](#Ident)
        * [func NewIdent(name string) *Ident](#NewIdent)
        * [func fieldName(x Expr) *Ident](#fieldName)
        * [func (x *Ident) Pos() token.Pos](#Ident.Pos)
        * [func (x *Ident) End() token.Pos](#Ident.End)
        * [func (*Ident) exprNode()](#Ident.exprNode)
        * [func (id *Ident) IsExported() bool](#Ident.IsExported)
        * [func (id *Ident) String() string](#Ident.String)
    * [type Ellipsis struct](#Ellipsis)
        * [func (x *Ellipsis) Pos() token.Pos](#Ellipsis.Pos)
        * [func (x *Ellipsis) End() token.Pos](#Ellipsis.End)
        * [func (*Ellipsis) exprNode()](#Ellipsis.exprNode)
    * [type BasicLit struct](#BasicLit)
        * [func (x *BasicLit) Pos() token.Pos](#BasicLit.Pos)
        * [func (x *BasicLit) End() token.Pos](#BasicLit.End)
        * [func (*BasicLit) exprNode()](#BasicLit.exprNode)
    * [type FuncLit struct](#FuncLit)
        * [func (x *FuncLit) Pos() token.Pos](#FuncLit.Pos)
        * [func (x *FuncLit) End() token.Pos](#FuncLit.End)
        * [func (*FuncLit) exprNode()](#FuncLit.exprNode)
    * [type CompositeLit struct](#CompositeLit)
        * [func (x *CompositeLit) Pos() token.Pos](#CompositeLit.Pos)
        * [func (x *CompositeLit) End() token.Pos](#CompositeLit.End)
        * [func (*CompositeLit) exprNode()](#CompositeLit.exprNode)
    * [type ParenExpr struct](#ParenExpr)
        * [func (x *ParenExpr) Pos() token.Pos](#ParenExpr.Pos)
        * [func (x *ParenExpr) End() token.Pos](#ParenExpr.End)
        * [func (*ParenExpr) exprNode()](#ParenExpr.exprNode)
    * [type SelectorExpr struct](#SelectorExpr)
        * [func (x *SelectorExpr) Pos() token.Pos](#SelectorExpr.Pos)
        * [func (x *SelectorExpr) End() token.Pos](#SelectorExpr.End)
        * [func (*SelectorExpr) exprNode()](#SelectorExpr.exprNode)
    * [type IndexExpr struct](#IndexExpr)
        * [func (x *IndexExpr) Pos() token.Pos](#IndexExpr.Pos)
        * [func (x *IndexExpr) End() token.Pos](#IndexExpr.End)
        * [func (*IndexExpr) exprNode()](#IndexExpr.exprNode)
    * [type SliceExpr struct](#SliceExpr)
        * [func (x *SliceExpr) Pos() token.Pos](#SliceExpr.Pos)
        * [func (x *SliceExpr) End() token.Pos](#SliceExpr.End)
        * [func (*SliceExpr) exprNode()](#SliceExpr.exprNode)
    * [type TypeAssertExpr struct](#TypeAssertExpr)
        * [func (x *TypeAssertExpr) Pos() token.Pos](#TypeAssertExpr.Pos)
        * [func (x *TypeAssertExpr) End() token.Pos](#TypeAssertExpr.End)
        * [func (*TypeAssertExpr) exprNode()](#TypeAssertExpr.exprNode)
    * [type CallExpr struct](#CallExpr)
        * [func (x *CallExpr) Pos() token.Pos](#CallExpr.Pos)
        * [func (x *CallExpr) End() token.Pos](#CallExpr.End)
        * [func (*CallExpr) exprNode()](#CallExpr.exprNode)
    * [type StarExpr struct](#StarExpr)
        * [func (x *StarExpr) Pos() token.Pos](#StarExpr.Pos)
        * [func (x *StarExpr) End() token.Pos](#StarExpr.End)
        * [func (*StarExpr) exprNode()](#StarExpr.exprNode)
    * [type UnaryExpr struct](#UnaryExpr)
        * [func (x *UnaryExpr) Pos() token.Pos](#UnaryExpr.Pos)
        * [func (x *UnaryExpr) End() token.Pos](#UnaryExpr.End)
        * [func (*UnaryExpr) exprNode()](#UnaryExpr.exprNode)
    * [type BinaryExpr struct](#BinaryExpr)
        * [func (x *BinaryExpr) Pos() token.Pos](#BinaryExpr.Pos)
        * [func (x *BinaryExpr) End() token.Pos](#BinaryExpr.End)
        * [func (*BinaryExpr) exprNode()](#BinaryExpr.exprNode)
    * [type KeyValueExpr struct](#KeyValueExpr)
        * [func (x *KeyValueExpr) Pos() token.Pos](#KeyValueExpr.Pos)
        * [func (x *KeyValueExpr) End() token.Pos](#KeyValueExpr.End)
        * [func (*KeyValueExpr) exprNode()](#KeyValueExpr.exprNode)
    * [type ChanDir int](#ChanDir)
    * [type ArrayType struct](#ArrayType)
        * [func (x *ArrayType) Pos() token.Pos](#ArrayType.Pos)
        * [func (x *ArrayType) End() token.Pos](#ArrayType.End)
        * [func (*ArrayType) exprNode()](#ArrayType.exprNode)
    * [type StructType struct](#StructType)
        * [func (x *StructType) Pos() token.Pos](#StructType.Pos)
        * [func (x *StructType) End() token.Pos](#StructType.End)
        * [func (*StructType) exprNode()](#StructType.exprNode)
    * [type InterfaceType struct](#InterfaceType)
        * [func (x *InterfaceType) Pos() token.Pos](#InterfaceType.Pos)
        * [func (x *InterfaceType) End() token.Pos](#InterfaceType.End)
        * [func (*InterfaceType) exprNode()](#InterfaceType.exprNode)
    * [type MapType struct](#MapType)
        * [func (x *MapType) Pos() token.Pos](#MapType.Pos)
        * [func (x *MapType) End() token.Pos](#MapType.End)
        * [func (*MapType) exprNode()](#MapType.exprNode)
    * [type ChanType struct](#ChanType)
        * [func (x *ChanType) Pos() token.Pos](#ChanType.Pos)
        * [func (x *ChanType) End() token.Pos](#ChanType.End)
        * [func (*ChanType) exprNode()](#ChanType.exprNode)
    * [type BadStmt struct](#BadStmt)
        * [func (s *BadStmt) Pos() token.Pos](#BadStmt.Pos)
        * [func (s *BadStmt) End() token.Pos](#BadStmt.End)
        * [func (*BadStmt) stmtNode()](#BadStmt.stmtNode)
    * [type DeclStmt struct](#DeclStmt)
        * [func (s *DeclStmt) Pos() token.Pos](#DeclStmt.Pos)
        * [func (s *DeclStmt) End() token.Pos](#DeclStmt.End)
        * [func (*DeclStmt) stmtNode()](#DeclStmt.stmtNode)
    * [type EmptyStmt struct](#EmptyStmt)
        * [func (s *EmptyStmt) Pos() token.Pos](#EmptyStmt.Pos)
        * [func (s *EmptyStmt) End() token.Pos](#EmptyStmt.End)
        * [func (*EmptyStmt) stmtNode()](#EmptyStmt.stmtNode)
    * [type LabeledStmt struct](#LabeledStmt)
        * [func (s *LabeledStmt) Pos() token.Pos](#LabeledStmt.Pos)
        * [func (s *LabeledStmt) End() token.Pos](#LabeledStmt.End)
        * [func (*LabeledStmt) stmtNode()](#LabeledStmt.stmtNode)
    * [type ExprStmt struct](#ExprStmt)
        * [func (s *ExprStmt) Pos() token.Pos](#ExprStmt.Pos)
        * [func (s *ExprStmt) End() token.Pos](#ExprStmt.End)
        * [func (*ExprStmt) stmtNode()](#ExprStmt.stmtNode)
    * [type SendStmt struct](#SendStmt)
        * [func (s *SendStmt) Pos() token.Pos](#SendStmt.Pos)
        * [func (s *SendStmt) End() token.Pos](#SendStmt.End)
        * [func (*SendStmt) stmtNode()](#SendStmt.stmtNode)
    * [type IncDecStmt struct](#IncDecStmt)
        * [func (s *IncDecStmt) Pos() token.Pos](#IncDecStmt.Pos)
        * [func (s *IncDecStmt) End() token.Pos](#IncDecStmt.End)
        * [func (*IncDecStmt) stmtNode()](#IncDecStmt.stmtNode)
    * [type AssignStmt struct](#AssignStmt)
        * [func (s *AssignStmt) Pos() token.Pos](#AssignStmt.Pos)
        * [func (s *AssignStmt) End() token.Pos](#AssignStmt.End)
        * [func (*AssignStmt) stmtNode()](#AssignStmt.stmtNode)
    * [type GoStmt struct](#GoStmt)
        * [func (s *GoStmt) Pos() token.Pos](#GoStmt.Pos)
        * [func (s *GoStmt) End() token.Pos](#GoStmt.End)
        * [func (*GoStmt) stmtNode()](#GoStmt.stmtNode)
    * [type DeferStmt struct](#DeferStmt)
        * [func (s *DeferStmt) Pos() token.Pos](#DeferStmt.Pos)
        * [func (s *DeferStmt) End() token.Pos](#DeferStmt.End)
        * [func (*DeferStmt) stmtNode()](#DeferStmt.stmtNode)
    * [type ReturnStmt struct](#ReturnStmt)
        * [func (s *ReturnStmt) Pos() token.Pos](#ReturnStmt.Pos)
        * [func (s *ReturnStmt) End() token.Pos](#ReturnStmt.End)
        * [func (*ReturnStmt) stmtNode()](#ReturnStmt.stmtNode)
    * [type BranchStmt struct](#BranchStmt)
        * [func (s *BranchStmt) Pos() token.Pos](#BranchStmt.Pos)
        * [func (s *BranchStmt) End() token.Pos](#BranchStmt.End)
        * [func (*BranchStmt) stmtNode()](#BranchStmt.stmtNode)
    * [type BlockStmt struct](#BlockStmt)
        * [func (s *BlockStmt) Pos() token.Pos](#BlockStmt.Pos)
        * [func (s *BlockStmt) End() token.Pos](#BlockStmt.End)
        * [func (*BlockStmt) stmtNode()](#BlockStmt.stmtNode)
    * [type IfStmt struct](#IfStmt)
        * [func (s *IfStmt) Pos() token.Pos](#IfStmt.Pos)
        * [func (s *IfStmt) End() token.Pos](#IfStmt.End)
        * [func (*IfStmt) stmtNode()](#IfStmt.stmtNode)
    * [type CaseClause struct](#CaseClause)
        * [func (s *CaseClause) Pos() token.Pos](#CaseClause.Pos)
        * [func (s *CaseClause) End() token.Pos](#CaseClause.End)
        * [func (*CaseClause) stmtNode()](#CaseClause.stmtNode)
    * [type SwitchStmt struct](#SwitchStmt)
        * [func (s *SwitchStmt) Pos() token.Pos](#SwitchStmt.Pos)
        * [func (s *SwitchStmt) End() token.Pos](#SwitchStmt.End)
        * [func (*SwitchStmt) stmtNode()](#SwitchStmt.stmtNode)
    * [type TypeSwitchStmt struct](#TypeSwitchStmt)
        * [func (s *TypeSwitchStmt) Pos() token.Pos](#TypeSwitchStmt.Pos)
        * [func (s *TypeSwitchStmt) End() token.Pos](#TypeSwitchStmt.End)
        * [func (*TypeSwitchStmt) stmtNode()](#TypeSwitchStmt.stmtNode)
    * [type CommClause struct](#CommClause)
        * [func (s *CommClause) Pos() token.Pos](#CommClause.Pos)
        * [func (s *CommClause) End() token.Pos](#CommClause.End)
        * [func (*CommClause) stmtNode()](#CommClause.stmtNode)
    * [type SelectStmt struct](#SelectStmt)
        * [func (s *SelectStmt) Pos() token.Pos](#SelectStmt.Pos)
        * [func (s *SelectStmt) End() token.Pos](#SelectStmt.End)
        * [func (*SelectStmt) stmtNode()](#SelectStmt.stmtNode)
    * [type ForStmt struct](#ForStmt)
        * [func (s *ForStmt) Pos() token.Pos](#ForStmt.Pos)
        * [func (s *ForStmt) End() token.Pos](#ForStmt.End)
        * [func (*ForStmt) stmtNode()](#ForStmt.stmtNode)
    * [type RangeStmt struct](#RangeStmt)
        * [func (s *RangeStmt) Pos() token.Pos](#RangeStmt.Pos)
        * [func (s *RangeStmt) End() token.Pos](#RangeStmt.End)
        * [func (*RangeStmt) stmtNode()](#RangeStmt.stmtNode)
    * [type Spec interface](#Spec)
    * [type ImportSpec struct](#ImportSpec)
        * [func (s *ImportSpec) Pos() token.Pos](#ImportSpec.Pos)
        * [func (s *ImportSpec) End() token.Pos](#ImportSpec.End)
        * [func (*ImportSpec) specNode()](#ImportSpec.specNode)
    * [type ValueSpec struct](#ValueSpec)
        * [func (s *ValueSpec) Pos() token.Pos](#ValueSpec.Pos)
        * [func (s *ValueSpec) End() token.Pos](#ValueSpec.End)
        * [func (*ValueSpec) specNode()](#ValueSpec.specNode)
    * [type BadDecl struct](#BadDecl)
        * [func (d *BadDecl) Pos() token.Pos](#BadDecl.Pos)
        * [func (d *BadDecl) End() token.Pos](#BadDecl.End)
        * [func (*BadDecl) declNode()](#BadDecl.declNode)
    * [type GenDecl struct](#GenDecl)
        * [func (d *GenDecl) Pos() token.Pos](#GenDecl.Pos)
        * [func (d *GenDecl) End() token.Pos](#GenDecl.End)
        * [func (*GenDecl) declNode()](#GenDecl.declNode)
    * [type FuncDecl struct](#FuncDecl)
        * [func (d *FuncDecl) Pos() token.Pos](#FuncDecl.Pos)
        * [func (d *FuncDecl) End() token.Pos](#FuncDecl.End)
        * [func (*FuncDecl) declNode()](#FuncDecl.declNode)
    * [type File struct](#File)
        * [func MergePackageFiles(pkg *Package, mode MergeMode) *File](#MergePackageFiles)
        * [func (f *File) Pos() token.Pos](#File.Pos)
        * [func (f *File) End() token.Pos](#File.End)
    * [type Package struct](#Package)
        * [func NewPackage(fset *token.FileSet, files map[string]*File, importer Importer, universe *Scope) (*Package, error)](#NewPackage)
        * [func (p *Package) Pos() token.Pos](#Package.Pos)
        * [func (p *Package) End() token.Pos](#Package.End)
    * [type FuncType struct](#FuncType)
        * [func (x *FuncType) Pos() token.Pos](#FuncType.Pos)
        * [func (x *FuncType) End() token.Pos](#FuncType.End)
        * [func (*FuncType) exprNode()](#FuncType.exprNode)
    * [type TypeSpec struct](#TypeSpec)
        * [func (s *TypeSpec) Pos() token.Pos](#TypeSpec.Pos)
        * [func (s *TypeSpec) End() token.Pos](#TypeSpec.End)
        * [func (*TypeSpec) specNode()](#TypeSpec.specNode)
    * [type byPos []*ast.CommentGroup](#byPos)
        * [func (a byPos) Len() int](#byPos.Len)
        * [func (a byPos) Less(i, j int) bool](#byPos.Less)
        * [func (a byPos) Swap(i, j int)](#byPos.Swap)
    * [type CommentMap map[ast.Node][]*ast.CommentGroup](#CommentMap)
        * [func NewCommentMap(fset *token.FileSet, node Node, comments []*CommentGroup) CommentMap](#NewCommentMap)
        * [func (cmap CommentMap) addComment(n Node, c *CommentGroup)](#CommentMap.addComment)
        * [func (cmap CommentMap) Update(old, new Node) Node](#CommentMap.Update)
        * [func (cmap CommentMap) Filter(node Node) CommentMap](#CommentMap.Filter)
        * [func (cmap CommentMap) Comments() []*CommentGroup](#CommentMap.Comments)
        * [func (cmap CommentMap) String() string](#CommentMap.String)
    * [type byInterval []ast.Node](#byInterval)
        * [func (a byInterval) Len() int](#byInterval.Len)
        * [func (a byInterval) Less(i, j int) bool](#byInterval.Less)
        * [func (a byInterval) Swap(i, j int)](#byInterval.Swap)
    * [type commentListReader struct](#commentListReader)
        * [func (r *commentListReader) eol() bool](#commentListReader.eol)
        * [func (r *commentListReader) next()](#commentListReader.next)
    * [type nodeStack []ast.Node](#nodeStack)
        * [func (s *nodeStack) push(n Node)](#nodeStack.push)
        * [func (s *nodeStack) pop(pos token.Pos) (top Node)](#nodeStack.pop)
    * [type Filter func(string) bool](#Filter)
    * [type MergeMode uint](#MergeMode)
    * [type posSpan struct](#posSpan)
    * [type cgPos struct](#cgPos)
    * [type FieldFilter func(name string, value reflect.Value) bool](#FieldFilter)
    * [type printer struct](#printer)
        * [func (p *printer) Write(data []byte) (n int, err error)](#printer.Write)
        * [func (p *printer) printf(format string, args ...interface{})](#printer.printf)
        * [func (p *printer) print(x reflect.Value)](#printer.print)
    * [type localError struct](#localError)
    * [type pkgBuilder struct](#pkgBuilder)
        * [func (p *pkgBuilder) error(pos token.Pos, msg string)](#pkgBuilder.error)
        * [func (p *pkgBuilder) errorf(pos token.Pos, format string, args ...interface{})](#pkgBuilder.errorf)
        * [func (p *pkgBuilder) declare(scope, altScope *Scope, obj *Object)](#pkgBuilder.declare)
    * [type Importer func(imports map[string]*std/go/ast.Object, path string) (pkg *std/go/ast.Object, err error)](#Importer)
    * [type Scope struct](#Scope)
        * [func NewScope(outer *Scope) *Scope](#NewScope)
        * [func (s *Scope) Lookup(name string) *Object](#Scope.Lookup)
        * [func (s *Scope) Insert(obj *Object) (alt *Object)](#Scope.Insert)
        * [func (s *Scope) String() string](#Scope.String)
    * [type Object struct](#Object)
        * [func NewObj(kind ObjKind, name string) *Object](#NewObj)
        * [func (obj *Object) Pos() token.Pos](#Object.Pos)
    * [type ObjKind int](#ObjKind)
        * [func (kind ObjKind) String() string](#ObjKind.String)
    * [type Visitor interface](#Visitor)
    * [type inspector func(std/go/ast.Node) bool](#inspector)
        * [func (f inspector) Visit(node Node) Visitor](#inspector.Visit)
* [Functions](#func)
    * [func isWhitespace(ch byte) bool](#isWhitespace)
    * [func stripTrailingWhitespace(s string) string](#stripTrailingWhitespace)
    * [func isDirective(c string) bool](#isDirective)
    * [func IsExported(name string) bool](#IsExported)
    * [func sortComments(list []*CommentGroup)](#sortComments)
    * [func nodeList(n Node) []Node](#nodeList)
    * [func summary(list []*CommentGroup) string](#summary)
    * [func exportFilter(name string) bool](#exportFilter)
    * [func FileExports(src *File) bool](#FileExports)
    * [func PackageExports(pkg *Package) bool](#PackageExports)
    * [func filterIdentList(list []*Ident, f Filter) []*Ident](#filterIdentList)
    * [func filterFieldList(fields *FieldList, filter Filter, export bool) (removedFields bool)](#filterFieldList)
    * [func filterCompositeLit(lit *CompositeLit, filter Filter, export bool)](#filterCompositeLit)
    * [func filterExprList(list []Expr, filter Filter, export bool) []Expr](#filterExprList)
    * [func filterParamList(fields *FieldList, filter Filter, export bool) bool](#filterParamList)
    * [func filterType(typ Expr, f Filter, export bool) bool](#filterType)
    * [func filterSpec(spec Spec, f Filter, export bool) bool](#filterSpec)
    * [func filterSpecList(list []Spec, f Filter, export bool) []Spec](#filterSpecList)
    * [func FilterDecl(decl Decl, f Filter) bool](#FilterDecl)
    * [func filterDecl(decl Decl, f Filter, export bool) bool](#filterDecl)
    * [func FilterFile(src *File, f Filter) bool](#FilterFile)
    * [func filterFile(src *File, f Filter, export bool) bool](#filterFile)
    * [func FilterPackage(pkg *Package, f Filter) bool](#FilterPackage)
    * [func filterPackage(pkg *Package, f Filter, export bool) bool](#filterPackage)
    * [func nameOf(f *FuncDecl) string](#nameOf)
    * [func SortImports(fset *token.FileSet, f *File)](#SortImports)
    * [func lineAt(fset *token.FileSet, pos token.Pos) int](#lineAt)
    * [func importPath(s Spec) string](#importPath)
    * [func importName(s Spec) string](#importName)
    * [func importComment(s Spec) string](#importComment)
    * [func collapse(prev, next Spec) bool](#collapse)
    * [func sortSpecs(fset *token.FileSet, f *File, specs []Spec) []Spec](#sortSpecs)
    * [func NotNilFilter(_ string, v reflect.Value) bool](#NotNilFilter)
    * [func Fprint(w io.Writer, fset *token.FileSet, x interface{}, f FieldFilter) error](#Fprint)
    * [func fprint(w io.Writer, fset *token.FileSet, x interface{}, f FieldFilter) (err error)](#fprint)
    * [func Print(fset *token.FileSet, x interface{}) error](#Print)
    * [func resolve(scope *Scope, ident *Ident) bool](#resolve)
    * [func walkIdentList(v Visitor, list []*Ident)](#walkIdentList)
    * [func walkExprList(v Visitor, list []Expr)](#walkExprList)
    * [func walkStmtList(v Visitor, list []Stmt)](#walkStmtList)
    * [func walkDeclList(v Visitor, list []Decl)](#walkDeclList)
    * [func Walk(v Visitor, node Node)](#Walk)
    * [func Inspect(node Node, f func(Node) bool)](#Inspect)
    * [func walkFuncTypeParams(v Visitor, n *FuncType)](#walkFuncTypeParams)
    * [func walkTypeSpecParams(v Visitor, n *TypeSpec)](#walkTypeSpecParams)
    * [func walkOtherNodes(v Visitor, n Node)](#walkOtherNodes)
    * [func TestCommentText(t *testing.T)](#TestCommentText)
    * [func TestIsDirective(t *testing.T)](#TestIsDirective)
    * [func trim(s string) string](#trim)
    * [func TestPrint(t *testing.T)](#TestPrint)


## <a id="const" href="#const">Constants</a>

### <a id="SEND" href="#SEND">const SEND</a>

```
searchKey: ast.SEND
```

```Go
const SEND ChanDir = 1 << iota
```

### <a id="RECV" href="#RECV">const RECV</a>

```
searchKey: ast.RECV
```

```Go
const RECV
```

### <a id="FilterFuncDuplicates" href="#FilterFuncDuplicates">const FilterFuncDuplicates</a>

```
searchKey: ast.FilterFuncDuplicates
```

```Go
const FilterFuncDuplicates MergeMode = 1 << iota
```

If set, duplicate function declarations are excluded. 

### <a id="FilterUnassociatedComments" href="#FilterUnassociatedComments">const FilterUnassociatedComments</a>

```
searchKey: ast.FilterUnassociatedComments
```

```Go
const FilterUnassociatedComments
```

If set, comments that are not associated with a specific AST node (as Doc or Comment) are excluded. 

### <a id="FilterImportDuplicates" href="#FilterImportDuplicates">const FilterImportDuplicates</a>

```
searchKey: ast.FilterImportDuplicates
```

```Go
const FilterImportDuplicates
```

If set, duplicate import declarations are excluded. 

### <a id="Bad" href="#Bad">const Bad</a>

```
searchKey: ast.Bad
```

```Go
const Bad ObjKind = iota // for error handling

```

The list of possible Object kinds. 

### <a id="Pkg" href="#Pkg">const Pkg</a>

```
searchKey: ast.Pkg
```

```Go
const Pkg // package

```

The list of possible Object kinds. 

### <a id="Con" href="#Con">const Con</a>

```
searchKey: ast.Con
```

```Go
const Con // constant

```

The list of possible Object kinds. 

### <a id="Typ" href="#Typ">const Typ</a>

```
searchKey: ast.Typ
```

```Go
const Typ // type

```

The list of possible Object kinds. 

### <a id="Var" href="#Var">const Var</a>

```
searchKey: ast.Var
```

```Go
const Var // variable

```

The list of possible Object kinds. 

### <a id="Fun" href="#Fun">const Fun</a>

```
searchKey: ast.Fun
```

```Go
const Fun // function or method

```

The list of possible Object kinds. 

### <a id="Lbl" href="#Lbl">const Lbl</a>

```
searchKey: ast.Lbl
```

```Go
const Lbl // label

```

The list of possible Object kinds. 

## <a id="var" href="#var">Variables</a>

### <a id="separator" href="#separator">var separator</a>

```
searchKey: ast.separator
tags: [private]
```

```Go
var separator = &Comment{token.NoPos, "//"}
```

separator is an empty //-style comment that is interspersed between different comment groups when they are concatenated into a single group 

### <a id="indent" href="#indent">var indent</a>

```
searchKey: ast.indent
tags: [private]
```

```Go
var indent = []byte(".  ")
```

### <a id="objKindStrings" href="#objKindStrings">var objKindStrings</a>

```
searchKey: ast.objKindStrings
tags: [private]
```

```Go
var objKindStrings = ...
```

### <a id="comments" href="#comments">var comments</a>

```
searchKey: ast.comments
tags: [private]
```

```Go
var comments = ...
```

### <a id="isDirectiveTests" href="#isDirectiveTests">var isDirectiveTests</a>

```
searchKey: ast.isDirectiveTests
tags: [private]
```

```Go
var isDirectiveTests = ...
```

### <a id="tests" href="#tests">var tests</a>

```
searchKey: ast.tests
tags: [private]
```

```Go
var tests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Node" href="#Node">type Node interface</a>

```
searchKey: ast.Node
```

```Go
type Node interface {
	Pos() token.Pos // position of first character belonging to the node
	End() token.Pos // position of first character immediately after the node
}
```

All node types implement the Node interface. 

### <a id="Expr" href="#Expr">type Expr interface</a>

```
searchKey: ast.Expr
```

```Go
type Expr interface {
	Node
	exprNode()
}
```

All expression nodes implement the Expr interface. 

### <a id="Stmt" href="#Stmt">type Stmt interface</a>

```
searchKey: ast.Stmt
```

```Go
type Stmt interface {
	Node
	stmtNode()
}
```

All statement nodes implement the Stmt interface. 

### <a id="Decl" href="#Decl">type Decl interface</a>

```
searchKey: ast.Decl
```

```Go
type Decl interface {
	Node
	declNode()
}
```

All declaration nodes implement the Decl interface. 

### <a id="Comment" href="#Comment">type Comment struct</a>

```
searchKey: ast.Comment
```

```Go
type Comment struct {
	Slash token.Pos // position of "/" starting the comment
	Text  string    // comment text (excluding '\n' for //-style comments)
}
```

A Comment node represents a single //-style or /*-style comment. 

The Text field contains the comment text without carriage returns (\r) that may have been present in the source. Because a comment's end position is computed using len(Text), the position reported by End() does not match the true source end position for comments containing carriage returns. 

#### <a id="Comment.Pos" href="#Comment.Pos">func (c *Comment) Pos() token.Pos</a>

```
searchKey: ast.Comment.Pos
```

```Go
func (c *Comment) Pos() token.Pos
```

#### <a id="Comment.End" href="#Comment.End">func (c *Comment) End() token.Pos</a>

```
searchKey: ast.Comment.End
```

```Go
func (c *Comment) End() token.Pos
```

### <a id="CommentGroup" href="#CommentGroup">type CommentGroup struct</a>

```
searchKey: ast.CommentGroup
```

```Go
type CommentGroup struct {
	List []*Comment // len(List) > 0
}
```

A CommentGroup represents a sequence of comments with no other tokens and no empty lines between. 

#### <a id="CommentGroup.Pos" href="#CommentGroup.Pos">func (g *CommentGroup) Pos() token.Pos</a>

```
searchKey: ast.CommentGroup.Pos
```

```Go
func (g *CommentGroup) Pos() token.Pos
```

#### <a id="CommentGroup.End" href="#CommentGroup.End">func (g *CommentGroup) End() token.Pos</a>

```
searchKey: ast.CommentGroup.End
```

```Go
func (g *CommentGroup) End() token.Pos
```

#### <a id="CommentGroup.Text" href="#CommentGroup.Text">func (g *CommentGroup) Text() string</a>

```
searchKey: ast.CommentGroup.Text
```

```Go
func (g *CommentGroup) Text() string
```

Text returns the text of the comment. Comment markers (//, /*, and */), the first space of a line comment, and leading and trailing empty lines are removed. Comment directives like "//line" and "//go:noinline" are also removed. Multiple empty lines are reduced to one, and trailing space on lines is trimmed. Unless the result is empty, it is newline-terminated. 

### <a id="Field" href="#Field">type Field struct</a>

```
searchKey: ast.Field
```

```Go
type Field struct {
	Doc     *CommentGroup // associated documentation; or nil
	Names   []*Ident      // field/method/(type) parameter names, or type "type"; or nil
	Type    Expr          // field/method/parameter type, type list type; or nil
	Tag     *BasicLit     // field tag; or nil
	Comment *CommentGroup // line comments; or nil
}
```

A Field represents a Field declaration list in a struct type, a method list in an interface type, or a parameter/result declaration in a signature. Field.Names is nil for unnamed parameters (parameter lists which only contain types) and embedded struct fields. In the latter case, the field name is the type name. Field.Names contains a single name "type" for elements of interface type lists. Types belonging to the same type list share the same "type" identifier which also records the position of that keyword. 

#### <a id="Field.Pos" href="#Field.Pos">func (f *Field) Pos() token.Pos</a>

```
searchKey: ast.Field.Pos
```

```Go
func (f *Field) Pos() token.Pos
```

#### <a id="Field.End" href="#Field.End">func (f *Field) End() token.Pos</a>

```
searchKey: ast.Field.End
```

```Go
func (f *Field) End() token.Pos
```

### <a id="FieldList" href="#FieldList">type FieldList struct</a>

```
searchKey: ast.FieldList
```

```Go
type FieldList struct {
	Opening token.Pos // position of opening parenthesis/brace, if any
	List    []*Field  // field list; or nil
	Closing token.Pos // position of closing parenthesis/brace, if any
}
```

A FieldList represents a list of Fields, enclosed by parentheses or braces. 

#### <a id="FieldList.Pos" href="#FieldList.Pos">func (f *FieldList) Pos() token.Pos</a>

```
searchKey: ast.FieldList.Pos
```

```Go
func (f *FieldList) Pos() token.Pos
```

#### <a id="FieldList.End" href="#FieldList.End">func (f *FieldList) End() token.Pos</a>

```
searchKey: ast.FieldList.End
```

```Go
func (f *FieldList) End() token.Pos
```

#### <a id="FieldList.NumFields" href="#FieldList.NumFields">func (f *FieldList) NumFields() int</a>

```
searchKey: ast.FieldList.NumFields
```

```Go
func (f *FieldList) NumFields() int
```

NumFields returns the number of parameters or struct fields represented by a FieldList. 

### <a id="BadExpr" href="#BadExpr">type BadExpr struct</a>

```
searchKey: ast.BadExpr
```

```Go
type BadExpr struct {
	From, To token.Pos // position range of bad expression
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A BadExpr node is a placeholder for an expression containing syntax errors for which a correct expression node cannot be created. 

#### <a id="BadExpr.Pos" href="#BadExpr.Pos">func (x *BadExpr) Pos() token.Pos</a>

```
searchKey: ast.BadExpr.Pos
```

```Go
func (x *BadExpr) Pos() token.Pos
```

#### <a id="BadExpr.End" href="#BadExpr.End">func (x *BadExpr) End() token.Pos</a>

```
searchKey: ast.BadExpr.End
```

```Go
func (x *BadExpr) End() token.Pos
```

#### <a id="BadExpr.exprNode" href="#BadExpr.exprNode">func (*BadExpr) exprNode()</a>

```
searchKey: ast.BadExpr.exprNode
tags: [private]
```

```Go
func (*BadExpr) exprNode()
```

exprNode() ensures that only expression/type nodes can be assigned to an Expr. 

### <a id="Ident" href="#Ident">type Ident struct</a>

```
searchKey: ast.Ident
```

```Go
type Ident struct {
	NamePos token.Pos // identifier position
	Name    string    // identifier name
	Obj     *Object   // denoted object; or nil
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

An Ident node represents an identifier. 

#### <a id="NewIdent" href="#NewIdent">func NewIdent(name string) *Ident</a>

```
searchKey: ast.NewIdent
```

```Go
func NewIdent(name string) *Ident
```

NewIdent creates a new Ident without position. Useful for ASTs generated by code other than the Go parser. 

#### <a id="fieldName" href="#fieldName">func fieldName(x Expr) *Ident</a>

```
searchKey: ast.fieldName
tags: [private]
```

```Go
func fieldName(x Expr) *Ident
```

fieldName assumes that x is the type of an anonymous field and returns the corresponding field name. If x is not an acceptable anonymous field, the result is nil. 

#### <a id="Ident.Pos" href="#Ident.Pos">func (x *Ident) Pos() token.Pos</a>

```
searchKey: ast.Ident.Pos
```

```Go
func (x *Ident) Pos() token.Pos
```

#### <a id="Ident.End" href="#Ident.End">func (x *Ident) End() token.Pos</a>

```
searchKey: ast.Ident.End
```

```Go
func (x *Ident) End() token.Pos
```

#### <a id="Ident.exprNode" href="#Ident.exprNode">func (*Ident) exprNode()</a>

```
searchKey: ast.Ident.exprNode
tags: [private]
```

```Go
func (*Ident) exprNode()
```

#### <a id="Ident.IsExported" href="#Ident.IsExported">func (id *Ident) IsExported() bool</a>

```
searchKey: ast.Ident.IsExported
```

```Go
func (id *Ident) IsExported() bool
```

IsExported reports whether id starts with an upper-case letter. 

#### <a id="Ident.String" href="#Ident.String">func (id *Ident) String() string</a>

```
searchKey: ast.Ident.String
```

```Go
func (id *Ident) String() string
```

### <a id="Ellipsis" href="#Ellipsis">type Ellipsis struct</a>

```
searchKey: ast.Ellipsis
```

```Go
type Ellipsis struct {
	Ellipsis token.Pos // position of "..."
	Elt      Expr      // ellipsis element type (parameter lists only); or nil
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

An Ellipsis node stands for the "..." type in a parameter list or the "..." length in an array type. 

#### <a id="Ellipsis.Pos" href="#Ellipsis.Pos">func (x *Ellipsis) Pos() token.Pos</a>

```
searchKey: ast.Ellipsis.Pos
```

```Go
func (x *Ellipsis) Pos() token.Pos
```

#### <a id="Ellipsis.End" href="#Ellipsis.End">func (x *Ellipsis) End() token.Pos</a>

```
searchKey: ast.Ellipsis.End
```

```Go
func (x *Ellipsis) End() token.Pos
```

#### <a id="Ellipsis.exprNode" href="#Ellipsis.exprNode">func (*Ellipsis) exprNode()</a>

```
searchKey: ast.Ellipsis.exprNode
tags: [private]
```

```Go
func (*Ellipsis) exprNode()
```

### <a id="BasicLit" href="#BasicLit">type BasicLit struct</a>

```
searchKey: ast.BasicLit
```

```Go
type BasicLit struct {
	ValuePos token.Pos   // literal position
	Kind     token.Token // token.INT, token.FLOAT, token.IMAG, token.CHAR, or token.STRING
	Value    string      // literal string; e.g. 42, 0x7f, 3.14, 1e-9, 2.4i, 'a', '\x7f', "foo" or `\m\n\o`
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A BasicLit node represents a literal of basic type. 

#### <a id="BasicLit.Pos" href="#BasicLit.Pos">func (x *BasicLit) Pos() token.Pos</a>

```
searchKey: ast.BasicLit.Pos
```

```Go
func (x *BasicLit) Pos() token.Pos
```

#### <a id="BasicLit.End" href="#BasicLit.End">func (x *BasicLit) End() token.Pos</a>

```
searchKey: ast.BasicLit.End
```

```Go
func (x *BasicLit) End() token.Pos
```

#### <a id="BasicLit.exprNode" href="#BasicLit.exprNode">func (*BasicLit) exprNode()</a>

```
searchKey: ast.BasicLit.exprNode
tags: [private]
```

```Go
func (*BasicLit) exprNode()
```

### <a id="FuncLit" href="#FuncLit">type FuncLit struct</a>

```
searchKey: ast.FuncLit
```

```Go
type FuncLit struct {
	Type *FuncType  // function type
	Body *BlockStmt // function body
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A FuncLit node represents a function literal. 

#### <a id="FuncLit.Pos" href="#FuncLit.Pos">func (x *FuncLit) Pos() token.Pos</a>

```
searchKey: ast.FuncLit.Pos
```

```Go
func (x *FuncLit) Pos() token.Pos
```

#### <a id="FuncLit.End" href="#FuncLit.End">func (x *FuncLit) End() token.Pos</a>

```
searchKey: ast.FuncLit.End
```

```Go
func (x *FuncLit) End() token.Pos
```

#### <a id="FuncLit.exprNode" href="#FuncLit.exprNode">func (*FuncLit) exprNode()</a>

```
searchKey: ast.FuncLit.exprNode
tags: [private]
```

```Go
func (*FuncLit) exprNode()
```

### <a id="CompositeLit" href="#CompositeLit">type CompositeLit struct</a>

```
searchKey: ast.CompositeLit
```

```Go
type CompositeLit struct {
	Type       Expr      // literal type; or nil
	Lbrace     token.Pos // position of "{"
	Elts       []Expr    // list of composite elements; or nil
	Rbrace     token.Pos // position of "}"
	Incomplete bool      // true if (source) expressions are missing in the Elts list
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A CompositeLit node represents a composite literal. 

#### <a id="CompositeLit.Pos" href="#CompositeLit.Pos">func (x *CompositeLit) Pos() token.Pos</a>

```
searchKey: ast.CompositeLit.Pos
```

```Go
func (x *CompositeLit) Pos() token.Pos
```

#### <a id="CompositeLit.End" href="#CompositeLit.End">func (x *CompositeLit) End() token.Pos</a>

```
searchKey: ast.CompositeLit.End
```

```Go
func (x *CompositeLit) End() token.Pos
```

#### <a id="CompositeLit.exprNode" href="#CompositeLit.exprNode">func (*CompositeLit) exprNode()</a>

```
searchKey: ast.CompositeLit.exprNode
tags: [private]
```

```Go
func (*CompositeLit) exprNode()
```

### <a id="ParenExpr" href="#ParenExpr">type ParenExpr struct</a>

```
searchKey: ast.ParenExpr
```

```Go
type ParenExpr struct {
	Lparen token.Pos // position of "("
	X      Expr      // parenthesized expression
	Rparen token.Pos // position of ")"
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A ParenExpr node represents a parenthesized expression. 

#### <a id="ParenExpr.Pos" href="#ParenExpr.Pos">func (x *ParenExpr) Pos() token.Pos</a>

```
searchKey: ast.ParenExpr.Pos
```

```Go
func (x *ParenExpr) Pos() token.Pos
```

#### <a id="ParenExpr.End" href="#ParenExpr.End">func (x *ParenExpr) End() token.Pos</a>

```
searchKey: ast.ParenExpr.End
```

```Go
func (x *ParenExpr) End() token.Pos
```

#### <a id="ParenExpr.exprNode" href="#ParenExpr.exprNode">func (*ParenExpr) exprNode()</a>

```
searchKey: ast.ParenExpr.exprNode
tags: [private]
```

```Go
func (*ParenExpr) exprNode()
```

### <a id="SelectorExpr" href="#SelectorExpr">type SelectorExpr struct</a>

```
searchKey: ast.SelectorExpr
```

```Go
type SelectorExpr struct {
	X   Expr   // expression
	Sel *Ident // field selector
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A SelectorExpr node represents an expression followed by a selector. 

#### <a id="SelectorExpr.Pos" href="#SelectorExpr.Pos">func (x *SelectorExpr) Pos() token.Pos</a>

```
searchKey: ast.SelectorExpr.Pos
```

```Go
func (x *SelectorExpr) Pos() token.Pos
```

#### <a id="SelectorExpr.End" href="#SelectorExpr.End">func (x *SelectorExpr) End() token.Pos</a>

```
searchKey: ast.SelectorExpr.End
```

```Go
func (x *SelectorExpr) End() token.Pos
```

#### <a id="SelectorExpr.exprNode" href="#SelectorExpr.exprNode">func (*SelectorExpr) exprNode()</a>

```
searchKey: ast.SelectorExpr.exprNode
tags: [private]
```

```Go
func (*SelectorExpr) exprNode()
```

### <a id="IndexExpr" href="#IndexExpr">type IndexExpr struct</a>

```
searchKey: ast.IndexExpr
```

```Go
type IndexExpr struct {
	X      Expr      // expression
	Lbrack token.Pos // position of "["
	Index  Expr      // index expression
	Rbrack token.Pos // position of "]"
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

An IndexExpr node represents an expression followed by an index. 

#### <a id="IndexExpr.Pos" href="#IndexExpr.Pos">func (x *IndexExpr) Pos() token.Pos</a>

```
searchKey: ast.IndexExpr.Pos
```

```Go
func (x *IndexExpr) Pos() token.Pos
```

#### <a id="IndexExpr.End" href="#IndexExpr.End">func (x *IndexExpr) End() token.Pos</a>

```
searchKey: ast.IndexExpr.End
```

```Go
func (x *IndexExpr) End() token.Pos
```

#### <a id="IndexExpr.exprNode" href="#IndexExpr.exprNode">func (*IndexExpr) exprNode()</a>

```
searchKey: ast.IndexExpr.exprNode
tags: [private]
```

```Go
func (*IndexExpr) exprNode()
```

### <a id="SliceExpr" href="#SliceExpr">type SliceExpr struct</a>

```
searchKey: ast.SliceExpr
```

```Go
type SliceExpr struct {
	X      Expr      // expression
	Lbrack token.Pos // position of "["
	Low    Expr      // begin of slice range; or nil
	High   Expr      // end of slice range; or nil
	Max    Expr      // maximum capacity of slice; or nil
	Slice3 bool      // true if 3-index slice (2 colons present)
	Rbrack token.Pos // position of "]"
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A SliceExpr node represents an expression followed by slice indices. 

#### <a id="SliceExpr.Pos" href="#SliceExpr.Pos">func (x *SliceExpr) Pos() token.Pos</a>

```
searchKey: ast.SliceExpr.Pos
```

```Go
func (x *SliceExpr) Pos() token.Pos
```

#### <a id="SliceExpr.End" href="#SliceExpr.End">func (x *SliceExpr) End() token.Pos</a>

```
searchKey: ast.SliceExpr.End
```

```Go
func (x *SliceExpr) End() token.Pos
```

#### <a id="SliceExpr.exprNode" href="#SliceExpr.exprNode">func (*SliceExpr) exprNode()</a>

```
searchKey: ast.SliceExpr.exprNode
tags: [private]
```

```Go
func (*SliceExpr) exprNode()
```

### <a id="TypeAssertExpr" href="#TypeAssertExpr">type TypeAssertExpr struct</a>

```
searchKey: ast.TypeAssertExpr
```

```Go
type TypeAssertExpr struct {
	X      Expr      // expression
	Lparen token.Pos // position of "("
	Type   Expr      // asserted type; nil means type switch X.(type)
	Rparen token.Pos // position of ")"
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A TypeAssertExpr node represents an expression followed by a type assertion. 

#### <a id="TypeAssertExpr.Pos" href="#TypeAssertExpr.Pos">func (x *TypeAssertExpr) Pos() token.Pos</a>

```
searchKey: ast.TypeAssertExpr.Pos
```

```Go
func (x *TypeAssertExpr) Pos() token.Pos
```

#### <a id="TypeAssertExpr.End" href="#TypeAssertExpr.End">func (x *TypeAssertExpr) End() token.Pos</a>

```
searchKey: ast.TypeAssertExpr.End
```

```Go
func (x *TypeAssertExpr) End() token.Pos
```

#### <a id="TypeAssertExpr.exprNode" href="#TypeAssertExpr.exprNode">func (*TypeAssertExpr) exprNode()</a>

```
searchKey: ast.TypeAssertExpr.exprNode
tags: [private]
```

```Go
func (*TypeAssertExpr) exprNode()
```

### <a id="CallExpr" href="#CallExpr">type CallExpr struct</a>

```
searchKey: ast.CallExpr
```

```Go
type CallExpr struct {
	Fun      Expr      // function expression
	Lparen   token.Pos // position of "("
	Args     []Expr    // function arguments; or nil
	Ellipsis token.Pos // position of "..." (token.NoPos if there is no "...")
	Rparen   token.Pos // position of ")"
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A CallExpr node represents an expression followed by an argument list. 

#### <a id="CallExpr.Pos" href="#CallExpr.Pos">func (x *CallExpr) Pos() token.Pos</a>

```
searchKey: ast.CallExpr.Pos
```

```Go
func (x *CallExpr) Pos() token.Pos
```

#### <a id="CallExpr.End" href="#CallExpr.End">func (x *CallExpr) End() token.Pos</a>

```
searchKey: ast.CallExpr.End
```

```Go
func (x *CallExpr) End() token.Pos
```

#### <a id="CallExpr.exprNode" href="#CallExpr.exprNode">func (*CallExpr) exprNode()</a>

```
searchKey: ast.CallExpr.exprNode
tags: [private]
```

```Go
func (*CallExpr) exprNode()
```

### <a id="StarExpr" href="#StarExpr">type StarExpr struct</a>

```
searchKey: ast.StarExpr
```

```Go
type StarExpr struct {
	Star token.Pos // position of "*"
	X    Expr      // operand
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A StarExpr node represents an expression of the form "*" Expression. Semantically it could be a unary "*" expression, or a pointer type. 

#### <a id="StarExpr.Pos" href="#StarExpr.Pos">func (x *StarExpr) Pos() token.Pos</a>

```
searchKey: ast.StarExpr.Pos
```

```Go
func (x *StarExpr) Pos() token.Pos
```

#### <a id="StarExpr.End" href="#StarExpr.End">func (x *StarExpr) End() token.Pos</a>

```
searchKey: ast.StarExpr.End
```

```Go
func (x *StarExpr) End() token.Pos
```

#### <a id="StarExpr.exprNode" href="#StarExpr.exprNode">func (*StarExpr) exprNode()</a>

```
searchKey: ast.StarExpr.exprNode
tags: [private]
```

```Go
func (*StarExpr) exprNode()
```

### <a id="UnaryExpr" href="#UnaryExpr">type UnaryExpr struct</a>

```
searchKey: ast.UnaryExpr
```

```Go
type UnaryExpr struct {
	OpPos token.Pos   // position of Op
	Op    token.Token // operator
	X     Expr        // operand
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A UnaryExpr node represents a unary expression. Unary "*" expressions are represented via StarExpr nodes. 

#### <a id="UnaryExpr.Pos" href="#UnaryExpr.Pos">func (x *UnaryExpr) Pos() token.Pos</a>

```
searchKey: ast.UnaryExpr.Pos
```

```Go
func (x *UnaryExpr) Pos() token.Pos
```

#### <a id="UnaryExpr.End" href="#UnaryExpr.End">func (x *UnaryExpr) End() token.Pos</a>

```
searchKey: ast.UnaryExpr.End
```

```Go
func (x *UnaryExpr) End() token.Pos
```

#### <a id="UnaryExpr.exprNode" href="#UnaryExpr.exprNode">func (*UnaryExpr) exprNode()</a>

```
searchKey: ast.UnaryExpr.exprNode
tags: [private]
```

```Go
func (*UnaryExpr) exprNode()
```

### <a id="BinaryExpr" href="#BinaryExpr">type BinaryExpr struct</a>

```
searchKey: ast.BinaryExpr
```

```Go
type BinaryExpr struct {
	X     Expr        // left operand
	OpPos token.Pos   // position of Op
	Op    token.Token // operator
	Y     Expr        // right operand
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A BinaryExpr node represents a binary expression. 

#### <a id="BinaryExpr.Pos" href="#BinaryExpr.Pos">func (x *BinaryExpr) Pos() token.Pos</a>

```
searchKey: ast.BinaryExpr.Pos
```

```Go
func (x *BinaryExpr) Pos() token.Pos
```

#### <a id="BinaryExpr.End" href="#BinaryExpr.End">func (x *BinaryExpr) End() token.Pos</a>

```
searchKey: ast.BinaryExpr.End
```

```Go
func (x *BinaryExpr) End() token.Pos
```

#### <a id="BinaryExpr.exprNode" href="#BinaryExpr.exprNode">func (*BinaryExpr) exprNode()</a>

```
searchKey: ast.BinaryExpr.exprNode
tags: [private]
```

```Go
func (*BinaryExpr) exprNode()
```

### <a id="KeyValueExpr" href="#KeyValueExpr">type KeyValueExpr struct</a>

```
searchKey: ast.KeyValueExpr
```

```Go
type KeyValueExpr struct {
	Key   Expr
	Colon token.Pos // position of ":"
	Value Expr
}
```

An expression is represented by a tree consisting of one or more of the following concrete expression nodes. 

A KeyValueExpr node represents (key : value) pairs in composite literals. 

#### <a id="KeyValueExpr.Pos" href="#KeyValueExpr.Pos">func (x *KeyValueExpr) Pos() token.Pos</a>

```
searchKey: ast.KeyValueExpr.Pos
```

```Go
func (x *KeyValueExpr) Pos() token.Pos
```

#### <a id="KeyValueExpr.End" href="#KeyValueExpr.End">func (x *KeyValueExpr) End() token.Pos</a>

```
searchKey: ast.KeyValueExpr.End
```

```Go
func (x *KeyValueExpr) End() token.Pos
```

#### <a id="KeyValueExpr.exprNode" href="#KeyValueExpr.exprNode">func (*KeyValueExpr) exprNode()</a>

```
searchKey: ast.KeyValueExpr.exprNode
tags: [private]
```

```Go
func (*KeyValueExpr) exprNode()
```

### <a id="ChanDir" href="#ChanDir">type ChanDir int</a>

```
searchKey: ast.ChanDir
```

```Go
type ChanDir int
```

The direction of a channel type is indicated by a bit mask including one or both of the following constants. 

### <a id="ArrayType" href="#ArrayType">type ArrayType struct</a>

```
searchKey: ast.ArrayType
```

```Go
type ArrayType struct {
	Lbrack token.Pos // position of "["
	Len    Expr      // Ellipsis node for [...]T array types, nil for slice types
	Elt    Expr      // element type
}
```

A type is represented by a tree consisting of one or more of the following type-specific expression nodes. 

An ArrayType node represents an array or slice type. 

#### <a id="ArrayType.Pos" href="#ArrayType.Pos">func (x *ArrayType) Pos() token.Pos</a>

```
searchKey: ast.ArrayType.Pos
```

```Go
func (x *ArrayType) Pos() token.Pos
```

#### <a id="ArrayType.End" href="#ArrayType.End">func (x *ArrayType) End() token.Pos</a>

```
searchKey: ast.ArrayType.End
```

```Go
func (x *ArrayType) End() token.Pos
```

#### <a id="ArrayType.exprNode" href="#ArrayType.exprNode">func (*ArrayType) exprNode()</a>

```
searchKey: ast.ArrayType.exprNode
tags: [private]
```

```Go
func (*ArrayType) exprNode()
```

### <a id="StructType" href="#StructType">type StructType struct</a>

```
searchKey: ast.StructType
```

```Go
type StructType struct {
	Struct     token.Pos  // position of "struct" keyword
	Fields     *FieldList // list of field declarations
	Incomplete bool       // true if (source) fields are missing in the Fields list
}
```

A type is represented by a tree consisting of one or more of the following type-specific expression nodes. 

A StructType node represents a struct type. 

#### <a id="StructType.Pos" href="#StructType.Pos">func (x *StructType) Pos() token.Pos</a>

```
searchKey: ast.StructType.Pos
```

```Go
func (x *StructType) Pos() token.Pos
```

#### <a id="StructType.End" href="#StructType.End">func (x *StructType) End() token.Pos</a>

```
searchKey: ast.StructType.End
```

```Go
func (x *StructType) End() token.Pos
```

#### <a id="StructType.exprNode" href="#StructType.exprNode">func (*StructType) exprNode()</a>

```
searchKey: ast.StructType.exprNode
tags: [private]
```

```Go
func (*StructType) exprNode()
```

### <a id="InterfaceType" href="#InterfaceType">type InterfaceType struct</a>

```
searchKey: ast.InterfaceType
```

```Go
type InterfaceType struct {
	Interface  token.Pos  // position of "interface" keyword
	Methods    *FieldList // list of embedded interfaces, methods, or types
	Incomplete bool       // true if (source) methods or types are missing in the Methods list
}
```

A type is represented by a tree consisting of one or more of the following type-specific expression nodes. 

An InterfaceType node represents an interface type. 

#### <a id="InterfaceType.Pos" href="#InterfaceType.Pos">func (x *InterfaceType) Pos() token.Pos</a>

```
searchKey: ast.InterfaceType.Pos
```

```Go
func (x *InterfaceType) Pos() token.Pos
```

#### <a id="InterfaceType.End" href="#InterfaceType.End">func (x *InterfaceType) End() token.Pos</a>

```
searchKey: ast.InterfaceType.End
```

```Go
func (x *InterfaceType) End() token.Pos
```

#### <a id="InterfaceType.exprNode" href="#InterfaceType.exprNode">func (*InterfaceType) exprNode()</a>

```
searchKey: ast.InterfaceType.exprNode
tags: [private]
```

```Go
func (*InterfaceType) exprNode()
```

### <a id="MapType" href="#MapType">type MapType struct</a>

```
searchKey: ast.MapType
```

```Go
type MapType struct {
	Map   token.Pos // position of "map" keyword
	Key   Expr
	Value Expr
}
```

A type is represented by a tree consisting of one or more of the following type-specific expression nodes. 

A MapType node represents a map type. 

#### <a id="MapType.Pos" href="#MapType.Pos">func (x *MapType) Pos() token.Pos</a>

```
searchKey: ast.MapType.Pos
```

```Go
func (x *MapType) Pos() token.Pos
```

#### <a id="MapType.End" href="#MapType.End">func (x *MapType) End() token.Pos</a>

```
searchKey: ast.MapType.End
```

```Go
func (x *MapType) End() token.Pos
```

#### <a id="MapType.exprNode" href="#MapType.exprNode">func (*MapType) exprNode()</a>

```
searchKey: ast.MapType.exprNode
tags: [private]
```

```Go
func (*MapType) exprNode()
```

### <a id="ChanType" href="#ChanType">type ChanType struct</a>

```
searchKey: ast.ChanType
```

```Go
type ChanType struct {
	Begin token.Pos // position of "chan" keyword or "<-" (whichever comes first)
	Arrow token.Pos // position of "<-" (token.NoPos if there is no "<-")
	Dir   ChanDir   // channel direction
	Value Expr      // value type
}
```

A type is represented by a tree consisting of one or more of the following type-specific expression nodes. 

A ChanType node represents a channel type. 

#### <a id="ChanType.Pos" href="#ChanType.Pos">func (x *ChanType) Pos() token.Pos</a>

```
searchKey: ast.ChanType.Pos
```

```Go
func (x *ChanType) Pos() token.Pos
```

#### <a id="ChanType.End" href="#ChanType.End">func (x *ChanType) End() token.Pos</a>

```
searchKey: ast.ChanType.End
```

```Go
func (x *ChanType) End() token.Pos
```

#### <a id="ChanType.exprNode" href="#ChanType.exprNode">func (*ChanType) exprNode()</a>

```
searchKey: ast.ChanType.exprNode
tags: [private]
```

```Go
func (*ChanType) exprNode()
```

### <a id="BadStmt" href="#BadStmt">type BadStmt struct</a>

```
searchKey: ast.BadStmt
```

```Go
type BadStmt struct {
	From, To token.Pos // position range of bad statement
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A BadStmt node is a placeholder for statements containing syntax errors for which no correct statement nodes can be created. 

#### <a id="BadStmt.Pos" href="#BadStmt.Pos">func (s *BadStmt) Pos() token.Pos</a>

```
searchKey: ast.BadStmt.Pos
```

```Go
func (s *BadStmt) Pos() token.Pos
```

#### <a id="BadStmt.End" href="#BadStmt.End">func (s *BadStmt) End() token.Pos</a>

```
searchKey: ast.BadStmt.End
```

```Go
func (s *BadStmt) End() token.Pos
```

#### <a id="BadStmt.stmtNode" href="#BadStmt.stmtNode">func (*BadStmt) stmtNode()</a>

```
searchKey: ast.BadStmt.stmtNode
tags: [private]
```

```Go
func (*BadStmt) stmtNode()
```

stmtNode() ensures that only statement nodes can be assigned to a Stmt. 

### <a id="DeclStmt" href="#DeclStmt">type DeclStmt struct</a>

```
searchKey: ast.DeclStmt
```

```Go
type DeclStmt struct {
	Decl Decl // *GenDecl with CONST, TYPE, or VAR token
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A DeclStmt node represents a declaration in a statement list. 

#### <a id="DeclStmt.Pos" href="#DeclStmt.Pos">func (s *DeclStmt) Pos() token.Pos</a>

```
searchKey: ast.DeclStmt.Pos
```

```Go
func (s *DeclStmt) Pos() token.Pos
```

#### <a id="DeclStmt.End" href="#DeclStmt.End">func (s *DeclStmt) End() token.Pos</a>

```
searchKey: ast.DeclStmt.End
```

```Go
func (s *DeclStmt) End() token.Pos
```

#### <a id="DeclStmt.stmtNode" href="#DeclStmt.stmtNode">func (*DeclStmt) stmtNode()</a>

```
searchKey: ast.DeclStmt.stmtNode
tags: [private]
```

```Go
func (*DeclStmt) stmtNode()
```

### <a id="EmptyStmt" href="#EmptyStmt">type EmptyStmt struct</a>

```
searchKey: ast.EmptyStmt
```

```Go
type EmptyStmt struct {
	Semicolon token.Pos // position of following ";"
	Implicit  bool      // if set, ";" was omitted in the source
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

An EmptyStmt node represents an empty statement. The "position" of the empty statement is the position of the immediately following (explicit or implicit) semicolon. 

#### <a id="EmptyStmt.Pos" href="#EmptyStmt.Pos">func (s *EmptyStmt) Pos() token.Pos</a>

```
searchKey: ast.EmptyStmt.Pos
```

```Go
func (s *EmptyStmt) Pos() token.Pos
```

#### <a id="EmptyStmt.End" href="#EmptyStmt.End">func (s *EmptyStmt) End() token.Pos</a>

```
searchKey: ast.EmptyStmt.End
```

```Go
func (s *EmptyStmt) End() token.Pos
```

#### <a id="EmptyStmt.stmtNode" href="#EmptyStmt.stmtNode">func (*EmptyStmt) stmtNode()</a>

```
searchKey: ast.EmptyStmt.stmtNode
tags: [private]
```

```Go
func (*EmptyStmt) stmtNode()
```

### <a id="LabeledStmt" href="#LabeledStmt">type LabeledStmt struct</a>

```
searchKey: ast.LabeledStmt
```

```Go
type LabeledStmt struct {
	Label *Ident
	Colon token.Pos // position of ":"
	Stmt  Stmt
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A LabeledStmt node represents a labeled statement. 

#### <a id="LabeledStmt.Pos" href="#LabeledStmt.Pos">func (s *LabeledStmt) Pos() token.Pos</a>

```
searchKey: ast.LabeledStmt.Pos
```

```Go
func (s *LabeledStmt) Pos() token.Pos
```

#### <a id="LabeledStmt.End" href="#LabeledStmt.End">func (s *LabeledStmt) End() token.Pos</a>

```
searchKey: ast.LabeledStmt.End
```

```Go
func (s *LabeledStmt) End() token.Pos
```

#### <a id="LabeledStmt.stmtNode" href="#LabeledStmt.stmtNode">func (*LabeledStmt) stmtNode()</a>

```
searchKey: ast.LabeledStmt.stmtNode
tags: [private]
```

```Go
func (*LabeledStmt) stmtNode()
```

### <a id="ExprStmt" href="#ExprStmt">type ExprStmt struct</a>

```
searchKey: ast.ExprStmt
```

```Go
type ExprStmt struct {
	X Expr // expression
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

An ExprStmt node represents a (stand-alone) expression in a statement list. 

#### <a id="ExprStmt.Pos" href="#ExprStmt.Pos">func (s *ExprStmt) Pos() token.Pos</a>

```
searchKey: ast.ExprStmt.Pos
```

```Go
func (s *ExprStmt) Pos() token.Pos
```

#### <a id="ExprStmt.End" href="#ExprStmt.End">func (s *ExprStmt) End() token.Pos</a>

```
searchKey: ast.ExprStmt.End
```

```Go
func (s *ExprStmt) End() token.Pos
```

#### <a id="ExprStmt.stmtNode" href="#ExprStmt.stmtNode">func (*ExprStmt) stmtNode()</a>

```
searchKey: ast.ExprStmt.stmtNode
tags: [private]
```

```Go
func (*ExprStmt) stmtNode()
```

### <a id="SendStmt" href="#SendStmt">type SendStmt struct</a>

```
searchKey: ast.SendStmt
```

```Go
type SendStmt struct {
	Chan  Expr
	Arrow token.Pos // position of "<-"
	Value Expr
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A SendStmt node represents a send statement. 

#### <a id="SendStmt.Pos" href="#SendStmt.Pos">func (s *SendStmt) Pos() token.Pos</a>

```
searchKey: ast.SendStmt.Pos
```

```Go
func (s *SendStmt) Pos() token.Pos
```

#### <a id="SendStmt.End" href="#SendStmt.End">func (s *SendStmt) End() token.Pos</a>

```
searchKey: ast.SendStmt.End
```

```Go
func (s *SendStmt) End() token.Pos
```

#### <a id="SendStmt.stmtNode" href="#SendStmt.stmtNode">func (*SendStmt) stmtNode()</a>

```
searchKey: ast.SendStmt.stmtNode
tags: [private]
```

```Go
func (*SendStmt) stmtNode()
```

### <a id="IncDecStmt" href="#IncDecStmt">type IncDecStmt struct</a>

```
searchKey: ast.IncDecStmt
```

```Go
type IncDecStmt struct {
	X      Expr
	TokPos token.Pos   // position of Tok
	Tok    token.Token // INC or DEC
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

An IncDecStmt node represents an increment or decrement statement. 

#### <a id="IncDecStmt.Pos" href="#IncDecStmt.Pos">func (s *IncDecStmt) Pos() token.Pos</a>

```
searchKey: ast.IncDecStmt.Pos
```

```Go
func (s *IncDecStmt) Pos() token.Pos
```

#### <a id="IncDecStmt.End" href="#IncDecStmt.End">func (s *IncDecStmt) End() token.Pos</a>

```
searchKey: ast.IncDecStmt.End
```

```Go
func (s *IncDecStmt) End() token.Pos
```

#### <a id="IncDecStmt.stmtNode" href="#IncDecStmt.stmtNode">func (*IncDecStmt) stmtNode()</a>

```
searchKey: ast.IncDecStmt.stmtNode
tags: [private]
```

```Go
func (*IncDecStmt) stmtNode()
```

### <a id="AssignStmt" href="#AssignStmt">type AssignStmt struct</a>

```
searchKey: ast.AssignStmt
```

```Go
type AssignStmt struct {
	Lhs    []Expr
	TokPos token.Pos   // position of Tok
	Tok    token.Token // assignment token, DEFINE
	Rhs    []Expr
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

An AssignStmt node represents an assignment or a short variable declaration. 

#### <a id="AssignStmt.Pos" href="#AssignStmt.Pos">func (s *AssignStmt) Pos() token.Pos</a>

```
searchKey: ast.AssignStmt.Pos
```

```Go
func (s *AssignStmt) Pos() token.Pos
```

#### <a id="AssignStmt.End" href="#AssignStmt.End">func (s *AssignStmt) End() token.Pos</a>

```
searchKey: ast.AssignStmt.End
```

```Go
func (s *AssignStmt) End() token.Pos
```

#### <a id="AssignStmt.stmtNode" href="#AssignStmt.stmtNode">func (*AssignStmt) stmtNode()</a>

```
searchKey: ast.AssignStmt.stmtNode
tags: [private]
```

```Go
func (*AssignStmt) stmtNode()
```

### <a id="GoStmt" href="#GoStmt">type GoStmt struct</a>

```
searchKey: ast.GoStmt
```

```Go
type GoStmt struct {
	Go   token.Pos // position of "go" keyword
	Call *CallExpr
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A GoStmt node represents a go statement. 

#### <a id="GoStmt.Pos" href="#GoStmt.Pos">func (s *GoStmt) Pos() token.Pos</a>

```
searchKey: ast.GoStmt.Pos
```

```Go
func (s *GoStmt) Pos() token.Pos
```

#### <a id="GoStmt.End" href="#GoStmt.End">func (s *GoStmt) End() token.Pos</a>

```
searchKey: ast.GoStmt.End
```

```Go
func (s *GoStmt) End() token.Pos
```

#### <a id="GoStmt.stmtNode" href="#GoStmt.stmtNode">func (*GoStmt) stmtNode()</a>

```
searchKey: ast.GoStmt.stmtNode
tags: [private]
```

```Go
func (*GoStmt) stmtNode()
```

### <a id="DeferStmt" href="#DeferStmt">type DeferStmt struct</a>

```
searchKey: ast.DeferStmt
```

```Go
type DeferStmt struct {
	Defer token.Pos // position of "defer" keyword
	Call  *CallExpr
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A DeferStmt node represents a defer statement. 

#### <a id="DeferStmt.Pos" href="#DeferStmt.Pos">func (s *DeferStmt) Pos() token.Pos</a>

```
searchKey: ast.DeferStmt.Pos
```

```Go
func (s *DeferStmt) Pos() token.Pos
```

#### <a id="DeferStmt.End" href="#DeferStmt.End">func (s *DeferStmt) End() token.Pos</a>

```
searchKey: ast.DeferStmt.End
```

```Go
func (s *DeferStmt) End() token.Pos
```

#### <a id="DeferStmt.stmtNode" href="#DeferStmt.stmtNode">func (*DeferStmt) stmtNode()</a>

```
searchKey: ast.DeferStmt.stmtNode
tags: [private]
```

```Go
func (*DeferStmt) stmtNode()
```

### <a id="ReturnStmt" href="#ReturnStmt">type ReturnStmt struct</a>

```
searchKey: ast.ReturnStmt
```

```Go
type ReturnStmt struct {
	Return  token.Pos // position of "return" keyword
	Results []Expr    // result expressions; or nil
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A ReturnStmt node represents a return statement. 

#### <a id="ReturnStmt.Pos" href="#ReturnStmt.Pos">func (s *ReturnStmt) Pos() token.Pos</a>

```
searchKey: ast.ReturnStmt.Pos
```

```Go
func (s *ReturnStmt) Pos() token.Pos
```

#### <a id="ReturnStmt.End" href="#ReturnStmt.End">func (s *ReturnStmt) End() token.Pos</a>

```
searchKey: ast.ReturnStmt.End
```

```Go
func (s *ReturnStmt) End() token.Pos
```

#### <a id="ReturnStmt.stmtNode" href="#ReturnStmt.stmtNode">func (*ReturnStmt) stmtNode()</a>

```
searchKey: ast.ReturnStmt.stmtNode
tags: [private]
```

```Go
func (*ReturnStmt) stmtNode()
```

### <a id="BranchStmt" href="#BranchStmt">type BranchStmt struct</a>

```
searchKey: ast.BranchStmt
```

```Go
type BranchStmt struct {
	TokPos token.Pos   // position of Tok
	Tok    token.Token // keyword token (BREAK, CONTINUE, GOTO, FALLTHROUGH)
	Label  *Ident      // label name; or nil
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A BranchStmt node represents a break, continue, goto, or fallthrough statement. 

#### <a id="BranchStmt.Pos" href="#BranchStmt.Pos">func (s *BranchStmt) Pos() token.Pos</a>

```
searchKey: ast.BranchStmt.Pos
```

```Go
func (s *BranchStmt) Pos() token.Pos
```

#### <a id="BranchStmt.End" href="#BranchStmt.End">func (s *BranchStmt) End() token.Pos</a>

```
searchKey: ast.BranchStmt.End
```

```Go
func (s *BranchStmt) End() token.Pos
```

#### <a id="BranchStmt.stmtNode" href="#BranchStmt.stmtNode">func (*BranchStmt) stmtNode()</a>

```
searchKey: ast.BranchStmt.stmtNode
tags: [private]
```

```Go
func (*BranchStmt) stmtNode()
```

### <a id="BlockStmt" href="#BlockStmt">type BlockStmt struct</a>

```
searchKey: ast.BlockStmt
```

```Go
type BlockStmt struct {
	Lbrace token.Pos // position of "{"
	List   []Stmt
	Rbrace token.Pos // position of "}", if any (may be absent due to syntax error)
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A BlockStmt node represents a braced statement list. 

#### <a id="BlockStmt.Pos" href="#BlockStmt.Pos">func (s *BlockStmt) Pos() token.Pos</a>

```
searchKey: ast.BlockStmt.Pos
```

```Go
func (s *BlockStmt) Pos() token.Pos
```

#### <a id="BlockStmt.End" href="#BlockStmt.End">func (s *BlockStmt) End() token.Pos</a>

```
searchKey: ast.BlockStmt.End
```

```Go
func (s *BlockStmt) End() token.Pos
```

#### <a id="BlockStmt.stmtNode" href="#BlockStmt.stmtNode">func (*BlockStmt) stmtNode()</a>

```
searchKey: ast.BlockStmt.stmtNode
tags: [private]
```

```Go
func (*BlockStmt) stmtNode()
```

### <a id="IfStmt" href="#IfStmt">type IfStmt struct</a>

```
searchKey: ast.IfStmt
```

```Go
type IfStmt struct {
	If   token.Pos // position of "if" keyword
	Init Stmt      // initialization statement; or nil
	Cond Expr      // condition
	Body *BlockStmt
	Else Stmt // else branch; or nil
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

An IfStmt node represents an if statement. 

#### <a id="IfStmt.Pos" href="#IfStmt.Pos">func (s *IfStmt) Pos() token.Pos</a>

```
searchKey: ast.IfStmt.Pos
```

```Go
func (s *IfStmt) Pos() token.Pos
```

#### <a id="IfStmt.End" href="#IfStmt.End">func (s *IfStmt) End() token.Pos</a>

```
searchKey: ast.IfStmt.End
```

```Go
func (s *IfStmt) End() token.Pos
```

#### <a id="IfStmt.stmtNode" href="#IfStmt.stmtNode">func (*IfStmt) stmtNode()</a>

```
searchKey: ast.IfStmt.stmtNode
tags: [private]
```

```Go
func (*IfStmt) stmtNode()
```

### <a id="CaseClause" href="#CaseClause">type CaseClause struct</a>

```
searchKey: ast.CaseClause
```

```Go
type CaseClause struct {
	Case  token.Pos // position of "case" or "default" keyword
	List  []Expr    // list of expressions or types; nil means default case
	Colon token.Pos // position of ":"
	Body  []Stmt    // statement list; or nil
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A CaseClause represents a case of an expression or type switch statement. 

#### <a id="CaseClause.Pos" href="#CaseClause.Pos">func (s *CaseClause) Pos() token.Pos</a>

```
searchKey: ast.CaseClause.Pos
```

```Go
func (s *CaseClause) Pos() token.Pos
```

#### <a id="CaseClause.End" href="#CaseClause.End">func (s *CaseClause) End() token.Pos</a>

```
searchKey: ast.CaseClause.End
```

```Go
func (s *CaseClause) End() token.Pos
```

#### <a id="CaseClause.stmtNode" href="#CaseClause.stmtNode">func (*CaseClause) stmtNode()</a>

```
searchKey: ast.CaseClause.stmtNode
tags: [private]
```

```Go
func (*CaseClause) stmtNode()
```

### <a id="SwitchStmt" href="#SwitchStmt">type SwitchStmt struct</a>

```
searchKey: ast.SwitchStmt
```

```Go
type SwitchStmt struct {
	Switch token.Pos  // position of "switch" keyword
	Init   Stmt       // initialization statement; or nil
	Tag    Expr       // tag expression; or nil
	Body   *BlockStmt // CaseClauses only
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A SwitchStmt node represents an expression switch statement. 

#### <a id="SwitchStmt.Pos" href="#SwitchStmt.Pos">func (s *SwitchStmt) Pos() token.Pos</a>

```
searchKey: ast.SwitchStmt.Pos
```

```Go
func (s *SwitchStmt) Pos() token.Pos
```

#### <a id="SwitchStmt.End" href="#SwitchStmt.End">func (s *SwitchStmt) End() token.Pos</a>

```
searchKey: ast.SwitchStmt.End
```

```Go
func (s *SwitchStmt) End() token.Pos
```

#### <a id="SwitchStmt.stmtNode" href="#SwitchStmt.stmtNode">func (*SwitchStmt) stmtNode()</a>

```
searchKey: ast.SwitchStmt.stmtNode
tags: [private]
```

```Go
func (*SwitchStmt) stmtNode()
```

### <a id="TypeSwitchStmt" href="#TypeSwitchStmt">type TypeSwitchStmt struct</a>

```
searchKey: ast.TypeSwitchStmt
```

```Go
type TypeSwitchStmt struct {
	Switch token.Pos  // position of "switch" keyword
	Init   Stmt       // initialization statement; or nil
	Assign Stmt       // x := y.(type) or y.(type)
	Body   *BlockStmt // CaseClauses only
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A TypeSwitchStmt node represents a type switch statement. 

#### <a id="TypeSwitchStmt.Pos" href="#TypeSwitchStmt.Pos">func (s *TypeSwitchStmt) Pos() token.Pos</a>

```
searchKey: ast.TypeSwitchStmt.Pos
```

```Go
func (s *TypeSwitchStmt) Pos() token.Pos
```

#### <a id="TypeSwitchStmt.End" href="#TypeSwitchStmt.End">func (s *TypeSwitchStmt) End() token.Pos</a>

```
searchKey: ast.TypeSwitchStmt.End
```

```Go
func (s *TypeSwitchStmt) End() token.Pos
```

#### <a id="TypeSwitchStmt.stmtNode" href="#TypeSwitchStmt.stmtNode">func (*TypeSwitchStmt) stmtNode()</a>

```
searchKey: ast.TypeSwitchStmt.stmtNode
tags: [private]
```

```Go
func (*TypeSwitchStmt) stmtNode()
```

### <a id="CommClause" href="#CommClause">type CommClause struct</a>

```
searchKey: ast.CommClause
```

```Go
type CommClause struct {
	Case  token.Pos // position of "case" or "default" keyword
	Comm  Stmt      // send or receive statement; nil means default case
	Colon token.Pos // position of ":"
	Body  []Stmt    // statement list; or nil
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A CommClause node represents a case of a select statement. 

#### <a id="CommClause.Pos" href="#CommClause.Pos">func (s *CommClause) Pos() token.Pos</a>

```
searchKey: ast.CommClause.Pos
```

```Go
func (s *CommClause) Pos() token.Pos
```

#### <a id="CommClause.End" href="#CommClause.End">func (s *CommClause) End() token.Pos</a>

```
searchKey: ast.CommClause.End
```

```Go
func (s *CommClause) End() token.Pos
```

#### <a id="CommClause.stmtNode" href="#CommClause.stmtNode">func (*CommClause) stmtNode()</a>

```
searchKey: ast.CommClause.stmtNode
tags: [private]
```

```Go
func (*CommClause) stmtNode()
```

### <a id="SelectStmt" href="#SelectStmt">type SelectStmt struct</a>

```
searchKey: ast.SelectStmt
```

```Go
type SelectStmt struct {
	Select token.Pos  // position of "select" keyword
	Body   *BlockStmt // CommClauses only
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A SelectStmt node represents a select statement. 

#### <a id="SelectStmt.Pos" href="#SelectStmt.Pos">func (s *SelectStmt) Pos() token.Pos</a>

```
searchKey: ast.SelectStmt.Pos
```

```Go
func (s *SelectStmt) Pos() token.Pos
```

#### <a id="SelectStmt.End" href="#SelectStmt.End">func (s *SelectStmt) End() token.Pos</a>

```
searchKey: ast.SelectStmt.End
```

```Go
func (s *SelectStmt) End() token.Pos
```

#### <a id="SelectStmt.stmtNode" href="#SelectStmt.stmtNode">func (*SelectStmt) stmtNode()</a>

```
searchKey: ast.SelectStmt.stmtNode
tags: [private]
```

```Go
func (*SelectStmt) stmtNode()
```

### <a id="ForStmt" href="#ForStmt">type ForStmt struct</a>

```
searchKey: ast.ForStmt
```

```Go
type ForStmt struct {
	For  token.Pos // position of "for" keyword
	Init Stmt      // initialization statement; or nil
	Cond Expr      // condition; or nil
	Post Stmt      // post iteration statement; or nil
	Body *BlockStmt
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A ForStmt represents a for statement. 

#### <a id="ForStmt.Pos" href="#ForStmt.Pos">func (s *ForStmt) Pos() token.Pos</a>

```
searchKey: ast.ForStmt.Pos
```

```Go
func (s *ForStmt) Pos() token.Pos
```

#### <a id="ForStmt.End" href="#ForStmt.End">func (s *ForStmt) End() token.Pos</a>

```
searchKey: ast.ForStmt.End
```

```Go
func (s *ForStmt) End() token.Pos
```

#### <a id="ForStmt.stmtNode" href="#ForStmt.stmtNode">func (*ForStmt) stmtNode()</a>

```
searchKey: ast.ForStmt.stmtNode
tags: [private]
```

```Go
func (*ForStmt) stmtNode()
```

### <a id="RangeStmt" href="#RangeStmt">type RangeStmt struct</a>

```
searchKey: ast.RangeStmt
```

```Go
type RangeStmt struct {
	For        token.Pos   // position of "for" keyword
	Key, Value Expr        // Key, Value may be nil
	TokPos     token.Pos   // position of Tok; invalid if Key == nil
	Tok        token.Token // ILLEGAL if Key == nil, ASSIGN, DEFINE
	X          Expr        // value to range over
	Body       *BlockStmt
}
```

A statement is represented by a tree consisting of one or more of the following concrete statement nodes. 

A RangeStmt represents a for statement with a range clause. 

#### <a id="RangeStmt.Pos" href="#RangeStmt.Pos">func (s *RangeStmt) Pos() token.Pos</a>

```
searchKey: ast.RangeStmt.Pos
```

```Go
func (s *RangeStmt) Pos() token.Pos
```

#### <a id="RangeStmt.End" href="#RangeStmt.End">func (s *RangeStmt) End() token.Pos</a>

```
searchKey: ast.RangeStmt.End
```

```Go
func (s *RangeStmt) End() token.Pos
```

#### <a id="RangeStmt.stmtNode" href="#RangeStmt.stmtNode">func (*RangeStmt) stmtNode()</a>

```
searchKey: ast.RangeStmt.stmtNode
tags: [private]
```

```Go
func (*RangeStmt) stmtNode()
```

### <a id="Spec" href="#Spec">type Spec interface</a>

```
searchKey: ast.Spec
```

```Go
type Spec interface {
	Node
	specNode()
}
```

A Spec node represents a single (non-parenthesized) import, constant, type, or variable declaration. 

The Spec type stands for any of *ImportSpec, *ValueSpec, and *TypeSpec. 

### <a id="ImportSpec" href="#ImportSpec">type ImportSpec struct</a>

```
searchKey: ast.ImportSpec
```

```Go
type ImportSpec struct {
	Doc     *CommentGroup // associated documentation; or nil
	Name    *Ident        // local package name (including "."); or nil
	Path    *BasicLit     // import path
	Comment *CommentGroup // line comments; or nil
	EndPos  token.Pos     // end of spec (overrides Path.Pos if nonzero)
}
```

A Spec node represents a single (non-parenthesized) import, constant, type, or variable declaration. 

An ImportSpec node represents a single package import. 

#### <a id="ImportSpec.Pos" href="#ImportSpec.Pos">func (s *ImportSpec) Pos() token.Pos</a>

```
searchKey: ast.ImportSpec.Pos
```

```Go
func (s *ImportSpec) Pos() token.Pos
```

#### <a id="ImportSpec.End" href="#ImportSpec.End">func (s *ImportSpec) End() token.Pos</a>

```
searchKey: ast.ImportSpec.End
```

```Go
func (s *ImportSpec) End() token.Pos
```

#### <a id="ImportSpec.specNode" href="#ImportSpec.specNode">func (*ImportSpec) specNode()</a>

```
searchKey: ast.ImportSpec.specNode
tags: [private]
```

```Go
func (*ImportSpec) specNode()
```

specNode() ensures that only spec nodes can be assigned to a Spec. 

### <a id="ValueSpec" href="#ValueSpec">type ValueSpec struct</a>

```
searchKey: ast.ValueSpec
```

```Go
type ValueSpec struct {
	Doc     *CommentGroup // associated documentation; or nil
	Names   []*Ident      // value names (len(Names) > 0)
	Type    Expr          // value type; or nil
	Values  []Expr        // initial values; or nil
	Comment *CommentGroup // line comments; or nil
}
```

A Spec node represents a single (non-parenthesized) import, constant, type, or variable declaration. 

A ValueSpec node represents a constant or variable declaration (ConstSpec or VarSpec production). 

#### <a id="ValueSpec.Pos" href="#ValueSpec.Pos">func (s *ValueSpec) Pos() token.Pos</a>

```
searchKey: ast.ValueSpec.Pos
```

```Go
func (s *ValueSpec) Pos() token.Pos
```

#### <a id="ValueSpec.End" href="#ValueSpec.End">func (s *ValueSpec) End() token.Pos</a>

```
searchKey: ast.ValueSpec.End
```

```Go
func (s *ValueSpec) End() token.Pos
```

#### <a id="ValueSpec.specNode" href="#ValueSpec.specNode">func (*ValueSpec) specNode()</a>

```
searchKey: ast.ValueSpec.specNode
tags: [private]
```

```Go
func (*ValueSpec) specNode()
```

### <a id="BadDecl" href="#BadDecl">type BadDecl struct</a>

```
searchKey: ast.BadDecl
```

```Go
type BadDecl struct {
	From, To token.Pos // position range of bad declaration
}
```

A declaration is represented by one of the following declaration nodes. 

A BadDecl node is a placeholder for a declaration containing syntax errors for which a correct declaration node cannot be created. 

#### <a id="BadDecl.Pos" href="#BadDecl.Pos">func (d *BadDecl) Pos() token.Pos</a>

```
searchKey: ast.BadDecl.Pos
```

```Go
func (d *BadDecl) Pos() token.Pos
```

#### <a id="BadDecl.End" href="#BadDecl.End">func (d *BadDecl) End() token.Pos</a>

```
searchKey: ast.BadDecl.End
```

```Go
func (d *BadDecl) End() token.Pos
```

#### <a id="BadDecl.declNode" href="#BadDecl.declNode">func (*BadDecl) declNode()</a>

```
searchKey: ast.BadDecl.declNode
tags: [private]
```

```Go
func (*BadDecl) declNode()
```

declNode() ensures that only declaration nodes can be assigned to a Decl. 

### <a id="GenDecl" href="#GenDecl">type GenDecl struct</a>

```
searchKey: ast.GenDecl
```

```Go
type GenDecl struct {
	Doc    *CommentGroup // associated documentation; or nil
	TokPos token.Pos     // position of Tok
	Tok    token.Token   // IMPORT, CONST, TYPE, or VAR
	Lparen token.Pos     // position of '(', if any
	Specs  []Spec
	Rparen token.Pos // position of ')', if any
}
```

A declaration is represented by one of the following declaration nodes. 

A GenDecl node (generic declaration node) represents an import, constant, type or variable declaration. A valid Lparen position (Lparen.IsValid()) indicates a parenthesized declaration. 

Relationship between Tok value and Specs element type: 

```
token.IMPORT  *ImportSpec
token.CONST   *ValueSpec
token.TYPE    *TypeSpec
token.VAR     *ValueSpec

```
#### <a id="GenDecl.Pos" href="#GenDecl.Pos">func (d *GenDecl) Pos() token.Pos</a>

```
searchKey: ast.GenDecl.Pos
```

```Go
func (d *GenDecl) Pos() token.Pos
```

#### <a id="GenDecl.End" href="#GenDecl.End">func (d *GenDecl) End() token.Pos</a>

```
searchKey: ast.GenDecl.End
```

```Go
func (d *GenDecl) End() token.Pos
```

#### <a id="GenDecl.declNode" href="#GenDecl.declNode">func (*GenDecl) declNode()</a>

```
searchKey: ast.GenDecl.declNode
tags: [private]
```

```Go
func (*GenDecl) declNode()
```

### <a id="FuncDecl" href="#FuncDecl">type FuncDecl struct</a>

```
searchKey: ast.FuncDecl
```

```Go
type FuncDecl struct {
	Doc  *CommentGroup // associated documentation; or nil
	Recv *FieldList    // receiver (methods); or nil (functions)
	Name *Ident        // function/method name
	Type *FuncType     // function signature: type and value parameters, results, and position of "func" keyword
	Body *BlockStmt    // function body; or nil for external (non-Go) function

}
```

A declaration is represented by one of the following declaration nodes. 

A FuncDecl node represents a function declaration. 

#### <a id="FuncDecl.Pos" href="#FuncDecl.Pos">func (d *FuncDecl) Pos() token.Pos</a>

```
searchKey: ast.FuncDecl.Pos
```

```Go
func (d *FuncDecl) Pos() token.Pos
```

#### <a id="FuncDecl.End" href="#FuncDecl.End">func (d *FuncDecl) End() token.Pos</a>

```
searchKey: ast.FuncDecl.End
```

```Go
func (d *FuncDecl) End() token.Pos
```

#### <a id="FuncDecl.declNode" href="#FuncDecl.declNode">func (*FuncDecl) declNode()</a>

```
searchKey: ast.FuncDecl.declNode
tags: [private]
```

```Go
func (*FuncDecl) declNode()
```

### <a id="File" href="#File">type File struct</a>

```
searchKey: ast.File
```

```Go
type File struct {
	Doc        *CommentGroup   // associated documentation; or nil
	Package    token.Pos       // position of "package" keyword
	Name       *Ident          // package name
	Decls      []Decl          // top-level declarations; or nil
	Scope      *Scope          // package scope (this file only)
	Imports    []*ImportSpec   // imports in this file
	Unresolved []*Ident        // unresolved identifiers in this file
	Comments   []*CommentGroup // list of all comments in the source file
}
```

A File node represents a Go source file. 

The Comments list contains all comments in the source file in order of appearance, including the comments that are pointed to from other nodes via Doc and Comment fields. 

For correct printing of source code containing comments (using packages go/format and go/printer), special care must be taken to update comments when a File's syntax tree is modified: For printing, comments are interspersed between tokens based on their position. If syntax tree nodes are removed or moved, relevant comments in their vicinity must also be removed (from the File.Comments list) or moved accordingly (by updating their positions). A CommentMap may be used to facilitate some of these operations. 

Whether and how a comment is associated with a node depends on the interpretation of the syntax tree by the manipulating program: Except for Doc and Comment comments directly associated with nodes, the remaining comments are "free-floating" (see also issues #18593, #20744). 

#### <a id="MergePackageFiles" href="#MergePackageFiles">func MergePackageFiles(pkg *Package, mode MergeMode) *File</a>

```
searchKey: ast.MergePackageFiles
```

```Go
func MergePackageFiles(pkg *Package, mode MergeMode) *File
```

MergePackageFiles creates a file AST by merging the ASTs of the files belonging to a package. The mode flags control merging behavior. 

#### <a id="File.Pos" href="#File.Pos">func (f *File) Pos() token.Pos</a>

```
searchKey: ast.File.Pos
```

```Go
func (f *File) Pos() token.Pos
```

#### <a id="File.End" href="#File.End">func (f *File) End() token.Pos</a>

```
searchKey: ast.File.End
```

```Go
func (f *File) End() token.Pos
```

### <a id="Package" href="#Package">type Package struct</a>

```
searchKey: ast.Package
```

```Go
type Package struct {
	Name    string             // package name
	Scope   *Scope             // package scope across all files
	Imports map[string]*Object // map of package id -> package object
	Files   map[string]*File   // Go source files by filename
}
```

A Package node represents a set of source files collectively building a Go package. 

#### <a id="NewPackage" href="#NewPackage">func NewPackage(fset *token.FileSet, files map[string]*File, importer Importer, universe *Scope) (*Package, error)</a>

```
searchKey: ast.NewPackage
```

```Go
func NewPackage(fset *token.FileSet, files map[string]*File, importer Importer, universe *Scope) (*Package, error)
```

NewPackage creates a new Package node from a set of File nodes. It resolves unresolved identifiers across files and updates each file's Unresolved list accordingly. If a non-nil importer and universe scope are provided, they are used to resolve identifiers not declared in any of the package files. Any remaining unresolved identifiers are reported as undeclared. If the files belong to different packages, one package name is selected and files with different package names are reported and then ignored. The result is a package node and a scanner.ErrorList if there were errors. 

#### <a id="Package.Pos" href="#Package.Pos">func (p *Package) Pos() token.Pos</a>

```
searchKey: ast.Package.Pos
```

```Go
func (p *Package) Pos() token.Pos
```

#### <a id="Package.End" href="#Package.End">func (p *Package) End() token.Pos</a>

```
searchKey: ast.Package.End
```

```Go
func (p *Package) End() token.Pos
```

### <a id="FuncType" href="#FuncType">type FuncType struct</a>

```
searchKey: ast.FuncType
```

```Go
type FuncType struct {
	Func    token.Pos  // position of "func" keyword (token.NoPos if there is no "func")
	Params  *FieldList // (incoming) parameters; non-nil
	Results *FieldList // (outgoing) results; or nil
}
```

A FuncType node represents a function type. 

#### <a id="FuncType.Pos" href="#FuncType.Pos">func (x *FuncType) Pos() token.Pos</a>

```
searchKey: ast.FuncType.Pos
```

```Go
func (x *FuncType) Pos() token.Pos
```

#### <a id="FuncType.End" href="#FuncType.End">func (x *FuncType) End() token.Pos</a>

```
searchKey: ast.FuncType.End
```

```Go
func (x *FuncType) End() token.Pos
```

#### <a id="FuncType.exprNode" href="#FuncType.exprNode">func (*FuncType) exprNode()</a>

```
searchKey: ast.FuncType.exprNode
tags: [private]
```

```Go
func (*FuncType) exprNode()
```

### <a id="TypeSpec" href="#TypeSpec">type TypeSpec struct</a>

```
searchKey: ast.TypeSpec
```

```Go
type TypeSpec struct {
	Doc     *CommentGroup // associated documentation; or nil
	Name    *Ident        // type name
	Assign  token.Pos     // position of '=', if any
	Type    Expr          // *Ident, *ParenExpr, *SelectorExpr, *StarExpr, or any of the *XxxTypes
	Comment *CommentGroup // line comments; or nil
}
```

A TypeSpec node represents a type declaration (TypeSpec production). 

#### <a id="TypeSpec.Pos" href="#TypeSpec.Pos">func (s *TypeSpec) Pos() token.Pos</a>

```
searchKey: ast.TypeSpec.Pos
```

```Go
func (s *TypeSpec) Pos() token.Pos
```

#### <a id="TypeSpec.End" href="#TypeSpec.End">func (s *TypeSpec) End() token.Pos</a>

```
searchKey: ast.TypeSpec.End
```

```Go
func (s *TypeSpec) End() token.Pos
```

#### <a id="TypeSpec.specNode" href="#TypeSpec.specNode">func (*TypeSpec) specNode()</a>

```
searchKey: ast.TypeSpec.specNode
tags: [private]
```

```Go
func (*TypeSpec) specNode()
```

### <a id="byPos" href="#byPos">type byPos []*ast.CommentGroup</a>

```
searchKey: ast.byPos
tags: [private]
```

```Go
type byPos []*CommentGroup
```

#### <a id="byPos.Len" href="#byPos.Len">func (a byPos) Len() int</a>

```
searchKey: ast.byPos.Len
tags: [private]
```

```Go
func (a byPos) Len() int
```

#### <a id="byPos.Less" href="#byPos.Less">func (a byPos) Less(i, j int) bool</a>

```
searchKey: ast.byPos.Less
tags: [private]
```

```Go
func (a byPos) Less(i, j int) bool
```

#### <a id="byPos.Swap" href="#byPos.Swap">func (a byPos) Swap(i, j int)</a>

```
searchKey: ast.byPos.Swap
tags: [private]
```

```Go
func (a byPos) Swap(i, j int)
```

### <a id="CommentMap" href="#CommentMap">type CommentMap map[ast.Node][]*ast.CommentGroup</a>

```
searchKey: ast.CommentMap
```

```Go
type CommentMap map[Node][]*CommentGroup
```

A CommentMap maps an AST node to a list of comment groups associated with it. See NewCommentMap for a description of the association. 

#### <a id="NewCommentMap" href="#NewCommentMap">func NewCommentMap(fset *token.FileSet, node Node, comments []*CommentGroup) CommentMap</a>

```
searchKey: ast.NewCommentMap
```

```Go
func NewCommentMap(fset *token.FileSet, node Node, comments []*CommentGroup) CommentMap
```

NewCommentMap creates a new comment map by associating comment groups of the comments list with the nodes of the AST specified by node. 

A comment group g is associated with a node n if: 

```
- g starts on the same line as n ends
- g starts on the line immediately following n, and there is
  at least one empty line after g and before the next node
- g starts before n and is not associated to the node before n
  via the previous rules

```
NewCommentMap tries to associate a comment group to the "largest" node possible: For instance, if the comment is a line comment trailing an assignment, the comment is associated with the entire assignment rather than just the last operand in the assignment. 

#### <a id="CommentMap.addComment" href="#CommentMap.addComment">func (cmap CommentMap) addComment(n Node, c *CommentGroup)</a>

```
searchKey: ast.CommentMap.addComment
tags: [private]
```

```Go
func (cmap CommentMap) addComment(n Node, c *CommentGroup)
```

#### <a id="CommentMap.Update" href="#CommentMap.Update">func (cmap CommentMap) Update(old, new Node) Node</a>

```
searchKey: ast.CommentMap.Update
```

```Go
func (cmap CommentMap) Update(old, new Node) Node
```

Update replaces an old node in the comment map with the new node and returns the new node. Comments that were associated with the old node are associated with the new node. 

#### <a id="CommentMap.Filter" href="#CommentMap.Filter">func (cmap CommentMap) Filter(node Node) CommentMap</a>

```
searchKey: ast.CommentMap.Filter
```

```Go
func (cmap CommentMap) Filter(node Node) CommentMap
```

Filter returns a new comment map consisting of only those entries of cmap for which a corresponding node exists in the AST specified by node. 

#### <a id="CommentMap.Comments" href="#CommentMap.Comments">func (cmap CommentMap) Comments() []*CommentGroup</a>

```
searchKey: ast.CommentMap.Comments
```

```Go
func (cmap CommentMap) Comments() []*CommentGroup
```

Comments returns the list of comment groups in the comment map. The result is sorted in source order. 

#### <a id="CommentMap.String" href="#CommentMap.String">func (cmap CommentMap) String() string</a>

```
searchKey: ast.CommentMap.String
```

```Go
func (cmap CommentMap) String() string
```

### <a id="byInterval" href="#byInterval">type byInterval []ast.Node</a>

```
searchKey: ast.byInterval
tags: [private]
```

```Go
type byInterval []Node
```

#### <a id="byInterval.Len" href="#byInterval.Len">func (a byInterval) Len() int</a>

```
searchKey: ast.byInterval.Len
tags: [private]
```

```Go
func (a byInterval) Len() int
```

#### <a id="byInterval.Less" href="#byInterval.Less">func (a byInterval) Less(i, j int) bool</a>

```
searchKey: ast.byInterval.Less
tags: [private]
```

```Go
func (a byInterval) Less(i, j int) bool
```

#### <a id="byInterval.Swap" href="#byInterval.Swap">func (a byInterval) Swap(i, j int)</a>

```
searchKey: ast.byInterval.Swap
tags: [private]
```

```Go
func (a byInterval) Swap(i, j int)
```

### <a id="commentListReader" href="#commentListReader">type commentListReader struct</a>

```
searchKey: ast.commentListReader
tags: [private]
```

```Go
type commentListReader struct {
	fset     *token.FileSet
	list     []*CommentGroup
	index    int
	comment  *CommentGroup  // comment group at current index
	pos, end token.Position // source interval of comment group at current index
}
```

A commentListReader helps iterating through a list of comment groups. 

#### <a id="commentListReader.eol" href="#commentListReader.eol">func (r *commentListReader) eol() bool</a>

```
searchKey: ast.commentListReader.eol
tags: [private]
```

```Go
func (r *commentListReader) eol() bool
```

#### <a id="commentListReader.next" href="#commentListReader.next">func (r *commentListReader) next()</a>

```
searchKey: ast.commentListReader.next
tags: [private]
```

```Go
func (r *commentListReader) next()
```

### <a id="nodeStack" href="#nodeStack">type nodeStack []ast.Node</a>

```
searchKey: ast.nodeStack
tags: [private]
```

```Go
type nodeStack []Node
```

A nodeStack keeps track of nested nodes. A node lower on the stack lexically contains the nodes higher on the stack. 

#### <a id="nodeStack.push" href="#nodeStack.push">func (s *nodeStack) push(n Node)</a>

```
searchKey: ast.nodeStack.push
tags: [private]
```

```Go
func (s *nodeStack) push(n Node)
```

push pops all nodes that appear lexically before n and then pushes n on the stack. 

#### <a id="nodeStack.pop" href="#nodeStack.pop">func (s *nodeStack) pop(pos token.Pos) (top Node)</a>

```
searchKey: ast.nodeStack.pop
tags: [private]
```

```Go
func (s *nodeStack) pop(pos token.Pos) (top Node)
```

pop pops all nodes that appear lexically before pos (i.e., whose lexical extent has ended before or at pos). It returns the last node popped. 

### <a id="Filter" href="#Filter">type Filter func(string) bool</a>

```
searchKey: ast.Filter
```

```Go
type Filter func(string) bool
```

### <a id="MergeMode" href="#MergeMode">type MergeMode uint</a>

```
searchKey: ast.MergeMode
```

```Go
type MergeMode uint
```

The MergeMode flags control the behavior of MergePackageFiles. 

### <a id="posSpan" href="#posSpan">type posSpan struct</a>

```
searchKey: ast.posSpan
tags: [private]
```

```Go
type posSpan struct {
	Start token.Pos
	End   token.Pos
}
```

### <a id="cgPos" href="#cgPos">type cgPos struct</a>

```
searchKey: ast.cgPos
tags: [private]
```

```Go
type cgPos struct {
	left bool // true if comment is to the left of the spec, false otherwise.
	cg   *CommentGroup
}
```

### <a id="FieldFilter" href="#FieldFilter">type FieldFilter func(name string, value reflect.Value) bool</a>

```
searchKey: ast.FieldFilter
```

```Go
type FieldFilter func(name string, value reflect.Value) bool
```

A FieldFilter may be provided to Fprint to control the output. 

### <a id="printer" href="#printer">type printer struct</a>

```
searchKey: ast.printer
tags: [private]
```

```Go
type printer struct {
	output io.Writer
	fset   *token.FileSet
	filter FieldFilter
	ptrmap map[interface{}]int // *T -> line number
	indent int                 // current indentation level
	last   byte                // the last byte processed by Write
	line   int                 // current line number
}
```

#### <a id="printer.Write" href="#printer.Write">func (p *printer) Write(data []byte) (n int, err error)</a>

```
searchKey: ast.printer.Write
tags: [private]
```

```Go
func (p *printer) Write(data []byte) (n int, err error)
```

#### <a id="printer.printf" href="#printer.printf">func (p *printer) printf(format string, args ...interface{})</a>

```
searchKey: ast.printer.printf
tags: [private]
```

```Go
func (p *printer) printf(format string, args ...interface{})
```

printf is a convenience wrapper that takes care of print errors. 

#### <a id="printer.print" href="#printer.print">func (p *printer) print(x reflect.Value)</a>

```
searchKey: ast.printer.print
tags: [private]
```

```Go
func (p *printer) print(x reflect.Value)
```

### <a id="localError" href="#localError">type localError struct</a>

```
searchKey: ast.localError
tags: [private]
```

```Go
type localError struct {
	err error
}
```

localError wraps locally caught errors so we can distinguish them from genuine panics which we don't want to return as errors. 

### <a id="pkgBuilder" href="#pkgBuilder">type pkgBuilder struct</a>

```
searchKey: ast.pkgBuilder
tags: [private]
```

```Go
type pkgBuilder struct {
	fset   *token.FileSet
	errors scanner.ErrorList
}
```

#### <a id="pkgBuilder.error" href="#pkgBuilder.error">func (p *pkgBuilder) error(pos token.Pos, msg string)</a>

```
searchKey: ast.pkgBuilder.error
tags: [private]
```

```Go
func (p *pkgBuilder) error(pos token.Pos, msg string)
```

#### <a id="pkgBuilder.errorf" href="#pkgBuilder.errorf">func (p *pkgBuilder) errorf(pos token.Pos, format string, args ...interface{})</a>

```
searchKey: ast.pkgBuilder.errorf
tags: [private]
```

```Go
func (p *pkgBuilder) errorf(pos token.Pos, format string, args ...interface{})
```

#### <a id="pkgBuilder.declare" href="#pkgBuilder.declare">func (p *pkgBuilder) declare(scope, altScope *Scope, obj *Object)</a>

```
searchKey: ast.pkgBuilder.declare
tags: [private]
```

```Go
func (p *pkgBuilder) declare(scope, altScope *Scope, obj *Object)
```

### <a id="Importer" href="#Importer">type Importer func(imports map[string]*std/go/ast.Object, path string) (pkg *std/go/ast.Object, err error)</a>

```
searchKey: ast.Importer
```

```Go
type Importer func(imports map[string]*Object, path string) (pkg *Object, err error)
```

An Importer resolves import paths to package Objects. The imports map records the packages already imported, indexed by package id (canonical import path). An Importer must determine the canonical import path and check the map to see if it is already present in the imports map. If so, the Importer can return the map entry. Otherwise, the Importer should load the package data for the given path into a new *Object (pkg), record pkg in the imports map, and then return pkg. 

### <a id="Scope" href="#Scope">type Scope struct</a>

```
searchKey: ast.Scope
```

```Go
type Scope struct {
	Outer   *Scope
	Objects map[string]*Object
}
```

A Scope maintains the set of named language entities declared in the scope and a link to the immediately surrounding (outer) scope. 

#### <a id="NewScope" href="#NewScope">func NewScope(outer *Scope) *Scope</a>

```
searchKey: ast.NewScope
```

```Go
func NewScope(outer *Scope) *Scope
```

NewScope creates a new scope nested in the outer scope. 

#### <a id="Scope.Lookup" href="#Scope.Lookup">func (s *Scope) Lookup(name string) *Object</a>

```
searchKey: ast.Scope.Lookup
```

```Go
func (s *Scope) Lookup(name string) *Object
```

Lookup returns the object with the given name if it is found in scope s, otherwise it returns nil. Outer scopes are ignored. 

#### <a id="Scope.Insert" href="#Scope.Insert">func (s *Scope) Insert(obj *Object) (alt *Object)</a>

```
searchKey: ast.Scope.Insert
```

```Go
func (s *Scope) Insert(obj *Object) (alt *Object)
```

Insert attempts to insert a named object obj into the scope s. If the scope already contains an object alt with the same name, Insert leaves the scope unchanged and returns alt. Otherwise it inserts obj and returns nil. 

#### <a id="Scope.String" href="#Scope.String">func (s *Scope) String() string</a>

```
searchKey: ast.Scope.String
```

```Go
func (s *Scope) String() string
```

Debugging support 

### <a id="Object" href="#Object">type Object struct</a>

```
searchKey: ast.Object
```

```Go
type Object struct {
	Kind ObjKind
	Name string      // declared name
	Decl interface{} // corresponding Field, XxxSpec, FuncDecl, LabeledStmt, AssignStmt, Scope; or nil
	Data interface{} // object-specific data; or nil
	Type interface{} // placeholder for type information; may be nil
}
```

An Object describes a named language entity such as a package, constant, type, variable, function (incl. methods), or label. 

The Data fields contains object-specific data: 

```
Kind    Data type         Data value
Pkg     *Scope            package scope
Con     int               iota for the respective declaration

```
#### <a id="NewObj" href="#NewObj">func NewObj(kind ObjKind, name string) *Object</a>

```
searchKey: ast.NewObj
```

```Go
func NewObj(kind ObjKind, name string) *Object
```

NewObj creates a new object of a given kind and name. 

#### <a id="Object.Pos" href="#Object.Pos">func (obj *Object) Pos() token.Pos</a>

```
searchKey: ast.Object.Pos
```

```Go
func (obj *Object) Pos() token.Pos
```

Pos computes the source position of the declaration of an object name. The result may be an invalid position if it cannot be computed (obj.Decl may be nil or not correct). 

### <a id="ObjKind" href="#ObjKind">type ObjKind int</a>

```
searchKey: ast.ObjKind
```

```Go
type ObjKind int
```

ObjKind describes what an object represents. 

#### <a id="ObjKind.String" href="#ObjKind.String">func (kind ObjKind) String() string</a>

```
searchKey: ast.ObjKind.String
```

```Go
func (kind ObjKind) String() string
```

### <a id="Visitor" href="#Visitor">type Visitor interface</a>

```
searchKey: ast.Visitor
```

```Go
type Visitor interface {
	Visit(node Node) (w Visitor)
}
```

A Visitor's Visit method is invoked for each node encountered by Walk. If the result visitor w is not nil, Walk visits each of the children of node with the visitor w, followed by a call of w.Visit(nil). 

### <a id="inspector" href="#inspector">type inspector func(std/go/ast.Node) bool</a>

```
searchKey: ast.inspector
tags: [private]
```

```Go
type inspector func(Node) bool
```

#### <a id="inspector.Visit" href="#inspector.Visit">func (f inspector) Visit(node Node) Visitor</a>

```
searchKey: ast.inspector.Visit
tags: [private]
```

```Go
func (f inspector) Visit(node Node) Visitor
```

## <a id="func" href="#func">Functions</a>

### <a id="isWhitespace" href="#isWhitespace">func isWhitespace(ch byte) bool</a>

```
searchKey: ast.isWhitespace
tags: [private]
```

```Go
func isWhitespace(ch byte) bool
```

### <a id="stripTrailingWhitespace" href="#stripTrailingWhitespace">func stripTrailingWhitespace(s string) string</a>

```
searchKey: ast.stripTrailingWhitespace
tags: [private]
```

```Go
func stripTrailingWhitespace(s string) string
```

### <a id="isDirective" href="#isDirective">func isDirective(c string) bool</a>

```
searchKey: ast.isDirective
tags: [private]
```

```Go
func isDirective(c string) bool
```

isDirective reports whether c is a comment directive. 

### <a id="IsExported" href="#IsExported">func IsExported(name string) bool</a>

```
searchKey: ast.IsExported
```

```Go
func IsExported(name string) bool
```

IsExported reports whether name starts with an upper-case letter. 

### <a id="sortComments" href="#sortComments">func sortComments(list []*CommentGroup)</a>

```
searchKey: ast.sortComments
tags: [private]
```

```Go
func sortComments(list []*CommentGroup)
```

sortComments sorts the list of comment groups in source order. 

### <a id="nodeList" href="#nodeList">func nodeList(n Node) []Node</a>

```
searchKey: ast.nodeList
tags: [private]
```

```Go
func nodeList(n Node) []Node
```

nodeList returns the list of nodes of the AST n in source order. 

### <a id="summary" href="#summary">func summary(list []*CommentGroup) string</a>

```
searchKey: ast.summary
tags: [private]
```

```Go
func summary(list []*CommentGroup) string
```

### <a id="exportFilter" href="#exportFilter">func exportFilter(name string) bool</a>

```
searchKey: ast.exportFilter
tags: [private]
```

```Go
func exportFilter(name string) bool
```

exportFilter is a special filter function to extract exported nodes. 

### <a id="FileExports" href="#FileExports">func FileExports(src *File) bool</a>

```
searchKey: ast.FileExports
```

```Go
func FileExports(src *File) bool
```

FileExports trims the AST for a Go source file in place such that only exported nodes remain: all top-level identifiers which are not exported and their associated information (such as type, initial value, or function body) are removed. Non-exported fields and methods of exported types are stripped. The File.Comments list is not changed. 

FileExports reports whether there are exported declarations. 

### <a id="PackageExports" href="#PackageExports">func PackageExports(pkg *Package) bool</a>

```
searchKey: ast.PackageExports
```

```Go
func PackageExports(pkg *Package) bool
```

PackageExports trims the AST for a Go package in place such that only exported nodes remain. The pkg.Files list is not changed, so that file names and top-level package comments don't get lost. 

PackageExports reports whether there are exported declarations; it returns false otherwise. 

### <a id="filterIdentList" href="#filterIdentList">func filterIdentList(list []*Ident, f Filter) []*Ident</a>

```
searchKey: ast.filterIdentList
tags: [private]
```

```Go
func filterIdentList(list []*Ident, f Filter) []*Ident
```

### <a id="filterFieldList" href="#filterFieldList">func filterFieldList(fields *FieldList, filter Filter, export bool) (removedFields bool)</a>

```
searchKey: ast.filterFieldList
tags: [private]
```

```Go
func filterFieldList(fields *FieldList, filter Filter, export bool) (removedFields bool)
```

### <a id="filterCompositeLit" href="#filterCompositeLit">func filterCompositeLit(lit *CompositeLit, filter Filter, export bool)</a>

```
searchKey: ast.filterCompositeLit
tags: [private]
```

```Go
func filterCompositeLit(lit *CompositeLit, filter Filter, export bool)
```

### <a id="filterExprList" href="#filterExprList">func filterExprList(list []Expr, filter Filter, export bool) []Expr</a>

```
searchKey: ast.filterExprList
tags: [private]
```

```Go
func filterExprList(list []Expr, filter Filter, export bool) []Expr
```

### <a id="filterParamList" href="#filterParamList">func filterParamList(fields *FieldList, filter Filter, export bool) bool</a>

```
searchKey: ast.filterParamList
tags: [private]
```

```Go
func filterParamList(fields *FieldList, filter Filter, export bool) bool
```

### <a id="filterType" href="#filterType">func filterType(typ Expr, f Filter, export bool) bool</a>

```
searchKey: ast.filterType
tags: [private]
```

```Go
func filterType(typ Expr, f Filter, export bool) bool
```

### <a id="filterSpec" href="#filterSpec">func filterSpec(spec Spec, f Filter, export bool) bool</a>

```
searchKey: ast.filterSpec
tags: [private]
```

```Go
func filterSpec(spec Spec, f Filter, export bool) bool
```

### <a id="filterSpecList" href="#filterSpecList">func filterSpecList(list []Spec, f Filter, export bool) []Spec</a>

```
searchKey: ast.filterSpecList
tags: [private]
```

```Go
func filterSpecList(list []Spec, f Filter, export bool) []Spec
```

### <a id="FilterDecl" href="#FilterDecl">func FilterDecl(decl Decl, f Filter) bool</a>

```
searchKey: ast.FilterDecl
```

```Go
func FilterDecl(decl Decl, f Filter) bool
```

FilterDecl trims the AST for a Go declaration in place by removing all names (including struct field and interface method names, but not from parameter lists) that don't pass through the filter f. 

FilterDecl reports whether there are any declared names left after filtering. 

### <a id="filterDecl" href="#filterDecl">func filterDecl(decl Decl, f Filter, export bool) bool</a>

```
searchKey: ast.filterDecl
tags: [private]
```

```Go
func filterDecl(decl Decl, f Filter, export bool) bool
```

### <a id="FilterFile" href="#FilterFile">func FilterFile(src *File, f Filter) bool</a>

```
searchKey: ast.FilterFile
```

```Go
func FilterFile(src *File, f Filter) bool
```

FilterFile trims the AST for a Go file in place by removing all names from top-level declarations (including struct field and interface method names, but not from parameter lists) that don't pass through the filter f. If the declaration is empty afterwards, the declaration is removed from the AST. Import declarations are always removed. The File.Comments list is not changed. 

FilterFile reports whether there are any top-level declarations left after filtering. 

### <a id="filterFile" href="#filterFile">func filterFile(src *File, f Filter, export bool) bool</a>

```
searchKey: ast.filterFile
tags: [private]
```

```Go
func filterFile(src *File, f Filter, export bool) bool
```

### <a id="FilterPackage" href="#FilterPackage">func FilterPackage(pkg *Package, f Filter) bool</a>

```
searchKey: ast.FilterPackage
```

```Go
func FilterPackage(pkg *Package, f Filter) bool
```

FilterPackage trims the AST for a Go package in place by removing all names from top-level declarations (including struct field and interface method names, but not from parameter lists) that don't pass through the filter f. If the declaration is empty afterwards, the declaration is removed from the AST. The pkg.Files list is not changed, so that file names and top-level package comments don't get lost. 

FilterPackage reports whether there are any top-level declarations left after filtering. 

### <a id="filterPackage" href="#filterPackage">func filterPackage(pkg *Package, f Filter, export bool) bool</a>

```
searchKey: ast.filterPackage
tags: [private]
```

```Go
func filterPackage(pkg *Package, f Filter, export bool) bool
```

### <a id="nameOf" href="#nameOf">func nameOf(f *FuncDecl) string</a>

```
searchKey: ast.nameOf
tags: [private]
```

```Go
func nameOf(f *FuncDecl) string
```

nameOf returns the function (foo) or method name (foo.bar) for the given function declaration. If the AST is incorrect for the receiver, it assumes a function instead. 

### <a id="SortImports" href="#SortImports">func SortImports(fset *token.FileSet, f *File)</a>

```
searchKey: ast.SortImports
```

```Go
func SortImports(fset *token.FileSet, f *File)
```

SortImports sorts runs of consecutive import lines in import blocks in f. It also removes duplicate imports when it is possible to do so without data loss. 

### <a id="lineAt" href="#lineAt">func lineAt(fset *token.FileSet, pos token.Pos) int</a>

```
searchKey: ast.lineAt
tags: [private]
```

```Go
func lineAt(fset *token.FileSet, pos token.Pos) int
```

### <a id="importPath" href="#importPath">func importPath(s Spec) string</a>

```
searchKey: ast.importPath
tags: [private]
```

```Go
func importPath(s Spec) string
```

### <a id="importName" href="#importName">func importName(s Spec) string</a>

```
searchKey: ast.importName
tags: [private]
```

```Go
func importName(s Spec) string
```

### <a id="importComment" href="#importComment">func importComment(s Spec) string</a>

```
searchKey: ast.importComment
tags: [private]
```

```Go
func importComment(s Spec) string
```

### <a id="collapse" href="#collapse">func collapse(prev, next Spec) bool</a>

```
searchKey: ast.collapse
tags: [private]
```

```Go
func collapse(prev, next Spec) bool
```

collapse indicates whether prev may be removed, leaving only next. 

### <a id="sortSpecs" href="#sortSpecs">func sortSpecs(fset *token.FileSet, f *File, specs []Spec) []Spec</a>

```
searchKey: ast.sortSpecs
tags: [private]
```

```Go
func sortSpecs(fset *token.FileSet, f *File, specs []Spec) []Spec
```

### <a id="NotNilFilter" href="#NotNilFilter">func NotNilFilter(_ string, v reflect.Value) bool</a>

```
searchKey: ast.NotNilFilter
```

```Go
func NotNilFilter(_ string, v reflect.Value) bool
```

NotNilFilter returns true for field values that are not nil; it returns false otherwise. 

### <a id="Fprint" href="#Fprint">func Fprint(w io.Writer, fset *token.FileSet, x interface{}, f FieldFilter) error</a>

```
searchKey: ast.Fprint
```

```Go
func Fprint(w io.Writer, fset *token.FileSet, x interface{}, f FieldFilter) error
```

Fprint prints the (sub-)tree starting at AST node x to w. If fset != nil, position information is interpreted relative to that file set. Otherwise positions are printed as integer values (file set specific offsets). 

A non-nil FieldFilter f may be provided to control the output: struct fields for which f(fieldname, fieldvalue) is true are printed; all others are filtered from the output. Unexported struct fields are never printed. 

### <a id="fprint" href="#fprint">func fprint(w io.Writer, fset *token.FileSet, x interface{}, f FieldFilter) (err error)</a>

```
searchKey: ast.fprint
tags: [private]
```

```Go
func fprint(w io.Writer, fset *token.FileSet, x interface{}, f FieldFilter) (err error)
```

### <a id="Print" href="#Print">func Print(fset *token.FileSet, x interface{}) error</a>

```
searchKey: ast.Print
```

```Go
func Print(fset *token.FileSet, x interface{}) error
```

Print prints x to standard output, skipping nil fields. Print(fset, x) is the same as Fprint(os.Stdout, fset, x, NotNilFilter). 

### <a id="resolve" href="#resolve">func resolve(scope *Scope, ident *Ident) bool</a>

```
searchKey: ast.resolve
tags: [private]
```

```Go
func resolve(scope *Scope, ident *Ident) bool
```

### <a id="walkIdentList" href="#walkIdentList">func walkIdentList(v Visitor, list []*Ident)</a>

```
searchKey: ast.walkIdentList
tags: [private]
```

```Go
func walkIdentList(v Visitor, list []*Ident)
```

### <a id="walkExprList" href="#walkExprList">func walkExprList(v Visitor, list []Expr)</a>

```
searchKey: ast.walkExprList
tags: [private]
```

```Go
func walkExprList(v Visitor, list []Expr)
```

### <a id="walkStmtList" href="#walkStmtList">func walkStmtList(v Visitor, list []Stmt)</a>

```
searchKey: ast.walkStmtList
tags: [private]
```

```Go
func walkStmtList(v Visitor, list []Stmt)
```

### <a id="walkDeclList" href="#walkDeclList">func walkDeclList(v Visitor, list []Decl)</a>

```
searchKey: ast.walkDeclList
tags: [private]
```

```Go
func walkDeclList(v Visitor, list []Decl)
```

### <a id="Walk" href="#Walk">func Walk(v Visitor, node Node)</a>

```
searchKey: ast.Walk
```

```Go
func Walk(v Visitor, node Node)
```

Walk traverses an AST in depth-first order: It starts by calling v.Visit(node); node must not be nil. If the visitor w returned by v.Visit(node) is not nil, Walk is invoked recursively with visitor w for each of the non-nil children of node, followed by a call of w.Visit(nil). 

### <a id="Inspect" href="#Inspect">func Inspect(node Node, f func(Node) bool)</a>

```
searchKey: ast.Inspect
```

```Go
func Inspect(node Node, f func(Node) bool)
```

Inspect traverses an AST in depth-first order: It starts by calling f(node); node must not be nil. If f returns true, Inspect invokes f recursively for each of the non-nil children of node, followed by a call of f(nil). 

### <a id="walkFuncTypeParams" href="#walkFuncTypeParams">func walkFuncTypeParams(v Visitor, n *FuncType)</a>

```
searchKey: ast.walkFuncTypeParams
tags: [private]
```

```Go
func walkFuncTypeParams(v Visitor, n *FuncType)
```

### <a id="walkTypeSpecParams" href="#walkTypeSpecParams">func walkTypeSpecParams(v Visitor, n *TypeSpec)</a>

```
searchKey: ast.walkTypeSpecParams
tags: [private]
```

```Go
func walkTypeSpecParams(v Visitor, n *TypeSpec)
```

### <a id="walkOtherNodes" href="#walkOtherNodes">func walkOtherNodes(v Visitor, n Node)</a>

```
searchKey: ast.walkOtherNodes
tags: [private]
```

```Go
func walkOtherNodes(v Visitor, n Node)
```

### <a id="TestCommentText" href="#TestCommentText">func TestCommentText(t *testing.T)</a>

```
searchKey: ast.TestCommentText
tags: [private]
```

```Go
func TestCommentText(t *testing.T)
```

### <a id="TestIsDirective" href="#TestIsDirective">func TestIsDirective(t *testing.T)</a>

```
searchKey: ast.TestIsDirective
tags: [private]
```

```Go
func TestIsDirective(t *testing.T)
```

### <a id="trim" href="#trim">func trim(s string) string</a>

```
searchKey: ast.trim
tags: [private]
```

```Go
func trim(s string) string
```

Split s into lines, trim whitespace from all lines, and return the concatenated non-empty lines. 

### <a id="TestPrint" href="#TestPrint">func TestPrint(t *testing.T)</a>

```
searchKey: ast.TestPrint
tags: [private]
```

```Go
func TestPrint(t *testing.T)
```

