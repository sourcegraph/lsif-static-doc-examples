# Package types

Package types declares the data types and implements the algorithms for type-checking of Go packages. Use Config.Check to invoke the type checker for a package. Alternatively, create a new type checker with NewChecker and invoke it incrementally by calling Checker.Files. 

Type-checking consists of several interdependent phases: 

Name resolution maps each identifier (ast.Ident) in the program to the language object (Object) it denotes. Use Info.{Defs,Uses,Implicits} for the results of name resolution. 

Constant folding computes the exact constant value (constant.Value) for every expression (ast.Expr) that is a compile-time constant. Use Info.Types[expr].Value for the results of constant folding. 

Type inference computes the type (Type) of every expression (ast.Expr) and checks for compliance with the language specification. Use Info.Types[expr].Type for the results of type inference. 

For a tutorial, see [https://golang.org/s/types-tutorial](https://golang.org/s/types-tutorial). 

## Index

* [Constants](#const)
    * [const debug](#debug)
    * [const trace](#trace)
    * [const forceStrict](#forceStrict)
    * [const _Test](#_Test)
    * [const _BlankPkgName](#_BlankPkgName)
    * [const _MismatchedPkgName](#_MismatchedPkgName)
    * [const _InvalidPkgUse](#_InvalidPkgUse)
    * [const _BadImportPath](#_BadImportPath)
    * [const _BrokenImport](#_BrokenImport)
    * [const _ImportCRenamed](#_ImportCRenamed)
    * [const _UnusedImport](#_UnusedImport)
    * [const _InvalidInitCycle](#_InvalidInitCycle)
    * [const _DuplicateDecl](#_DuplicateDecl)
    * [const _InvalidDeclCycle](#_InvalidDeclCycle)
    * [const _InvalidTypeCycle](#_InvalidTypeCycle)
    * [const _InvalidConstInit](#_InvalidConstInit)
    * [const _InvalidConstVal](#_InvalidConstVal)
    * [const _InvalidConstType](#_InvalidConstType)
    * [const _UntypedNil](#_UntypedNil)
    * [const _WrongAssignCount](#_WrongAssignCount)
    * [const _UnassignableOperand](#_UnassignableOperand)
    * [const _NoNewVar](#_NoNewVar)
    * [const _MultiValAssignOp](#_MultiValAssignOp)
    * [const _InvalidIfaceAssign](#_InvalidIfaceAssign)
    * [const _InvalidChanAssign](#_InvalidChanAssign)
    * [const _IncompatibleAssign](#_IncompatibleAssign)
    * [const _UnaddressableFieldAssign](#_UnaddressableFieldAssign)
    * [const _NotAType](#_NotAType)
    * [const _InvalidArrayLen](#_InvalidArrayLen)
    * [const _BlankIfaceMethod](#_BlankIfaceMethod)
    * [const _IncomparableMapKey](#_IncomparableMapKey)
    * [const _InvalidIfaceEmbed](#_InvalidIfaceEmbed)
    * [const _InvalidPtrEmbed](#_InvalidPtrEmbed)
    * [const _BadRecv](#_BadRecv)
    * [const _InvalidRecv](#_InvalidRecv)
    * [const _DuplicateFieldAndMethod](#_DuplicateFieldAndMethod)
    * [const _DuplicateMethod](#_DuplicateMethod)
    * [const _InvalidBlank](#_InvalidBlank)
    * [const _InvalidIota](#_InvalidIota)
    * [const _MissingInitBody](#_MissingInitBody)
    * [const _InvalidInitSig](#_InvalidInitSig)
    * [const _InvalidInitDecl](#_InvalidInitDecl)
    * [const _InvalidMainDecl](#_InvalidMainDecl)
    * [const _TooManyValues](#_TooManyValues)
    * [const _NotAnExpr](#_NotAnExpr)
    * [const _TruncatedFloat](#_TruncatedFloat)
    * [const _NumericOverflow](#_NumericOverflow)
    * [const _UndefinedOp](#_UndefinedOp)
    * [const _MismatchedTypes](#_MismatchedTypes)
    * [const _DivByZero](#_DivByZero)
    * [const _NonNumericIncDec](#_NonNumericIncDec)
    * [const _UnaddressableOperand](#_UnaddressableOperand)
    * [const _InvalidIndirection](#_InvalidIndirection)
    * [const _NonIndexableOperand](#_NonIndexableOperand)
    * [const _InvalidIndex](#_InvalidIndex)
    * [const _SwappedSliceIndices](#_SwappedSliceIndices)
    * [const _NonSliceableOperand](#_NonSliceableOperand)
    * [const _InvalidSliceExpr](#_InvalidSliceExpr)
    * [const _InvalidShiftCount](#_InvalidShiftCount)
    * [const _InvalidShiftOperand](#_InvalidShiftOperand)
    * [const _InvalidReceive](#_InvalidReceive)
    * [const _InvalidSend](#_InvalidSend)
    * [const _DuplicateLitKey](#_DuplicateLitKey)
    * [const _MissingLitKey](#_MissingLitKey)
    * [const _InvalidLitIndex](#_InvalidLitIndex)
    * [const _OversizeArrayLit](#_OversizeArrayLit)
    * [const _MixedStructLit](#_MixedStructLit)
    * [const _InvalidStructLit](#_InvalidStructLit)
    * [const _MissingLitField](#_MissingLitField)
    * [const _DuplicateLitField](#_DuplicateLitField)
    * [const _UnexportedLitField](#_UnexportedLitField)
    * [const _InvalidLitField](#_InvalidLitField)
    * [const _UntypedLit](#_UntypedLit)
    * [const _InvalidLit](#_InvalidLit)
    * [const _AmbiguousSelector](#_AmbiguousSelector)
    * [const _UndeclaredImportedName](#_UndeclaredImportedName)
    * [const _UnexportedName](#_UnexportedName)
    * [const _UndeclaredName](#_UndeclaredName)
    * [const _MissingFieldOrMethod](#_MissingFieldOrMethod)
    * [const _BadDotDotDotSyntax](#_BadDotDotDotSyntax)
    * [const _NonVariadicDotDotDot](#_NonVariadicDotDotDot)
    * [const _MisplacedDotDotDot](#_MisplacedDotDotDot)
    * [const _InvalidDotDotDot](#_InvalidDotDotDot)
    * [const _UncalledBuiltin](#_UncalledBuiltin)
    * [const _InvalidAppend](#_InvalidAppend)
    * [const _InvalidCap](#_InvalidCap)
    * [const _InvalidClose](#_InvalidClose)
    * [const _InvalidCopy](#_InvalidCopy)
    * [const _InvalidComplex](#_InvalidComplex)
    * [const _InvalidDelete](#_InvalidDelete)
    * [const _InvalidImag](#_InvalidImag)
    * [const _InvalidLen](#_InvalidLen)
    * [const _SwappedMakeArgs](#_SwappedMakeArgs)
    * [const _InvalidMake](#_InvalidMake)
    * [const _InvalidReal](#_InvalidReal)
    * [const _InvalidAssert](#_InvalidAssert)
    * [const _ImpossibleAssert](#_ImpossibleAssert)
    * [const _InvalidConversion](#_InvalidConversion)
    * [const _InvalidUntypedConversion](#_InvalidUntypedConversion)
    * [const _BadOffsetofSyntax](#_BadOffsetofSyntax)
    * [const _InvalidOffsetof](#_InvalidOffsetof)
    * [const _UnusedExpr](#_UnusedExpr)
    * [const _UnusedVar](#_UnusedVar)
    * [const _MissingReturn](#_MissingReturn)
    * [const _WrongResultCount](#_WrongResultCount)
    * [const _OutOfScopeResult](#_OutOfScopeResult)
    * [const _InvalidCond](#_InvalidCond)
    * [const _InvalidPostDecl](#_InvalidPostDecl)
    * [const _InvalidIterVar](#_InvalidIterVar)
    * [const _InvalidRangeExpr](#_InvalidRangeExpr)
    * [const _MisplacedBreak](#_MisplacedBreak)
    * [const _MisplacedContinue](#_MisplacedContinue)
    * [const _MisplacedFallthrough](#_MisplacedFallthrough)
    * [const _DuplicateCase](#_DuplicateCase)
    * [const _DuplicateDefault](#_DuplicateDefault)
    * [const _BadTypeKeyword](#_BadTypeKeyword)
    * [const _InvalidTypeSwitch](#_InvalidTypeSwitch)
    * [const _InvalidExprSwitch](#_InvalidExprSwitch)
    * [const _InvalidSelectCase](#_InvalidSelectCase)
    * [const _UndeclaredLabel](#_UndeclaredLabel)
    * [const _DuplicateLabel](#_DuplicateLabel)
    * [const _MisplacedLabel](#_MisplacedLabel)
    * [const _UnusedLabel](#_UnusedLabel)
    * [const _JumpOverDecl](#_JumpOverDecl)
    * [const _JumpIntoBlock](#_JumpIntoBlock)
    * [const _InvalidMethodExpr](#_InvalidMethodExpr)
    * [const _WrongArgCount](#_WrongArgCount)
    * [const _InvalidCall](#_InvalidCall)
    * [const _UnusedResults](#_UnusedResults)
    * [const _InvalidDefer](#_InvalidDefer)
    * [const _InvalidGo](#_InvalidGo)
    * [const _BadDecl](#_BadDecl)
    * [const _RepeatedDecl](#_RepeatedDecl)
    * [const _InvalidUnsafeAdd](#_InvalidUnsafeAdd)
    * [const _InvalidUnsafeSlice](#_InvalidUnsafeSlice)
    * [const _Todo](#_Todo)
    * [const conversion](#conversion)
    * [const expression](#expression)
    * [const statement](#statement)
    * [const white](#white)
    * [const black](#black)
    * [const grey](#grey)
    * [const invalid](#invalid)
    * [const novalue](#novalue)
    * [const builtin](#builtin)
    * [const typexpr](#typexpr)
    * [const constant_](#constant_)
    * [const variable](#variable)
    * [const mapindex](#mapindex)
    * [const value](#value)
    * [const commaok](#commaok)
    * [const commaerr](#commaerr)
    * [const cgofunc](#cgofunc)
    * [const FieldVal](#FieldVal)
    * [const MethodVal](#MethodVal)
    * [const MethodExpr](#MethodExpr)
    * [const breakOk](#breakOk)
    * [const continueOk](#continueOk)
    * [const fallthroughOk](#fallthroughOk)
    * [const finalSwitchCase](#finalSwitchCase)
    * [const Invalid](#Invalid)
    * [const Bool](#Bool)
    * [const Int](#Int)
    * [const Int8](#Int8)
    * [const Int16](#Int16)
    * [const Int32](#Int32)
    * [const Int64](#Int64)
    * [const Uint](#Uint)
    * [const Uint8](#Uint8)
    * [const Uint16](#Uint16)
    * [const Uint32](#Uint32)
    * [const Uint64](#Uint64)
    * [const Uintptr](#Uintptr)
    * [const Float32](#Float32)
    * [const Float64](#Float64)
    * [const Complex64](#Complex64)
    * [const Complex128](#Complex128)
    * [const String](#String)
    * [const UnsafePointer](#UnsafePointer)
    * [const UntypedBool](#UntypedBool)
    * [const UntypedInt](#UntypedInt)
    * [const UntypedRune](#UntypedRune)
    * [const UntypedFloat](#UntypedFloat)
    * [const UntypedComplex](#UntypedComplex)
    * [const UntypedString](#UntypedString)
    * [const UntypedNil](#UntypedNil)
    * [const Byte](#Byte)
    * [const Rune](#Rune)
    * [const IsBoolean](#IsBoolean)
    * [const IsInteger](#IsInteger)
    * [const IsUnsigned](#IsUnsigned)
    * [const IsFloat](#IsFloat)
    * [const IsComplex](#IsComplex)
    * [const IsString](#IsString)
    * [const IsUntyped](#IsUntyped)
    * [const IsOrdered](#IsOrdered)
    * [const IsNumeric](#IsNumeric)
    * [const IsConstType](#IsConstType)
    * [const SendRecv](#SendRecv)
    * [const SendOnly](#SendOnly)
    * [const RecvOnly](#RecvOnly)
    * [const instanceMarker](#instanceMarker)
    * [const _Append](#_Append)
    * [const _Cap](#_Cap)
    * [const _Close](#_Close)
    * [const _Complex](#_Complex)
    * [const _Copy](#_Copy)
    * [const _Delete](#_Delete)
    * [const _Imag](#_Imag)
    * [const _Len](#_Len)
    * [const _Make](#_Make)
    * [const _New](#_New)
    * [const _Panic](#_Panic)
    * [const _Print](#_Print)
    * [const _Println](#_Println)
    * [const _Real](#_Real)
    * [const _Recover](#_Recover)
    * [const _Add](#_Add)
    * [const _Alignof](#_Alignof)
    * [const _Offsetof](#_Offsetof)
    * [const _Sizeof](#_Sizeof)
    * [const _Slice](#_Slice)
    * [const _Assert](#_Assert)
    * [const _Trace](#_Trace)
* [Variables](#var)
    * [var cgoPrefixes](#cgoPrefixes)
    * [var errBadCgo](#errBadCgo)
    * [var unaryOpPredicates](#unaryOpPredicates)
    * [var op2str1](#op2str1)
    * [var op2str2](#op2str2)
    * [var binaryOpPredicates](#binaryOpPredicates)
    * [var gccgoArchSizes](#gccgoArchSizes)
    * [var emptyMethodSet](#emptyMethodSet)
    * [var operandModeString](#operandModeString)
    * [var basicSizes](#basicSizes)
    * [var gcArchSizes](#gcArchSizes)
    * [var stdSizes](#stdSizes)
    * [var emptyInterface](#emptyInterface)
    * [var markComplete](#markComplete)
    * [var lastId](#lastId)
    * [var expandf](#expandf)
    * [var theBottom](#theBottom)
    * [var theTop](#theTop)
    * [var gcCompatibilityMode](#gcCompatibilityMode)
    * [var Universe](#Universe)
    * [var Unsafe](#Unsafe)
    * [var universeIota](#universeIota)
    * [var universeByte](#universeByte)
    * [var universeRune](#universeRune)
    * [var universeAny](#universeAny)
    * [var universeError](#universeError)
    * [var Typ](#Typ)
    * [var aliases](#aliases)
    * [var predeclaredConsts](#predeclaredConsts)
    * [var predeclaredFuncs](#predeclaredFuncs)
    * [var goVersionRx](#goVersionRx)
    * [var assignOps](#assignOps)
* [Types](#type)
    * [type Error struct](#Error)
        * [func (err Error) Error() string](#Error.Error)
    * [type Importer interface](#Importer)
    * [type ImportMode int](#ImportMode)
    * [type ImporterFrom interface](#ImporterFrom)
    * [type Config struct](#Config)
        * [func (conf *Config) Check(path string, fset *token.FileSet, files []*ast.File, info *Info) (*Package, error)](#Config.Check)
        * [func (conf *Config) alignof(T Type) int64](#Config.alignof)
        * [func (conf *Config) offsetsof(T *Struct) []int64](#Config.offsetsof)
        * [func (conf *Config) offsetof(typ Type, index []int) int64](#Config.offsetof)
        * [func (conf *Config) sizeof(T Type) int64](#Config.sizeof)
    * [type TypeAndValue struct](#TypeAndValue)
        * [func Eval(fset *token.FileSet, pkg *Package, pos token.Pos, expr string) (_ TypeAndValue, err error)](#Eval)
        * [func (tv TypeAndValue) IsVoid() bool](#TypeAndValue.IsVoid)
        * [func (tv TypeAndValue) IsType() bool](#TypeAndValue.IsType)
        * [func (tv TypeAndValue) IsBuiltin() bool](#TypeAndValue.IsBuiltin)
        * [func (tv TypeAndValue) IsValue() bool](#TypeAndValue.IsValue)
        * [func (tv TypeAndValue) IsNil() bool](#TypeAndValue.IsNil)
        * [func (tv TypeAndValue) Addressable() bool](#TypeAndValue.Addressable)
        * [func (tv TypeAndValue) Assignable() bool](#TypeAndValue.Assignable)
        * [func (tv TypeAndValue) HasOk() bool](#TypeAndValue.HasOk)
    * [type _Inferred struct](#_Inferred)
    * [type Initializer struct](#Initializer)
        * [func (init *Initializer) String() string](#Initializer.String)
    * [type Info struct](#Info)
        * [func (info *Info) TypeOf(e ast.Expr) Type](#Info.TypeOf)
        * [func (info *Info) ObjectOf(id *ast.Ident) Object](#Info.ObjectOf)
    * [type exprInfo struct](#exprInfo)
    * [type context struct](#context)
        * [func (ctxt *context) lookup(name string) Object](#context.lookup)
    * [type importKey struct](#importKey)
    * [type dotImportKey struct](#dotImportKey)
    * [type Checker struct](#Checker)
        * [func NewChecker(conf *Config, fset *token.FileSet, pkg *Package, info *Info) *Checker](#NewChecker)
        * [func (check *Checker) assignment(x *operand, T Type, context string)](#Checker.assignment)
        * [func (check *Checker) initConst(lhs *Const, x *operand)](#Checker.initConst)
        * [func (check *Checker) initVar(lhs *Var, x *operand, context string) Type](#Checker.initVar)
        * [func (check *Checker) assignVar(lhs ast.Expr, x *operand) Type](#Checker.assignVar)
        * [func (check *Checker) initVars(lhs []*Var, origRHS []ast.Expr, returnPos token.Pos)](#Checker.initVars)
        * [func (check *Checker) assignVars(lhs, origRHS []ast.Expr)](#Checker.assignVars)
        * [func (check *Checker) shortVarDecl(pos positioner, lhs, rhs []ast.Expr)](#Checker.shortVarDecl)
        * [func (check *Checker) builtin(x *operand, call *ast.CallExpr, id builtinId) (_ bool)](#Checker.builtin)
        * [func (check *Checker) applyTypeFunc(f func(Type) Type, x Type) Type](#Checker.applyTypeFunc)
        * [func (check *Checker) funcInst(x *operand, inst *ast.IndexExpr)](#Checker.funcInst)
        * [func (check *Checker) callExpr(x *operand, call *ast.CallExpr) exprKind](#Checker.callExpr)
        * [func (check *Checker) exprList(elist []ast.Expr, allowCommaOk bool) (xlist []*operand, commaOk bool)](#Checker.exprList)
        * [func (check *Checker) arguments(call *ast.CallExpr, sig *Signature, targs []Type, args []*operand) (rsig *Signature)](#Checker.arguments)
        * [func (check *Checker) selector(x *operand, e *ast.SelectorExpr)](#Checker.selector)
        * [func (check *Checker) use(arg ...ast.Expr)](#Checker.use)
        * [func (check *Checker) useLHS(arg ...ast.Expr)](#Checker.useLHS)
        * [func (check *Checker) instantiatedOperand(x *operand)](#Checker.instantiatedOperand)
        * [func (check *Checker) addDeclDep(to Object)](#Checker.addDeclDep)
        * [func (check *Checker) rememberUntyped(e ast.Expr, lhs bool, mode operandMode, typ *Basic, val constant.Value)](#Checker.rememberUntyped)
        * [func (check *Checker) later(f func())](#Checker.later)
        * [func (check *Checker) push(obj Object) int](#Checker.push)
        * [func (check *Checker) pop() Object](#Checker.pop)
        * [func (check *Checker) initFiles(files []*ast.File)](#Checker.initFiles)
        * [func (check *Checker) handleBailout(err *error)](#Checker.handleBailout)
        * [func (check *Checker) Files(files []*ast.File) error](#Checker.Files)
        * [func (check *Checker) checkFiles(files []*ast.File) (err error)](#Checker.checkFiles)
        * [func (check *Checker) processDelayed(top int)](#Checker.processDelayed)
        * [func (check *Checker) record(x *operand)](#Checker.record)
        * [func (check *Checker) recordUntyped()](#Checker.recordUntyped)
        * [func (check *Checker) recordTypeAndValue(x ast.Expr, mode operandMode, typ Type, val constant.Value)](#Checker.recordTypeAndValue)
        * [func (check *Checker) recordBuiltinType(f ast.Expr, sig *Signature)](#Checker.recordBuiltinType)
        * [func (check *Checker) recordCommaOkTypes(x ast.Expr, a [2]Type)](#Checker.recordCommaOkTypes)
        * [func (check *Checker) recordInferred(call ast.Expr, targs []Type, sig *Signature)](#Checker.recordInferred)
        * [func (check *Checker) recordDef(id *ast.Ident, obj Object)](#Checker.recordDef)
        * [func (check *Checker) recordUse(id *ast.Ident, obj Object)](#Checker.recordUse)
        * [func (check *Checker) recordImplicit(node ast.Node, obj Object)](#Checker.recordImplicit)
        * [func (check *Checker) recordSelection(x *ast.SelectorExpr, kind SelectionKind, recv Type, obj Object, index []int, indirect bool)](#Checker.recordSelection)
        * [func (check *Checker) recordScope(node ast.Node, scope *Scope)](#Checker.recordScope)
        * [func (check *Checker) conversion(x *operand, T Type)](#Checker.conversion)
        * [func (check *Checker) reportAltDecl(obj Object)](#Checker.reportAltDecl)
        * [func (check *Checker) declare(scope *Scope, id *ast.Ident, obj Object, pos token.Pos)](#Checker.declare)
        * [func (check *Checker) objDecl(obj Object, def *Named)](#Checker.objDecl)
        * [func (check *Checker) cycle(obj Object) (isCycle bool)](#Checker.cycle)
        * [func (check *Checker) validType(typ Type, path []Object) typeInfo](#Checker.validType)
        * [func (check *Checker) cycleError(cycle []Object)](#Checker.cycleError)
        * [func (check *Checker) walkDecls(decls []ast.Decl, f func(decl))](#Checker.walkDecls)
        * [func (check *Checker) walkDecl(d ast.Decl, f func(decl))](#Checker.walkDecl)
        * [func (check *Checker) constDecl(obj *Const, typ, init ast.Expr, inherited bool)](#Checker.constDecl)
        * [func (check *Checker) varDecl(obj *Var, lhs []*Var, typ, init ast.Expr)](#Checker.varDecl)
        * [func (check *Checker) typeDecl(obj *TypeName, tdecl *ast.TypeSpec, def *Named)](#Checker.typeDecl)
        * [func (check *Checker) collectTypeParams(list *ast.FieldList) (tparams []*TypeName)](#Checker.collectTypeParams)
        * [func (check *Checker) declareTypeParams(tparams []*TypeName, names []*ast.Ident) []*TypeName](#Checker.declareTypeParams)
        * [func (check *Checker) collectMethods(obj *TypeName)](#Checker.collectMethods)
        * [func (check *Checker) funcDecl(obj *Func, decl *declInfo)](#Checker.funcDecl)
        * [func (check *Checker) declStmt(d ast.Decl)](#Checker.declStmt)
        * [func (check *Checker) qualifier(pkg *Package) string](#Checker.qualifier)
        * [func (check *Checker) markImports(pkg *Package)](#Checker.markImports)
        * [func (check *Checker) sprintf(format string, args ...interface{}) string](#Checker.sprintf)
        * [func (check *Checker) trace(pos token.Pos, format string, args ...interface{})](#Checker.trace)
        * [func (check *Checker) dump(format string, args ...interface{})](#Checker.dump)
        * [func (check *Checker) err(err error)](#Checker.err)
        * [func (check *Checker) newError(at positioner, code errorCode, soft bool, msg string) error](#Checker.newError)
        * [func (check *Checker) newErrorf(at positioner, code errorCode, soft bool, format string, args ...interface{}) error](#Checker.newErrorf)
        * [func (check *Checker) error(at positioner, code errorCode, msg string)](#Checker.error)
        * [func (check *Checker) errorf(at positioner, code errorCode, format string, args ...interface{})](#Checker.errorf)
        * [func (check *Checker) softErrorf(at positioner, code errorCode, format string, args ...interface{})](#Checker.softErrorf)
        * [func (check *Checker) invalidAST(at positioner, format string, args ...interface{})](#Checker.invalidAST)
        * [func (check *Checker) invalidArg(at positioner, code errorCode, format string, args ...interface{})](#Checker.invalidArg)
        * [func (check *Checker) invalidOp(at positioner, code errorCode, format string, args ...interface{})](#Checker.invalidOp)
        * [func (check *Checker) op(m opPredicates, x *operand, op token.Token) bool](#Checker.op)
        * [func (check *Checker) overflow(x *operand, op token.Token, opPos token.Pos)](#Checker.overflow)
        * [func (check *Checker) unary(x *operand, e *ast.UnaryExpr)](#Checker.unary)
        * [func (check *Checker) representable(x *operand, typ *Basic)](#Checker.representable)
        * [func (check *Checker) representation(x *operand, typ *Basic) (constant.Value, errorCode)](#Checker.representation)
        * [func (check *Checker) invalidConversion(code errorCode, x *operand, target Type)](#Checker.invalidConversion)
        * [func (check *Checker) updateExprType(x ast.Expr, typ Type, final bool)](#Checker.updateExprType)
        * [func (check *Checker) updateExprVal(x ast.Expr, val constant.Value)](#Checker.updateExprVal)
        * [func (check *Checker) convertUntyped(x *operand, target Type)](#Checker.convertUntyped)
        * [func (check *Checker) implicitTypeAndValue(x *operand, target Type) (Type, constant.Value, errorCode)](#Checker.implicitTypeAndValue)
        * [func (check *Checker) comparison(x, y *operand, op token.Token)](#Checker.comparison)
        * [func (check *Checker) shift(x, y *operand, e ast.Expr, op token.Token)](#Checker.shift)
        * [func (check *Checker) binary(x *operand, e ast.Expr, lhs, rhs ast.Expr, op token.Token, opPos token.Pos)](#Checker.binary)
        * [func (check *Checker) rawExpr(x *operand, e ast.Expr, hint Type) exprKind](#Checker.rawExpr)
        * [func (check *Checker) exprInternal(x *operand, e ast.Expr, hint Type) exprKind](#Checker.exprInternal)
        * [func (check *Checker) typeAssertion(at positioner, x *operand, xtyp *Interface, T Type)](#Checker.typeAssertion)
        * [func (check *Checker) expr(x *operand, e ast.Expr)](#Checker.expr)
        * [func (check *Checker) multiExpr(x *operand, e ast.Expr)](#Checker.multiExpr)
        * [func (check *Checker) exprWithHint(x *operand, e ast.Expr, hint Type)](#Checker.exprWithHint)
        * [func (check *Checker) exprOrType(x *operand, e ast.Expr)](#Checker.exprOrType)
        * [func (check *Checker) exclude(x *operand, modeset uint)](#Checker.exclude)
        * [func (check *Checker) singleValue(x *operand)](#Checker.singleValue)
        * [func (check *Checker) indexExpr(x *operand, e *ast.IndexExpr) (isFuncInst bool)](#Checker.indexExpr)
        * [func (check *Checker) sliceExpr(x *operand, e *ast.SliceExpr)](#Checker.sliceExpr)
        * [func (check *Checker) singleIndex(e *ast.IndexExpr) ast.Expr](#Checker.singleIndex)
        * [func (check *Checker) index(index ast.Expr, max int64) (typ Type, val int64)](#Checker.index)
        * [func (check *Checker) isValidIndex(x *operand, code errorCode, what string, allowNegative bool) bool](#Checker.isValidIndex)
        * [func (check *Checker) indexedElts(elts []ast.Expr, typ Type, length int64) int64](#Checker.indexedElts)
        * [func (check *Checker) infer(posn positioner, tparams []*TypeName, targs []Type, params *Tuple, args []*operand, report bool) (result []Type)](#Checker.infer)
        * [func (check *Checker) inferB(tparams []*TypeName, targs []Type, report bool) (types []Type, index int)](#Checker.inferB)
        * [func (check *Checker) structuralType(constraint Type) Type](#Checker.structuralType)
        * [func (check *Checker) initOrder()](#Checker.initOrder)
        * [func (check *Checker) reportCycle(cycle []Object)](#Checker.reportCycle)
        * [func (check *Checker) labels(body *ast.BlockStmt)](#Checker.labels)
        * [func (check *Checker) blockBranches(all *Scope, parent *block, lstmt *ast.LabeledStmt, list []ast.Stmt) []*ast.BranchStmt](#Checker.blockBranches)
        * [func (check *Checker) lookupFieldOrMethod(T Type, addressable bool, pkg *Package, name string) (obj Object, index []int, indirect bool)](#Checker.lookupFieldOrMethod)
        * [func (check *Checker) rawLookupFieldOrMethod(T Type, addressable bool, pkg *Package, name string) (obj Object, index []int, indirect bool)](#Checker.rawLookupFieldOrMethod)
        * [func (check *Checker) consolidateMultiples(list []embeddedType) []embeddedType](#Checker.consolidateMultiples)
        * [func (check *Checker) lookupType(m map[Type]int, typ Type) (int, bool)](#Checker.lookupType)
        * [func (check *Checker) missingMethod(V Type, T *Interface, static bool) (method, wrongType *Func)](#Checker.missingMethod)
        * [func (check *Checker) assertableTo(V *Interface, T Type) (method, wrongType *Func)](#Checker.assertableTo)
        * [func (check *Checker) identical(x, y Type) bool](#Checker.identical)
        * [func (check *Checker) identicalIgnoreTags(x, y Type) bool](#Checker.identicalIgnoreTags)
        * [func (check *Checker) identical0(x, y Type, cmpTags bool, p *ifacePair) bool](#Checker.identical0)
        * [func (check *Checker) identicalTParams(x, y []*TypeName, cmpTags bool, p *ifacePair) bool](#Checker.identicalTParams)
        * [func (check *Checker) arityMatch(s, init *ast.ValueSpec)](#Checker.arityMatch)
        * [func (check *Checker) declarePkgObj(ident *ast.Ident, obj Object, d *declInfo)](#Checker.declarePkgObj)
        * [func (check *Checker) filename(fileNo int) string](#Checker.filename)
        * [func (check *Checker) importPackage(at positioner, path, dir string) *Package](#Checker.importPackage)
        * [func (check *Checker) collectObjects()](#Checker.collectObjects)
        * [func (check *Checker) unpackRecv(rtyp ast.Expr, unpackParams bool) (ptr bool, rname *ast.Ident, tparams []*ast.Ident)](#Checker.unpackRecv)
        * [func (check *Checker) resolveBaseTypeName(seenPtr bool, name *ast.Ident) (ptr bool, base *TypeName)](#Checker.resolveBaseTypeName)
        * [func (check *Checker) packageObjects()](#Checker.packageObjects)
        * [func (check *Checker) unusedImports()](#Checker.unusedImports)
        * [func (check *Checker) errorUnusedPkg(obj *PkgName)](#Checker.errorUnusedPkg)
        * [func (check *Checker) isTerminating(s ast.Stmt, label string) bool](#Checker.isTerminating)
        * [func (check *Checker) isTerminatingList(list []ast.Stmt, label string) bool](#Checker.isTerminatingList)
        * [func (check *Checker) isTerminatingSwitch(body *ast.BlockStmt, label string) bool](#Checker.isTerminatingSwitch)
        * [func (check *Checker) funcBody(decl *declInfo, name string, sig *Signature, body *ast.BlockStmt, iota constant.Value)](#Checker.funcBody)
        * [func (check *Checker) usage(scope *Scope)](#Checker.usage)
        * [func (check *Checker) simpleStmt(s ast.Stmt)](#Checker.simpleStmt)
        * [func (check *Checker) stmtList(ctxt stmtContext, list []ast.Stmt)](#Checker.stmtList)
        * [func (check *Checker) multipleDefaults(list []ast.Stmt)](#Checker.multipleDefaults)
        * [func (check *Checker) openScope(node ast.Node, comment string)](#Checker.openScope)
        * [func (check *Checker) closeScope()](#Checker.closeScope)
        * [func (check *Checker) suspendedCall(keyword string, call *ast.CallExpr)](#Checker.suspendedCall)
        * [func (check *Checker) caseValues(x *operand, values []ast.Expr, seen valueMap)](#Checker.caseValues)
        * [func (check *Checker) caseTypes(x *operand, xtyp *Interface, types []ast.Expr, seen map[Type]ast.Expr) (T Type)](#Checker.caseTypes)
        * [func (check *Checker) stmt(ctxt stmtContext, s ast.Stmt)](#Checker.stmt)
        * [func (check *Checker) instantiate(pos token.Pos, typ Type, targs []Type, poslist []token.Pos) (res Type)](#Checker.instantiate)
        * [func (check *Checker) subst(pos token.Pos, typ Type, smap *substMap) Type](#Checker.subst)
        * [func (check *Checker) newNamed(obj *TypeName, underlying Type, methods []*Func) *Named](#Checker.newNamed)
        * [func (check *Checker) newTypeParam(obj *TypeName, index int, bound Type) *_TypeParam](#Checker.newTypeParam)
        * [func (check *Checker) ident(x *operand, e *ast.Ident, def *Named, wantType bool)](#Checker.ident)
        * [func (check *Checker) typ(e ast.Expr) Type](#Checker.typ)
        * [func (check *Checker) varType(e ast.Expr) Type](#Checker.varType)
        * [func (check *Checker) ordinaryType(pos positioner, typ Type)](#Checker.ordinaryType)
        * [func (check *Checker) anyType(e ast.Expr) Type](#Checker.anyType)
        * [func (check *Checker) definedType(e ast.Expr, def *Named) Type](#Checker.definedType)
        * [func (check *Checker) genericType(e ast.Expr, reportErr bool) Type](#Checker.genericType)
        * [func (check *Checker) funcType(sig *Signature, recvPar *ast.FieldList, ftyp *ast.FuncType)](#Checker.funcType)
        * [func (check *Checker) typInternal(e0 ast.Expr, def *Named) (T Type)](#Checker.typInternal)
        * [func (check *Checker) typeOrNil(e ast.Expr) Type](#Checker.typeOrNil)
        * [func (check *Checker) instantiatedType(x ast.Expr, targs []ast.Expr, def *Named) Type](#Checker.instantiatedType)
        * [func (check *Checker) arrayLength(e ast.Expr) int64](#Checker.arrayLength)
        * [func (check *Checker) typeList(list []ast.Expr) []Type](#Checker.typeList)
        * [func (check *Checker) collectParams(scope *Scope, list *ast.FieldList, type0 ast.Expr, variadicOk bool) (params []*Var, variadic bool)](#Checker.collectParams)
        * [func (check *Checker) declareInSet(oset *objset, pos token.Pos, obj Object) bool](#Checker.declareInSet)
        * [func (check *Checker) interfaceType(ityp *Interface, iface *ast.InterfaceType, def *Named)](#Checker.interfaceType)
        * [func (check *Checker) completeInterface(pos token.Pos, ityp *Interface)](#Checker.completeInterface)
        * [func (check *Checker) tag(t *ast.BasicLit) string](#Checker.tag)
        * [func (check *Checker) structType(styp *Struct, e *ast.StructType)](#Checker.structType)
        * [func (check *Checker) collectTypeConstraints(pos token.Pos, types []ast.Expr) []Type](#Checker.collectTypeConstraints)
        * [func (check *Checker) langCompat(lit *ast.BasicLit)](#Checker.langCompat)
        * [func (check *Checker) allowVersion(pkg *Package, major, minor int) bool](#Checker.allowVersion)
    * [type bailout struct{}](#bailout)
    * [type typeInfo uint](#typeInfo)
    * [type decl interface](#decl)
    * [type importDecl struct](#importDecl)
        * [func (d importDecl) node() ast.Node](#importDecl.node)
    * [type constDecl struct](#constDecl)
        * [func (d constDecl) node() ast.Node](#constDecl.node)
    * [type varDecl struct](#varDecl)
        * [func (d varDecl) node() ast.Node](#varDecl.node)
    * [type typeDecl struct](#typeDecl)
        * [func (d typeDecl) node() ast.Node](#typeDecl.node)
    * [type funcDecl struct](#funcDecl)
        * [func (d funcDecl) node() ast.Node](#funcDecl.node)
    * [type errorCode int](#errorCode)
    * [type positioner interface](#positioner)
    * [type posSpan struct](#posSpan)
        * [func inNode(node ast.Node, pos token.Pos) posSpan](#inNode)
        * [func spanOf(at positioner) posSpan](#spanOf)
        * [func (e posSpan) Pos() token.Pos](#posSpan.Pos)
    * [type atPos token.Pos](#atPos)
        * [func (s atPos) Pos() token.Pos](#atPos.Pos)
    * [type opPredicates map[token.Token]func(std/go/types.Type) bool](#opPredicates)
    * [type exprKind int](#exprKind)
    * [type tpWalker struct](#tpWalker)
        * [func (w *tpWalker) isParameterized(typ Type) (res bool)](#tpWalker.isParameterized)
        * [func (w *tpWalker) isParameterizedList(list []Type) bool](#tpWalker.isParameterizedList)
    * [type dependency interface](#dependency)
    * [type graphNode struct](#graphNode)
    * [type nodeSet map[*types.graphNode]bool](#nodeSet)
        * [func (s *nodeSet) add(p *graphNode)](#nodeSet.add)
    * [type nodeQueue []*types.graphNode](#nodeQueue)
        * [func (a nodeQueue) Len() int](#nodeQueue.Len)
        * [func (a nodeQueue) Swap(i, j int)](#nodeQueue.Swap)
        * [func (a nodeQueue) Less(i, j int) bool](#nodeQueue.Less)
        * [func (a *nodeQueue) Push(x interface{})](#nodeQueue.Push)
        * [func (a *nodeQueue) Pop() interface{}](#nodeQueue.Pop)
    * [type block struct](#block)
        * [func (b *block) insert(s *ast.LabeledStmt)](#block.insert)
        * [func (b *block) gotoTarget(name string) *ast.LabeledStmt](#block.gotoTarget)
        * [func (b *block) enclosingTarget(name string) *ast.LabeledStmt](#block.enclosingTarget)
    * [type embeddedType struct](#embeddedType)
    * [type MethodSet struct](#MethodSet)
        * [func NewMethodSet(T Type) *MethodSet](#NewMethodSet)
        * [func (s *MethodSet) String() string](#MethodSet.String)
        * [func (s *MethodSet) Len() int](#MethodSet.Len)
        * [func (s *MethodSet) At(i int) *Selection](#MethodSet.At)
        * [func (s *MethodSet) Lookup(pkg *Package, name string) *Selection](#MethodSet.Lookup)
    * [type methodSet map[string]*types.Selection](#methodSet)
        * [func (s methodSet) add(list []*Func, index []int, indirect bool, multiples bool) methodSet](#methodSet.add)
    * [type Object interface](#Object)
        * [func LookupFieldOrMethod(T Type, addressable bool, pkg *Package, name string) (obj Object, index []int, indirect bool)](#LookupFieldOrMethod)
    * [type object struct](#object)
        * [func (obj *object) Parent() *Scope](#object.Parent)
        * [func (obj *object) Pos() token.Pos](#object.Pos)
        * [func (obj *object) Pkg() *Package](#object.Pkg)
        * [func (obj *object) Name() string](#object.Name)
        * [func (obj *object) Type() Type](#object.Type)
        * [func (obj *object) Exported() bool](#object.Exported)
        * [func (obj *object) Id() string](#object.Id)
        * [func (obj *object) String() string](#object.String)
        * [func (obj *object) order() uint32](#object.order)
        * [func (obj *object) color() color](#object.color)
        * [func (obj *object) scopePos() token.Pos](#object.scopePos)
        * [func (obj *object) setParent(parent *Scope)](#object.setParent)
        * [func (obj *object) setType(typ Type)](#object.setType)
        * [func (obj *object) setOrder(order uint32)](#object.setOrder)
        * [func (obj *object) setColor(color color)](#object.setColor)
        * [func (obj *object) setScopePos(pos token.Pos)](#object.setScopePos)
        * [func (obj *object) sameId(pkg *Package, name string) bool](#object.sameId)
    * [type color uint32](#color)
        * [func colorFor(t Type) color](#colorFor)
        * [func (c color) String() string](#color.String)
    * [type PkgName struct](#PkgName)
        * [func NewPkgName(pos token.Pos, pkg *Package, name string, imported *Package) *PkgName](#NewPkgName)
        * [func (obj *PkgName) Imported() *Package](#PkgName.Imported)
        * [func (obj *PkgName) String() string](#PkgName.String)
    * [type Const struct](#Const)
        * [func NewConst(pos token.Pos, pkg *Package, name string, typ Type, val constant.Value) *Const](#NewConst)
        * [func (obj *Const) Val() constant.Value](#Const.Val)
        * [func (*Const) isDependency()](#Const.isDependency)
        * [func (obj *Const) String() string](#Const.String)
    * [type TypeName struct](#TypeName)
        * [func NewTypeName(pos token.Pos, pkg *Package, name string, typ Type) *TypeName](#NewTypeName)
        * [func (obj *TypeName) IsAlias() bool](#TypeName.IsAlias)
        * [func (obj *TypeName) String() string](#TypeName.String)
    * [type Var struct](#Var)
        * [func NewVar(pos token.Pos, pkg *Package, name string, typ Type) *Var](#NewVar)
        * [func NewParam(pos token.Pos, pkg *Package, name string, typ Type) *Var](#NewParam)
        * [func NewField(pos token.Pos, pkg *Package, name string, typ Type, embedded bool) *Var](#NewField)
        * [func (obj *Var) Anonymous() bool](#Var.Anonymous)
        * [func (obj *Var) Embedded() bool](#Var.Embedded)
        * [func (obj *Var) IsField() bool](#Var.IsField)
        * [func (*Var) isDependency()](#Var.isDependency)
        * [func (obj *Var) String() string](#Var.String)
    * [type Func struct](#Func)
        * [func MissingMethod(V Type, T *Interface, static bool) (method *Func, wrongType bool)](#MissingMethod)
        * [func lookupMethod(methods []*Func, pkg *Package, name string) (int, *Func)](#lookupMethod)
        * [func NewFunc(pos token.Pos, pkg *Package, name string, sig *Signature) *Func](#NewFunc)
        * [func (obj *Func) FullName() string](#Func.FullName)
        * [func (obj *Func) Scope() *Scope](#Func.Scope)
        * [func (*Func) isDependency()](#Func.isDependency)
        * [func (obj *Func) String() string](#Func.String)
    * [type Label struct](#Label)
        * [func NewLabel(pos token.Pos, pkg *Package, name string) *Label](#NewLabel)
        * [func (obj *Label) String() string](#Label.String)
    * [type Builtin struct](#Builtin)
        * [func newBuiltin(id builtinId) *Builtin](#newBuiltin)
        * [func (obj *Builtin) String() string](#Builtin.String)
    * [type Nil struct](#Nil)
        * [func (obj *Nil) String() string](#Nil.String)
    * [type objset map[string]types.Object](#objset)
        * [func (s *objset) insert(obj Object) Object](#objset.insert)
    * [type operandMode byte](#operandMode)
    * [type operand struct](#operand)
        * [func (x *operand) convertibleTo(check *Checker, T Type, reason *string) bool](#operand.convertibleTo)
        * [func (x *operand) Pos() token.Pos](#operand.Pos)
        * [func (x *operand) String() string](#operand.String)
        * [func (x *operand) setConst(tok token.Token, lit string)](#operand.setConst)
        * [func (x *operand) isNil() bool](#operand.isNil)
        * [func (x *operand) assignableTo(check *Checker, T Type, reason *string) (bool, errorCode)](#operand.assignableTo)
    * [type Package struct](#Package)
        * [func NewPackage(path, name string) *Package](#NewPackage)
        * [func (pkg *Package) Path() string](#Package.Path)
        * [func (pkg *Package) Name() string](#Package.Name)
        * [func (pkg *Package) SetName(name string)](#Package.SetName)
        * [func (pkg *Package) Scope() *Scope](#Package.Scope)
        * [func (pkg *Package) Complete() bool](#Package.Complete)
        * [func (pkg *Package) MarkComplete()](#Package.MarkComplete)
        * [func (pkg *Package) Imports() []*Package](#Package.Imports)
        * [func (pkg *Package) SetImports(list []*Package)](#Package.SetImports)
        * [func (pkg *Package) String() string](#Package.String)
    * [type ifacePair struct](#ifacePair)
        * [func (p *ifacePair) identical(q *ifacePair) bool](#ifacePair.identical)
    * [type declInfo struct](#declInfo)
        * [func (d *declInfo) hasInitializer() bool](#declInfo.hasInitializer)
        * [func (d *declInfo) addDep(obj Object)](#declInfo.addDep)
    * [type inSourceOrder []types.Object](#inSourceOrder)
        * [func (a inSourceOrder) Len() int](#inSourceOrder.Len)
        * [func (a inSourceOrder) Less(i, j int) bool](#inSourceOrder.Less)
        * [func (a inSourceOrder) Swap(i, j int)](#inSourceOrder.Swap)
    * [type sanitizer map[types.Type]types.Type](#sanitizer)
        * [func (s sanitizer) typ(typ Type) Type](#sanitizer.typ)
        * [func (s sanitizer) var_(v *Var)](#sanitizer.var_)
        * [func (s sanitizer) varList(list []*Var)](#sanitizer.varList)
        * [func (s sanitizer) tuple(t *Tuple)](#sanitizer.tuple)
        * [func (s sanitizer) func_(f *Func)](#sanitizer.func_)
        * [func (s sanitizer) funcList(list []*Func)](#sanitizer.funcList)
        * [func (s sanitizer) typeList(list []Type)](#sanitizer.typeList)
    * [type Scope struct](#Scope)
        * [func NewScope(parent *Scope, pos, end token.Pos, comment string) *Scope](#NewScope)
        * [func (s *Scope) Parent() *Scope](#Scope.Parent)
        * [func (s *Scope) Len() int](#Scope.Len)
        * [func (s *Scope) Names() []string](#Scope.Names)
        * [func (s *Scope) NumChildren() int](#Scope.NumChildren)
        * [func (s *Scope) Child(i int) *Scope](#Scope.Child)
        * [func (s *Scope) Lookup(name string) Object](#Scope.Lookup)
        * [func (s *Scope) LookupParent(name string, pos token.Pos) (*Scope, Object)](#Scope.LookupParent)
        * [func (s *Scope) Insert(obj Object) Object](#Scope.Insert)
        * [func (s *Scope) squash(err func(obj, alt Object))](#Scope.squash)
        * [func (s *Scope) Pos() token.Pos](#Scope.Pos)
        * [func (s *Scope) End() token.Pos](#Scope.End)
        * [func (s *Scope) Contains(pos token.Pos) bool](#Scope.Contains)
        * [func (s *Scope) Innermost(pos token.Pos) *Scope](#Scope.Innermost)
        * [func (s *Scope) WriteTo(w io.Writer, n int, recurse bool)](#Scope.WriteTo)
        * [func (s *Scope) String() string](#Scope.String)
    * [type SelectionKind int](#SelectionKind)
    * [type Selection struct](#Selection)
        * [func (s *Selection) Kind() SelectionKind](#Selection.Kind)
        * [func (s *Selection) Recv() Type](#Selection.Recv)
        * [func (s *Selection) Obj() Object](#Selection.Obj)
        * [func (s *Selection) Type() Type](#Selection.Type)
        * [func (s *Selection) Index() []int](#Selection.Index)
        * [func (s *Selection) Indirect() bool](#Selection.Indirect)
        * [func (s *Selection) String() string](#Selection.String)
    * [type Sizes interface](#Sizes)
        * [func SizesFor(compiler, arch string) Sizes](#SizesFor)
    * [type StdSizes struct](#StdSizes)
        * [func (s *StdSizes) Alignof(T Type) int64](#StdSizes.Alignof)
        * [func (s *StdSizes) Offsetsof(fields []*Var) []int64](#StdSizes.Offsetsof)
        * [func (s *StdSizes) Sizeof(T Type) int64](#StdSizes.Sizeof)
    * [type stmtContext uint](#stmtContext)
    * [type valueMap map[interface{}][]types.valueType](#valueMap)
    * [type valueType struct](#valueType)
    * [type substMap struct](#substMap)
        * [func makeSubstMap(tpars []*TypeName, targs []Type) *substMap](#makeSubstMap)
        * [func (m *substMap) String() string](#substMap.String)
        * [func (m *substMap) empty() bool](#substMap.empty)
        * [func (m *substMap) lookup(tpar *_TypeParam) Type](#substMap.lookup)
    * [type subster struct](#subster)
        * [func (subst *subster) typ(typ Type) Type](#subster.typ)
        * [func (subst *subster) typOrNil(typ Type) Type](#subster.typOrNil)
        * [func (subst *subster) var_(v *Var) *Var](#subster.var_)
        * [func (subst *subster) tuple(t *Tuple) *Tuple](#subster.tuple)
        * [func (subst *subster) varList(in []*Var) (out []*Var, copied bool)](#subster.varList)
        * [func (subst *subster) func_(f *Func) *Func](#subster.func_)
        * [func (subst *subster) funcList(in []*Func) (out []*Func, copied bool)](#subster.funcList)
        * [func (subst *subster) typeList(in []Type) (out []Type, copied bool)](#subster.typeList)
    * [type Type interface](#Type)
        * [func implicitArrayDeref(typ Type) Type](#implicitArrayDeref)
        * [func deref(typ Type) (Type, bool)](#deref)
        * [func derefStructPtr(typ Type) Type](#derefStructPtr)
        * [func Default(typ Type) Type](#Default)
        * [func _NewSum(types []Type) Type](#_NewSum)
        * [func optype(typ Type) Type](#optype)
        * [func expand(typ Type) Type](#expand)
        * [func under(t Type) Type](#under)
        * [func intersect(x, y Type) (r Type)](#intersect)
    * [type BasicKind int](#BasicKind)
    * [type BasicInfo int](#BasicInfo)
    * [type Basic struct](#Basic)
        * [func asBasic(t Type) *Basic](#asBasic)
        * [func (b *Basic) Kind() BasicKind](#Basic.Kind)
        * [func (b *Basic) Info() BasicInfo](#Basic.Info)
        * [func (b *Basic) Name() string](#Basic.Name)
        * [func (t *Basic) Underlying() Type](#Basic.Underlying)
        * [func (t *Basic) String() string](#Basic.String)
    * [type Array struct](#Array)
        * [func NewArray(elem Type, len int64) *Array](#NewArray)
        * [func asArray(t Type) *Array](#asArray)
        * [func (a *Array) Len() int64](#Array.Len)
        * [func (a *Array) Elem() Type](#Array.Elem)
        * [func (t *Array) Underlying() Type](#Array.Underlying)
        * [func (t *Array) String() string](#Array.String)
    * [type Slice struct](#Slice)
        * [func NewSlice(elem Type) *Slice](#NewSlice)
        * [func asSlice(t Type) *Slice](#asSlice)
        * [func (s *Slice) Elem() Type](#Slice.Elem)
        * [func (t *Slice) Underlying() Type](#Slice.Underlying)
        * [func (t *Slice) String() string](#Slice.String)
    * [type Struct struct](#Struct)
        * [func NewStruct(fields []*Var, tags []string) *Struct](#NewStruct)
        * [func asStruct(t Type) *Struct](#asStruct)
        * [func (s *Struct) NumFields() int](#Struct.NumFields)
        * [func (s *Struct) Field(i int) *Var](#Struct.Field)
        * [func (s *Struct) Tag(i int) string](#Struct.Tag)
        * [func (t *Struct) Underlying() Type](#Struct.Underlying)
        * [func (t *Struct) String() string](#Struct.String)
    * [type Pointer struct](#Pointer)
        * [func NewPointer(elem Type) *Pointer](#NewPointer)
        * [func asPointer(t Type) *Pointer](#asPointer)
        * [func (p *Pointer) Elem() Type](#Pointer.Elem)
        * [func (t *Pointer) Underlying() Type](#Pointer.Underlying)
        * [func (t *Pointer) String() string](#Pointer.String)
    * [type Tuple struct](#Tuple)
        * [func NewTuple(x ...*Var) *Tuple](#NewTuple)
        * [func asTuple(t Type) *Tuple](#asTuple)
        * [func (t *Tuple) Len() int](#Tuple.Len)
        * [func (t *Tuple) At(i int) *Var](#Tuple.At)
        * [func (t *Tuple) Underlying() Type](#Tuple.Underlying)
        * [func (t *Tuple) String() string](#Tuple.String)
    * [type Signature struct](#Signature)
        * [func makeSig(res Type, args ...Type) *Signature](#makeSig)
        * [func NewSignature(recv *Var, params, results *Tuple, variadic bool) *Signature](#NewSignature)
        * [func asSignature(t Type) *Signature](#asSignature)
        * [func (s *Signature) Recv() *Var](#Signature.Recv)
        * [func (s *Signature) _TParams() []*TypeName](#Signature._TParams)
        * [func (s *Signature) _SetTParams(tparams []*TypeName)](#Signature._SetTParams)
        * [func (s *Signature) Params() *Tuple](#Signature.Params)
        * [func (s *Signature) Results() *Tuple](#Signature.Results)
        * [func (s *Signature) Variadic() bool](#Signature.Variadic)
        * [func (t *Signature) Underlying() Type](#Signature.Underlying)
        * [func (t *Signature) String() string](#Signature.String)
    * [type _Sum struct](#_Sum)
        * [func asSum(t Type) *_Sum](#asSum)
        * [func (s *_Sum) is(pred func(Type) bool) bool](#_Sum.is)
        * [func (t *_Sum) Underlying() Type](#_Sum.Underlying)
        * [func (t *_Sum) String() string](#_Sum.String)
    * [type Interface struct](#Interface)
        * [func NewInterface(methods []*Func, embeddeds []*Named) *Interface](#NewInterface)
        * [func NewInterfaceType(methods []*Func, embeddeds []Type) *Interface](#NewInterfaceType)
        * [func asInterface(t Type) *Interface](#asInterface)
        * [func (t *Interface) is(pred func(Type) bool) bool](#Interface.is)
        * [func (t *Interface) NumExplicitMethods() int](#Interface.NumExplicitMethods)
        * [func (t *Interface) ExplicitMethod(i int) *Func](#Interface.ExplicitMethod)
        * [func (t *Interface) NumEmbeddeds() int](#Interface.NumEmbeddeds)
        * [func (t *Interface) Embedded(i int) *Named](#Interface.Embedded)
        * [func (t *Interface) EmbeddedType(i int) Type](#Interface.EmbeddedType)
        * [func (t *Interface) NumMethods() int](#Interface.NumMethods)
        * [func (t *Interface) assertCompleteness()](#Interface.assertCompleteness)
        * [func (t *Interface) Method(i int) *Func](#Interface.Method)
        * [func (t *Interface) Empty() bool](#Interface.Empty)
        * [func (t *Interface) _HasTypeList() bool](#Interface._HasTypeList)
        * [func (t *Interface) _IsComparable() bool](#Interface._IsComparable)
        * [func (t *Interface) _IsConstraint() bool](#Interface._IsConstraint)
        * [func (t *Interface) iterate(f func(*Interface) bool, seen map[*Interface]bool) bool](#Interface.iterate)
        * [func (t *Interface) isSatisfiedBy(typ Type) bool](#Interface.isSatisfiedBy)
        * [func (t *Interface) Complete() *Interface](#Interface.Complete)
        * [func (t *Interface) Underlying() Type](#Interface.Underlying)
        * [func (t *Interface) String() string](#Interface.String)
    * [type Map struct](#Map)
        * [func NewMap(key, elem Type) *Map](#NewMap)
        * [func asMap(t Type) *Map](#asMap)
        * [func (m *Map) Key() Type](#Map.Key)
        * [func (m *Map) Elem() Type](#Map.Elem)
        * [func (t *Map) Underlying() Type](#Map.Underlying)
        * [func (t *Map) String() string](#Map.String)
    * [type Chan struct](#Chan)
        * [func NewChan(dir ChanDir, elem Type) *Chan](#NewChan)
        * [func asChan(t Type) *Chan](#asChan)
        * [func (c *Chan) Dir() ChanDir](#Chan.Dir)
        * [func (c *Chan) Elem() Type](#Chan.Elem)
        * [func (t *Chan) Underlying() Type](#Chan.Underlying)
        * [func (t *Chan) String() string](#Chan.String)
    * [type ChanDir int](#ChanDir)
    * [type Named struct](#Named)
        * [func NewNamed(obj *TypeName, underlying Type, methods []*Func) *Named](#NewNamed)
        * [func asNamed(t Type) *Named](#asNamed)
        * [func (n0 *Named) under() Type](#Named.under)
        * [func (n *Named) setUnderlying(typ Type)](#Named.setUnderlying)
        * [func (t *Named) Obj() *TypeName](#Named.Obj)
        * [func (t *Named) _TParams() []*TypeName](#Named._TParams)
        * [func (t *Named) _TArgs() []Type](#Named._TArgs)
        * [func (t *Named) _SetTArgs(args []Type)](#Named._SetTArgs)
        * [func (t *Named) NumMethods() int](#Named.NumMethods)
        * [func (t *Named) Method(i int) *Func](#Named.Method)
        * [func (t *Named) SetUnderlying(underlying Type)](#Named.SetUnderlying)
        * [func (t *Named) AddMethod(m *Func)](#Named.AddMethod)
        * [func (t *Named) Underlying() Type](#Named.Underlying)
        * [func (t *Named) String() string](#Named.String)
    * [type _TypeParam struct](#_TypeParam)
        * [func asTypeParam(t Type) *_TypeParam](#asTypeParam)
        * [func (t *_TypeParam) Bound() *Interface](#_TypeParam.Bound)
        * [func (t *_TypeParam) Underlying() Type](#_TypeParam.Underlying)
        * [func (t *_TypeParam) String() string](#_TypeParam.String)
    * [type instance struct](#instance)
        * [func (t *instance) expand() Type](#instance.expand)
        * [func (t *instance) Underlying() Type](#instance.Underlying)
        * [func (t *instance) String() string](#instance.String)
    * [type bottom struct{}](#bottom)
        * [func (t *bottom) Underlying() Type](#bottom.Underlying)
        * [func (t *bottom) String() string](#bottom.String)
    * [type top struct{}](#top)
        * [func (t *top) Underlying() Type](#top.Underlying)
        * [func (t *top) String() string](#top.String)
    * [type Qualifier func(*std/go/types.Package) string](#Qualifier)
        * [func RelativeTo(pkg *Package) Qualifier](#RelativeTo)
    * [type byUniqueTypeName []types.Type](#byUniqueTypeName)
        * [func (a byUniqueTypeName) Len() int](#byUniqueTypeName.Len)
        * [func (a byUniqueTypeName) Less(i, j int) bool](#byUniqueTypeName.Less)
        * [func (a byUniqueTypeName) Swap(i, j int)](#byUniqueTypeName.Swap)
    * [type byUniqueMethodName []*types.Func](#byUniqueMethodName)
        * [func (a byUniqueMethodName) Len() int](#byUniqueMethodName.Len)
        * [func (a byUniqueMethodName) Less(i, j int) bool](#byUniqueMethodName.Less)
        * [func (a byUniqueMethodName) Swap(i, j int)](#byUniqueMethodName.Swap)
    * [type unifier struct](#unifier)
        * [func newUnifier(check *Checker, exact bool) *unifier](#newUnifier)
        * [func (u *unifier) unify(x, y Type) bool](#unifier.unify)
        * [func (u *unifier) join(i, j int) bool](#unifier.join)
        * [func (u *unifier) nifyEq(x, y Type, p *ifacePair) bool](#unifier.nifyEq)
        * [func (u *unifier) nify(x, y Type, p *ifacePair) bool](#unifier.nify)
    * [type tparamsList struct](#tparamsList)
        * [func (d *tparamsList) String() string](#tparamsList.String)
        * [func (d *tparamsList) init(tparams []*TypeName)](#tparamsList.init.unify.go)
        * [func (d *tparamsList) index(typ Type) int](#tparamsList.index)
        * [func (d *tparamsList) setIndex(i, tj int)](#tparamsList.setIndex)
        * [func (d *tparamsList) at(i int) Type](#tparamsList.at)
        * [func (d *tparamsList) set(i int, typ Type)](#tparamsList.set)
        * [func (d *tparamsList) types() (list []Type, index int)](#tparamsList.types)
    * [type builtinId int](#builtinId)
    * [type version struct](#version)
        * [func parseGoVersion(s string) (v version, err error)](#parseGoVersion)
* [Functions](#func)
    * [func srcimporter_setUsesCgo(conf *Config)](#srcimporter_setUsesCgo)
    * [func AssertableTo(V *Interface, T Type) bool](#AssertableTo)
    * [func AssignableTo(V, T Type) bool](#AssignableTo)
    * [func ConvertibleTo(V, T Type) bool](#ConvertibleTo)
    * [func Implements(V Type, T *Interface) bool](#Implements)
    * [func Identical(x, y Type) bool](#Identical)
    * [func IdenticalIgnoreTags(x, y Type) bool](#IdenticalIgnoreTags)
    * [func getInferred(info *Info) map[ast.Expr]_Inferred](#getInferred)
    * [func unparen(e ast.Expr) ast.Expr](#unparen)
    * [func isUintptr(typ Type) bool](#isUintptr)
    * [func isUnsafePointer(typ Type) bool](#isUnsafePointer)
    * [func isPointer(typ Type) bool](#isPointer)
    * [func isBytesOrRunes(typ Type) bool](#isBytesOrRunes)
    * [func pathString(path []Object) string](#pathString)
    * [func firstInSrc(path []Object) int](#firstInSrc)
    * [func assert(p bool)](#assert)
    * [func unreachable()](#unreachable)
    * [func stripAnnotations(s string) string](#stripAnnotations)
    * [func CheckExpr(fset *token.FileSet, pkg *Package, pos token.Pos, expr ast.Expr, info *Info) (err error)](#CheckExpr)
    * [func init()](#init.expr.go)
    * [func opName(e ast.Expr) string](#opName)
    * [func isShift(op token.Token) bool](#isShift)
    * [func isComparison(op token.Token) bool](#isComparison)
    * [func fitsFloat32(x constant.Value) bool](#fitsFloat32)
    * [func roundFloat32(x constant.Value) constant.Value](#roundFloat32)
    * [func fitsFloat64(x constant.Value) bool](#fitsFloat64)
    * [func roundFloat64(x constant.Value) constant.Value](#roundFloat64)
    * [func representableConst(x constant.Value, check *Checker, typ *Basic, rounded *constant.Value) bool](#representableConst)
    * [func init()](#init.expr.go.0xc05a5bcd60)
    * [func keyVal(x constant.Value) interface{}](#keyVal)
    * [func ExprString(x ast.Expr) string](#ExprString)
    * [func WriteExpr(buf *bytes.Buffer, x ast.Expr)](#WriteExpr)
    * [func writeSigExpr(buf *bytes.Buffer, sig *ast.FuncType)](#writeSigExpr)
    * [func writeFieldList(buf *bytes.Buffer, list []*ast.Field, sep string, iface bool)](#writeFieldList)
    * [func writeIdentList(buf *bytes.Buffer, list []*ast.Ident)](#writeIdentList)
    * [func writeExprList(buf *bytes.Buffer, list []ast.Expr)](#writeExprList)
    * [func typeNamesString(list []*TypeName) string](#typeNamesString)
    * [func isParameterized(tparams []*TypeName, typ Type) bool](#isParameterized)
    * [func findPath(objMap map[Object]*declInfo, from, to Object, seen map[Object]bool) []Object](#findPath)
    * [func dependencyGraph(objMap map[Object]*declInfo) []*graphNode](#dependencyGraph)
    * [func concat(list []int, i int) []int](#concat)
    * [func fieldIndex(fields []*Var, pkg *Package, name string) int](#fieldIndex)
    * [func ptrRecv(f *Func) bool](#ptrRecv)
    * [func Id(pkg *Package, name string) string](#Id)
    * [func writeObject(buf *bytes.Buffer, obj Object, qf Qualifier)](#writeObject)
    * [func writePackage(buf *bytes.Buffer, pkg *Package, qf Qualifier)](#writePackage)
    * [func ObjectString(obj Object, qf Qualifier) string](#ObjectString)
    * [func writeFuncName(buf *bytes.Buffer, f *Func, qf Qualifier)](#writeFuncName)
    * [func operandString(x *operand, qf Qualifier) string](#operandString)
    * [func isNamed(typ Type) bool](#isNamed)
    * [func isGeneric(typ Type) bool](#isGeneric)
    * [func is(typ Type, what BasicInfo) bool](#is)
    * [func isBoolean(typ Type) bool](#isBoolean)
    * [func isInteger(typ Type) bool](#isInteger)
    * [func isUnsigned(typ Type) bool](#isUnsigned)
    * [func isFloat(typ Type) bool](#isFloat)
    * [func isComplex(typ Type) bool](#isComplex)
    * [func isNumeric(typ Type) bool](#isNumeric)
    * [func isString(typ Type) bool](#isString)
    * [func isIntegerOrFloat(typ Type) bool](#isIntegerOrFloat)
    * [func isNumericOrString(typ Type) bool](#isNumericOrString)
    * [func isTyped(typ Type) bool](#isTyped)
    * [func isUntyped(typ Type) bool](#isUntyped)
    * [func isOrdered(typ Type) bool](#isOrdered)
    * [func isConstType(typ Type) bool](#isConstType)
    * [func IsInterface(typ Type) bool](#IsInterface)
    * [func Comparable(T Type) bool](#Comparable)
    * [func comparable(T Type, seen map[Type]bool) bool](#comparable)
    * [func hasNil(typ Type) bool](#hasNil)
    * [func validatedImportPath(path string) (string, error)](#validatedImportPath)
    * [func dir(path string) string](#dir)
    * [func hasBreak(s ast.Stmt, label string, implicit bool) bool](#hasBreak)
    * [func hasBreakList(list []ast.Stmt, label string, implicit bool) bool](#hasBreakList)
    * [func sanitizeInfo(info *Info)](#sanitizeInfo)
    * [func SelectionString(s *Selection, qf Qualifier) string](#SelectionString)
    * [func align(x, a int64) int64](#align)
    * [func trimTrailingEmptyStmts(list []ast.Stmt) []ast.Stmt](#trimTrailingEmptyStmts)
    * [func assignOp(op token.Token) token.Token](#assignOp)
    * [func goVal(val constant.Value) interface{}](#goVal)
    * [func isVarName(x ast.Expr) bool](#isVarName)
    * [func rangeKeyVal(typ Type, wantKey, wantVal bool) (Type, Type, string)](#rangeKeyVal)
    * [func instantiatedHash(typ *Named, targs []Type) string](#instantiatedHash)
    * [func typeListString(list []Type) string](#typeListString)
    * [func unpackType(typ Type) []Type](#unpackType)
    * [func nextId() uint64](#nextId)
    * [func init()](#init.type.go)
    * [func TypeString(typ Type, qf Qualifier) string](#TypeString)
    * [func WriteType(buf *bytes.Buffer, typ Type, qf Qualifier)](#WriteType)
    * [func writeType(buf *bytes.Buffer, typ Type, qf Qualifier, visited []Type)](#writeType)
    * [func writeTypeList(buf *bytes.Buffer, list []Type, qf Qualifier, visited []Type)](#writeTypeList)
    * [func writeTParamList(buf *bytes.Buffer, list []*TypeName, qf Qualifier, visited []Type)](#writeTParamList)
    * [func writeTypeName(buf *bytes.Buffer, obj *TypeName, qf Qualifier)](#writeTypeName)
    * [func writeTuple(buf *bytes.Buffer, tup *Tuple, variadic bool, qf Qualifier, visited []Type)](#writeTuple)
    * [func WriteSignature(buf *bytes.Buffer, sig *Signature, qf Qualifier)](#WriteSignature)
    * [func writeSignature(buf *bytes.Buffer, sig *Signature, qf Qualifier, visited []Type)](#writeSignature)
    * [func subscript(x uint64) string](#subscript)
    * [func isubst(x ast.Expr, smap map[*ast.Ident]*ast.Ident) ast.Expr](#isubst)
    * [func goTypeName(typ Type) string](#goTypeName)
    * [func sortTypes(list []Type)](#sortTypes)
    * [func sortName(t Type) string](#sortName)
    * [func sortMethods(list []*Func)](#sortMethods)
    * [func assertSortedMethods(list []*Func)](#assertSortedMethods)
    * [func embeddedFieldIdent(e ast.Expr) *ast.Ident](#embeddedFieldIdent)
    * [func includes(list []Type, typ Type) bool](#includes)
    * [func defPredeclaredTypes()](#defPredeclaredTypes)
    * [func defPredeclaredConsts()](#defPredeclaredConsts)
    * [func defPredeclaredNil()](#defPredeclaredNil)
    * [func defPredeclaredFuncs()](#defPredeclaredFuncs)
    * [func DefPredeclaredTestFuncs()](#DefPredeclaredTestFuncs)
    * [func defPredeclaredComparable()](#defPredeclaredComparable)
    * [func init()](#init.universe.go)
    * [func def(obj Object)](#def)
    * [func TestStripAnnotations(t *testing.T)](#TestStripAnnotations)
    * [func TestIsAlias(t *testing.T)](#TestIsAlias)
    * [func TestEmbeddedMethod(t *testing.T)](#TestEmbeddedMethod)
    * [func TestSizeof(t *testing.T)](#TestSizeof)
    * [func TestZeroTok(t *testing.T)](#TestZeroTok)
    * [func TestAssignOp(t *testing.T)](#TestAssignOp)
    * [func ResetId()](#ResetId)
    * [func SetGoVersion(config *Config, goVersion string)](#SetGoVersion)


## <a id="const" href="#const">Constants</a>

### <a id="debug" href="#debug">const debug</a>

```
searchKey: types.debug
tags: [private]
```

```Go
const debug = false // leave on during development

```

debugging/development support 

### <a id="trace" href="#trace">const trace</a>

```
searchKey: types.trace
tags: [private]
```

```Go
const trace = false // turn on for detailed type resolution traces

```

debugging/development support 

### <a id="forceStrict" href="#forceStrict">const forceStrict</a>

```
searchKey: types.forceStrict
tags: [private]
```

```Go
const forceStrict = false
```

If forceStrict is set, the type-checker enforces additional rules not specified by the Go 1 spec, but which will catch guaranteed run-time errors if the respective code is executed. In other words, programs passing in strict mode are Go 1 compliant, but not all Go 1 programs will pass in strict mode. The additional rules are: 

- A type assertion x.(T) where T is an interface type 

```
is invalid if any (statically known) method that exists
for both x and T have different signatures.

```
### <a id="_Test" href="#_Test">const _Test</a>

```
searchKey: types._Test
tags: [private]
```

```Go
const _Test
```

_Test is reserved for errors that only apply while in self-test mode. 

### <a id="_BlankPkgName" href="#_BlankPkgName">const _BlankPkgName</a>

```
searchKey: types._BlankPkgName
tags: [private]
```

```Go
const _BlankPkgName
```

_BlankPkgName occurs when a package name is the blank identifier "_". 

Per the spec: 

```
"The PackageName must not be the blank identifier."

```
### <a id="_MismatchedPkgName" href="#_MismatchedPkgName">const _MismatchedPkgName</a>

```
searchKey: types._MismatchedPkgName
tags: [private]
```

```Go
const _MismatchedPkgName
```

_MismatchedPkgName occurs when a file's package name doesn't match the package name already established by other files. 

### <a id="_InvalidPkgUse" href="#_InvalidPkgUse">const _InvalidPkgUse</a>

```
searchKey: types._InvalidPkgUse
tags: [private]
```

```Go
const _InvalidPkgUse
```

_InvalidPkgUse occurs when a package identifier is used outside of a selector expression. 

Example: 

```
import "fmt"

var _ = fmt

```
### <a id="_BadImportPath" href="#_BadImportPath">const _BadImportPath</a>

```
searchKey: types._BadImportPath
tags: [private]
```

```Go
const _BadImportPath
```

_BadImportPath occurs when an import path is not valid. 

### <a id="_BrokenImport" href="#_BrokenImport">const _BrokenImport</a>

```
searchKey: types._BrokenImport
tags: [private]
```

```Go
const _BrokenImport
```

_BrokenImport occurs when importing a package fails. 

Example: 

```
import "amissingpackage"

```
### <a id="_ImportCRenamed" href="#_ImportCRenamed">const _ImportCRenamed</a>

```
searchKey: types._ImportCRenamed
tags: [private]
```

```Go
const _ImportCRenamed
```

_ImportCRenamed occurs when the special import "C" is renamed. "C" is a pseudo-package, and must not be renamed. 

Example: 

```
import _ "C"

```
### <a id="_UnusedImport" href="#_UnusedImport">const _UnusedImport</a>

```
searchKey: types._UnusedImport
tags: [private]
```

```Go
const _UnusedImport
```

_UnusedImport occurs when an import is unused. 

Example: 

```
import "fmt"

func main() {}

```
### <a id="_InvalidInitCycle" href="#_InvalidInitCycle">const _InvalidInitCycle</a>

```
searchKey: types._InvalidInitCycle
tags: [private]
```

```Go
const _InvalidInitCycle
```

_InvalidInitCycle occurs when an invalid cycle is detected within the initialization graph. 

Example: 

```
var x int = f()

func f() int { return x }

```
### <a id="_DuplicateDecl" href="#_DuplicateDecl">const _DuplicateDecl</a>

```
searchKey: types._DuplicateDecl
tags: [private]
```

```Go
const _DuplicateDecl
```

_DuplicateDecl occurs when an identifier is declared multiple times. 

Example: 

```
var x = 1
var x = 2

```
### <a id="_InvalidDeclCycle" href="#_InvalidDeclCycle">const _InvalidDeclCycle</a>

```
searchKey: types._InvalidDeclCycle
tags: [private]
```

```Go
const _InvalidDeclCycle
```

_InvalidDeclCycle occurs when a declaration cycle is not valid. 

Example: 

```
import "unsafe"

type T struct {
	a [n]int
}

var n = unsafe.Sizeof(T{})

```
### <a id="_InvalidTypeCycle" href="#_InvalidTypeCycle">const _InvalidTypeCycle</a>

```
searchKey: types._InvalidTypeCycle
tags: [private]
```

```Go
const _InvalidTypeCycle
```

_InvalidTypeCycle occurs when a cycle in type definitions results in a type that is not well-defined. 

Example: 

```
import "unsafe"

type T [unsafe.Sizeof(T{})]int

```
### <a id="_InvalidConstInit" href="#_InvalidConstInit">const _InvalidConstInit</a>

```
searchKey: types._InvalidConstInit
tags: [private]
```

```Go
const _InvalidConstInit
```

_InvalidConstInit occurs when a const declaration has a non-constant initializer. 

Example: 

```
var x int
const _ = x

```
### <a id="_InvalidConstVal" href="#_InvalidConstVal">const _InvalidConstVal</a>

```
searchKey: types._InvalidConstVal
tags: [private]
```

```Go
const _InvalidConstVal
```

_InvalidConstVal occurs when a const value cannot be converted to its target type. 

TODO(findleyr): this error code and example are not very clear. Consider removing it. 

Example: 

```
const _ = 1 << "hello"

```
### <a id="_InvalidConstType" href="#_InvalidConstType">const _InvalidConstType</a>

```
searchKey: types._InvalidConstType
tags: [private]
```

```Go
const _InvalidConstType
```

_InvalidConstType occurs when the underlying type in a const declaration is not a valid constant type. 

Example: 

```
const c *int = 4

```
### <a id="_UntypedNil" href="#_UntypedNil">const _UntypedNil</a>

```
searchKey: types._UntypedNil
tags: [private]
```

```Go
const _UntypedNil
```

_UntypedNil occurs when the predeclared (untyped) value nil is used to initialize a variable declared without an explicit type. 

Example: 

```
var x = nil

```
### <a id="_WrongAssignCount" href="#_WrongAssignCount">const _WrongAssignCount</a>

```
searchKey: types._WrongAssignCount
tags: [private]
```

```Go
const _WrongAssignCount
```

_WrongAssignCount occurs when the number of values on the right-hand side of an assignment or initialization expression does not match the number of variables on the left-hand side. 

Example: 

```
var x = 1, 2

```
### <a id="_UnassignableOperand" href="#_UnassignableOperand">const _UnassignableOperand</a>

```
searchKey: types._UnassignableOperand
tags: [private]
```

```Go
const _UnassignableOperand
```

_UnassignableOperand occurs when the left-hand side of an assignment is not assignable. 

Example: 

```
func f() {
	const c = 1
	c = 2
}

```
### <a id="_NoNewVar" href="#_NoNewVar">const _NoNewVar</a>

```
searchKey: types._NoNewVar
tags: [private]
```

```Go
const _NoNewVar
```

_NoNewVar occurs when a short variable declaration (':=') does not declare new variables. 

Example: 

```
func f() {
	x := 1
	x := 2
}

```
### <a id="_MultiValAssignOp" href="#_MultiValAssignOp">const _MultiValAssignOp</a>

```
searchKey: types._MultiValAssignOp
tags: [private]
```

```Go
const _MultiValAssignOp
```

_MultiValAssignOp occurs when an assignment operation (+=, *=, etc) does not have single-valued left-hand or right-hand side. 

Per the spec: 

```
"In assignment operations, both the left- and right-hand expression lists
must contain exactly one single-valued expression"

```
Example: 

```
func f() int {
	x, y := 1, 2
	x, y += 1
	return x + y
}

```
### <a id="_InvalidIfaceAssign" href="#_InvalidIfaceAssign">const _InvalidIfaceAssign</a>

```
searchKey: types._InvalidIfaceAssign
tags: [private]
```

```Go
const _InvalidIfaceAssign
```

_InvalidIfaceAssign occurs when a value of type T is used as an interface, but T does not implement a method of the expected interface. 

Example: 

```
type I interface {
	f()
}

type T int

var x I = T(1)

```
### <a id="_InvalidChanAssign" href="#_InvalidChanAssign">const _InvalidChanAssign</a>

```
searchKey: types._InvalidChanAssign
tags: [private]
```

```Go
const _InvalidChanAssign
```

_InvalidChanAssign occurs when a chan assignment is invalid. 

Per the spec, a value x is assignable to a channel type T if: 

```
"x is a bidirectional channel value, T is a channel type, x's type V and
T have identical element types, and at least one of V or T is not a
defined type."

```
Example: 

```
type T1 chan int
type T2 chan int

var x T1
// Invalid assignment because both types are named
var _ T2 = x

```
### <a id="_IncompatibleAssign" href="#_IncompatibleAssign">const _IncompatibleAssign</a>

```
searchKey: types._IncompatibleAssign
tags: [private]
```

```Go
const _IncompatibleAssign
```

_IncompatibleAssign occurs when the type of the right-hand side expression in an assignment cannot be assigned to the type of the variable being assigned. 

Example: 

```
var x []int
var _ int = x

```
### <a id="_UnaddressableFieldAssign" href="#_UnaddressableFieldAssign">const _UnaddressableFieldAssign</a>

```
searchKey: types._UnaddressableFieldAssign
tags: [private]
```

```Go
const _UnaddressableFieldAssign
```

_UnaddressableFieldAssign occurs when trying to assign to a struct field in a map value. 

Example: 

```
func f() {
	m := make(map[string]struct{i int})
	m["foo"].i = 42
}

```
### <a id="_NotAType" href="#_NotAType">const _NotAType</a>

```
searchKey: types._NotAType
tags: [private]
```

```Go
const _NotAType
```

_NotAType occurs when the identifier used as the underlying type in a type declaration or the right-hand side of a type alias does not denote a type. 

Example: 

```
var S = 2

type T S

```
### <a id="_InvalidArrayLen" href="#_InvalidArrayLen">const _InvalidArrayLen</a>

```
searchKey: types._InvalidArrayLen
tags: [private]
```

```Go
const _InvalidArrayLen
```

_InvalidArrayLen occurs when an array length is not a constant value. 

Example: 

```
var n = 3
var _ = [n]int{}

```
### <a id="_BlankIfaceMethod" href="#_BlankIfaceMethod">const _BlankIfaceMethod</a>

```
searchKey: types._BlankIfaceMethod
tags: [private]
```

```Go
const _BlankIfaceMethod
```

_BlankIfaceMethod occurs when a method name is '_'. 

Per the spec: 

```
"The name of each explicitly specified method must be unique and not
blank."

```
Example: 

```
type T interface {
	_(int)
}

```
### <a id="_IncomparableMapKey" href="#_IncomparableMapKey">const _IncomparableMapKey</a>

```
searchKey: types._IncomparableMapKey
tags: [private]
```

```Go
const _IncomparableMapKey
```

_IncomparableMapKey occurs when a map key type does not support the == and != operators. 

Per the spec: 

```
"The comparison operators == and != must be fully defined for operands of
the key type; thus the key type must not be a function, map, or slice."

```
Example: 

```
var x map[T]int

type T []int

```
### <a id="_InvalidIfaceEmbed" href="#_InvalidIfaceEmbed">const _InvalidIfaceEmbed</a>

```
searchKey: types._InvalidIfaceEmbed
tags: [private]
```

```Go
const _InvalidIfaceEmbed
```

_InvalidIfaceEmbed occurs when a non-interface type is embedded in an interface. 

Example: 

```
type T struct {}

func (T) m()

type I interface {
	T
}

```
### <a id="_InvalidPtrEmbed" href="#_InvalidPtrEmbed">const _InvalidPtrEmbed</a>

```
searchKey: types._InvalidPtrEmbed
tags: [private]
```

```Go
const _InvalidPtrEmbed
```

_InvalidPtrEmbed occurs when an embedded field is of the pointer form *T, and T itself is itself a pointer, an unsafe.Pointer, or an interface. 

Per the spec: 

```
"An embedded field must be specified as a type name T or as a pointer to
a non-interface type name *T, and T itself may not be a pointer type."

```
Example: 

```
type T *int

type S struct {
	*T
}

```
### <a id="_BadRecv" href="#_BadRecv">const _BadRecv</a>

```
searchKey: types._BadRecv
tags: [private]
```

```Go
const _BadRecv
```

_BadRecv occurs when a method declaration does not have exactly one receiver parameter. 

Example: 

```
func () _() {}

```
### <a id="_InvalidRecv" href="#_InvalidRecv">const _InvalidRecv</a>

```
searchKey: types._InvalidRecv
tags: [private]
```

```Go
const _InvalidRecv
```

_InvalidRecv occurs when a receiver type expression is not of the form T or *T, or T is a pointer type. 

Example: 

```
type T struct {}

func (**T) m() {}

```
### <a id="_DuplicateFieldAndMethod" href="#_DuplicateFieldAndMethod">const _DuplicateFieldAndMethod</a>

```
searchKey: types._DuplicateFieldAndMethod
tags: [private]
```

```Go
const _DuplicateFieldAndMethod
```

_DuplicateFieldAndMethod occurs when an identifier appears as both a field and method name. 

Example: 

```
type T struct {
	m int
}

func (T) m() {}

```
### <a id="_DuplicateMethod" href="#_DuplicateMethod">const _DuplicateMethod</a>

```
searchKey: types._DuplicateMethod
tags: [private]
```

```Go
const _DuplicateMethod
```

_DuplicateMethod occurs when two methods on the same receiver type have the same name. 

Example: 

```
type T struct {}
func (T) m() {}
func (T) m(i int) int { return i }

```
### <a id="_InvalidBlank" href="#_InvalidBlank">const _InvalidBlank</a>

```
searchKey: types._InvalidBlank
tags: [private]
```

```Go
const _InvalidBlank
```

_InvalidBlank occurs when a blank identifier is used as a value or type. 

Per the spec: 

```
"The blank identifier may appear as an operand only on the left-hand side
of an assignment."

```
Example: 

```
var x = _

```
### <a id="_InvalidIota" href="#_InvalidIota">const _InvalidIota</a>

```
searchKey: types._InvalidIota
tags: [private]
```

```Go
const _InvalidIota
```

_InvalidIota occurs when the predeclared identifier iota is used outside of a constant declaration. 

Example: 

```
var x = iota

```
### <a id="_MissingInitBody" href="#_MissingInitBody">const _MissingInitBody</a>

```
searchKey: types._MissingInitBody
tags: [private]
```

```Go
const _MissingInitBody
```

_MissingInitBody occurs when an init function is missing its body. 

Example: 

```
func init()

```
### <a id="_InvalidInitSig" href="#_InvalidInitSig">const _InvalidInitSig</a>

```
searchKey: types._InvalidInitSig
tags: [private deprecated]
```

```Go
const _InvalidInitSig
```

_InvalidInitSig occurs when an init function declares parameters or results. 

Deprecated: no longer emitted by the type checker. _InvalidInitDecl is used instead. 

### <a id="_InvalidInitDecl" href="#_InvalidInitDecl">const _InvalidInitDecl</a>

```
searchKey: types._InvalidInitDecl
tags: [private]
```

```Go
const _InvalidInitDecl
```

_InvalidInitDecl occurs when init is declared as anything other than a function. 

Example: 

```
var init = 1

```
Example: 

```
func init() int { return 1 }

```
### <a id="_InvalidMainDecl" href="#_InvalidMainDecl">const _InvalidMainDecl</a>

```
searchKey: types._InvalidMainDecl
tags: [private]
```

```Go
const _InvalidMainDecl
```

_InvalidMainDecl occurs when main is declared as anything other than a function, in a main package. 

### <a id="_TooManyValues" href="#_TooManyValues">const _TooManyValues</a>

```
searchKey: types._TooManyValues
tags: [private]
```

```Go
const _TooManyValues
```

_TooManyValues occurs when a function returns too many values for the expression context in which it is used. 

Example: 

```
func ReturnTwo() (int, int) {
	return 1, 2
}

var x = ReturnTwo()

```
### <a id="_NotAnExpr" href="#_NotAnExpr">const _NotAnExpr</a>

```
searchKey: types._NotAnExpr
tags: [private]
```

```Go
const _NotAnExpr
```

_NotAnExpr occurs when a type expression is used where a value expression is expected. 

Example: 

```
type T struct {}

func f() {
	T
}

```
### <a id="_TruncatedFloat" href="#_TruncatedFloat">const _TruncatedFloat</a>

```
searchKey: types._TruncatedFloat
tags: [private]
```

```Go
const _TruncatedFloat
```

_TruncatedFloat occurs when a float constant is truncated to an integer value. 

Example: 

```
var _ int = 98.6

```
### <a id="_NumericOverflow" href="#_NumericOverflow">const _NumericOverflow</a>

```
searchKey: types._NumericOverflow
tags: [private]
```

```Go
const _NumericOverflow
```

_NumericOverflow occurs when a numeric constant overflows its target type. 

Example: 

```
var x int8 = 1000

```
### <a id="_UndefinedOp" href="#_UndefinedOp">const _UndefinedOp</a>

```
searchKey: types._UndefinedOp
tags: [private]
```

```Go
const _UndefinedOp
```

_UndefinedOp occurs when an operator is not defined for the type(s) used in an operation. 

Example: 

```
var c = "a" - "b"

```
### <a id="_MismatchedTypes" href="#_MismatchedTypes">const _MismatchedTypes</a>

```
searchKey: types._MismatchedTypes
tags: [private]
```

```Go
const _MismatchedTypes
```

_MismatchedTypes occurs when operand types are incompatible in a binary operation. 

Example: 

```
var a = "hello"
var b = 1
var c = a - b

```
### <a id="_DivByZero" href="#_DivByZero">const _DivByZero</a>

```
searchKey: types._DivByZero
tags: [private]
```

```Go
const _DivByZero
```

_DivByZero occurs when a division operation is provable at compile time to be a division by zero. 

Example: 

```
const divisor = 0
var x int = 1/divisor

```
### <a id="_NonNumericIncDec" href="#_NonNumericIncDec">const _NonNumericIncDec</a>

```
searchKey: types._NonNumericIncDec
tags: [private]
```

```Go
const _NonNumericIncDec
```

_NonNumericIncDec occurs when an increment or decrement operator is applied to a non-numeric value. 

Example: 

```
func f() {
	var c = "c"
	c++
}

```
### <a id="_UnaddressableOperand" href="#_UnaddressableOperand">const _UnaddressableOperand</a>

```
searchKey: types._UnaddressableOperand
tags: [private]
```

```Go
const _UnaddressableOperand
```

_UnaddressableOperand occurs when the & operator is applied to an unaddressable expression. 

Example: 

```
var x = &1

```
### <a id="_InvalidIndirection" href="#_InvalidIndirection">const _InvalidIndirection</a>

```
searchKey: types._InvalidIndirection
tags: [private]
```

```Go
const _InvalidIndirection
```

_InvalidIndirection occurs when a non-pointer value is indirected via the '*' operator. 

Example: 

```
var x int
var y = *x

```
### <a id="_NonIndexableOperand" href="#_NonIndexableOperand">const _NonIndexableOperand</a>

```
searchKey: types._NonIndexableOperand
tags: [private]
```

```Go
const _NonIndexableOperand
```

_NonIndexableOperand occurs when an index operation is applied to a value that cannot be indexed. 

Example: 

```
var x = 1
var y = x[1]

```
### <a id="_InvalidIndex" href="#_InvalidIndex">const _InvalidIndex</a>

```
searchKey: types._InvalidIndex
tags: [private]
```

```Go
const _InvalidIndex
```

_InvalidIndex occurs when an index argument is not of integer type, negative, or out-of-bounds. 

Example: 

```
var s = [...]int{1,2,3}
var x = s[5]

```
Example: 

```
var s = []int{1,2,3}
var _ = s[-1]

```
Example: 

```
var s = []int{1,2,3}
var i string
var _ = s[i]

```
### <a id="_SwappedSliceIndices" href="#_SwappedSliceIndices">const _SwappedSliceIndices</a>

```
searchKey: types._SwappedSliceIndices
tags: [private]
```

```Go
const _SwappedSliceIndices
```

_SwappedSliceIndices occurs when constant indices in a slice expression are decreasing in value. 

Example: 

```
var _ = []int{1,2,3}[2:1]

```
### <a id="_NonSliceableOperand" href="#_NonSliceableOperand">const _NonSliceableOperand</a>

```
searchKey: types._NonSliceableOperand
tags: [private]
```

```Go
const _NonSliceableOperand
```

_NonSliceableOperand occurs when a slice operation is applied to a value whose type is not sliceable, or is unaddressable. 

Example: 

```
var x = [...]int{1, 2, 3}[:1]

```
Example: 

```
var x = 1
var y = 1[:1]

```
### <a id="_InvalidSliceExpr" href="#_InvalidSliceExpr">const _InvalidSliceExpr</a>

```
searchKey: types._InvalidSliceExpr
tags: [private]
```

```Go
const _InvalidSliceExpr
```

_InvalidSliceExpr occurs when a three-index slice expression (a[x:y:z]) is applied to a string. 

Example: 

```
var s = "hello"
var x = s[1:2:3]

```
### <a id="_InvalidShiftCount" href="#_InvalidShiftCount">const _InvalidShiftCount</a>

```
searchKey: types._InvalidShiftCount
tags: [private]
```

```Go
const _InvalidShiftCount
```

_InvalidShiftCount occurs when the right-hand side of a shift operation is either non-integer, negative, or too large. 

Example: 

```
var (
	x string
	y int = 1 << x
)

```
### <a id="_InvalidShiftOperand" href="#_InvalidShiftOperand">const _InvalidShiftOperand</a>

```
searchKey: types._InvalidShiftOperand
tags: [private]
```

```Go
const _InvalidShiftOperand
```

_InvalidShiftOperand occurs when the shifted operand is not an integer. 

Example: 

```
var s = "hello"
var x = s << 2

```
### <a id="_InvalidReceive" href="#_InvalidReceive">const _InvalidReceive</a>

```
searchKey: types._InvalidReceive
tags: [private]
```

```Go
const _InvalidReceive
```

_InvalidReceive occurs when there is a channel receive from a value that is either not a channel, or is a send-only channel. 

Example: 

```
func f() {
	var x = 1
	<-x
}

```
### <a id="_InvalidSend" href="#_InvalidSend">const _InvalidSend</a>

```
searchKey: types._InvalidSend
tags: [private]
```

```Go
const _InvalidSend
```

_InvalidSend occurs when there is a channel send to a value that is not a channel, or is a receive-only channel. 

Example: 

```
func f() {
	var x = 1
	x <- "hello!"
}

```
### <a id="_DuplicateLitKey" href="#_DuplicateLitKey">const _DuplicateLitKey</a>

```
searchKey: types._DuplicateLitKey
tags: [private]
```

```Go
const _DuplicateLitKey
```

_DuplicateLitKey occurs when an index is duplicated in a slice, array, or map literal. 

Example: 

```
var _ = []int{0:1, 0:2}

```
Example: 

```
var _ = map[string]int{"a": 1, "a": 2}

```
### <a id="_MissingLitKey" href="#_MissingLitKey">const _MissingLitKey</a>

```
searchKey: types._MissingLitKey
tags: [private]
```

```Go
const _MissingLitKey
```

_MissingLitKey occurs when a map literal is missing a key expression. 

Example: 

```
var _ = map[string]int{1}

```
### <a id="_InvalidLitIndex" href="#_InvalidLitIndex">const _InvalidLitIndex</a>

```
searchKey: types._InvalidLitIndex
tags: [private]
```

```Go
const _InvalidLitIndex
```

_InvalidLitIndex occurs when the key in a key-value element of a slice or array literal is not an integer constant. 

Example: 

```
var i = 0
var x = []string{i: "world"}

```
### <a id="_OversizeArrayLit" href="#_OversizeArrayLit">const _OversizeArrayLit</a>

```
searchKey: types._OversizeArrayLit
tags: [private]
```

```Go
const _OversizeArrayLit
```

_OversizeArrayLit occurs when an array literal exceeds its length. 

Example: 

```
var _ = [2]int{1,2,3}

```
### <a id="_MixedStructLit" href="#_MixedStructLit">const _MixedStructLit</a>

```
searchKey: types._MixedStructLit
tags: [private]
```

```Go
const _MixedStructLit
```

_MixedStructLit occurs when a struct literal contains a mix of positional and named elements. 

Example: 

```
var _ = struct{i, j int}{i: 1, 2}

```
### <a id="_InvalidStructLit" href="#_InvalidStructLit">const _InvalidStructLit</a>

```
searchKey: types._InvalidStructLit
tags: [private]
```

```Go
const _InvalidStructLit
```

_InvalidStructLit occurs when a positional struct literal has an incorrect number of values. 

Example: 

```
var _ = struct{i, j int}{1,2,3}

```
### <a id="_MissingLitField" href="#_MissingLitField">const _MissingLitField</a>

```
searchKey: types._MissingLitField
tags: [private]
```

```Go
const _MissingLitField
```

_MissingLitField occurs when a struct literal refers to a field that does not exist on the struct type. 

Example: 

```
var _ = struct{i int}{j: 2}

```
### <a id="_DuplicateLitField" href="#_DuplicateLitField">const _DuplicateLitField</a>

```
searchKey: types._DuplicateLitField
tags: [private]
```

```Go
const _DuplicateLitField
```

_DuplicateLitField occurs when a struct literal contains duplicated fields. 

Example: 

```
var _ = struct{i int}{i: 1, i: 2}

```
### <a id="_UnexportedLitField" href="#_UnexportedLitField">const _UnexportedLitField</a>

```
searchKey: types._UnexportedLitField
tags: [private]
```

```Go
const _UnexportedLitField
```

_UnexportedLitField occurs when a positional struct literal implicitly assigns an unexported field of an imported type. 

### <a id="_InvalidLitField" href="#_InvalidLitField">const _InvalidLitField</a>

```
searchKey: types._InvalidLitField
tags: [private]
```

```Go
const _InvalidLitField
```

_InvalidLitField occurs when a field name is not a valid identifier. 

Example: 

```
var _ = struct{i int}{1: 1}

```
### <a id="_UntypedLit" href="#_UntypedLit">const _UntypedLit</a>

```
searchKey: types._UntypedLit
tags: [private]
```

```Go
const _UntypedLit
```

_UntypedLit occurs when a composite literal omits a required type identifier. 

Example: 

```
type outer struct{
	inner struct { i int }
}

var _ = outer{inner: {1}}

```
### <a id="_InvalidLit" href="#_InvalidLit">const _InvalidLit</a>

```
searchKey: types._InvalidLit
tags: [private]
```

```Go
const _InvalidLit
```

_InvalidLit occurs when a composite literal expression does not match its type. 

Example: 

```
type P *struct{
	x int
}
var _ = P {}

```
### <a id="_AmbiguousSelector" href="#_AmbiguousSelector">const _AmbiguousSelector</a>

```
searchKey: types._AmbiguousSelector
tags: [private]
```

```Go
const _AmbiguousSelector
```

_AmbiguousSelector occurs when a selector is ambiguous. 

Example: 

```
type E1 struct { i int }
type E2 struct { i int }
type T struct { E1; E2 }

var x T
var _ = x.i

```
### <a id="_UndeclaredImportedName" href="#_UndeclaredImportedName">const _UndeclaredImportedName</a>

```
searchKey: types._UndeclaredImportedName
tags: [private]
```

```Go
const _UndeclaredImportedName
```

_UndeclaredImportedName occurs when a package-qualified identifier is undeclared by the imported package. 

Example: 

```
import "go/types"

var _ = types.NotAnActualIdentifier

```
### <a id="_UnexportedName" href="#_UnexportedName">const _UnexportedName</a>

```
searchKey: types._UnexportedName
tags: [private]
```

```Go
const _UnexportedName
```

_UnexportedName occurs when a selector refers to an unexported identifier of an imported package. 

Example: 

```
import "reflect"

type _ reflect.flag

```
### <a id="_UndeclaredName" href="#_UndeclaredName">const _UndeclaredName</a>

```
searchKey: types._UndeclaredName
tags: [private]
```

```Go
const _UndeclaredName
```

_UndeclaredName occurs when an identifier is not declared in the current scope. 

Example: 

```
var x T

```
### <a id="_MissingFieldOrMethod" href="#_MissingFieldOrMethod">const _MissingFieldOrMethod</a>

```
searchKey: types._MissingFieldOrMethod
tags: [private]
```

```Go
const _MissingFieldOrMethod
```

_MissingFieldOrMethod occurs when a selector references a field or method that does not exist. 

Example: 

```
type T struct {}

var x = T{}.f

```
### <a id="_BadDotDotDotSyntax" href="#_BadDotDotDotSyntax">const _BadDotDotDotSyntax</a>

```
searchKey: types._BadDotDotDotSyntax
tags: [private]
```

```Go
const _BadDotDotDotSyntax
```

_BadDotDotDotSyntax occurs when a "..." occurs in a context where it is not valid. 

Example: 

```
var _ = map[int][...]int{0: {}}

```
### <a id="_NonVariadicDotDotDot" href="#_NonVariadicDotDotDot">const _NonVariadicDotDotDot</a>

```
searchKey: types._NonVariadicDotDotDot
tags: [private]
```

```Go
const _NonVariadicDotDotDot
```

_NonVariadicDotDotDot occurs when a "..." is used on the final argument to a non-variadic function. 

Example: 

```
func printArgs(s []string) {
	for _, a := range s {
		println(a)
	}
}

func f() {
	s := []string{"a", "b", "c"}
	printArgs(s...)
}

```
### <a id="_MisplacedDotDotDot" href="#_MisplacedDotDotDot">const _MisplacedDotDotDot</a>

```
searchKey: types._MisplacedDotDotDot
tags: [private]
```

```Go
const _MisplacedDotDotDot
```

_MisplacedDotDotDot occurs when a "..." is used somewhere other than the final argument in a function declaration. 

Example: 

```
func f(...int, int)

```
### <a id="_InvalidDotDotDot" href="#_InvalidDotDotDot">const _InvalidDotDotDot</a>

```
searchKey: types._InvalidDotDotDot
tags: [private]
```

```Go
const _InvalidDotDotDot
```

_InvalidDotDotDot occurs when a "..." is used in a non-variadic built-in function. 

Example: 

```
var s = []int{1, 2, 3}
var l = len(s...)

```
### <a id="_UncalledBuiltin" href="#_UncalledBuiltin">const _UncalledBuiltin</a>

```
searchKey: types._UncalledBuiltin
tags: [private]
```

```Go
const _UncalledBuiltin
```

_UncalledBuiltin occurs when a built-in function is used as a function-valued expression, instead of being called. 

Per the spec: 

```
"The built-in functions do not have standard Go types, so they can only
appear in call expressions; they cannot be used as function values."

```
Example: 

```
var _ = copy

```
### <a id="_InvalidAppend" href="#_InvalidAppend">const _InvalidAppend</a>

```
searchKey: types._InvalidAppend
tags: [private]
```

```Go
const _InvalidAppend
```

_InvalidAppend occurs when append is called with a first argument that is not a slice. 

Example: 

```
var _ = append(1, 2)

```
### <a id="_InvalidCap" href="#_InvalidCap">const _InvalidCap</a>

```
searchKey: types._InvalidCap
tags: [private]
```

```Go
const _InvalidCap
```

_InvalidCap occurs when an argument to the cap built-in function is not of supported type. 

See [https://golang.org/ref/spec#Length_and_capacity](https://golang.org/ref/spec#Length_and_capacity) for information on which underlying types are supported as arguments to cap and len. 

Example: 

```
var s = 2
var x = cap(s)

```
### <a id="_InvalidClose" href="#_InvalidClose">const _InvalidClose</a>

```
searchKey: types._InvalidClose
tags: [private]
```

```Go
const _InvalidClose
```

_InvalidClose occurs when close(...) is called with an argument that is not of channel type, or that is a receive-only channel. 

Example: 

```
func f() {
	var x int
	close(x)
}

```
### <a id="_InvalidCopy" href="#_InvalidCopy">const _InvalidCopy</a>

```
searchKey: types._InvalidCopy
tags: [private]
```

```Go
const _InvalidCopy
```

_InvalidCopy occurs when the arguments are not of slice type or do not have compatible type. 

See [https://golang.org/ref/spec#Appending_and_copying_slices](https://golang.org/ref/spec#Appending_and_copying_slices) for more information on the type requirements for the copy built-in. 

Example: 

```
func f() {
	var x []int
	y := []int64{1,2,3}
	copy(x, y)
}

```
### <a id="_InvalidComplex" href="#_InvalidComplex">const _InvalidComplex</a>

```
searchKey: types._InvalidComplex
tags: [private]
```

```Go
const _InvalidComplex
```

_InvalidComplex occurs when the complex built-in function is called with arguments with incompatible types. 

Example: 

```
var _ = complex(float32(1), float64(2))

```
### <a id="_InvalidDelete" href="#_InvalidDelete">const _InvalidDelete</a>

```
searchKey: types._InvalidDelete
tags: [private]
```

```Go
const _InvalidDelete
```

_InvalidDelete occurs when the delete built-in function is called with a first argument that is not a map. 

Example: 

```
func f() {
	m := "hello"
	delete(m, "e")
}

```
### <a id="_InvalidImag" href="#_InvalidImag">const _InvalidImag</a>

```
searchKey: types._InvalidImag
tags: [private]
```

```Go
const _InvalidImag
```

_InvalidImag occurs when the imag built-in function is called with an argument that does not have complex type. 

Example: 

```
var _ = imag(int(1))

```
### <a id="_InvalidLen" href="#_InvalidLen">const _InvalidLen</a>

```
searchKey: types._InvalidLen
tags: [private]
```

```Go
const _InvalidLen
```

_InvalidLen occurs when an argument to the len built-in function is not of supported type. 

See [https://golang.org/ref/spec#Length_and_capacity](https://golang.org/ref/spec#Length_and_capacity) for information on which underlying types are supported as arguments to cap and len. 

Example: 

```
var s = 2
var x = len(s)

```
### <a id="_SwappedMakeArgs" href="#_SwappedMakeArgs">const _SwappedMakeArgs</a>

```
searchKey: types._SwappedMakeArgs
tags: [private]
```

```Go
const _SwappedMakeArgs
```

_SwappedMakeArgs occurs when make is called with three arguments, and its length argument is larger than its capacity argument. 

Example: 

```
var x = make([]int, 3, 2)

```
### <a id="_InvalidMake" href="#_InvalidMake">const _InvalidMake</a>

```
searchKey: types._InvalidMake
tags: [private]
```

```Go
const _InvalidMake
```

_InvalidMake occurs when make is called with an unsupported type argument. 

See [https://golang.org/ref/spec#Making_slices_maps_and_channels](https://golang.org/ref/spec#Making_slices_maps_and_channels) for information on the types that may be created using make. 

Example: 

```
var x = make(int)

```
### <a id="_InvalidReal" href="#_InvalidReal">const _InvalidReal</a>

```
searchKey: types._InvalidReal
tags: [private]
```

```Go
const _InvalidReal
```

_InvalidReal occurs when the real built-in function is called with an argument that does not have complex type. 

Example: 

```
var _ = real(int(1))

```
### <a id="_InvalidAssert" href="#_InvalidAssert">const _InvalidAssert</a>

```
searchKey: types._InvalidAssert
tags: [private]
```

```Go
const _InvalidAssert
```

_InvalidAssert occurs when a type assertion is applied to a value that is not of interface type. 

Example: 

```
var x = 1
var _ = x.(float64)

```
### <a id="_ImpossibleAssert" href="#_ImpossibleAssert">const _ImpossibleAssert</a>

```
searchKey: types._ImpossibleAssert
tags: [private]
```

```Go
const _ImpossibleAssert
```

_ImpossibleAssert occurs for a type assertion x.(T) when the value x of interface cannot have dynamic type T, due to a missing or mismatching method on T. 

Example: 

```
type T int

func (t *T) m() int { return int(*t) }

type I interface { m() int }

var x I
var _ = x.(T)

```
### <a id="_InvalidConversion" href="#_InvalidConversion">const _InvalidConversion</a>

```
searchKey: types._InvalidConversion
tags: [private]
```

```Go
const _InvalidConversion
```

_InvalidConversion occurs when the argument type cannot be converted to the target. 

See [https://golang.org/ref/spec#Conversions](https://golang.org/ref/spec#Conversions) for the rules of convertibility. 

Example: 

```
var x float64
var _ = string(x)

```
### <a id="_InvalidUntypedConversion" href="#_InvalidUntypedConversion">const _InvalidUntypedConversion</a>

```
searchKey: types._InvalidUntypedConversion
tags: [private]
```

```Go
const _InvalidUntypedConversion
```

_InvalidUntypedConversion occurs when an there is no valid implicit conversion from an untyped value satisfying the type constraints of the context in which it is used. 

Example: 

```
var _ = 1 + ""

```
### <a id="_BadOffsetofSyntax" href="#_BadOffsetofSyntax">const _BadOffsetofSyntax</a>

```
searchKey: types._BadOffsetofSyntax
tags: [private]
```

```Go
const _BadOffsetofSyntax
```

_BadOffsetofSyntax occurs when unsafe.Offsetof is called with an argument that is not a selector expression. 

Example: 

```
import "unsafe"

var x int
var _ = unsafe.Offsetof(x)

```
### <a id="_InvalidOffsetof" href="#_InvalidOffsetof">const _InvalidOffsetof</a>

```
searchKey: types._InvalidOffsetof
tags: [private]
```

```Go
const _InvalidOffsetof
```

_InvalidOffsetof occurs when unsafe.Offsetof is called with a method selector, rather than a field selector, or when the field is embedded via a pointer. 

Per the spec: 

```
"If f is an embedded field, it must be reachable without pointer
indirections through fields of the struct. "

```
Example: 

```
import "unsafe"

type T struct { f int }
type S struct { *T }
var s S
var _ = unsafe.Offsetof(s.f)

```
Example: 

```
import "unsafe"

type S struct{}

func (S) m() {}

var s S
var _ = unsafe.Offsetof(s.m)

```
### <a id="_UnusedExpr" href="#_UnusedExpr">const _UnusedExpr</a>

```
searchKey: types._UnusedExpr
tags: [private]
```

```Go
const _UnusedExpr
```

_UnusedExpr occurs when a side-effect free expression is used as a statement. Such a statement has no effect. 

Example: 

```
func f(i int) {
	i*i
}

```
### <a id="_UnusedVar" href="#_UnusedVar">const _UnusedVar</a>

```
searchKey: types._UnusedVar
tags: [private]
```

```Go
const _UnusedVar
```

_UnusedVar occurs when a variable is declared but unused. 

Example: 

```
func f() {
	x := 1
}

```
### <a id="_MissingReturn" href="#_MissingReturn">const _MissingReturn</a>

```
searchKey: types._MissingReturn
tags: [private]
```

```Go
const _MissingReturn
```

_MissingReturn occurs when a function with results is missing a return statement. 

Example: 

```
func f() int {}

```
### <a id="_WrongResultCount" href="#_WrongResultCount">const _WrongResultCount</a>

```
searchKey: types._WrongResultCount
tags: [private]
```

```Go
const _WrongResultCount
```

_WrongResultCount occurs when a return statement returns an incorrect number of values. 

Example: 

```
func ReturnOne() int {
	return 1, 2
}

```
### <a id="_OutOfScopeResult" href="#_OutOfScopeResult">const _OutOfScopeResult</a>

```
searchKey: types._OutOfScopeResult
tags: [private]
```

```Go
const _OutOfScopeResult
```

_OutOfScopeResult occurs when the name of a value implicitly returned by an empty return statement is shadowed in a nested scope. 

Example: 

```
func factor(n int) (i int) {
	for i := 2; i < n; i++ {
		if n%i == 0 {
			return
		}
	}
	return 0
}

```
### <a id="_InvalidCond" href="#_InvalidCond">const _InvalidCond</a>

```
searchKey: types._InvalidCond
tags: [private]
```

```Go
const _InvalidCond
```

_InvalidCond occurs when an if condition is not a boolean expression. 

Example: 

```
func checkReturn(i int) {
	if i {
		panic("non-zero return")
	}
}

```
### <a id="_InvalidPostDecl" href="#_InvalidPostDecl">const _InvalidPostDecl</a>

```
searchKey: types._InvalidPostDecl
tags: [private]
```

```Go
const _InvalidPostDecl
```

_InvalidPostDecl occurs when there is a declaration in a for-loop post statement. 

Example: 

```
func f() {
	for i := 0; i < 10; j := 0 {}
}

```
### <a id="_InvalidIterVar" href="#_InvalidIterVar">const _InvalidIterVar</a>

```
searchKey: types._InvalidIterVar
tags: [private]
```

```Go
const _InvalidIterVar
```

_InvalidIterVar occurs when two iteration variables are used while ranging over a channel. 

Example: 

```
func f(c chan int) {
	for k, v := range c {
		println(k, v)
	}
}

```
### <a id="_InvalidRangeExpr" href="#_InvalidRangeExpr">const _InvalidRangeExpr</a>

```
searchKey: types._InvalidRangeExpr
tags: [private]
```

```Go
const _InvalidRangeExpr
```

_InvalidRangeExpr occurs when the type of a range expression is not array, slice, string, map, or channel. 

Example: 

```
func f(i int) {
	for j := range i {
		println(j)
	}
}

```
### <a id="_MisplacedBreak" href="#_MisplacedBreak">const _MisplacedBreak</a>

```
searchKey: types._MisplacedBreak
tags: [private]
```

```Go
const _MisplacedBreak
```

_MisplacedBreak occurs when a break statement is not within a for, switch, or select statement of the innermost function definition. 

Example: 

```
func f() {
	break
}

```
### <a id="_MisplacedContinue" href="#_MisplacedContinue">const _MisplacedContinue</a>

```
searchKey: types._MisplacedContinue
tags: [private]
```

```Go
const _MisplacedContinue
```

_MisplacedContinue occurs when a continue statement is not within a for loop of the innermost function definition. 

Example: 

```
func sumeven(n int) int {
	proceed := func() {
		continue
	}
	sum := 0
	for i := 1; i <= n; i++ {
		if i % 2 != 0 {
			proceed()
		}
		sum += i
	}
	return sum
}

```
### <a id="_MisplacedFallthrough" href="#_MisplacedFallthrough">const _MisplacedFallthrough</a>

```
searchKey: types._MisplacedFallthrough
tags: [private]
```

```Go
const _MisplacedFallthrough
```

_MisplacedFallthrough occurs when a fallthrough statement is not within an expression switch. 

Example: 

```
func typename(i interface{}) string {
	switch i.(type) {
	case int64:
		fallthrough
	case int:
		return "int"
	}
	return "unsupported"
}

```
### <a id="_DuplicateCase" href="#_DuplicateCase">const _DuplicateCase</a>

```
searchKey: types._DuplicateCase
tags: [private]
```

```Go
const _DuplicateCase
```

_DuplicateCase occurs when a type or expression switch has duplicate cases. 

Example: 

```
func printInt(i int) {
	switch i {
	case 1:
		println("one")
	case 1:
		println("One")
	}
}

```
### <a id="_DuplicateDefault" href="#_DuplicateDefault">const _DuplicateDefault</a>

```
searchKey: types._DuplicateDefault
tags: [private]
```

```Go
const _DuplicateDefault
```

_DuplicateDefault occurs when a type or expression switch has multiple default clauses. 

Example: 

```
func printInt(i int) {
	switch i {
	case 1:
		println("one")
	default:
		println("One")
	default:
		println("1")
	}
}

```
### <a id="_BadTypeKeyword" href="#_BadTypeKeyword">const _BadTypeKeyword</a>

```
searchKey: types._BadTypeKeyword
tags: [private]
```

```Go
const _BadTypeKeyword
```

_BadTypeKeyword occurs when a .(type) expression is used anywhere other than a type switch. 

Example: 

```
type I interface {
	m()
}
var t I
var _ = t.(type)

```
### <a id="_InvalidTypeSwitch" href="#_InvalidTypeSwitch">const _InvalidTypeSwitch</a>

```
searchKey: types._InvalidTypeSwitch
tags: [private]
```

```Go
const _InvalidTypeSwitch
```

_InvalidTypeSwitch occurs when .(type) is used on an expression that is not of interface type. 

Example: 

```
func f(i int) {
	switch x := i.(type) {}
}

```
### <a id="_InvalidExprSwitch" href="#_InvalidExprSwitch">const _InvalidExprSwitch</a>

```
searchKey: types._InvalidExprSwitch
tags: [private]
```

```Go
const _InvalidExprSwitch
```

_InvalidExprSwitch occurs when a switch expression is not comparable. 

Example: 

```
func _() {
	var a struct{ _ func() }
	switch a /* ERROR cannot switch on a */ {
	}
}

```
### <a id="_InvalidSelectCase" href="#_InvalidSelectCase">const _InvalidSelectCase</a>

```
searchKey: types._InvalidSelectCase
tags: [private]
```

```Go
const _InvalidSelectCase
```

_InvalidSelectCase occurs when a select case is not a channel send or receive. 

Example: 

```
func checkChan(c <-chan int) bool {
	select {
	case c:
		return true
	default:
		return false
	}
}

```
### <a id="_UndeclaredLabel" href="#_UndeclaredLabel">const _UndeclaredLabel</a>

```
searchKey: types._UndeclaredLabel
tags: [private]
```

```Go
const _UndeclaredLabel
```

_UndeclaredLabel occurs when an undeclared label is jumped to. 

Example: 

```
func f() {
	goto L
}

```
### <a id="_DuplicateLabel" href="#_DuplicateLabel">const _DuplicateLabel</a>

```
searchKey: types._DuplicateLabel
tags: [private]
```

```Go
const _DuplicateLabel
```

_DuplicateLabel occurs when a label is declared more than once. 

Example: 

```
func f() int {
L:
L:
	return 1
}

```
### <a id="_MisplacedLabel" href="#_MisplacedLabel">const _MisplacedLabel</a>

```
searchKey: types._MisplacedLabel
tags: [private]
```

```Go
const _MisplacedLabel
```

_MisplacedLabel occurs when a break or continue label is not on a for, switch, or select statement. 

Example: 

```
func f() {
L:
	a := []int{1,2,3}
	for _, e := range a {
		if e > 10 {
			break L
		}
		println(a)
	}
}

```
### <a id="_UnusedLabel" href="#_UnusedLabel">const _UnusedLabel</a>

```
searchKey: types._UnusedLabel
tags: [private]
```

```Go
const _UnusedLabel
```

_UnusedLabel occurs when a label is declared but not used. 

Example: 

```
func f() {
L:
}

```
### <a id="_JumpOverDecl" href="#_JumpOverDecl">const _JumpOverDecl</a>

```
searchKey: types._JumpOverDecl
tags: [private]
```

```Go
const _JumpOverDecl
```

_JumpOverDecl occurs when a label jumps over a variable declaration. 

Example: 

```
func f() int {
	goto L
	x := 2
L:
	x++
	return x
}

```
### <a id="_JumpIntoBlock" href="#_JumpIntoBlock">const _JumpIntoBlock</a>

```
searchKey: types._JumpIntoBlock
tags: [private]
```

```Go
const _JumpIntoBlock
```

_JumpIntoBlock occurs when a forward jump goes to a label inside a nested block. 

Example: 

```
func f(x int) {
	goto L
	if x > 0 {
	L:
		print("inside block")
	}

```
} 

### <a id="_InvalidMethodExpr" href="#_InvalidMethodExpr">const _InvalidMethodExpr</a>

```
searchKey: types._InvalidMethodExpr
tags: [private]
```

```Go
const _InvalidMethodExpr
```

_InvalidMethodExpr occurs when a pointer method is called but the argument is not addressable. 

Example: 

```
type T struct {}

func (*T) m() int { return 1 }

var _ = T.m(T{})

```
### <a id="_WrongArgCount" href="#_WrongArgCount">const _WrongArgCount</a>

```
searchKey: types._WrongArgCount
tags: [private]
```

```Go
const _WrongArgCount
```

_WrongArgCount occurs when too few or too many arguments are passed by a function call. 

Example: 

```
func f(i int) {}
var x = f()

```
### <a id="_InvalidCall" href="#_InvalidCall">const _InvalidCall</a>

```
searchKey: types._InvalidCall
tags: [private]
```

```Go
const _InvalidCall
```

_InvalidCall occurs when an expression is called that is not of function type. 

Example: 

```
var x = "x"
var y = x()

```
### <a id="_UnusedResults" href="#_UnusedResults">const _UnusedResults</a>

```
searchKey: types._UnusedResults
tags: [private]
```

```Go
const _UnusedResults
```

_UnusedResults occurs when a restricted expression-only built-in function is suspended via go or defer. Such a suspension discards the results of these side-effect free built-in functions, and therefore is ineffectual. 

Example: 

```
func f(a []int) int {
	defer len(a)
	return i
}

```
### <a id="_InvalidDefer" href="#_InvalidDefer">const _InvalidDefer</a>

```
searchKey: types._InvalidDefer
tags: [private]
```

```Go
const _InvalidDefer
```

_InvalidDefer occurs when a deferred expression is not a function call, for example if the expression is a type conversion. 

Example: 

```
func f(i int) int {
	defer int32(i)
	return i
}

```
### <a id="_InvalidGo" href="#_InvalidGo">const _InvalidGo</a>

```
searchKey: types._InvalidGo
tags: [private]
```

```Go
const _InvalidGo
```

_InvalidGo occurs when a go expression is not a function call, for example if the expression is a type conversion. 

Example: 

```
func f(i int) int {
	go int32(i)
	return i
}

```
### <a id="_BadDecl" href="#_BadDecl">const _BadDecl</a>

```
searchKey: types._BadDecl
tags: [private]
```

```Go
const _BadDecl
```

_BadDecl occurs when a declaration has invalid syntax. 

### <a id="_RepeatedDecl" href="#_RepeatedDecl">const _RepeatedDecl</a>

```
searchKey: types._RepeatedDecl
tags: [private]
```

```Go
const _RepeatedDecl
```

_RepeatedDecl occurs when an identifier occurs more than once on the left hand side of a short variable declaration. 

Example: 

```
func _() {
	x, y, y := 1, 2, 3
}

```
### <a id="_InvalidUnsafeAdd" href="#_InvalidUnsafeAdd">const _InvalidUnsafeAdd</a>

```
searchKey: types._InvalidUnsafeAdd
tags: [private]
```

```Go
const _InvalidUnsafeAdd
```

_InvalidUnsafeAdd occurs when unsafe.Add is called with a length argument that is not of integer type. 

Example: 

```
import "unsafe"

var p unsafe.Pointer
var _ = unsafe.Add(p, float64(1))

```
### <a id="_InvalidUnsafeSlice" href="#_InvalidUnsafeSlice">const _InvalidUnsafeSlice</a>

```
searchKey: types._InvalidUnsafeSlice
tags: [private]
```

```Go
const _InvalidUnsafeSlice
```

_InvalidUnsafeSlice occurs when unsafe.Slice is called with a pointer argument that is not of pointer type or a length argument that is not of integer type, negative, or out of bounds. 

Example: 

```
import "unsafe"

var x int
var _ = unsafe.Slice(x, 1)

```
Example: 

```
import "unsafe"

var x int
var _ = unsafe.Slice(&x, float64(1))

```
Example: 

```
import "unsafe"

var x int
var _ = unsafe.Slice(&x, -1)

```
Example: 

```
import "unsafe"

var x int
var _ = unsafe.Slice(&x, uint64(1) << 63)

```
### <a id="_Todo" href="#_Todo">const _Todo</a>

```
searchKey: types._Todo
tags: [private]
```

```Go
const _Todo
```

_Todo is a placeholder for error codes that have not been decided. TODO(rFindley) remove this error code after deciding on errors for generics code. 

### <a id="conversion" href="#conversion">const conversion</a>

```
searchKey: types.conversion
tags: [private]
```

```Go
const conversion exprKind = iota
```

### <a id="expression" href="#expression">const expression</a>

```
searchKey: types.expression
tags: [private]
```

```Go
const expression
```

### <a id="statement" href="#statement">const statement</a>

```
searchKey: types.statement
tags: [private]
```

```Go
const statement
```

### <a id="white" href="#white">const white</a>

```
searchKey: types.white
tags: [private]
```

```Go
const white color = iota
```

An object may be painted in one of three colors. Color values other than white or black are considered grey. 

### <a id="black" href="#black">const black</a>

```
searchKey: types.black
tags: [private]
```

```Go
const black
```

An object may be painted in one of three colors. Color values other than white or black are considered grey. 

### <a id="grey" href="#grey">const grey</a>

```
searchKey: types.grey
tags: [private]
```

```Go
const grey // must be > white and black

```

An object may be painted in one of three colors. Color values other than white or black are considered grey. 

### <a id="invalid" href="#invalid">const invalid</a>

```
searchKey: types.invalid
tags: [private]
```

```Go
const invalid operandMode = iota // operand is invalid

```

### <a id="novalue" href="#novalue">const novalue</a>

```
searchKey: types.novalue
tags: [private]
```

```Go
const novalue // operand represents no value (result of a function call w/o result)

```

### <a id="builtin" href="#builtin">const builtin</a>

```
searchKey: types.builtin
tags: [private]
```

```Go
const builtin // operand is a built-in function

```

### <a id="typexpr" href="#typexpr">const typexpr</a>

```
searchKey: types.typexpr
tags: [private]
```

```Go
const typexpr // operand is a type

```

### <a id="constant_" href="#constant_">const constant_</a>

```
searchKey: types.constant_
tags: [private]
```

```Go
const constant_ // operand is a constant; the operand's typ is a Basic type

```

### <a id="variable" href="#variable">const variable</a>

```
searchKey: types.variable
tags: [private]
```

```Go
const variable // operand is an addressable variable

```

### <a id="mapindex" href="#mapindex">const mapindex</a>

```
searchKey: types.mapindex
tags: [private]
```

```Go
const mapindex // operand is a map index expression (acts like a variable on lhs, commaok on rhs of an assignment)
 = ...
```

### <a id="value" href="#value">const value</a>

```
searchKey: types.value
tags: [private]
```

```Go
const value // operand is a computed value

```

### <a id="commaok" href="#commaok">const commaok</a>

```
searchKey: types.commaok
tags: [private]
```

```Go
const commaok // like value, but operand may be used in a comma,ok expression

```

### <a id="commaerr" href="#commaerr">const commaerr</a>

```
searchKey: types.commaerr
tags: [private]
```

```Go
const commaerr // like commaok, but second value is error, not boolean

```

### <a id="cgofunc" href="#cgofunc">const cgofunc</a>

```
searchKey: types.cgofunc
tags: [private]
```

```Go
const cgofunc // operand is a cgo function

```

### <a id="FieldVal" href="#FieldVal">const FieldVal</a>

```
searchKey: types.FieldVal
```

```Go
const FieldVal SelectionKind = iota // x.f is a struct field selector

```

### <a id="MethodVal" href="#MethodVal">const MethodVal</a>

```
searchKey: types.MethodVal
```

```Go
const MethodVal // x.f is a method selector

```

### <a id="MethodExpr" href="#MethodExpr">const MethodExpr</a>

```
searchKey: types.MethodExpr
```

```Go
const MethodExpr // x.f is a method expression

```

### <a id="breakOk" href="#breakOk">const breakOk</a>

```
searchKey: types.breakOk
tags: [private]
```

```Go
const breakOk stmtContext = 1 << iota
```

permissible control-flow statements 

### <a id="continueOk" href="#continueOk">const continueOk</a>

```
searchKey: types.continueOk
tags: [private]
```

```Go
const continueOk
```

### <a id="fallthroughOk" href="#fallthroughOk">const fallthroughOk</a>

```
searchKey: types.fallthroughOk
tags: [private]
```

```Go
const fallthroughOk
```

### <a id="finalSwitchCase" href="#finalSwitchCase">const finalSwitchCase</a>

```
searchKey: types.finalSwitchCase
tags: [private]
```

```Go
const finalSwitchCase
```

additional context information 

### <a id="Invalid" href="#Invalid">const Invalid</a>

```
searchKey: types.Invalid
```

```Go
const Invalid BasicKind = iota // type is invalid

```

### <a id="Bool" href="#Bool">const Bool</a>

```
searchKey: types.Bool
```

```Go
const Bool
```

predeclared types 

### <a id="Int" href="#Int">const Int</a>

```
searchKey: types.Int
```

```Go
const Int
```

### <a id="Int8" href="#Int8">const Int8</a>

```
searchKey: types.Int8
```

```Go
const Int8
```

### <a id="Int16" href="#Int16">const Int16</a>

```
searchKey: types.Int16
```

```Go
const Int16
```

### <a id="Int32" href="#Int32">const Int32</a>

```
searchKey: types.Int32
```

```Go
const Int32
```

### <a id="Int64" href="#Int64">const Int64</a>

```
searchKey: types.Int64
```

```Go
const Int64
```

### <a id="Uint" href="#Uint">const Uint</a>

```
searchKey: types.Uint
```

```Go
const Uint
```

### <a id="Uint8" href="#Uint8">const Uint8</a>

```
searchKey: types.Uint8
```

```Go
const Uint8
```

### <a id="Uint16" href="#Uint16">const Uint16</a>

```
searchKey: types.Uint16
```

```Go
const Uint16
```

### <a id="Uint32" href="#Uint32">const Uint32</a>

```
searchKey: types.Uint32
```

```Go
const Uint32
```

### <a id="Uint64" href="#Uint64">const Uint64</a>

```
searchKey: types.Uint64
```

```Go
const Uint64
```

### <a id="Uintptr" href="#Uintptr">const Uintptr</a>

```
searchKey: types.Uintptr
```

```Go
const Uintptr
```

### <a id="Float32" href="#Float32">const Float32</a>

```
searchKey: types.Float32
```

```Go
const Float32
```

### <a id="Float64" href="#Float64">const Float64</a>

```
searchKey: types.Float64
```

```Go
const Float64
```

### <a id="Complex64" href="#Complex64">const Complex64</a>

```
searchKey: types.Complex64
```

```Go
const Complex64
```

### <a id="Complex128" href="#Complex128">const Complex128</a>

```
searchKey: types.Complex128
```

```Go
const Complex128
```

### <a id="String" href="#String">const String</a>

```
searchKey: types.String
```

```Go
const String
```

### <a id="UnsafePointer" href="#UnsafePointer">const UnsafePointer</a>

```
searchKey: types.UnsafePointer
```

```Go
const UnsafePointer
```

### <a id="UntypedBool" href="#UntypedBool">const UntypedBool</a>

```
searchKey: types.UntypedBool
```

```Go
const UntypedBool
```

types for untyped values 

### <a id="UntypedInt" href="#UntypedInt">const UntypedInt</a>

```
searchKey: types.UntypedInt
```

```Go
const UntypedInt
```

### <a id="UntypedRune" href="#UntypedRune">const UntypedRune</a>

```
searchKey: types.UntypedRune
```

```Go
const UntypedRune
```

### <a id="UntypedFloat" href="#UntypedFloat">const UntypedFloat</a>

```
searchKey: types.UntypedFloat
```

```Go
const UntypedFloat
```

### <a id="UntypedComplex" href="#UntypedComplex">const UntypedComplex</a>

```
searchKey: types.UntypedComplex
```

```Go
const UntypedComplex
```

### <a id="UntypedString" href="#UntypedString">const UntypedString</a>

```
searchKey: types.UntypedString
```

```Go
const UntypedString
```

### <a id="UntypedNil" href="#UntypedNil">const UntypedNil</a>

```
searchKey: types.UntypedNil
```

```Go
const UntypedNil
```

### <a id="Byte" href="#Byte">const Byte</a>

```
searchKey: types.Byte
```

```Go
const Byte = Uint8
```

aliases 

### <a id="Rune" href="#Rune">const Rune</a>

```
searchKey: types.Rune
```

```Go
const Rune = Int32
```

### <a id="IsBoolean" href="#IsBoolean">const IsBoolean</a>

```
searchKey: types.IsBoolean
```

```Go
const IsBoolean BasicInfo = 1 << iota
```

Properties of basic types. 

### <a id="IsInteger" href="#IsInteger">const IsInteger</a>

```
searchKey: types.IsInteger
```

```Go
const IsInteger
```

Properties of basic types. 

### <a id="IsUnsigned" href="#IsUnsigned">const IsUnsigned</a>

```
searchKey: types.IsUnsigned
```

```Go
const IsUnsigned
```

Properties of basic types. 

### <a id="IsFloat" href="#IsFloat">const IsFloat</a>

```
searchKey: types.IsFloat
```

```Go
const IsFloat
```

Properties of basic types. 

### <a id="IsComplex" href="#IsComplex">const IsComplex</a>

```
searchKey: types.IsComplex
```

```Go
const IsComplex
```

Properties of basic types. 

### <a id="IsString" href="#IsString">const IsString</a>

```
searchKey: types.IsString
```

```Go
const IsString
```

Properties of basic types. 

### <a id="IsUntyped" href="#IsUntyped">const IsUntyped</a>

```
searchKey: types.IsUntyped
```

```Go
const IsUntyped
```

Properties of basic types. 

### <a id="IsOrdered" href="#IsOrdered">const IsOrdered</a>

```
searchKey: types.IsOrdered
```

```Go
const IsOrdered = IsInteger | IsFloat | IsString
```

Properties of basic types. 

### <a id="IsNumeric" href="#IsNumeric">const IsNumeric</a>

```
searchKey: types.IsNumeric
```

```Go
const IsNumeric = IsInteger | IsFloat | IsComplex
```

Properties of basic types. 

### <a id="IsConstType" href="#IsConstType">const IsConstType</a>

```
searchKey: types.IsConstType
```

```Go
const IsConstType = IsBoolean | IsNumeric | IsString
```

Properties of basic types. 

### <a id="SendRecv" href="#SendRecv">const SendRecv</a>

```
searchKey: types.SendRecv
```

```Go
const SendRecv ChanDir = iota
```

The direction of a channel is indicated by one of these constants. 

### <a id="SendOnly" href="#SendOnly">const SendOnly</a>

```
searchKey: types.SendOnly
```

```Go
const SendOnly
```

The direction of a channel is indicated by one of these constants. 

### <a id="RecvOnly" href="#RecvOnly">const RecvOnly</a>

```
searchKey: types.RecvOnly
```

```Go
const RecvOnly
```

The direction of a channel is indicated by one of these constants. 

### <a id="instanceMarker" href="#instanceMarker">const instanceMarker</a>

```
searchKey: types.instanceMarker
tags: [private]
```

```Go
const instanceMarker = '#'
```

instanceMarker is the prefix for an instantiated type in "non-evaluated" instance form. 

### <a id="_Append" href="#_Append">const _Append</a>

```
searchKey: types._Append
tags: [private]
```

```Go
const _Append builtinId = iota
```

universe scope 

### <a id="_Cap" href="#_Cap">const _Cap</a>

```
searchKey: types._Cap
tags: [private]
```

```Go
const _Cap
```

### <a id="_Close" href="#_Close">const _Close</a>

```
searchKey: types._Close
tags: [private]
```

```Go
const _Close
```

### <a id="_Complex" href="#_Complex">const _Complex</a>

```
searchKey: types._Complex
tags: [private]
```

```Go
const _Complex
```

### <a id="_Copy" href="#_Copy">const _Copy</a>

```
searchKey: types._Copy
tags: [private]
```

```Go
const _Copy
```

### <a id="_Delete" href="#_Delete">const _Delete</a>

```
searchKey: types._Delete
tags: [private]
```

```Go
const _Delete
```

### <a id="_Imag" href="#_Imag">const _Imag</a>

```
searchKey: types._Imag
tags: [private]
```

```Go
const _Imag
```

### <a id="_Len" href="#_Len">const _Len</a>

```
searchKey: types._Len
tags: [private]
```

```Go
const _Len
```

### <a id="_Make" href="#_Make">const _Make</a>

```
searchKey: types._Make
tags: [private]
```

```Go
const _Make
```

### <a id="_New" href="#_New">const _New</a>

```
searchKey: types._New
tags: [private]
```

```Go
const _New
```

### <a id="_Panic" href="#_Panic">const _Panic</a>

```
searchKey: types._Panic
tags: [private]
```

```Go
const _Panic
```

### <a id="_Print" href="#_Print">const _Print</a>

```
searchKey: types._Print
tags: [private]
```

```Go
const _Print
```

### <a id="_Println" href="#_Println">const _Println</a>

```
searchKey: types._Println
tags: [private]
```

```Go
const _Println
```

### <a id="_Real" href="#_Real">const _Real</a>

```
searchKey: types._Real
tags: [private]
```

```Go
const _Real
```

### <a id="_Recover" href="#_Recover">const _Recover</a>

```
searchKey: types._Recover
tags: [private]
```

```Go
const _Recover
```

### <a id="_Add" href="#_Add">const _Add</a>

```
searchKey: types._Add
tags: [private]
```

```Go
const _Add
```

package unsafe 

### <a id="_Alignof" href="#_Alignof">const _Alignof</a>

```
searchKey: types._Alignof
tags: [private]
```

```Go
const _Alignof
```

### <a id="_Offsetof" href="#_Offsetof">const _Offsetof</a>

```
searchKey: types._Offsetof
tags: [private]
```

```Go
const _Offsetof
```

### <a id="_Sizeof" href="#_Sizeof">const _Sizeof</a>

```
searchKey: types._Sizeof
tags: [private]
```

```Go
const _Sizeof
```

### <a id="_Slice" href="#_Slice">const _Slice</a>

```
searchKey: types._Slice
tags: [private]
```

```Go
const _Slice
```

### <a id="_Assert" href="#_Assert">const _Assert</a>

```
searchKey: types._Assert
tags: [private]
```

```Go
const _Assert
```

testing support 

### <a id="_Trace" href="#_Trace">const _Trace</a>

```
searchKey: types._Trace
tags: [private]
```

```Go
const _Trace
```

## <a id="var" href="#var">Variables</a>

### <a id="cgoPrefixes" href="#cgoPrefixes">var cgoPrefixes</a>

```
searchKey: types.cgoPrefixes
tags: [private]
```

```Go
var cgoPrefixes = ...
```

### <a id="errBadCgo" href="#errBadCgo">var errBadCgo</a>

```
searchKey: types.errBadCgo
tags: [private]
```

```Go
var errBadCgo = errors.New("cannot use FakeImportC and go115UsesCgo together")
```

### <a id="unaryOpPredicates" href="#unaryOpPredicates">var unaryOpPredicates</a>

```
searchKey: types.unaryOpPredicates
tags: [private]
```

```Go
var unaryOpPredicates opPredicates
```

### <a id="op2str1" href="#op2str1">var op2str1</a>

```
searchKey: types.op2str1
tags: [private]
```

```Go
var op2str1 = [...]string{
	token.XOR: "bitwise complement",
}
```

### <a id="op2str2" href="#op2str2">var op2str2</a>

```
searchKey: types.op2str2
tags: [private]
```

```Go
var op2str2 = ...
```

This is only used for operations that may cause overflow. 

### <a id="binaryOpPredicates" href="#binaryOpPredicates">var binaryOpPredicates</a>

```
searchKey: types.binaryOpPredicates
tags: [private]
```

```Go
var binaryOpPredicates opPredicates
```

### <a id="gccgoArchSizes" href="#gccgoArchSizes">var gccgoArchSizes</a>

```
searchKey: types.gccgoArchSizes
tags: [private]
```

```Go
var gccgoArchSizes = ...
```

### <a id="emptyMethodSet" href="#emptyMethodSet">var emptyMethodSet</a>

```
searchKey: types.emptyMethodSet
tags: [private]
```

```Go
var emptyMethodSet MethodSet
```

Shared empty method set. 

### <a id="operandModeString" href="#operandModeString">var operandModeString</a>

```
searchKey: types.operandModeString
tags: [private]
```

```Go
var operandModeString = ...
```

### <a id="basicSizes" href="#basicSizes">var basicSizes</a>

```
searchKey: types.basicSizes
tags: [private]
```

```Go
var basicSizes = ...
```

### <a id="gcArchSizes" href="#gcArchSizes">var gcArchSizes</a>

```
searchKey: types.gcArchSizes
tags: [private]
```

```Go
var gcArchSizes = ...
```

common architecture word sizes and alignments 

### <a id="stdSizes" href="#stdSizes">var stdSizes</a>

```
searchKey: types.stdSizes
tags: [private]
```

```Go
var stdSizes = SizesFor("gc", "amd64")
```

stdSizes is used if Config.Sizes == nil. 

### <a id="emptyInterface" href="#emptyInterface">var emptyInterface</a>

```
searchKey: types.emptyInterface
tags: [private]
```

```Go
var emptyInterface = Interface{allMethods: markComplete}
```

emptyInterface represents the empty (completed) interface 

### <a id="markComplete" href="#markComplete">var markComplete</a>

```
searchKey: types.markComplete
tags: [private]
```

```Go
var markComplete = make([]*Func, 0)
```

markComplete is used to mark an empty interface as completely set up by setting the allMethods field to a non-nil empty slice. 

### <a id="lastId" href="#lastId">var lastId</a>

```
searchKey: types.lastId
tags: [private]
```

```Go
var lastId uint32
```

Note: This is a uint32 rather than a uint64 because the respective 64 bit atomic instructions are not available on all platforms. 

### <a id="expandf" href="#expandf">var expandf</a>

```
searchKey: types.expandf
tags: [private]
```

```Go
var expandf func(Type) Type
```

expandf is set to expand. Call expandf when calling expand causes compile-time cycle error. 

### <a id="theBottom" href="#theBottom">var theBottom</a>

```
searchKey: types.theBottom
tags: [private]
```

```Go
var theBottom = &bottom{}
```

theBottom is the singleton bottom type. 

### <a id="theTop" href="#theTop">var theTop</a>

```
searchKey: types.theTop
tags: [private]
```

```Go
var theTop = &top{}
```

theTop is the singleton top type. 

### <a id="gcCompatibilityMode" href="#gcCompatibilityMode">var gcCompatibilityMode</a>

```
searchKey: types.gcCompatibilityMode
tags: [private]
```

```Go
var gcCompatibilityMode bool
```

If gcCompatibilityMode is set, printing of types is modified to match the representation of some types in the gc compiler: 

```
- byte and rune lose their alias name and simply stand for
  uint8 and int32 respectively
- embedded interfaces get flattened (the embedding info is lost,
  and certain recursive interface types cannot be printed anymore)

```
This makes it easier to compare packages computed with the type- checker vs packages imported from gc export data. 

Caution: This flag affects all uses of WriteType, globally. It is only provided for testing in conjunction with gc-generated data. 

This flag is exported in the x/tools/go/types package. We don't need it at the moment in the std repo and so we don't export it anymore. We should eventually try to remove it altogether. TODO(gri) remove this 

### <a id="Universe" href="#Universe">var Universe</a>

```
searchKey: types.Universe
```

```Go
var Universe *Scope
```

The Universe scope contains all predeclared objects of Go. It is the outermost scope of any chain of nested scopes. 

### <a id="Unsafe" href="#Unsafe">var Unsafe</a>

```
searchKey: types.Unsafe
```

```Go
var Unsafe *Package
```

The Unsafe package is the package returned by an importer for the import path "unsafe". 

### <a id="universeIota" href="#universeIota">var universeIota</a>

```
searchKey: types.universeIota
tags: [private]
```

```Go
var universeIota *Const
```

### <a id="universeByte" href="#universeByte">var universeByte</a>

```
searchKey: types.universeByte
tags: [private]
```

```Go
var universeByte *Basic // uint8 alias, but has name "byte"

```

### <a id="universeRune" href="#universeRune">var universeRune</a>

```
searchKey: types.universeRune
tags: [private]
```

```Go
var universeRune *Basic // int32 alias, but has name "rune"

```

### <a id="universeAny" href="#universeAny">var universeAny</a>

```
searchKey: types.universeAny
tags: [private]
```

```Go
var universeAny *Interface
```

### <a id="universeError" href="#universeError">var universeError</a>

```
searchKey: types.universeError
tags: [private]
```

```Go
var universeError *Named
```

### <a id="Typ" href="#Typ">var Typ</a>

```
searchKey: types.Typ
```

```Go
var Typ = ...
```

Typ contains the predeclared *Basic types indexed by their corresponding BasicKind. 

The *Basic type for Typ[Byte] will have the name "uint8". Use Universe.Lookup("byte").Type() to obtain the specific alias basic type named "byte" (and analogous for "rune"). 

### <a id="aliases" href="#aliases">var aliases</a>

```
searchKey: types.aliases
tags: [private]
```

```Go
var aliases = [...]*Basic{
	{Byte, IsInteger | IsUnsigned, "byte"},
	{Rune, IsInteger, "rune"},
}
```

### <a id="predeclaredConsts" href="#predeclaredConsts">var predeclaredConsts</a>

```
searchKey: types.predeclaredConsts
tags: [private]
```

```Go
var predeclaredConsts = ...
```

### <a id="predeclaredFuncs" href="#predeclaredFuncs">var predeclaredFuncs</a>

```
searchKey: types.predeclaredFuncs
tags: [private]
```

```Go
var predeclaredFuncs = ...
```

### <a id="goVersionRx" href="#goVersionRx">var goVersionRx</a>

```
searchKey: types.goVersionRx
tags: [private]
```

```Go
var goVersionRx = regexp.MustCompile(`^go([1-9][0-9]*)\.(0|[1-9][0-9]*)$`)
```

goVersionRx matches a Go version string, e.g. "go1.12". 

### <a id="assignOps" href="#assignOps">var assignOps</a>

```
searchKey: types.assignOps
tags: [private]
```

```Go
var assignOps = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Error" href="#Error">type Error struct</a>

```
searchKey: types.Error
```

```Go
type Error struct {
	Fset *token.FileSet // file set for interpretation of Pos
	Pos  token.Pos      // error position
	Msg  string         // error message
	Soft bool           // if set, error is "soft"

	// go116code is a future API, unexported as the set of error codes is large
	// and likely to change significantly during experimentation. Tools wishing
	// to preview this feature may read go116code using reflection (see
	// errorcodes_test.go), but beware that there is no guarantee of future
	// compatibility.
	go116code  errorCode
	go116start token.Pos
	go116end   token.Pos
}
```

An Error describes a type-checking error; it implements the error interface. A "soft" error is an error that still permits a valid interpretation of a package (such as "unused variable"); "hard" errors may lead to unpredictable behavior if ignored. 

#### <a id="Error.Error" href="#Error.Error">func (err Error) Error() string</a>

```
searchKey: types.Error.Error
```

```Go
func (err Error) Error() string
```

Error returns an error string formatted as follows: filename:line:column: message 

### <a id="Importer" href="#Importer">type Importer interface</a>

```
searchKey: types.Importer
```

```Go
type Importer interface {
	// Import returns the imported package for the given import path.
	// The semantics is like for ImporterFrom.ImportFrom except that
	// dir and mode are ignored (since they are not present).
	Import(path string) (*Package, error)
}
```

An Importer resolves import paths to Packages. 

CAUTION: This interface does not support the import of locally vendored packages. See [https://golang.org/s/go15vendor](https://golang.org/s/go15vendor). If possible, external implementations should implement ImporterFrom. 

### <a id="ImportMode" href="#ImportMode">type ImportMode int</a>

```
searchKey: types.ImportMode
```

```Go
type ImportMode int
```

ImportMode is reserved for future use. 

### <a id="ImporterFrom" href="#ImporterFrom">type ImporterFrom interface</a>

```
searchKey: types.ImporterFrom
```

```Go
type ImporterFrom interface {
	// Importer is present for backward-compatibility. Calling
	// Import(path) is the same as calling ImportFrom(path, "", 0);
	// i.e., locally vendored packages may not be found.
	// The types package does not call Import if an ImporterFrom
	// is present.
	Importer

	// ImportFrom returns the imported package for the given import
	// path when imported by a package file located in dir.
	// If the import failed, besides returning an error, ImportFrom
	// is encouraged to cache and return a package anyway, if one
	// was created. This will reduce package inconsistencies and
	// follow-on type checker errors due to the missing package.
	// The mode value must be 0; it is reserved for future use.
	// Two calls to ImportFrom with the same path and dir must
	// return the same package.
	ImportFrom(path, dir string, mode ImportMode) (*Package, error)
}
```

An ImporterFrom resolves import paths to packages; it supports vendoring per [https://golang.org/s/go15vendor](https://golang.org/s/go15vendor). Use go/importer to obtain an ImporterFrom implementation. 

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: types.Config
```

```Go
type Config struct {
	// goVersion describes the accepted Go language version. The string
	// must follow the format "go%d.%d" (e.g. "go1.12") or it must be
	// empty; an empty string indicates the latest language version.
	// If the format is invalid, invoking the type checker will cause a
	// panic.
	goVersion string

	// If IgnoreFuncBodies is set, function bodies are not
	// type-checked.
	IgnoreFuncBodies bool

	// If FakeImportC is set, `import "C"` (for packages requiring Cgo)
	// declares an empty "C" package and errors are omitted for qualified
	// identifiers referring to package C (which won't find an object).
	// This feature is intended for the standard library cmd/api tool.
	//
	// Caution: Effects may be unpredictable due to follow-on errors.
	//          Do not use casually!
	FakeImportC bool

	// If go115UsesCgo is set, the type checker expects the
	// _cgo_gotypes.go file generated by running cmd/cgo to be
	// provided as a package source file. Qualified identifiers
	// referring to package C will be resolved to cgo-provided
	// declarations within _cgo_gotypes.go.
	//
	// It is an error to set both FakeImportC and go115UsesCgo.
	go115UsesCgo bool

	// If Error != nil, it is called with each error found
	// during type checking; err has dynamic type Error.
	// Secondary errors (for instance, to enumerate all types
	// involved in an invalid recursive type declaration) have
	// error strings that start with a '\t' character.
	// If Error == nil, type-checking stops with the first
	// error found.
	Error func(err error)

	// An importer is used to import packages referred to from
	// import declarations.
	// If the installed importer implements ImporterFrom, the type
	// checker calls ImportFrom instead of Import.
	// The type checker reports an error if an importer is needed
	// but none was installed.
	Importer Importer

	// If Sizes != nil, it provides the sizing functions for package unsafe.
	// Otherwise SizesFor("gc", "amd64") is used instead.
	Sizes Sizes

	// If DisableUnusedImportCheck is set, packages are not checked
	// for unused imports.
	DisableUnusedImportCheck bool
}
```

A Config specifies the configuration for type checking. The zero value for Config is a ready-to-use default configuration. 

#### <a id="Config.Check" href="#Config.Check">func (conf *Config) Check(path string, fset *token.FileSet, files []*ast.File, info *Info) (*Package, error)</a>

```
searchKey: types.Config.Check
```

```Go
func (conf *Config) Check(path string, fset *token.FileSet, files []*ast.File, info *Info) (*Package, error)
```

Check type-checks a package and returns the resulting package object and the first error if any. Additionally, if info != nil, Check populates each of the non-nil maps in the Info struct. 

The package is marked as complete if no errors occurred, otherwise it is incomplete. See Config.Error for controlling behavior in the presence of errors. 

The package is specified by a list of *ast.Files and corresponding file set, and the package path the package is identified with. The clean path must not be empty or dot ("."). 

#### <a id="Config.alignof" href="#Config.alignof">func (conf *Config) alignof(T Type) int64</a>

```
searchKey: types.Config.alignof
tags: [private]
```

```Go
func (conf *Config) alignof(T Type) int64
```

#### <a id="Config.offsetsof" href="#Config.offsetsof">func (conf *Config) offsetsof(T *Struct) []int64</a>

```
searchKey: types.Config.offsetsof
tags: [private]
```

```Go
func (conf *Config) offsetsof(T *Struct) []int64
```

#### <a id="Config.offsetof" href="#Config.offsetof">func (conf *Config) offsetof(typ Type, index []int) int64</a>

```
searchKey: types.Config.offsetof
tags: [private]
```

```Go
func (conf *Config) offsetof(typ Type, index []int) int64
```

offsetof returns the offset of the field specified via the index sequence relative to typ. All embedded fields must be structs (rather than pointer to structs). 

#### <a id="Config.sizeof" href="#Config.sizeof">func (conf *Config) sizeof(T Type) int64</a>

```
searchKey: types.Config.sizeof
tags: [private]
```

```Go
func (conf *Config) sizeof(T Type) int64
```

### <a id="TypeAndValue" href="#TypeAndValue">type TypeAndValue struct</a>

```
searchKey: types.TypeAndValue
```

```Go
type TypeAndValue struct {
	mode  operandMode
	Type  Type
	Value constant.Value
}
```

TypeAndValue reports the type and value (for constants) of the corresponding expression. 

#### <a id="Eval" href="#Eval">func Eval(fset *token.FileSet, pkg *Package, pos token.Pos, expr string) (_ TypeAndValue, err error)</a>

```
searchKey: types.Eval
```

```Go
func Eval(fset *token.FileSet, pkg *Package, pos token.Pos, expr string) (_ TypeAndValue, err error)
```

Eval returns the type and, if constant, the value for the expression expr, evaluated at position pos of package pkg, which must have been derived from type-checking an AST with complete position information relative to the provided file set. 

The meaning of the parameters fset, pkg, and pos is the same as in CheckExpr. An error is returned if expr cannot be parsed successfully, or the resulting expr AST cannot be type-checked. 

#### <a id="TypeAndValue.IsVoid" href="#TypeAndValue.IsVoid">func (tv TypeAndValue) IsVoid() bool</a>

```
searchKey: types.TypeAndValue.IsVoid
```

```Go
func (tv TypeAndValue) IsVoid() bool
```

IsVoid reports whether the corresponding expression is a function call without results. 

#### <a id="TypeAndValue.IsType" href="#TypeAndValue.IsType">func (tv TypeAndValue) IsType() bool</a>

```
searchKey: types.TypeAndValue.IsType
```

```Go
func (tv TypeAndValue) IsType() bool
```

IsType reports whether the corresponding expression specifies a type. 

#### <a id="TypeAndValue.IsBuiltin" href="#TypeAndValue.IsBuiltin">func (tv TypeAndValue) IsBuiltin() bool</a>

```
searchKey: types.TypeAndValue.IsBuiltin
```

```Go
func (tv TypeAndValue) IsBuiltin() bool
```

IsBuiltin reports whether the corresponding expression denotes a (possibly parenthesized) built-in function. 

#### <a id="TypeAndValue.IsValue" href="#TypeAndValue.IsValue">func (tv TypeAndValue) IsValue() bool</a>

```
searchKey: types.TypeAndValue.IsValue
```

```Go
func (tv TypeAndValue) IsValue() bool
```

IsValue reports whether the corresponding expression is a value. Builtins are not considered values. Constant values have a non- nil Value. 

#### <a id="TypeAndValue.IsNil" href="#TypeAndValue.IsNil">func (tv TypeAndValue) IsNil() bool</a>

```
searchKey: types.TypeAndValue.IsNil
```

```Go
func (tv TypeAndValue) IsNil() bool
```

IsNil reports whether the corresponding expression denotes the predeclared value nil. 

#### <a id="TypeAndValue.Addressable" href="#TypeAndValue.Addressable">func (tv TypeAndValue) Addressable() bool</a>

```
searchKey: types.TypeAndValue.Addressable
```

```Go
func (tv TypeAndValue) Addressable() bool
```

Addressable reports whether the corresponding expression is addressable ([https://golang.org/ref/spec#Address_operators](https://golang.org/ref/spec#Address_operators)). 

#### <a id="TypeAndValue.Assignable" href="#TypeAndValue.Assignable">func (tv TypeAndValue) Assignable() bool</a>

```
searchKey: types.TypeAndValue.Assignable
```

```Go
func (tv TypeAndValue) Assignable() bool
```

Assignable reports whether the corresponding expression is assignable to (provided a value of the right type). 

#### <a id="TypeAndValue.HasOk" href="#TypeAndValue.HasOk">func (tv TypeAndValue) HasOk() bool</a>

```
searchKey: types.TypeAndValue.HasOk
```

```Go
func (tv TypeAndValue) HasOk() bool
```

HasOk reports whether the corresponding expression may be used on the rhs of a comma-ok assignment. 

### <a id="_Inferred" href="#_Inferred">type _Inferred struct</a>

```
searchKey: types._Inferred
tags: [private]
```

```Go
type _Inferred struct {
	Targs []Type
	Sig   *Signature
}
```

_Inferred reports the _Inferred type arguments and signature for a parameterized function call that uses type inference. 

### <a id="Initializer" href="#Initializer">type Initializer struct</a>

```
searchKey: types.Initializer
```

```Go
type Initializer struct {
	Lhs []*Var // var Lhs = Rhs
	Rhs ast.Expr
}
```

An Initializer describes a package-level variable, or a list of variables in case of a multi-valued initialization expression, and the corresponding initialization expression. 

#### <a id="Initializer.String" href="#Initializer.String">func (init *Initializer) String() string</a>

```
searchKey: types.Initializer.String
```

```Go
func (init *Initializer) String() string
```

### <a id="Info" href="#Info">type Info struct</a>

```
searchKey: types.Info
```

```Go
type Info struct {
	// Types maps expressions to their types, and for constant
	// expressions, also their values. Invalid expressions are
	// omitted.
	//
	// For (possibly parenthesized) identifiers denoting built-in
	// functions, the recorded signatures are call-site specific:
	// if the call result is not a constant, the recorded type is
	// an argument-specific signature. Otherwise, the recorded type
	// is invalid.
	//
	// The Types map does not record the type of every identifier,
	// only those that appear where an arbitrary expression is
	// permitted. For instance, the identifier f in a selector
	// expression x.f is found only in the Selections map, the
	// identifier z in a variable declaration 'var z int' is found
	// only in the Defs map, and identifiers denoting packages in
	// qualified identifiers are collected in the Uses map.
	Types map[ast.Expr]TypeAndValue

	// Defs maps identifiers to the objects they define (including
	// package names, dots "." of dot-imports, and blank "_" identifiers).
	// For identifiers that do not denote objects (e.g., the package name
	// in package clauses, or symbolic variables t in t := x.(type) of
	// type switch headers), the corresponding objects are nil.
	//
	// For an embedded field, Defs returns the field *Var it defines.
	//
	// Invariant: Defs[id] == nil || Defs[id].Pos() == id.Pos()
	Defs map[*ast.Ident]Object

	// Uses maps identifiers to the objects they denote.
	//
	// For an embedded field, Uses returns the *TypeName it denotes.
	//
	// Invariant: Uses[id].Pos() != id.Pos()
	Uses map[*ast.Ident]Object

	// Implicits maps nodes to their implicitly declared objects, if any.
	// The following node and object types may appear:
	//
	//     node               declared object
	//
	//     *ast.ImportSpec    *PkgName for imports without renames
	//     *ast.CaseClause    type-specific *Var for each type switch case clause (incl. default)
	//     *ast.Field         anonymous parameter *Var (incl. unnamed results)
	//
	Implicits map[ast.Node]Object

	// Selections maps selector expressions (excluding qualified identifiers)
	// to their corresponding selections.
	Selections map[*ast.SelectorExpr]*Selection

	// Scopes maps ast.Nodes to the scopes they define. Package scopes are not
	// associated with a specific node but with all files belonging to a package.
	// Thus, the package scope can be found in the type-checked Package object.
	// Scopes nest, with the Universe scope being the outermost scope, enclosing
	// the package scope, which contains (one or more) files scopes, which enclose
	// function scopes which in turn enclose statement and function literal scopes.
	// Note that even though package-level functions are declared in the package
	// scope, the function scopes are embedded in the file scope of the file
	// containing the function declaration.
	//
	// The following node types may appear in Scopes:
	//
	//     *ast.File
	//     *ast.FuncType
	//     *ast.BlockStmt
	//     *ast.IfStmt
	//     *ast.SwitchStmt
	//     *ast.TypeSwitchStmt
	//     *ast.CaseClause
	//     *ast.CommClause
	//     *ast.ForStmt
	//     *ast.RangeStmt
	//
	Scopes map[ast.Node]*Scope

	// InitOrder is the list of package-level initializers in the order in which
	// they must be executed. Initializers referring to variables related by an
	// initialization dependency appear in topological order, the others appear
	// in source order. Variables without an initialization expression do not
	// appear in this list.
	InitOrder []*Initializer
}
```

Info holds result type information for a type-checked package. Only the information for which a map is provided is collected. If the package has type errors, the collected information may be incomplete. 

#### <a id="Info.TypeOf" href="#Info.TypeOf">func (info *Info) TypeOf(e ast.Expr) Type</a>

```
searchKey: types.Info.TypeOf
```

```Go
func (info *Info) TypeOf(e ast.Expr) Type
```

TypeOf returns the type of expression e, or nil if not found. Precondition: the Types, Uses and Defs maps are populated. 

#### <a id="Info.ObjectOf" href="#Info.ObjectOf">func (info *Info) ObjectOf(id *ast.Ident) Object</a>

```
searchKey: types.Info.ObjectOf
```

```Go
func (info *Info) ObjectOf(id *ast.Ident) Object
```

ObjectOf returns the object denoted by the specified id, or nil if not found. 

If id is an embedded struct field, ObjectOf returns the field (*Var) it defines, not the type (*TypeName) it uses. 

Precondition: the Uses and Defs maps are populated. 

### <a id="exprInfo" href="#exprInfo">type exprInfo struct</a>

```
searchKey: types.exprInfo
tags: [private]
```

```Go
type exprInfo struct {
	isLhs bool // expression is lhs operand of a shift with delayed type-check
	mode  operandMode
	typ   *Basic
	val   constant.Value // constant value; or nil (if not a constant)
}
```

exprInfo stores information about an untyped expression. 

### <a id="context" href="#context">type context struct</a>

```
searchKey: types.context
tags: [private]
```

```Go
type context struct {
	decl          *declInfo              // package-level declaration whose init expression/function body is checked
	scope         *Scope                 // top-most scope for lookups
	pos           token.Pos              // if valid, identifiers are looked up as if at position pos (used by Eval)
	iota          constant.Value         // value of iota in a constant declaration; nil otherwise
	errpos        positioner             // if set, identifier position of a constant with inherited initializer
	sig           *Signature             // function signature if inside a function; nil otherwise
	isPanic       map[*ast.CallExpr]bool // set of panic call expressions (used for termination check)
	hasLabel      bool                   // set if a function makes use of labels (only ~1% of functions); unused outside functions
	hasCallOrRecv bool                   // set if an expression contains a function call or channel receive operation
}
```

A context represents the context within which an object is type-checked. 

#### <a id="context.lookup" href="#context.lookup">func (ctxt *context) lookup(name string) Object</a>

```
searchKey: types.context.lookup
tags: [private]
```

```Go
func (ctxt *context) lookup(name string) Object
```

lookup looks up name in the current context and returns the matching object, or nil. 

### <a id="importKey" href="#importKey">type importKey struct</a>

```
searchKey: types.importKey
tags: [private]
```

```Go
type importKey struct {
	path, dir string
}
```

An importKey identifies an imported package by import path and source directory (directory containing the file containing the import). In practice, the directory may always be the same, or may not matter. Given an (import path, directory), an importer must always return the same package (but given two different import paths, an importer may still return the same package by mapping them to the same package paths). 

### <a id="dotImportKey" href="#dotImportKey">type dotImportKey struct</a>

```
searchKey: types.dotImportKey
tags: [private]
```

```Go
type dotImportKey struct {
	scope *Scope
	obj   Object
}
```

A dotImportKey describes a dot-imported object in the given scope. 

### <a id="Checker" href="#Checker">type Checker struct</a>

```
searchKey: types.Checker
```

```Go
type Checker struct {
	// package information
	// (initialized by NewChecker, valid for the life-time of checker)
	conf *Config
	fset *token.FileSet
	pkg  *Package
	*Info
	version version                    // accepted language version
	objMap  map[Object]*declInfo       // maps package-level objects and (non-interface) methods to declaration info
	impMap  map[importKey]*Package     // maps (import path, source directory) to (complete or fake) package
	posMap  map[*Interface][]token.Pos // maps interface types to lists of embedded interface positions
	typMap  map[string]*Named          // maps an instantiated named type hash to a *Named type

	// pkgPathMap maps package names to the set of distinct import paths we've
	// seen for that name, anywhere in the import graph. It is used for
	// disambiguating package names in error messages.
	//
	// pkgPathMap is allocated lazily, so that we don't pay the price of building
	// it on the happy path. seenPkgMap tracks the packages that we've already
	// walked.
	pkgPathMap map[string]map[string]bool
	seenPkgMap map[*Package]bool

	// information collected during type-checking of a set of package files
	// (initialized by Files, valid only for the duration of check.Files;
	// maps and lists are allocated on demand)
	files        []*ast.File               // package files
	imports      []*PkgName                // list of imported packages
	dotImportMap map[dotImportKey]*PkgName // maps dot-imported objects to the package they were dot-imported through

	firstErr error                 // first error encountered
	methods  map[*TypeName][]*Func // maps package scope type names to associated non-blank (non-interface) methods
	untyped  map[ast.Expr]exprInfo // map of expressions without final type
	delayed  []func()              // stack of delayed action segments; segments are processed in FIFO order
	objPath  []Object              // path of object dependencies during type inference (for cycle reporting)

	// context within which the current object is type-checked
	// (valid only for the duration of type-checking a specific object)
	context

	// debugging
	indent int // indentation for tracing
}
```

A Checker maintains the state of the type checker. It must be created with NewChecker. 

#### <a id="NewChecker" href="#NewChecker">func NewChecker(conf *Config, fset *token.FileSet, pkg *Package, info *Info) *Checker</a>

```
searchKey: types.NewChecker
```

```Go
func NewChecker(conf *Config, fset *token.FileSet, pkg *Package, info *Info) *Checker
```

NewChecker returns a new Checker instance for a given package. Package files may be added incrementally via checker.Files. 

#### <a id="Checker.assignment" href="#Checker.assignment">func (check *Checker) assignment(x *operand, T Type, context string)</a>

```
searchKey: types.Checker.assignment
tags: [private]
```

```Go
func (check *Checker) assignment(x *operand, T Type, context string)
```

assignment reports whether x can be assigned to a variable of type T, if necessary by attempting to convert untyped values to the appropriate type. context describes the context in which the assignment takes place. Use T == nil to indicate assignment to an untyped blank identifier. x.mode is set to invalid if the assignment failed. 

#### <a id="Checker.initConst" href="#Checker.initConst">func (check *Checker) initConst(lhs *Const, x *operand)</a>

```
searchKey: types.Checker.initConst
tags: [private]
```

```Go
func (check *Checker) initConst(lhs *Const, x *operand)
```

#### <a id="Checker.initVar" href="#Checker.initVar">func (check *Checker) initVar(lhs *Var, x *operand, context string) Type</a>

```
searchKey: types.Checker.initVar
tags: [private]
```

```Go
func (check *Checker) initVar(lhs *Var, x *operand, context string) Type
```

#### <a id="Checker.assignVar" href="#Checker.assignVar">func (check *Checker) assignVar(lhs ast.Expr, x *operand) Type</a>

```
searchKey: types.Checker.assignVar
tags: [private]
```

```Go
func (check *Checker) assignVar(lhs ast.Expr, x *operand) Type
```

#### <a id="Checker.initVars" href="#Checker.initVars">func (check *Checker) initVars(lhs []*Var, origRHS []ast.Expr, returnPos token.Pos)</a>

```
searchKey: types.Checker.initVars
tags: [private]
```

```Go
func (check *Checker) initVars(lhs []*Var, origRHS []ast.Expr, returnPos token.Pos)
```

If returnPos is valid, initVars is called to type-check the assignment of return expressions, and returnPos is the position of the return statement. 

#### <a id="Checker.assignVars" href="#Checker.assignVars">func (check *Checker) assignVars(lhs, origRHS []ast.Expr)</a>

```
searchKey: types.Checker.assignVars
tags: [private]
```

```Go
func (check *Checker) assignVars(lhs, origRHS []ast.Expr)
```

#### <a id="Checker.shortVarDecl" href="#Checker.shortVarDecl">func (check *Checker) shortVarDecl(pos positioner, lhs, rhs []ast.Expr)</a>

```
searchKey: types.Checker.shortVarDecl
tags: [private]
```

```Go
func (check *Checker) shortVarDecl(pos positioner, lhs, rhs []ast.Expr)
```

#### <a id="Checker.builtin" href="#Checker.builtin">func (check *Checker) builtin(x *operand, call *ast.CallExpr, id builtinId) (_ bool)</a>

```
searchKey: types.Checker.builtin
tags: [private]
```

```Go
func (check *Checker) builtin(x *operand, call *ast.CallExpr, id builtinId) (_ bool)
```

builtin type-checks a call to the built-in specified by id and reports whether the call is valid, with *x holding the result; but x.expr is not set. If the call is invalid, the result is false, and *x is undefined. 

#### <a id="Checker.applyTypeFunc" href="#Checker.applyTypeFunc">func (check *Checker) applyTypeFunc(f func(Type) Type, x Type) Type</a>

```
searchKey: types.Checker.applyTypeFunc
tags: [private]
```

```Go
func (check *Checker) applyTypeFunc(f func(Type) Type, x Type) Type
```

applyTypeFunc applies f to x. If x is a type parameter, the result is a type parameter constrained by an new interface bound. The type bounds for that interface are computed by applying f to each of the type bounds of x. If any of these applications of f return nil, applyTypeFunc returns nil. If x is not a type parameter, the result is f(x). 

#### <a id="Checker.funcInst" href="#Checker.funcInst">func (check *Checker) funcInst(x *operand, inst *ast.IndexExpr)</a>

```
searchKey: types.Checker.funcInst
tags: [private]
```

```Go
func (check *Checker) funcInst(x *operand, inst *ast.IndexExpr)
```

funcInst type-checks a function instantiation inst and returns the result in x. The operand x must be the evaluation of inst.X and its type must be a signature. 

#### <a id="Checker.callExpr" href="#Checker.callExpr">func (check *Checker) callExpr(x *operand, call *ast.CallExpr) exprKind</a>

```
searchKey: types.Checker.callExpr
tags: [private]
```

```Go
func (check *Checker) callExpr(x *operand, call *ast.CallExpr) exprKind
```

#### <a id="Checker.exprList" href="#Checker.exprList">func (check *Checker) exprList(elist []ast.Expr, allowCommaOk bool) (xlist []*operand, commaOk bool)</a>

```
searchKey: types.Checker.exprList
tags: [private]
```

```Go
func (check *Checker) exprList(elist []ast.Expr, allowCommaOk bool) (xlist []*operand, commaOk bool)
```

#### <a id="Checker.arguments" href="#Checker.arguments">func (check *Checker) arguments(call *ast.CallExpr, sig *Signature, targs []Type, args []*operand) (rsig *Signature)</a>

```
searchKey: types.Checker.arguments
tags: [private]
```

```Go
func (check *Checker) arguments(call *ast.CallExpr, sig *Signature, targs []Type, args []*operand) (rsig *Signature)
```

#### <a id="Checker.selector" href="#Checker.selector">func (check *Checker) selector(x *operand, e *ast.SelectorExpr)</a>

```
searchKey: types.Checker.selector
tags: [private]
```

```Go
func (check *Checker) selector(x *operand, e *ast.SelectorExpr)
```

#### <a id="Checker.use" href="#Checker.use">func (check *Checker) use(arg ...ast.Expr)</a>

```
searchKey: types.Checker.use
tags: [private]
```

```Go
func (check *Checker) use(arg ...ast.Expr)
```

use type-checks each argument. Useful to make sure expressions are evaluated (and variables are "used") in the presence of other errors. The arguments may be nil. 

#### <a id="Checker.useLHS" href="#Checker.useLHS">func (check *Checker) useLHS(arg ...ast.Expr)</a>

```
searchKey: types.Checker.useLHS
tags: [private]
```

```Go
func (check *Checker) useLHS(arg ...ast.Expr)
```

useLHS is like use, but doesn't "use" top-level identifiers. It should be called instead of use if the arguments are expressions on the lhs of an assignment. The arguments must not be nil. 

#### <a id="Checker.instantiatedOperand" href="#Checker.instantiatedOperand">func (check *Checker) instantiatedOperand(x *operand)</a>

```
searchKey: types.Checker.instantiatedOperand
tags: [private]
```

```Go
func (check *Checker) instantiatedOperand(x *operand)
```

instantiatedOperand reports an error of x is an uninstantiated (generic) type and sets x.typ to Typ[Invalid]. 

#### <a id="Checker.addDeclDep" href="#Checker.addDeclDep">func (check *Checker) addDeclDep(to Object)</a>

```
searchKey: types.Checker.addDeclDep
tags: [private]
```

```Go
func (check *Checker) addDeclDep(to Object)
```

addDeclDep adds the dependency edge (check.decl -> to) if check.decl exists 

#### <a id="Checker.rememberUntyped" href="#Checker.rememberUntyped">func (check *Checker) rememberUntyped(e ast.Expr, lhs bool, mode operandMode, typ *Basic, val constant.Value)</a>

```
searchKey: types.Checker.rememberUntyped
tags: [private]
```

```Go
func (check *Checker) rememberUntyped(e ast.Expr, lhs bool, mode operandMode, typ *Basic, val constant.Value)
```

#### <a id="Checker.later" href="#Checker.later">func (check *Checker) later(f func())</a>

```
searchKey: types.Checker.later
tags: [private]
```

```Go
func (check *Checker) later(f func())
```

later pushes f on to the stack of actions that will be processed later; either at the end of the current statement, or in case of a local constant or variable declaration, before the constant or variable is in scope (so that f still sees the scope before any new declarations). 

#### <a id="Checker.push" href="#Checker.push">func (check *Checker) push(obj Object) int</a>

```
searchKey: types.Checker.push
tags: [private]
```

```Go
func (check *Checker) push(obj Object) int
```

push pushes obj onto the object path and returns its index in the path. 

#### <a id="Checker.pop" href="#Checker.pop">func (check *Checker) pop() Object</a>

```
searchKey: types.Checker.pop
tags: [private]
```

```Go
func (check *Checker) pop() Object
```

pop pops and returns the topmost object from the object path. 

#### <a id="Checker.initFiles" href="#Checker.initFiles">func (check *Checker) initFiles(files []*ast.File)</a>

```
searchKey: types.Checker.initFiles
tags: [private]
```

```Go
func (check *Checker) initFiles(files []*ast.File)
```

initFiles initializes the files-specific portion of checker. The provided files must all belong to the same package. 

#### <a id="Checker.handleBailout" href="#Checker.handleBailout">func (check *Checker) handleBailout(err *error)</a>

```
searchKey: types.Checker.handleBailout
tags: [private]
```

```Go
func (check *Checker) handleBailout(err *error)
```

#### <a id="Checker.Files" href="#Checker.Files">func (check *Checker) Files(files []*ast.File) error</a>

```
searchKey: types.Checker.Files
```

```Go
func (check *Checker) Files(files []*ast.File) error
```

Files checks the provided files as part of the checker's package. 

#### <a id="Checker.checkFiles" href="#Checker.checkFiles">func (check *Checker) checkFiles(files []*ast.File) (err error)</a>

```
searchKey: types.Checker.checkFiles
tags: [private]
```

```Go
func (check *Checker) checkFiles(files []*ast.File) (err error)
```

#### <a id="Checker.processDelayed" href="#Checker.processDelayed">func (check *Checker) processDelayed(top int)</a>

```
searchKey: types.Checker.processDelayed
tags: [private]
```

```Go
func (check *Checker) processDelayed(top int)
```

processDelayed processes all delayed actions pushed after top. 

#### <a id="Checker.record" href="#Checker.record">func (check *Checker) record(x *operand)</a>

```
searchKey: types.Checker.record
tags: [private]
```

```Go
func (check *Checker) record(x *operand)
```

#### <a id="Checker.recordUntyped" href="#Checker.recordUntyped">func (check *Checker) recordUntyped()</a>

```
searchKey: types.Checker.recordUntyped
tags: [private]
```

```Go
func (check *Checker) recordUntyped()
```

#### <a id="Checker.recordTypeAndValue" href="#Checker.recordTypeAndValue">func (check *Checker) recordTypeAndValue(x ast.Expr, mode operandMode, typ Type, val constant.Value)</a>

```
searchKey: types.Checker.recordTypeAndValue
tags: [private]
```

```Go
func (check *Checker) recordTypeAndValue(x ast.Expr, mode operandMode, typ Type, val constant.Value)
```

#### <a id="Checker.recordBuiltinType" href="#Checker.recordBuiltinType">func (check *Checker) recordBuiltinType(f ast.Expr, sig *Signature)</a>

```
searchKey: types.Checker.recordBuiltinType
tags: [private]
```

```Go
func (check *Checker) recordBuiltinType(f ast.Expr, sig *Signature)
```

#### <a id="Checker.recordCommaOkTypes" href="#Checker.recordCommaOkTypes">func (check *Checker) recordCommaOkTypes(x ast.Expr, a [2]Type)</a>

```
searchKey: types.Checker.recordCommaOkTypes
tags: [private]
```

```Go
func (check *Checker) recordCommaOkTypes(x ast.Expr, a [2]Type)
```

#### <a id="Checker.recordInferred" href="#Checker.recordInferred">func (check *Checker) recordInferred(call ast.Expr, targs []Type, sig *Signature)</a>

```
searchKey: types.Checker.recordInferred
tags: [private]
```

```Go
func (check *Checker) recordInferred(call ast.Expr, targs []Type, sig *Signature)
```

#### <a id="Checker.recordDef" href="#Checker.recordDef">func (check *Checker) recordDef(id *ast.Ident, obj Object)</a>

```
searchKey: types.Checker.recordDef
tags: [private]
```

```Go
func (check *Checker) recordDef(id *ast.Ident, obj Object)
```

#### <a id="Checker.recordUse" href="#Checker.recordUse">func (check *Checker) recordUse(id *ast.Ident, obj Object)</a>

```
searchKey: types.Checker.recordUse
tags: [private]
```

```Go
func (check *Checker) recordUse(id *ast.Ident, obj Object)
```

#### <a id="Checker.recordImplicit" href="#Checker.recordImplicit">func (check *Checker) recordImplicit(node ast.Node, obj Object)</a>

```
searchKey: types.Checker.recordImplicit
tags: [private]
```

```Go
func (check *Checker) recordImplicit(node ast.Node, obj Object)
```

#### <a id="Checker.recordSelection" href="#Checker.recordSelection">func (check *Checker) recordSelection(x *ast.SelectorExpr, kind SelectionKind, recv Type, obj Object, index []int, indirect bool)</a>

```
searchKey: types.Checker.recordSelection
tags: [private]
```

```Go
func (check *Checker) recordSelection(x *ast.SelectorExpr, kind SelectionKind, recv Type, obj Object, index []int, indirect bool)
```

#### <a id="Checker.recordScope" href="#Checker.recordScope">func (check *Checker) recordScope(node ast.Node, scope *Scope)</a>

```
searchKey: types.Checker.recordScope
tags: [private]
```

```Go
func (check *Checker) recordScope(node ast.Node, scope *Scope)
```

#### <a id="Checker.conversion" href="#Checker.conversion">func (check *Checker) conversion(x *operand, T Type)</a>

```
searchKey: types.Checker.conversion
tags: [private]
```

```Go
func (check *Checker) conversion(x *operand, T Type)
```

Conversion type-checks the conversion T(x). The result is in x. 

#### <a id="Checker.reportAltDecl" href="#Checker.reportAltDecl">func (check *Checker) reportAltDecl(obj Object)</a>

```
searchKey: types.Checker.reportAltDecl
tags: [private]
```

```Go
func (check *Checker) reportAltDecl(obj Object)
```

#### <a id="Checker.declare" href="#Checker.declare">func (check *Checker) declare(scope *Scope, id *ast.Ident, obj Object, pos token.Pos)</a>

```
searchKey: types.Checker.declare
tags: [private]
```

```Go
func (check *Checker) declare(scope *Scope, id *ast.Ident, obj Object, pos token.Pos)
```

#### <a id="Checker.objDecl" href="#Checker.objDecl">func (check *Checker) objDecl(obj Object, def *Named)</a>

```
searchKey: types.Checker.objDecl
tags: [private]
```

```Go
func (check *Checker) objDecl(obj Object, def *Named)
```

objDecl type-checks the declaration of obj in its respective (file) context. For the meaning of def, see Checker.definedType, in typexpr.go. 

#### <a id="Checker.cycle" href="#Checker.cycle">func (check *Checker) cycle(obj Object) (isCycle bool)</a>

```
searchKey: types.Checker.cycle
tags: [private]
```

```Go
func (check *Checker) cycle(obj Object) (isCycle bool)
```

cycle checks if the cycle starting with obj is valid and reports an error if it is not. 

#### <a id="Checker.validType" href="#Checker.validType">func (check *Checker) validType(typ Type, path []Object) typeInfo</a>

```
searchKey: types.Checker.validType
tags: [private]
```

```Go
func (check *Checker) validType(typ Type, path []Object) typeInfo
```

validType verifies that the given type does not "expand" infinitely producing a cycle in the type graph. Cycles are detected by marking defined types. (Cycles involving alias types, as in "type A = [10]A" are detected earlier, via the objDecl cycle detection mechanism.) 

#### <a id="Checker.cycleError" href="#Checker.cycleError">func (check *Checker) cycleError(cycle []Object)</a>

```
searchKey: types.Checker.cycleError
tags: [private]
```

```Go
func (check *Checker) cycleError(cycle []Object)
```

cycleError reports a declaration cycle starting with the object in cycle that is "first" in the source. 

#### <a id="Checker.walkDecls" href="#Checker.walkDecls">func (check *Checker) walkDecls(decls []ast.Decl, f func(decl))</a>

```
searchKey: types.Checker.walkDecls
tags: [private]
```

```Go
func (check *Checker) walkDecls(decls []ast.Decl, f func(decl))
```

#### <a id="Checker.walkDecl" href="#Checker.walkDecl">func (check *Checker) walkDecl(d ast.Decl, f func(decl))</a>

```
searchKey: types.Checker.walkDecl
tags: [private]
```

```Go
func (check *Checker) walkDecl(d ast.Decl, f func(decl))
```

#### <a id="Checker.constDecl" href="#Checker.constDecl">func (check *Checker) constDecl(obj *Const, typ, init ast.Expr, inherited bool)</a>

```
searchKey: types.Checker.constDecl
tags: [private]
```

```Go
func (check *Checker) constDecl(obj *Const, typ, init ast.Expr, inherited bool)
```

#### <a id="Checker.varDecl" href="#Checker.varDecl">func (check *Checker) varDecl(obj *Var, lhs []*Var, typ, init ast.Expr)</a>

```
searchKey: types.Checker.varDecl
tags: [private]
```

```Go
func (check *Checker) varDecl(obj *Var, lhs []*Var, typ, init ast.Expr)
```

#### <a id="Checker.typeDecl" href="#Checker.typeDecl">func (check *Checker) typeDecl(obj *TypeName, tdecl *ast.TypeSpec, def *Named)</a>

```
searchKey: types.Checker.typeDecl
tags: [private]
```

```Go
func (check *Checker) typeDecl(obj *TypeName, tdecl *ast.TypeSpec, def *Named)
```

#### <a id="Checker.collectTypeParams" href="#Checker.collectTypeParams">func (check *Checker) collectTypeParams(list *ast.FieldList) (tparams []*TypeName)</a>

```
searchKey: types.Checker.collectTypeParams
tags: [private]
```

```Go
func (check *Checker) collectTypeParams(list *ast.FieldList) (tparams []*TypeName)
```

#### <a id="Checker.declareTypeParams" href="#Checker.declareTypeParams">func (check *Checker) declareTypeParams(tparams []*TypeName, names []*ast.Ident) []*TypeName</a>

```
searchKey: types.Checker.declareTypeParams
tags: [private]
```

```Go
func (check *Checker) declareTypeParams(tparams []*TypeName, names []*ast.Ident) []*TypeName
```

#### <a id="Checker.collectMethods" href="#Checker.collectMethods">func (check *Checker) collectMethods(obj *TypeName)</a>

```
searchKey: types.Checker.collectMethods
tags: [private]
```

```Go
func (check *Checker) collectMethods(obj *TypeName)
```

#### <a id="Checker.funcDecl" href="#Checker.funcDecl">func (check *Checker) funcDecl(obj *Func, decl *declInfo)</a>

```
searchKey: types.Checker.funcDecl
tags: [private]
```

```Go
func (check *Checker) funcDecl(obj *Func, decl *declInfo)
```

#### <a id="Checker.declStmt" href="#Checker.declStmt">func (check *Checker) declStmt(d ast.Decl)</a>

```
searchKey: types.Checker.declStmt
tags: [private]
```

```Go
func (check *Checker) declStmt(d ast.Decl)
```

#### <a id="Checker.qualifier" href="#Checker.qualifier">func (check *Checker) qualifier(pkg *Package) string</a>

```
searchKey: types.Checker.qualifier
tags: [private]
```

```Go
func (check *Checker) qualifier(pkg *Package) string
```

#### <a id="Checker.markImports" href="#Checker.markImports">func (check *Checker) markImports(pkg *Package)</a>

```
searchKey: types.Checker.markImports
tags: [private]
```

```Go
func (check *Checker) markImports(pkg *Package)
```

markImports recursively walks pkg and its imports, to record unique import paths in pkgPathMap. 

#### <a id="Checker.sprintf" href="#Checker.sprintf">func (check *Checker) sprintf(format string, args ...interface{}) string</a>

```
searchKey: types.Checker.sprintf
tags: [private]
```

```Go
func (check *Checker) sprintf(format string, args ...interface{}) string
```

#### <a id="Checker.trace" href="#Checker.trace">func (check *Checker) trace(pos token.Pos, format string, args ...interface{})</a>

```
searchKey: types.Checker.trace
tags: [private]
```

```Go
func (check *Checker) trace(pos token.Pos, format string, args ...interface{})
```

#### <a id="Checker.dump" href="#Checker.dump">func (check *Checker) dump(format string, args ...interface{})</a>

```
searchKey: types.Checker.dump
tags: [private]
```

```Go
func (check *Checker) dump(format string, args ...interface{})
```

dump is only needed for debugging 

#### <a id="Checker.err" href="#Checker.err">func (check *Checker) err(err error)</a>

```
searchKey: types.Checker.err
tags: [private]
```

```Go
func (check *Checker) err(err error)
```

#### <a id="Checker.newError" href="#Checker.newError">func (check *Checker) newError(at positioner, code errorCode, soft bool, msg string) error</a>

```
searchKey: types.Checker.newError
tags: [private]
```

```Go
func (check *Checker) newError(at positioner, code errorCode, soft bool, msg string) error
```

#### <a id="Checker.newErrorf" href="#Checker.newErrorf">func (check *Checker) newErrorf(at positioner, code errorCode, soft bool, format string, args ...interface{}) error</a>

```
searchKey: types.Checker.newErrorf
tags: [private]
```

```Go
func (check *Checker) newErrorf(at positioner, code errorCode, soft bool, format string, args ...interface{}) error
```

newErrorf creates a new Error, but does not handle it. 

#### <a id="Checker.error" href="#Checker.error">func (check *Checker) error(at positioner, code errorCode, msg string)</a>

```
searchKey: types.Checker.error
tags: [private]
```

```Go
func (check *Checker) error(at positioner, code errorCode, msg string)
```

#### <a id="Checker.errorf" href="#Checker.errorf">func (check *Checker) errorf(at positioner, code errorCode, format string, args ...interface{})</a>

```
searchKey: types.Checker.errorf
tags: [private]
```

```Go
func (check *Checker) errorf(at positioner, code errorCode, format string, args ...interface{})
```

#### <a id="Checker.softErrorf" href="#Checker.softErrorf">func (check *Checker) softErrorf(at positioner, code errorCode, format string, args ...interface{})</a>

```
searchKey: types.Checker.softErrorf
tags: [private]
```

```Go
func (check *Checker) softErrorf(at positioner, code errorCode, format string, args ...interface{})
```

#### <a id="Checker.invalidAST" href="#Checker.invalidAST">func (check *Checker) invalidAST(at positioner, format string, args ...interface{})</a>

```
searchKey: types.Checker.invalidAST
tags: [private]
```

```Go
func (check *Checker) invalidAST(at positioner, format string, args ...interface{})
```

#### <a id="Checker.invalidArg" href="#Checker.invalidArg">func (check *Checker) invalidArg(at positioner, code errorCode, format string, args ...interface{})</a>

```
searchKey: types.Checker.invalidArg
tags: [private]
```

```Go
func (check *Checker) invalidArg(at positioner, code errorCode, format string, args ...interface{})
```

#### <a id="Checker.invalidOp" href="#Checker.invalidOp">func (check *Checker) invalidOp(at positioner, code errorCode, format string, args ...interface{})</a>

```
searchKey: types.Checker.invalidOp
tags: [private]
```

```Go
func (check *Checker) invalidOp(at positioner, code errorCode, format string, args ...interface{})
```

#### <a id="Checker.op" href="#Checker.op">func (check *Checker) op(m opPredicates, x *operand, op token.Token) bool</a>

```
searchKey: types.Checker.op
tags: [private]
```

```Go
func (check *Checker) op(m opPredicates, x *operand, op token.Token) bool
```

#### <a id="Checker.overflow" href="#Checker.overflow">func (check *Checker) overflow(x *operand, op token.Token, opPos token.Pos)</a>

```
searchKey: types.Checker.overflow
tags: [private]
```

```Go
func (check *Checker) overflow(x *operand, op token.Token, opPos token.Pos)
```

overflow checks that the constant x is representable by its type. For untyped constants, it checks that the value doesn't become arbitrarily large. 

#### <a id="Checker.unary" href="#Checker.unary">func (check *Checker) unary(x *operand, e *ast.UnaryExpr)</a>

```
searchKey: types.Checker.unary
tags: [private]
```

```Go
func (check *Checker) unary(x *operand, e *ast.UnaryExpr)
```

The unary expression e may be nil. It's passed in for better error messages only. 

#### <a id="Checker.representable" href="#Checker.representable">func (check *Checker) representable(x *operand, typ *Basic)</a>

```
searchKey: types.Checker.representable
tags: [private]
```

```Go
func (check *Checker) representable(x *operand, typ *Basic)
```

representable checks that a constant operand is representable in the given basic type. 

#### <a id="Checker.representation" href="#Checker.representation">func (check *Checker) representation(x *operand, typ *Basic) (constant.Value, errorCode)</a>

```
searchKey: types.Checker.representation
tags: [private]
```

```Go
func (check *Checker) representation(x *operand, typ *Basic) (constant.Value, errorCode)
```

representation returns the representation of the constant operand x as the basic type typ. 

If no such representation is possible, it returns a non-zero error code. 

#### <a id="Checker.invalidConversion" href="#Checker.invalidConversion">func (check *Checker) invalidConversion(code errorCode, x *operand, target Type)</a>

```
searchKey: types.Checker.invalidConversion
tags: [private]
```

```Go
func (check *Checker) invalidConversion(code errorCode, x *operand, target Type)
```

#### <a id="Checker.updateExprType" href="#Checker.updateExprType">func (check *Checker) updateExprType(x ast.Expr, typ Type, final bool)</a>

```
searchKey: types.Checker.updateExprType
tags: [private]
```

```Go
func (check *Checker) updateExprType(x ast.Expr, typ Type, final bool)
```

updateExprType updates the type of x to typ and invokes itself recursively for the operands of x, depending on expression kind. If typ is still an untyped and not the final type, updateExprType only updates the recorded untyped type for x and possibly its operands. Otherwise (i.e., typ is not an untyped type anymore, or it is the final type for x), the type and value are recorded. Also, if x is a constant, it must be representable as a value of typ, and if x is the (formerly untyped) lhs operand of a non-constant shift, it must be an integer value. 

#### <a id="Checker.updateExprVal" href="#Checker.updateExprVal">func (check *Checker) updateExprVal(x ast.Expr, val constant.Value)</a>

```
searchKey: types.Checker.updateExprVal
tags: [private]
```

```Go
func (check *Checker) updateExprVal(x ast.Expr, val constant.Value)
```

updateExprVal updates the value of x to val. 

#### <a id="Checker.convertUntyped" href="#Checker.convertUntyped">func (check *Checker) convertUntyped(x *operand, target Type)</a>

```
searchKey: types.Checker.convertUntyped
tags: [private]
```

```Go
func (check *Checker) convertUntyped(x *operand, target Type)
```

convertUntyped attempts to set the type of an untyped value to the target type. 

#### <a id="Checker.implicitTypeAndValue" href="#Checker.implicitTypeAndValue">func (check *Checker) implicitTypeAndValue(x *operand, target Type) (Type, constant.Value, errorCode)</a>

```
searchKey: types.Checker.implicitTypeAndValue
tags: [private]
```

```Go
func (check *Checker) implicitTypeAndValue(x *operand, target Type) (Type, constant.Value, errorCode)
```

implicitTypeAndValue returns the implicit type of x when used in a context where the target type is expected. If no such implicit conversion is possible, it returns a nil Type and non-zero error code. 

If x is a constant operand, the returned constant.Value will be the representation of x in this context. 

#### <a id="Checker.comparison" href="#Checker.comparison">func (check *Checker) comparison(x, y *operand, op token.Token)</a>

```
searchKey: types.Checker.comparison
tags: [private]
```

```Go
func (check *Checker) comparison(x, y *operand, op token.Token)
```

#### <a id="Checker.shift" href="#Checker.shift">func (check *Checker) shift(x, y *operand, e ast.Expr, op token.Token)</a>

```
searchKey: types.Checker.shift
tags: [private]
```

```Go
func (check *Checker) shift(x, y *operand, e ast.Expr, op token.Token)
```

If e != nil, it must be the shift expression; it may be nil for non-constant shifts. 

#### <a id="Checker.binary" href="#Checker.binary">func (check *Checker) binary(x *operand, e ast.Expr, lhs, rhs ast.Expr, op token.Token, opPos token.Pos)</a>

```
searchKey: types.Checker.binary
tags: [private]
```

```Go
func (check *Checker) binary(x *operand, e ast.Expr, lhs, rhs ast.Expr, op token.Token, opPos token.Pos)
```

If e != nil, it must be the binary expression; it may be nil for non-constant expressions (when invoked for an assignment operation where the binary expression is implicit). 

#### <a id="Checker.rawExpr" href="#Checker.rawExpr">func (check *Checker) rawExpr(x *operand, e ast.Expr, hint Type) exprKind</a>

```
searchKey: types.Checker.rawExpr
tags: [private]
```

```Go
func (check *Checker) rawExpr(x *operand, e ast.Expr, hint Type) exprKind
```

rawExpr typechecks expression e and initializes x with the expression value or type. If an error occurred, x.mode is set to invalid. If hint != nil, it is the type of a composite literal element. 

#### <a id="Checker.exprInternal" href="#Checker.exprInternal">func (check *Checker) exprInternal(x *operand, e ast.Expr, hint Type) exprKind</a>

```
searchKey: types.Checker.exprInternal
tags: [private]
```

```Go
func (check *Checker) exprInternal(x *operand, e ast.Expr, hint Type) exprKind
```

exprInternal contains the core of type checking of expressions. Must only be called by rawExpr. 

#### <a id="Checker.typeAssertion" href="#Checker.typeAssertion">func (check *Checker) typeAssertion(at positioner, x *operand, xtyp *Interface, T Type)</a>

```
searchKey: types.Checker.typeAssertion
tags: [private]
```

```Go
func (check *Checker) typeAssertion(at positioner, x *operand, xtyp *Interface, T Type)
```

typeAssertion checks that x.(T) is legal; xtyp must be the type of x. 

#### <a id="Checker.expr" href="#Checker.expr">func (check *Checker) expr(x *operand, e ast.Expr)</a>

```
searchKey: types.Checker.expr
tags: [private]
```

```Go
func (check *Checker) expr(x *operand, e ast.Expr)
```

expr typechecks expression e and initializes x with the expression value. The result must be a single value. If an error occurred, x.mode is set to invalid. 

#### <a id="Checker.multiExpr" href="#Checker.multiExpr">func (check *Checker) multiExpr(x *operand, e ast.Expr)</a>

```
searchKey: types.Checker.multiExpr
tags: [private]
```

```Go
func (check *Checker) multiExpr(x *operand, e ast.Expr)
```

multiExpr is like expr but the result may also be a multi-value. 

#### <a id="Checker.exprWithHint" href="#Checker.exprWithHint">func (check *Checker) exprWithHint(x *operand, e ast.Expr, hint Type)</a>

```
searchKey: types.Checker.exprWithHint
tags: [private]
```

```Go
func (check *Checker) exprWithHint(x *operand, e ast.Expr, hint Type)
```

exprWithHint typechecks expression e and initializes x with the expression value; hint is the type of a composite literal element. If an error occurred, x.mode is set to invalid. 

#### <a id="Checker.exprOrType" href="#Checker.exprOrType">func (check *Checker) exprOrType(x *operand, e ast.Expr)</a>

```
searchKey: types.Checker.exprOrType
tags: [private]
```

```Go
func (check *Checker) exprOrType(x *operand, e ast.Expr)
```

exprOrType typechecks expression or type e and initializes x with the expression value or type. If an error occurred, x.mode is set to invalid. 

#### <a id="Checker.exclude" href="#Checker.exclude">func (check *Checker) exclude(x *operand, modeset uint)</a>

```
searchKey: types.Checker.exclude
tags: [private]
```

```Go
func (check *Checker) exclude(x *operand, modeset uint)
```

exclude reports an error if x.mode is in modeset and sets x.mode to invalid. The modeset may contain any of 1<<novalue, 1<<builtin, 1<<typexpr. 

#### <a id="Checker.singleValue" href="#Checker.singleValue">func (check *Checker) singleValue(x *operand)</a>

```
searchKey: types.Checker.singleValue
tags: [private]
```

```Go
func (check *Checker) singleValue(x *operand)
```

singleValue reports an error if x describes a tuple and sets x.mode to invalid. 

#### <a id="Checker.indexExpr" href="#Checker.indexExpr">func (check *Checker) indexExpr(x *operand, e *ast.IndexExpr) (isFuncInst bool)</a>

```
searchKey: types.Checker.indexExpr
tags: [private]
```

```Go
func (check *Checker) indexExpr(x *operand, e *ast.IndexExpr) (isFuncInst bool)
```

If e is a valid function instantiation, indexExpr returns true. In that case x represents the uninstantiated function value and it is the caller's responsibility to instantiate the function. 

#### <a id="Checker.sliceExpr" href="#Checker.sliceExpr">func (check *Checker) sliceExpr(x *operand, e *ast.SliceExpr)</a>

```
searchKey: types.Checker.sliceExpr
tags: [private]
```

```Go
func (check *Checker) sliceExpr(x *operand, e *ast.SliceExpr)
```

#### <a id="Checker.singleIndex" href="#Checker.singleIndex">func (check *Checker) singleIndex(e *ast.IndexExpr) ast.Expr</a>

```
searchKey: types.Checker.singleIndex
tags: [private]
```

```Go
func (check *Checker) singleIndex(e *ast.IndexExpr) ast.Expr
```

singleIndex returns the (single) index from the index expression e. If the index is missing, or if there are multiple indices, an error is reported and the result is nil. 

#### <a id="Checker.index" href="#Checker.index">func (check *Checker) index(index ast.Expr, max int64) (typ Type, val int64)</a>

```
searchKey: types.Checker.index
tags: [private]
```

```Go
func (check *Checker) index(index ast.Expr, max int64) (typ Type, val int64)
```

index checks an index expression for validity. If max >= 0, it is the upper bound for index. If the result typ is != Typ[Invalid], index is valid and typ is its (possibly named) integer type. If the result val >= 0, index is valid and val is its constant int value. 

#### <a id="Checker.isValidIndex" href="#Checker.isValidIndex">func (check *Checker) isValidIndex(x *operand, code errorCode, what string, allowNegative bool) bool</a>

```
searchKey: types.Checker.isValidIndex
tags: [private]
```

```Go
func (check *Checker) isValidIndex(x *operand, code errorCode, what string, allowNegative bool) bool
```

#### <a id="Checker.indexedElts" href="#Checker.indexedElts">func (check *Checker) indexedElts(elts []ast.Expr, typ Type, length int64) int64</a>

```
searchKey: types.Checker.indexedElts
tags: [private]
```

```Go
func (check *Checker) indexedElts(elts []ast.Expr, typ Type, length int64) int64
```

indexElts checks the elements (elts) of an array or slice composite literal against the literal's element type (typ), and the element indices against the literal length if known (length >= 0). It returns the length of the literal (maximum index value + 1). 

#### <a id="Checker.infer" href="#Checker.infer">func (check *Checker) infer(posn positioner, tparams []*TypeName, targs []Type, params *Tuple, args []*operand, report bool) (result []Type)</a>

```
searchKey: types.Checker.infer
tags: [private]
```

```Go
func (check *Checker) infer(posn positioner, tparams []*TypeName, targs []Type, params *Tuple, args []*operand, report bool) (result []Type)
```

infer attempts to infer the complete set of type arguments for generic function instantiation/call based on the given type parameters tparams, type arguments targs, function parameters params, and function arguments args, if any. There must be at least one type parameter, no more type arguments than type parameters, and params and args must match in number (incl. zero). If successful, infer returns the complete list of type arguments, one for each type parameter. Otherwise the result is nil and appropriate errors will be reported unless report is set to false. 

Inference proceeds in 3 steps: 

```
1) Start with given type arguments.
2) Infer type arguments from typed function arguments.
3) Infer type arguments from untyped function arguments.

```
Constraint type inference is used after each step to expand the set of type arguments. 

#### <a id="Checker.inferB" href="#Checker.inferB">func (check *Checker) inferB(tparams []*TypeName, targs []Type, report bool) (types []Type, index int)</a>

```
searchKey: types.Checker.inferB
tags: [private]
```

```Go
func (check *Checker) inferB(tparams []*TypeName, targs []Type, report bool) (types []Type, index int)
```

inferB returns the list of actual type arguments inferred from the type parameters' bounds and an initial set of type arguments. If type inference is impossible because unification fails, an error is reported if report is set to true, the resulting types list is nil, and index is 0. Otherwise, types is the list of inferred type arguments, and index is the index of the first type argument in that list that couldn't be inferred (and thus is nil). If all type arguments were inferred successfully, index is < 0. The number of type arguments provided may be less than the number of type parameters, but there must be at least one. 

#### <a id="Checker.structuralType" href="#Checker.structuralType">func (check *Checker) structuralType(constraint Type) Type</a>

```
searchKey: types.Checker.structuralType
tags: [private]
```

```Go
func (check *Checker) structuralType(constraint Type) Type
```

structuralType returns the structural type of a constraint, if any. 

#### <a id="Checker.initOrder" href="#Checker.initOrder">func (check *Checker) initOrder()</a>

```
searchKey: types.Checker.initOrder
tags: [private]
```

```Go
func (check *Checker) initOrder()
```

initOrder computes the Info.InitOrder for package variables. 

#### <a id="Checker.reportCycle" href="#Checker.reportCycle">func (check *Checker) reportCycle(cycle []Object)</a>

```
searchKey: types.Checker.reportCycle
tags: [private]
```

```Go
func (check *Checker) reportCycle(cycle []Object)
```

reportCycle reports an error for the given cycle. 

#### <a id="Checker.labels" href="#Checker.labels">func (check *Checker) labels(body *ast.BlockStmt)</a>

```
searchKey: types.Checker.labels
tags: [private]
```

```Go
func (check *Checker) labels(body *ast.BlockStmt)
```

labels checks correct label use in body. 

#### <a id="Checker.blockBranches" href="#Checker.blockBranches">func (check *Checker) blockBranches(all *Scope, parent *block, lstmt *ast.LabeledStmt, list []ast.Stmt) []*ast.BranchStmt</a>

```
searchKey: types.Checker.blockBranches
tags: [private]
```

```Go
func (check *Checker) blockBranches(all *Scope, parent *block, lstmt *ast.LabeledStmt, list []ast.Stmt) []*ast.BranchStmt
```

blockBranches processes a block's statement list and returns the set of outgoing forward jumps. all is the scope of all declared labels, parent the set of labels declared in the immediately enclosing block, and lstmt is the labeled statement this block is associated with (or nil). 

#### <a id="Checker.lookupFieldOrMethod" href="#Checker.lookupFieldOrMethod">func (check *Checker) lookupFieldOrMethod(T Type, addressable bool, pkg *Package, name string) (obj Object, index []int, indirect bool)</a>

```
searchKey: types.Checker.lookupFieldOrMethod
tags: [private]
```

```Go
func (check *Checker) lookupFieldOrMethod(T Type, addressable bool, pkg *Package, name string) (obj Object, index []int, indirect bool)
```

lookupFieldOrMethod is like the external version but completes interfaces as necessary. 

#### <a id="Checker.rawLookupFieldOrMethod" href="#Checker.rawLookupFieldOrMethod">func (check *Checker) rawLookupFieldOrMethod(T Type, addressable bool, pkg *Package, name string) (obj Object, index []int, indirect bool)</a>

```
searchKey: types.Checker.rawLookupFieldOrMethod
tags: [private]
```

```Go
func (check *Checker) rawLookupFieldOrMethod(T Type, addressable bool, pkg *Package, name string) (obj Object, index []int, indirect bool)
```

rawLookupFieldOrMethod should only be called by lookupFieldOrMethod and missingMethod. 

#### <a id="Checker.consolidateMultiples" href="#Checker.consolidateMultiples">func (check *Checker) consolidateMultiples(list []embeddedType) []embeddedType</a>

```
searchKey: types.Checker.consolidateMultiples
tags: [private]
```

```Go
func (check *Checker) consolidateMultiples(list []embeddedType) []embeddedType
```

consolidateMultiples collects multiple list entries with the same type into a single entry marked as containing multiples. The result is the consolidated list. 

#### <a id="Checker.lookupType" href="#Checker.lookupType">func (check *Checker) lookupType(m map[Type]int, typ Type) (int, bool)</a>

```
searchKey: types.Checker.lookupType
tags: [private]
```

```Go
func (check *Checker) lookupType(m map[Type]int, typ Type) (int, bool)
```

#### <a id="Checker.missingMethod" href="#Checker.missingMethod">func (check *Checker) missingMethod(V Type, T *Interface, static bool) (method, wrongType *Func)</a>

```
searchKey: types.Checker.missingMethod
tags: [private]
```

```Go
func (check *Checker) missingMethod(V Type, T *Interface, static bool) (method, wrongType *Func)
```

missingMethod is like MissingMethod but accepts a *Checker as receiver and an addressable flag. The receiver may be nil if missingMethod is invoked through an exported API call (such as MissingMethod), i.e., when all methods have been type-checked. If the type has the correctly named method, but with the wrong signature, the existing method is returned as well. To improve error messages, also report the wrong signature when the method exists on *V instead of V. 

#### <a id="Checker.assertableTo" href="#Checker.assertableTo">func (check *Checker) assertableTo(V *Interface, T Type) (method, wrongType *Func)</a>

```
searchKey: types.Checker.assertableTo
tags: [private]
```

```Go
func (check *Checker) assertableTo(V *Interface, T Type) (method, wrongType *Func)
```

assertableTo reports whether a value of type V can be asserted to have type T. It returns (nil, false) as affirmative answer. Otherwise it returns a missing method required by V and whether it is missing or just has the wrong type. The receiver may be nil if assertableTo is invoked through an exported API call (such as AssertableTo), i.e., when all methods have been type-checked. If the global constant forceStrict is set, assertions that are known to fail are not permitted. 

#### <a id="Checker.identical" href="#Checker.identical">func (check *Checker) identical(x, y Type) bool</a>

```
searchKey: types.Checker.identical
tags: [private]
```

```Go
func (check *Checker) identical(x, y Type) bool
```

identical reports whether x and y are identical types. Receivers of Signature types are ignored. 

#### <a id="Checker.identicalIgnoreTags" href="#Checker.identicalIgnoreTags">func (check *Checker) identicalIgnoreTags(x, y Type) bool</a>

```
searchKey: types.Checker.identicalIgnoreTags
tags: [private]
```

```Go
func (check *Checker) identicalIgnoreTags(x, y Type) bool
```

identicalIgnoreTags reports whether x and y are identical types if tags are ignored. Receivers of Signature types are ignored. 

#### <a id="Checker.identical0" href="#Checker.identical0">func (check *Checker) identical0(x, y Type, cmpTags bool, p *ifacePair) bool</a>

```
searchKey: types.Checker.identical0
tags: [private]
```

```Go
func (check *Checker) identical0(x, y Type, cmpTags bool, p *ifacePair) bool
```

For changes to this code the corresponding changes should be made to unifier.nify. 

#### <a id="Checker.identicalTParams" href="#Checker.identicalTParams">func (check *Checker) identicalTParams(x, y []*TypeName, cmpTags bool, p *ifacePair) bool</a>

```
searchKey: types.Checker.identicalTParams
tags: [private]
```

```Go
func (check *Checker) identicalTParams(x, y []*TypeName, cmpTags bool, p *ifacePair) bool
```

#### <a id="Checker.arityMatch" href="#Checker.arityMatch">func (check *Checker) arityMatch(s, init *ast.ValueSpec)</a>

```
searchKey: types.Checker.arityMatch
tags: [private]
```

```Go
func (check *Checker) arityMatch(s, init *ast.ValueSpec)
```

arityMatch checks that the lhs and rhs of a const or var decl have the appropriate number of names and init exprs. For const decls, init is the value spec providing the init exprs; for var decls, init is nil (the init exprs are in s in this case). 

#### <a id="Checker.declarePkgObj" href="#Checker.declarePkgObj">func (check *Checker) declarePkgObj(ident *ast.Ident, obj Object, d *declInfo)</a>

```
searchKey: types.Checker.declarePkgObj
tags: [private]
```

```Go
func (check *Checker) declarePkgObj(ident *ast.Ident, obj Object, d *declInfo)
```

declarePkgObj declares obj in the package scope, records its ident -> obj mapping, and updates check.objMap. The object must not be a function or method. 

#### <a id="Checker.filename" href="#Checker.filename">func (check *Checker) filename(fileNo int) string</a>

```
searchKey: types.Checker.filename
tags: [private]
```

```Go
func (check *Checker) filename(fileNo int) string
```

filename returns a filename suitable for debugging output. 

#### <a id="Checker.importPackage" href="#Checker.importPackage">func (check *Checker) importPackage(at positioner, path, dir string) *Package</a>

```
searchKey: types.Checker.importPackage
tags: [private]
```

```Go
func (check *Checker) importPackage(at positioner, path, dir string) *Package
```

#### <a id="Checker.collectObjects" href="#Checker.collectObjects">func (check *Checker) collectObjects()</a>

```
searchKey: types.Checker.collectObjects
tags: [private]
```

```Go
func (check *Checker) collectObjects()
```

collectObjects collects all file and package objects and inserts them into their respective scopes. It also performs imports and associates methods with receiver base type names. 

#### <a id="Checker.unpackRecv" href="#Checker.unpackRecv">func (check *Checker) unpackRecv(rtyp ast.Expr, unpackParams bool) (ptr bool, rname *ast.Ident, tparams []*ast.Ident)</a>

```
searchKey: types.Checker.unpackRecv
tags: [private]
```

```Go
func (check *Checker) unpackRecv(rtyp ast.Expr, unpackParams bool) (ptr bool, rname *ast.Ident, tparams []*ast.Ident)
```

unpackRecv unpacks a receiver type and returns its components: ptr indicates whether rtyp is a pointer receiver, rname is the receiver type name, and tparams are its type parameters, if any. The type parameters are only unpacked if unpackParams is set. If rname is nil, the receiver is unusable (i.e., the source has a bug which we cannot easily work around). 

#### <a id="Checker.resolveBaseTypeName" href="#Checker.resolveBaseTypeName">func (check *Checker) resolveBaseTypeName(seenPtr bool, name *ast.Ident) (ptr bool, base *TypeName)</a>

```
searchKey: types.Checker.resolveBaseTypeName
tags: [private]
```

```Go
func (check *Checker) resolveBaseTypeName(seenPtr bool, name *ast.Ident) (ptr bool, base *TypeName)
```

resolveBaseTypeName returns the non-alias base type name for typ, and whether there was a pointer indirection to get to it. The base type name must be declared in package scope, and there can be at most one pointer indirection. If no such type name exists, the returned base is nil. 

#### <a id="Checker.packageObjects" href="#Checker.packageObjects">func (check *Checker) packageObjects()</a>

```
searchKey: types.Checker.packageObjects
tags: [private]
```

```Go
func (check *Checker) packageObjects()
```

packageObjects typechecks all package objects, but not function bodies. 

#### <a id="Checker.unusedImports" href="#Checker.unusedImports">func (check *Checker) unusedImports()</a>

```
searchKey: types.Checker.unusedImports
tags: [private]
```

```Go
func (check *Checker) unusedImports()
```

unusedImports checks for unused imports. 

#### <a id="Checker.errorUnusedPkg" href="#Checker.errorUnusedPkg">func (check *Checker) errorUnusedPkg(obj *PkgName)</a>

```
searchKey: types.Checker.errorUnusedPkg
tags: [private]
```

```Go
func (check *Checker) errorUnusedPkg(obj *PkgName)
```

#### <a id="Checker.isTerminating" href="#Checker.isTerminating">func (check *Checker) isTerminating(s ast.Stmt, label string) bool</a>

```
searchKey: types.Checker.isTerminating
tags: [private]
```

```Go
func (check *Checker) isTerminating(s ast.Stmt, label string) bool
```

isTerminating reports if s is a terminating statement. If s is labeled, label is the label name; otherwise s is "". 

#### <a id="Checker.isTerminatingList" href="#Checker.isTerminatingList">func (check *Checker) isTerminatingList(list []ast.Stmt, label string) bool</a>

```
searchKey: types.Checker.isTerminatingList
tags: [private]
```

```Go
func (check *Checker) isTerminatingList(list []ast.Stmt, label string) bool
```

#### <a id="Checker.isTerminatingSwitch" href="#Checker.isTerminatingSwitch">func (check *Checker) isTerminatingSwitch(body *ast.BlockStmt, label string) bool</a>

```
searchKey: types.Checker.isTerminatingSwitch
tags: [private]
```

```Go
func (check *Checker) isTerminatingSwitch(body *ast.BlockStmt, label string) bool
```

#### <a id="Checker.funcBody" href="#Checker.funcBody">func (check *Checker) funcBody(decl *declInfo, name string, sig *Signature, body *ast.BlockStmt, iota constant.Value)</a>

```
searchKey: types.Checker.funcBody
tags: [private]
```

```Go
func (check *Checker) funcBody(decl *declInfo, name string, sig *Signature, body *ast.BlockStmt, iota constant.Value)
```

#### <a id="Checker.usage" href="#Checker.usage">func (check *Checker) usage(scope *Scope)</a>

```
searchKey: types.Checker.usage
tags: [private]
```

```Go
func (check *Checker) usage(scope *Scope)
```

#### <a id="Checker.simpleStmt" href="#Checker.simpleStmt">func (check *Checker) simpleStmt(s ast.Stmt)</a>

```
searchKey: types.Checker.simpleStmt
tags: [private]
```

```Go
func (check *Checker) simpleStmt(s ast.Stmt)
```

#### <a id="Checker.stmtList" href="#Checker.stmtList">func (check *Checker) stmtList(ctxt stmtContext, list []ast.Stmt)</a>

```
searchKey: types.Checker.stmtList
tags: [private]
```

```Go
func (check *Checker) stmtList(ctxt stmtContext, list []ast.Stmt)
```

#### <a id="Checker.multipleDefaults" href="#Checker.multipleDefaults">func (check *Checker) multipleDefaults(list []ast.Stmt)</a>

```
searchKey: types.Checker.multipleDefaults
tags: [private]
```

```Go
func (check *Checker) multipleDefaults(list []ast.Stmt)
```

#### <a id="Checker.openScope" href="#Checker.openScope">func (check *Checker) openScope(node ast.Node, comment string)</a>

```
searchKey: types.Checker.openScope
tags: [private]
```

```Go
func (check *Checker) openScope(node ast.Node, comment string)
```

#### <a id="Checker.closeScope" href="#Checker.closeScope">func (check *Checker) closeScope()</a>

```
searchKey: types.Checker.closeScope
tags: [private]
```

```Go
func (check *Checker) closeScope()
```

#### <a id="Checker.suspendedCall" href="#Checker.suspendedCall">func (check *Checker) suspendedCall(keyword string, call *ast.CallExpr)</a>

```
searchKey: types.Checker.suspendedCall
tags: [private]
```

```Go
func (check *Checker) suspendedCall(keyword string, call *ast.CallExpr)
```

#### <a id="Checker.caseValues" href="#Checker.caseValues">func (check *Checker) caseValues(x *operand, values []ast.Expr, seen valueMap)</a>

```
searchKey: types.Checker.caseValues
tags: [private]
```

```Go
func (check *Checker) caseValues(x *operand, values []ast.Expr, seen valueMap)
```

#### <a id="Checker.caseTypes" href="#Checker.caseTypes">func (check *Checker) caseTypes(x *operand, xtyp *Interface, types []ast.Expr, seen map[Type]ast.Expr) (T Type)</a>

```
searchKey: types.Checker.caseTypes
tags: [private]
```

```Go
func (check *Checker) caseTypes(x *operand, xtyp *Interface, types []ast.Expr, seen map[Type]ast.Expr) (T Type)
```

#### <a id="Checker.stmt" href="#Checker.stmt">func (check *Checker) stmt(ctxt stmtContext, s ast.Stmt)</a>

```
searchKey: types.Checker.stmt
tags: [private]
```

```Go
func (check *Checker) stmt(ctxt stmtContext, s ast.Stmt)
```

stmt typechecks statement s. 

#### <a id="Checker.instantiate" href="#Checker.instantiate">func (check *Checker) instantiate(pos token.Pos, typ Type, targs []Type, poslist []token.Pos) (res Type)</a>

```
searchKey: types.Checker.instantiate
tags: [private]
```

```Go
func (check *Checker) instantiate(pos token.Pos, typ Type, targs []Type, poslist []token.Pos) (res Type)
```

#### <a id="Checker.subst" href="#Checker.subst">func (check *Checker) subst(pos token.Pos, typ Type, smap *substMap) Type</a>

```
searchKey: types.Checker.subst
tags: [private]
```

```Go
func (check *Checker) subst(pos token.Pos, typ Type, smap *substMap) Type
```

subst returns the type typ with its type parameters tpars replaced by the corresponding type arguments targs, recursively. subst is functional in the sense that it doesn't modify the incoming type. If a substitution took place, the result type is different from from the incoming type. 

#### <a id="Checker.newNamed" href="#Checker.newNamed">func (check *Checker) newNamed(obj *TypeName, underlying Type, methods []*Func) *Named</a>

```
searchKey: types.Checker.newNamed
tags: [private]
```

```Go
func (check *Checker) newNamed(obj *TypeName, underlying Type, methods []*Func) *Named
```

#### <a id="Checker.newTypeParam" href="#Checker.newTypeParam">func (check *Checker) newTypeParam(obj *TypeName, index int, bound Type) *_TypeParam</a>

```
searchKey: types.Checker.newTypeParam
tags: [private]
```

```Go
func (check *Checker) newTypeParam(obj *TypeName, index int, bound Type) *_TypeParam
```

newTypeParam returns a new TypeParam. 

#### <a id="Checker.ident" href="#Checker.ident">func (check *Checker) ident(x *operand, e *ast.Ident, def *Named, wantType bool)</a>

```
searchKey: types.Checker.ident
tags: [private]
```

```Go
func (check *Checker) ident(x *operand, e *ast.Ident, def *Named, wantType bool)
```

ident type-checks identifier e and initializes x with the value or type of e. If an error occurred, x.mode is set to invalid. For the meaning of def, see Checker.definedType, below. If wantType is set, the identifier e is expected to denote a type. 

#### <a id="Checker.typ" href="#Checker.typ">func (check *Checker) typ(e ast.Expr) Type</a>

```
searchKey: types.Checker.typ
tags: [private]
```

```Go
func (check *Checker) typ(e ast.Expr) Type
```

typ type-checks the type expression e and returns its type, or Typ[Invalid]. The type must not be an (uninstantiated) generic type. 

#### <a id="Checker.varType" href="#Checker.varType">func (check *Checker) varType(e ast.Expr) Type</a>

```
searchKey: types.Checker.varType
tags: [private]
```

```Go
func (check *Checker) varType(e ast.Expr) Type
```

varType type-checks the type expression e and returns its type, or Typ[Invalid]. The type must not be an (uninstantiated) generic type and it must be ordinary (see ordinaryType). 

#### <a id="Checker.ordinaryType" href="#Checker.ordinaryType">func (check *Checker) ordinaryType(pos positioner, typ Type)</a>

```
searchKey: types.Checker.ordinaryType
tags: [private]
```

```Go
func (check *Checker) ordinaryType(pos positioner, typ Type)
```

ordinaryType reports an error if typ is an interface type containing type lists or is (or embeds) the predeclared type comparable. 

#### <a id="Checker.anyType" href="#Checker.anyType">func (check *Checker) anyType(e ast.Expr) Type</a>

```
searchKey: types.Checker.anyType
tags: [private]
```

```Go
func (check *Checker) anyType(e ast.Expr) Type
```

anyType type-checks the type expression e and returns its type, or Typ[Invalid]. The type may be generic or instantiated. 

#### <a id="Checker.definedType" href="#Checker.definedType">func (check *Checker) definedType(e ast.Expr, def *Named) Type</a>

```
searchKey: types.Checker.definedType
tags: [private]
```

```Go
func (check *Checker) definedType(e ast.Expr, def *Named) Type
```

definedType is like typ but also accepts a type name def. If def != nil, e is the type specification for the defined type def, declared in a type declaration, and def.underlying will be set to the type of e before any components of e are type-checked. 

#### <a id="Checker.genericType" href="#Checker.genericType">func (check *Checker) genericType(e ast.Expr, reportErr bool) Type</a>

```
searchKey: types.Checker.genericType
tags: [private]
```

```Go
func (check *Checker) genericType(e ast.Expr, reportErr bool) Type
```

genericType is like typ but the type must be an (uninstantiated) generic type. 

#### <a id="Checker.funcType" href="#Checker.funcType">func (check *Checker) funcType(sig *Signature, recvPar *ast.FieldList, ftyp *ast.FuncType)</a>

```
searchKey: types.Checker.funcType
tags: [private]
```

```Go
func (check *Checker) funcType(sig *Signature, recvPar *ast.FieldList, ftyp *ast.FuncType)
```

funcType type-checks a function or method type. 

#### <a id="Checker.typInternal" href="#Checker.typInternal">func (check *Checker) typInternal(e0 ast.Expr, def *Named) (T Type)</a>

```
searchKey: types.Checker.typInternal
tags: [private]
```

```Go
func (check *Checker) typInternal(e0 ast.Expr, def *Named) (T Type)
```

typInternal drives type checking of types. Must only be called by definedType or genericType. 

#### <a id="Checker.typeOrNil" href="#Checker.typeOrNil">func (check *Checker) typeOrNil(e ast.Expr) Type</a>

```
searchKey: types.Checker.typeOrNil
tags: [private]
```

```Go
func (check *Checker) typeOrNil(e ast.Expr) Type
```

typeOrNil type-checks the type expression (or nil value) e and returns the type of e, or nil. If e is a type, it must not be an (uninstantiated) generic type. If e is neither a type nor nil, typeOrNil returns Typ[Invalid]. TODO(gri) should we also disallow non-var types? 

#### <a id="Checker.instantiatedType" href="#Checker.instantiatedType">func (check *Checker) instantiatedType(x ast.Expr, targs []ast.Expr, def *Named) Type</a>

```
searchKey: types.Checker.instantiatedType
tags: [private]
```

```Go
func (check *Checker) instantiatedType(x ast.Expr, targs []ast.Expr, def *Named) Type
```

#### <a id="Checker.arrayLength" href="#Checker.arrayLength">func (check *Checker) arrayLength(e ast.Expr) int64</a>

```
searchKey: types.Checker.arrayLength
tags: [private]
```

```Go
func (check *Checker) arrayLength(e ast.Expr) int64
```

arrayLength type-checks the array length expression e and returns the constant length >= 0, or a value < 0 to indicate an error (and thus an unknown length). 

#### <a id="Checker.typeList" href="#Checker.typeList">func (check *Checker) typeList(list []ast.Expr) []Type</a>

```
searchKey: types.Checker.typeList
tags: [private]
```

```Go
func (check *Checker) typeList(list []ast.Expr) []Type
```

typeList provides the list of types corresponding to the incoming expression list. If an error occurred, the result is nil, but all list elements were type-checked. 

#### <a id="Checker.collectParams" href="#Checker.collectParams">func (check *Checker) collectParams(scope *Scope, list *ast.FieldList, type0 ast.Expr, variadicOk bool) (params []*Var, variadic bool)</a>

```
searchKey: types.Checker.collectParams
tags: [private]
```

```Go
func (check *Checker) collectParams(scope *Scope, list *ast.FieldList, type0 ast.Expr, variadicOk bool) (params []*Var, variadic bool)
```

collectParams declares the parameters of list in scope and returns the corresponding variable list. If type0 != nil, it is used instead of the first type in list. 

#### <a id="Checker.declareInSet" href="#Checker.declareInSet">func (check *Checker) declareInSet(oset *objset, pos token.Pos, obj Object) bool</a>

```
searchKey: types.Checker.declareInSet
tags: [private]
```

```Go
func (check *Checker) declareInSet(oset *objset, pos token.Pos, obj Object) bool
```

#### <a id="Checker.interfaceType" href="#Checker.interfaceType">func (check *Checker) interfaceType(ityp *Interface, iface *ast.InterfaceType, def *Named)</a>

```
searchKey: types.Checker.interfaceType
tags: [private]
```

```Go
func (check *Checker) interfaceType(ityp *Interface, iface *ast.InterfaceType, def *Named)
```

#### <a id="Checker.completeInterface" href="#Checker.completeInterface">func (check *Checker) completeInterface(pos token.Pos, ityp *Interface)</a>

```
searchKey: types.Checker.completeInterface
tags: [private]
```

```Go
func (check *Checker) completeInterface(pos token.Pos, ityp *Interface)
```

#### <a id="Checker.tag" href="#Checker.tag">func (check *Checker) tag(t *ast.BasicLit) string</a>

```
searchKey: types.Checker.tag
tags: [private]
```

```Go
func (check *Checker) tag(t *ast.BasicLit) string
```

#### <a id="Checker.structType" href="#Checker.structType">func (check *Checker) structType(styp *Struct, e *ast.StructType)</a>

```
searchKey: types.Checker.structType
tags: [private]
```

```Go
func (check *Checker) structType(styp *Struct, e *ast.StructType)
```

#### <a id="Checker.collectTypeConstraints" href="#Checker.collectTypeConstraints">func (check *Checker) collectTypeConstraints(pos token.Pos, types []ast.Expr) []Type</a>

```
searchKey: types.Checker.collectTypeConstraints
tags: [private]
```

```Go
func (check *Checker) collectTypeConstraints(pos token.Pos, types []ast.Expr) []Type
```

#### <a id="Checker.langCompat" href="#Checker.langCompat">func (check *Checker) langCompat(lit *ast.BasicLit)</a>

```
searchKey: types.Checker.langCompat
tags: [private]
```

```Go
func (check *Checker) langCompat(lit *ast.BasicLit)
```

langCompat reports an error if the representation of a numeric literal is not compatible with the current language version. 

#### <a id="Checker.allowVersion" href="#Checker.allowVersion">func (check *Checker) allowVersion(pkg *Package, major, minor int) bool</a>

```
searchKey: types.Checker.allowVersion
tags: [private]
```

```Go
func (check *Checker) allowVersion(pkg *Package, major, minor int) bool
```

allowVersion reports whether the given package is allowed to use version major.minor. 

### <a id="bailout" href="#bailout">type bailout struct{}</a>

```
searchKey: types.bailout
tags: [private]
```

```Go
type bailout struct{}
```

A bailout panic is used for early termination. 

### <a id="typeInfo" href="#typeInfo">type typeInfo uint</a>

```
searchKey: types.typeInfo
tags: [private]
```

```Go
type typeInfo uint
```

### <a id="decl" href="#decl">type decl interface</a>

```
searchKey: types.decl
tags: [private]
```

```Go
type decl interface {
	node() ast.Node
}
```

### <a id="importDecl" href="#importDecl">type importDecl struct</a>

```
searchKey: types.importDecl
tags: [private]
```

```Go
type importDecl struct{ spec *ast.ImportSpec }
```

#### <a id="importDecl.node" href="#importDecl.node">func (d importDecl) node() ast.Node</a>

```
searchKey: types.importDecl.node
tags: [private]
```

```Go
func (d importDecl) node() ast.Node
```

### <a id="constDecl" href="#constDecl">type constDecl struct</a>

```
searchKey: types.constDecl
tags: [private]
```

```Go
type constDecl struct {
	spec      *ast.ValueSpec
	iota      int
	typ       ast.Expr
	init      []ast.Expr
	inherited bool
}
```

#### <a id="constDecl.node" href="#constDecl.node">func (d constDecl) node() ast.Node</a>

```
searchKey: types.constDecl.node
tags: [private]
```

```Go
func (d constDecl) node() ast.Node
```

### <a id="varDecl" href="#varDecl">type varDecl struct</a>

```
searchKey: types.varDecl
tags: [private]
```

```Go
type varDecl struct{ spec *ast.ValueSpec }
```

#### <a id="varDecl.node" href="#varDecl.node">func (d varDecl) node() ast.Node</a>

```
searchKey: types.varDecl.node
tags: [private]
```

```Go
func (d varDecl) node() ast.Node
```

### <a id="typeDecl" href="#typeDecl">type typeDecl struct</a>

```
searchKey: types.typeDecl
tags: [private]
```

```Go
type typeDecl struct{ spec *ast.TypeSpec }
```

#### <a id="typeDecl.node" href="#typeDecl.node">func (d typeDecl) node() ast.Node</a>

```
searchKey: types.typeDecl.node
tags: [private]
```

```Go
func (d typeDecl) node() ast.Node
```

### <a id="funcDecl" href="#funcDecl">type funcDecl struct</a>

```
searchKey: types.funcDecl
tags: [private]
```

```Go
type funcDecl struct{ decl *ast.FuncDecl }
```

#### <a id="funcDecl.node" href="#funcDecl.node">func (d funcDecl) node() ast.Node</a>

```
searchKey: types.funcDecl.node
tags: [private]
```

```Go
func (d funcDecl) node() ast.Node
```

### <a id="errorCode" href="#errorCode">type errorCode int</a>

```
searchKey: types.errorCode
tags: [private]
```

```Go
type errorCode int
```

### <a id="positioner" href="#positioner">type positioner interface</a>

```
searchKey: types.positioner
tags: [private]
```

```Go
type positioner interface {
	Pos() token.Pos
}
```

The positioner interface is used to extract the position of type-checker errors. 

### <a id="posSpan" href="#posSpan">type posSpan struct</a>

```
searchKey: types.posSpan
tags: [private]
```

```Go
type posSpan struct {
	start, pos, end token.Pos
}
```

posSpan holds a position range along with a highlighted position within that range. This is used for positioning errors, with pos by convention being the first position in the source where the error is known to exist, and start and end defining the full span of syntax being considered when the error was detected. Invariant: start <= pos < end || start == pos == end. 

#### <a id="inNode" href="#inNode">func inNode(node ast.Node, pos token.Pos) posSpan</a>

```
searchKey: types.inNode
tags: [private]
```

```Go
func inNode(node ast.Node, pos token.Pos) posSpan
```

inNode creates a posSpan for the given node. Invariant: node.Pos() <= pos < node.End() (node.End() is the position of the first byte after node within the source). 

#### <a id="spanOf" href="#spanOf">func spanOf(at positioner) posSpan</a>

```
searchKey: types.spanOf
tags: [private]
```

```Go
func spanOf(at positioner) posSpan
```

spanOf extracts an error span from the given positioner. By default this is the trivial span starting and ending at pos, but this span is expanded when the argument naturally corresponds to a span of source code. 

#### <a id="posSpan.Pos" href="#posSpan.Pos">func (e posSpan) Pos() token.Pos</a>

```
searchKey: types.posSpan.Pos
tags: [private]
```

```Go
func (e posSpan) Pos() token.Pos
```

### <a id="atPos" href="#atPos">type atPos token.Pos</a>

```
searchKey: types.atPos
tags: [private]
```

```Go
type atPos token.Pos
```

atPos wraps a token.Pos to implement the positioner interface. 

#### <a id="atPos.Pos" href="#atPos.Pos">func (s atPos) Pos() token.Pos</a>

```
searchKey: types.atPos.Pos
tags: [private]
```

```Go
func (s atPos) Pos() token.Pos
```

### <a id="opPredicates" href="#opPredicates">type opPredicates map[token.Token]func(std/go/types.Type) bool</a>

```
searchKey: types.opPredicates
tags: [private]
```

```Go
type opPredicates map[token.Token]func(Type) bool
```

### <a id="exprKind" href="#exprKind">type exprKind int</a>

```
searchKey: types.exprKind
tags: [private]
```

```Go
type exprKind int
```

exprKind describes the kind of an expression; the kind determines if an expression is valid in 'statement context'. 

### <a id="tpWalker" href="#tpWalker">type tpWalker struct</a>

```
searchKey: types.tpWalker
tags: [private]
```

```Go
type tpWalker struct {
	seen    map[Type]bool
	tparams []*TypeName
}
```

#### <a id="tpWalker.isParameterized" href="#tpWalker.isParameterized">func (w *tpWalker) isParameterized(typ Type) (res bool)</a>

```
searchKey: types.tpWalker.isParameterized
tags: [private]
```

```Go
func (w *tpWalker) isParameterized(typ Type) (res bool)
```

#### <a id="tpWalker.isParameterizedList" href="#tpWalker.isParameterizedList">func (w *tpWalker) isParameterizedList(list []Type) bool</a>

```
searchKey: types.tpWalker.isParameterizedList
tags: [private]
```

```Go
func (w *tpWalker) isParameterizedList(list []Type) bool
```

### <a id="dependency" href="#dependency">type dependency interface</a>

```
searchKey: types.dependency
tags: [private]
```

```Go
type dependency interface {
	Object
	isDependency()
}
```

A dependency is an object that may be a dependency in an initialization expression. Only constants, variables, and functions can be dependencies. Constants are here because constant expression cycles are reported during initialization order computation. 

### <a id="graphNode" href="#graphNode">type graphNode struct</a>

```
searchKey: types.graphNode
tags: [private]
```

```Go
type graphNode struct {
	obj        dependency // object represented by this node
	pred, succ nodeSet    // consumers and dependencies of this node (lazily initialized)
	index      int        // node index in graph slice/priority queue
	ndeps      int        // number of outstanding dependencies before this object can be initialized
}
```

A graphNode represents a node in the object dependency graph. Each node p in n.pred represents an edge p->n, and each node s in n.succ represents an edge n->s; with a->b indicating that a depends on b. 

### <a id="nodeSet" href="#nodeSet">type nodeSet map[*types.graphNode]bool</a>

```
searchKey: types.nodeSet
tags: [private]
```

```Go
type nodeSet map[*graphNode]bool
```

#### <a id="nodeSet.add" href="#nodeSet.add">func (s *nodeSet) add(p *graphNode)</a>

```
searchKey: types.nodeSet.add
tags: [private]
```

```Go
func (s *nodeSet) add(p *graphNode)
```

### <a id="nodeQueue" href="#nodeQueue">type nodeQueue []*types.graphNode</a>

```
searchKey: types.nodeQueue
tags: [private]
```

```Go
type nodeQueue []*graphNode
```

nodeQueue implements the container/heap interface; a nodeQueue may be used as a priority queue. 

#### <a id="nodeQueue.Len" href="#nodeQueue.Len">func (a nodeQueue) Len() int</a>

```
searchKey: types.nodeQueue.Len
tags: [private]
```

```Go
func (a nodeQueue) Len() int
```

#### <a id="nodeQueue.Swap" href="#nodeQueue.Swap">func (a nodeQueue) Swap(i, j int)</a>

```
searchKey: types.nodeQueue.Swap
tags: [private]
```

```Go
func (a nodeQueue) Swap(i, j int)
```

#### <a id="nodeQueue.Less" href="#nodeQueue.Less">func (a nodeQueue) Less(i, j int) bool</a>

```
searchKey: types.nodeQueue.Less
tags: [private]
```

```Go
func (a nodeQueue) Less(i, j int) bool
```

#### <a id="nodeQueue.Push" href="#nodeQueue.Push">func (a *nodeQueue) Push(x interface{})</a>

```
searchKey: types.nodeQueue.Push
tags: [private]
```

```Go
func (a *nodeQueue) Push(x interface{})
```

#### <a id="nodeQueue.Pop" href="#nodeQueue.Pop">func (a *nodeQueue) Pop() interface{}</a>

```
searchKey: types.nodeQueue.Pop
tags: [private]
```

```Go
func (a *nodeQueue) Pop() interface{}
```

### <a id="block" href="#block">type block struct</a>

```
searchKey: types.block
tags: [private]
```

```Go
type block struct {
	parent *block                      // enclosing block
	lstmt  *ast.LabeledStmt            // labeled statement to which this block belongs, or nil
	labels map[string]*ast.LabeledStmt // allocated lazily
}
```

A block tracks label declarations in a block and its enclosing blocks. 

#### <a id="block.insert" href="#block.insert">func (b *block) insert(s *ast.LabeledStmt)</a>

```
searchKey: types.block.insert
tags: [private]
```

```Go
func (b *block) insert(s *ast.LabeledStmt)
```

insert records a new label declaration for the current block. The label must not have been declared before in any block. 

#### <a id="block.gotoTarget" href="#block.gotoTarget">func (b *block) gotoTarget(name string) *ast.LabeledStmt</a>

```
searchKey: types.block.gotoTarget
tags: [private]
```

```Go
func (b *block) gotoTarget(name string) *ast.LabeledStmt
```

gotoTarget returns the labeled statement in the current or an enclosing block with the given label name, or nil. 

#### <a id="block.enclosingTarget" href="#block.enclosingTarget">func (b *block) enclosingTarget(name string) *ast.LabeledStmt</a>

```
searchKey: types.block.enclosingTarget
tags: [private]
```

```Go
func (b *block) enclosingTarget(name string) *ast.LabeledStmt
```

enclosingTarget returns the innermost enclosing labeled statement with the given label name, or nil. 

### <a id="embeddedType" href="#embeddedType">type embeddedType struct</a>

```
searchKey: types.embeddedType
tags: [private]
```

```Go
type embeddedType struct {
	typ       Type
	index     []int // embedded field indices, starting with index at depth 0
	indirect  bool  // if set, there was a pointer indirection on the path to this field
	multiples bool  // if set, typ appears multiple times at this depth
}
```

embeddedType represents an embedded type 

### <a id="MethodSet" href="#MethodSet">type MethodSet struct</a>

```
searchKey: types.MethodSet
```

```Go
type MethodSet struct {
	list []*Selection
}
```

A MethodSet is an ordered set of concrete or abstract (interface) methods; a method is a MethodVal selection, and they are ordered by ascending m.Obj().Id(). The zero value for a MethodSet is a ready-to-use empty method set. 

#### <a id="NewMethodSet" href="#NewMethodSet">func NewMethodSet(T Type) *MethodSet</a>

```
searchKey: types.NewMethodSet
```

```Go
func NewMethodSet(T Type) *MethodSet
```

NewMethodSet returns the method set for the given type T. It always returns a non-nil method set, even if it is empty. 

#### <a id="MethodSet.String" href="#MethodSet.String">func (s *MethodSet) String() string</a>

```
searchKey: types.MethodSet.String
```

```Go
func (s *MethodSet) String() string
```

#### <a id="MethodSet.Len" href="#MethodSet.Len">func (s *MethodSet) Len() int</a>

```
searchKey: types.MethodSet.Len
```

```Go
func (s *MethodSet) Len() int
```

Len returns the number of methods in s. 

#### <a id="MethodSet.At" href="#MethodSet.At">func (s *MethodSet) At(i int) *Selection</a>

```
searchKey: types.MethodSet.At
```

```Go
func (s *MethodSet) At(i int) *Selection
```

At returns the i'th method in s for 0 <= i < s.Len(). 

#### <a id="MethodSet.Lookup" href="#MethodSet.Lookup">func (s *MethodSet) Lookup(pkg *Package, name string) *Selection</a>

```
searchKey: types.MethodSet.Lookup
```

```Go
func (s *MethodSet) Lookup(pkg *Package, name string) *Selection
```

Lookup returns the method with matching package and name, or nil if not found. 

### <a id="methodSet" href="#methodSet">type methodSet map[string]*types.Selection</a>

```
searchKey: types.methodSet
tags: [private]
```

```Go
type methodSet map[string]*Selection // a nil entry indicates a name collision

```

A methodSet is a set of methods and name collisions. A collision indicates that multiple methods with the same unique id, or a field with that id appeared. 

#### <a id="methodSet.add" href="#methodSet.add">func (s methodSet) add(list []*Func, index []int, indirect bool, multiples bool) methodSet</a>

```
searchKey: types.methodSet.add
tags: [private]
```

```Go
func (s methodSet) add(list []*Func, index []int, indirect bool, multiples bool) methodSet
```

Add adds all functions in list to the method set s. If multiples is set, every function in list appears multiple times and is treated as a collision. 

### <a id="Object" href="#Object">type Object interface</a>

```
searchKey: types.Object
```

```Go
type Object interface {
	Parent() *Scope // scope in which this object is declared; nil for methods and struct fields
	Pos() token.Pos // position of object identifier in declaration
	Pkg() *Package  // package to which this object belongs; nil for labels and objects in the Universe scope
	Name() string   // package local object name
	Type() Type     // object type
	Exported() bool // reports whether the name starts with a capital letter
	Id() string     // object name if exported, qualified name if not exported (see func Id)

	// String returns a human-readable string of the object.
	String() string

	// order reflects a package-level object's source order: if object
	// a is before object b in the source, then a.order() < b.order().
	// order returns a value > 0 for package-level objects; it returns
	// 0 for all other objects (including objects in file scopes).
	order() uint32

	// color returns the object's color.
	color() color

	// setType sets the type of the object.
	setType(Type)

	// setOrder sets the order number of the object. It must be > 0.
	setOrder(uint32)

	// setColor sets the object's color. It must not be white.
	setColor(color color)

	// setParent sets the parent scope of the object.
	setParent(*Scope)

	// sameId reports whether obj.Id() and Id(pkg, name) are the same.
	sameId(pkg *Package, name string) bool

	// scopePos returns the start position of the scope of this Object
	scopePos() token.Pos

	// setScopePos sets the start position of the scope for this Object.
	setScopePos(pos token.Pos)
}
```

An Object describes a named language entity such as a package, constant, type, variable, function (incl. methods), or label. All objects implement the Object interface. 

#### <a id="LookupFieldOrMethod" href="#LookupFieldOrMethod">func LookupFieldOrMethod(T Type, addressable bool, pkg *Package, name string) (obj Object, index []int, indirect bool)</a>

```
searchKey: types.LookupFieldOrMethod
```

```Go
func LookupFieldOrMethod(T Type, addressable bool, pkg *Package, name string) (obj Object, index []int, indirect bool)
```

LookupFieldOrMethod looks up a field or method with given package and name in T and returns the corresponding *Var or *Func, an index sequence, and a bool indicating if there were any pointer indirections on the path to the field or method. If addressable is set, T is the type of an addressable variable (only matters for method lookups). 

The last index entry is the field or method index in the (possibly embedded) type where the entry was found, either: 

```
1) the list of declared methods of a named type; or
2) the list of all methods (method set) of an interface type; or
3) the list of fields of a struct type.

```
The earlier index entries are the indices of the embedded struct fields traversed to get to the found entry, starting at depth 0. 

If no entry is found, a nil object is returned. In this case, the returned index and indirect values have the following meaning: 

```
	- If index != nil, the index sequence points to an ambiguous entry
	(the same name appeared more than once at the same embedding level).

	- If indirect is set, a method with a pointer receiver type was found
     but there was no pointer on the path from the actual receiver type to
	the method's formal receiver base type, nor was the receiver addressable.

```
### <a id="object" href="#object">type object struct</a>

```
searchKey: types.object
tags: [private]
```

```Go
type object struct {
	parent    *Scope
	pos       token.Pos
	pkg       *Package
	name      string
	typ       Type
	order_    uint32
	color_    color
	scopePos_ token.Pos
}
```

An object implements the common parts of an Object. 

#### <a id="object.Parent" href="#object.Parent">func (obj *object) Parent() *Scope</a>

```
searchKey: types.object.Parent
tags: [private]
```

```Go
func (obj *object) Parent() *Scope
```

Parent returns the scope in which the object is declared. The result is nil for methods and struct fields. 

#### <a id="object.Pos" href="#object.Pos">func (obj *object) Pos() token.Pos</a>

```
searchKey: types.object.Pos
tags: [private]
```

```Go
func (obj *object) Pos() token.Pos
```

Pos returns the declaration position of the object's identifier. 

#### <a id="object.Pkg" href="#object.Pkg">func (obj *object) Pkg() *Package</a>

```
searchKey: types.object.Pkg
tags: [private]
```

```Go
func (obj *object) Pkg() *Package
```

Pkg returns the package to which the object belongs. The result is nil for labels and objects in the Universe scope. 

#### <a id="object.Name" href="#object.Name">func (obj *object) Name() string</a>

```
searchKey: types.object.Name
tags: [private]
```

```Go
func (obj *object) Name() string
```

Name returns the object's (package-local, unqualified) name. 

#### <a id="object.Type" href="#object.Type">func (obj *object) Type() Type</a>

```
searchKey: types.object.Type
tags: [private]
```

```Go
func (obj *object) Type() Type
```

Type returns the object's type. 

#### <a id="object.Exported" href="#object.Exported">func (obj *object) Exported() bool</a>

```
searchKey: types.object.Exported
tags: [private]
```

```Go
func (obj *object) Exported() bool
```

Exported reports whether the object is exported (starts with a capital letter). It doesn't take into account whether the object is in a local (function) scope or not. 

#### <a id="object.Id" href="#object.Id">func (obj *object) Id() string</a>

```
searchKey: types.object.Id
tags: [private]
```

```Go
func (obj *object) Id() string
```

Id is a wrapper for Id(obj.Pkg(), obj.Name()). 

#### <a id="object.String" href="#object.String">func (obj *object) String() string</a>

```
searchKey: types.object.String
tags: [private]
```

```Go
func (obj *object) String() string
```

#### <a id="object.order" href="#object.order">func (obj *object) order() uint32</a>

```
searchKey: types.object.order
tags: [private]
```

```Go
func (obj *object) order() uint32
```

#### <a id="object.color" href="#object.color">func (obj *object) color() color</a>

```
searchKey: types.object.color
tags: [private]
```

```Go
func (obj *object) color() color
```

#### <a id="object.scopePos" href="#object.scopePos">func (obj *object) scopePos() token.Pos</a>

```
searchKey: types.object.scopePos
tags: [private]
```

```Go
func (obj *object) scopePos() token.Pos
```

#### <a id="object.setParent" href="#object.setParent">func (obj *object) setParent(parent *Scope)</a>

```
searchKey: types.object.setParent
tags: [private]
```

```Go
func (obj *object) setParent(parent *Scope)
```

#### <a id="object.setType" href="#object.setType">func (obj *object) setType(typ Type)</a>

```
searchKey: types.object.setType
tags: [private]
```

```Go
func (obj *object) setType(typ Type)
```

#### <a id="object.setOrder" href="#object.setOrder">func (obj *object) setOrder(order uint32)</a>

```
searchKey: types.object.setOrder
tags: [private]
```

```Go
func (obj *object) setOrder(order uint32)
```

#### <a id="object.setColor" href="#object.setColor">func (obj *object) setColor(color color)</a>

```
searchKey: types.object.setColor
tags: [private]
```

```Go
func (obj *object) setColor(color color)
```

#### <a id="object.setScopePos" href="#object.setScopePos">func (obj *object) setScopePos(pos token.Pos)</a>

```
searchKey: types.object.setScopePos
tags: [private]
```

```Go
func (obj *object) setScopePos(pos token.Pos)
```

#### <a id="object.sameId" href="#object.sameId">func (obj *object) sameId(pkg *Package, name string) bool</a>

```
searchKey: types.object.sameId
tags: [private]
```

```Go
func (obj *object) sameId(pkg *Package, name string) bool
```

### <a id="color" href="#color">type color uint32</a>

```
searchKey: types.color
tags: [private]
```

```Go
type color uint32
```

color encodes the color of an object (see Checker.objDecl for details). 

#### <a id="colorFor" href="#colorFor">func colorFor(t Type) color</a>

```
searchKey: types.colorFor
tags: [private]
```

```Go
func colorFor(t Type) color
```

colorFor returns the (initial) color for an object depending on whether its type t is known or not. 

#### <a id="color.String" href="#color.String">func (c color) String() string</a>

```
searchKey: types.color.String
tags: [private]
```

```Go
func (c color) String() string
```

### <a id="PkgName" href="#PkgName">type PkgName struct</a>

```
searchKey: types.PkgName
```

```Go
type PkgName struct {
	object
	imported *Package
	used     bool // set if the package was used
}
```

A PkgName represents an imported Go package. PkgNames don't have a type. 

#### <a id="NewPkgName" href="#NewPkgName">func NewPkgName(pos token.Pos, pkg *Package, name string, imported *Package) *PkgName</a>

```
searchKey: types.NewPkgName
```

```Go
func NewPkgName(pos token.Pos, pkg *Package, name string, imported *Package) *PkgName
```

NewPkgName returns a new PkgName object representing an imported package. The remaining arguments set the attributes found with all Objects. 

#### <a id="PkgName.Imported" href="#PkgName.Imported">func (obj *PkgName) Imported() *Package</a>

```
searchKey: types.PkgName.Imported
```

```Go
func (obj *PkgName) Imported() *Package
```

Imported returns the package that was imported. It is distinct from Pkg(), which is the package containing the import statement. 

#### <a id="PkgName.String" href="#PkgName.String">func (obj *PkgName) String() string</a>

```
searchKey: types.PkgName.String
```

```Go
func (obj *PkgName) String() string
```

### <a id="Const" href="#Const">type Const struct</a>

```
searchKey: types.Const
```

```Go
type Const struct {
	object
	val constant.Value
}
```

A Const represents a declared constant. 

#### <a id="NewConst" href="#NewConst">func NewConst(pos token.Pos, pkg *Package, name string, typ Type, val constant.Value) *Const</a>

```
searchKey: types.NewConst
```

```Go
func NewConst(pos token.Pos, pkg *Package, name string, typ Type, val constant.Value) *Const
```

NewConst returns a new constant with value val. The remaining arguments set the attributes found with all Objects. 

#### <a id="Const.Val" href="#Const.Val">func (obj *Const) Val() constant.Value</a>

```
searchKey: types.Const.Val
```

```Go
func (obj *Const) Val() constant.Value
```

Val returns the constant's value. 

#### <a id="Const.isDependency" href="#Const.isDependency">func (*Const) isDependency()</a>

```
searchKey: types.Const.isDependency
tags: [private]
```

```Go
func (*Const) isDependency()
```

#### <a id="Const.String" href="#Const.String">func (obj *Const) String() string</a>

```
searchKey: types.Const.String
```

```Go
func (obj *Const) String() string
```

### <a id="TypeName" href="#TypeName">type TypeName struct</a>

```
searchKey: types.TypeName
```

```Go
type TypeName struct {
	object
}
```

A TypeName represents a name for a (defined or alias) type. 

#### <a id="NewTypeName" href="#NewTypeName">func NewTypeName(pos token.Pos, pkg *Package, name string, typ Type) *TypeName</a>

```
searchKey: types.NewTypeName
```

```Go
func NewTypeName(pos token.Pos, pkg *Package, name string, typ Type) *TypeName
```

NewTypeName returns a new type name denoting the given typ. The remaining arguments set the attributes found with all Objects. 

The typ argument may be a defined (Named) type or an alias type. It may also be nil such that the returned TypeName can be used as argument for NewNamed, which will set the TypeName's type as a side- effect. 

#### <a id="TypeName.IsAlias" href="#TypeName.IsAlias">func (obj *TypeName) IsAlias() bool</a>

```
searchKey: types.TypeName.IsAlias
```

```Go
func (obj *TypeName) IsAlias() bool
```

IsAlias reports whether obj is an alias name for a type. 

#### <a id="TypeName.String" href="#TypeName.String">func (obj *TypeName) String() string</a>

```
searchKey: types.TypeName.String
```

```Go
func (obj *TypeName) String() string
```

### <a id="Var" href="#Var">type Var struct</a>

```
searchKey: types.Var
```

```Go
type Var struct {
	object
	embedded bool // if set, the variable is an embedded struct field, and name is the type name
	isField  bool // var is struct field
	used     bool // set if the variable was used
}
```

A Variable represents a declared variable (including function parameters and results, and struct fields). 

#### <a id="NewVar" href="#NewVar">func NewVar(pos token.Pos, pkg *Package, name string, typ Type) *Var</a>

```
searchKey: types.NewVar
```

```Go
func NewVar(pos token.Pos, pkg *Package, name string, typ Type) *Var
```

NewVar returns a new variable. The arguments set the attributes found with all Objects. 

#### <a id="NewParam" href="#NewParam">func NewParam(pos token.Pos, pkg *Package, name string, typ Type) *Var</a>

```
searchKey: types.NewParam
```

```Go
func NewParam(pos token.Pos, pkg *Package, name string, typ Type) *Var
```

NewParam returns a new variable representing a function parameter. 

#### <a id="NewField" href="#NewField">func NewField(pos token.Pos, pkg *Package, name string, typ Type, embedded bool) *Var</a>

```
searchKey: types.NewField
```

```Go
func NewField(pos token.Pos, pkg *Package, name string, typ Type, embedded bool) *Var
```

NewField returns a new variable representing a struct field. For embedded fields, the name is the unqualified type name / under which the field is accessible. 

#### <a id="Var.Anonymous" href="#Var.Anonymous">func (obj *Var) Anonymous() bool</a>

```
searchKey: types.Var.Anonymous
```

```Go
func (obj *Var) Anonymous() bool
```

Anonymous reports whether the variable is an embedded field. Same as Embedded; only present for backward-compatibility. 

#### <a id="Var.Embedded" href="#Var.Embedded">func (obj *Var) Embedded() bool</a>

```
searchKey: types.Var.Embedded
```

```Go
func (obj *Var) Embedded() bool
```

Embedded reports whether the variable is an embedded field. 

#### <a id="Var.IsField" href="#Var.IsField">func (obj *Var) IsField() bool</a>

```
searchKey: types.Var.IsField
```

```Go
func (obj *Var) IsField() bool
```

IsField reports whether the variable is a struct field. 

#### <a id="Var.isDependency" href="#Var.isDependency">func (*Var) isDependency()</a>

```
searchKey: types.Var.isDependency
tags: [private]
```

```Go
func (*Var) isDependency()
```

#### <a id="Var.String" href="#Var.String">func (obj *Var) String() string</a>

```
searchKey: types.Var.String
```

```Go
func (obj *Var) String() string
```

### <a id="Func" href="#Func">type Func struct</a>

```
searchKey: types.Func
```

```Go
type Func struct {
	object
	hasPtrRecv bool // only valid for methods that don't have a type yet
}
```

A Func represents a declared function, concrete method, or abstract (interface) method. Its Type() is always a *Signature. An abstract method may belong to many interfaces due to embedding. 

#### <a id="MissingMethod" href="#MissingMethod">func MissingMethod(V Type, T *Interface, static bool) (method *Func, wrongType bool)</a>

```
searchKey: types.MissingMethod
```

```Go
func MissingMethod(V Type, T *Interface, static bool) (method *Func, wrongType bool)
```

MissingMethod returns (nil, false) if V implements T, otherwise it returns a missing method required by T and whether it is missing or just has the wrong type. 

For non-interface types V, or if static is set, V implements T if all methods of T are present in V. Otherwise (V is an interface and static is not set), MissingMethod only checks that methods of T which are also present in V have matching types (e.g., for a type assertion x.(T) where x is of interface type V). 

#### <a id="lookupMethod" href="#lookupMethod">func lookupMethod(methods []*Func, pkg *Package, name string) (int, *Func)</a>

```
searchKey: types.lookupMethod
tags: [private]
```

```Go
func lookupMethod(methods []*Func, pkg *Package, name string) (int, *Func)
```

lookupMethod returns the index of and method with matching package and name, or (-1, nil). 

#### <a id="NewFunc" href="#NewFunc">func NewFunc(pos token.Pos, pkg *Package, name string, sig *Signature) *Func</a>

```
searchKey: types.NewFunc
```

```Go
func NewFunc(pos token.Pos, pkg *Package, name string, sig *Signature) *Func
```

NewFunc returns a new function with the given signature, representing the function's type. 

#### <a id="Func.FullName" href="#Func.FullName">func (obj *Func) FullName() string</a>

```
searchKey: types.Func.FullName
```

```Go
func (obj *Func) FullName() string
```

FullName returns the package- or receiver-type-qualified name of function or method obj. 

#### <a id="Func.Scope" href="#Func.Scope">func (obj *Func) Scope() *Scope</a>

```
searchKey: types.Func.Scope
```

```Go
func (obj *Func) Scope() *Scope
```

Scope returns the scope of the function's body block. 

#### <a id="Func.isDependency" href="#Func.isDependency">func (*Func) isDependency()</a>

```
searchKey: types.Func.isDependency
tags: [private]
```

```Go
func (*Func) isDependency()
```

#### <a id="Func.String" href="#Func.String">func (obj *Func) String() string</a>

```
searchKey: types.Func.String
```

```Go
func (obj *Func) String() string
```

### <a id="Label" href="#Label">type Label struct</a>

```
searchKey: types.Label
```

```Go
type Label struct {
	object
	used bool // set if the label was used
}
```

A Label represents a declared label. Labels don't have a type. 

#### <a id="NewLabel" href="#NewLabel">func NewLabel(pos token.Pos, pkg *Package, name string) *Label</a>

```
searchKey: types.NewLabel
```

```Go
func NewLabel(pos token.Pos, pkg *Package, name string) *Label
```

NewLabel returns a new label. 

#### <a id="Label.String" href="#Label.String">func (obj *Label) String() string</a>

```
searchKey: types.Label.String
```

```Go
func (obj *Label) String() string
```

### <a id="Builtin" href="#Builtin">type Builtin struct</a>

```
searchKey: types.Builtin
```

```Go
type Builtin struct {
	object
	id builtinId
}
```

A Builtin represents a built-in function. Builtins don't have a valid type. 

#### <a id="newBuiltin" href="#newBuiltin">func newBuiltin(id builtinId) *Builtin</a>

```
searchKey: types.newBuiltin
tags: [private]
```

```Go
func newBuiltin(id builtinId) *Builtin
```

#### <a id="Builtin.String" href="#Builtin.String">func (obj *Builtin) String() string</a>

```
searchKey: types.Builtin.String
```

```Go
func (obj *Builtin) String() string
```

### <a id="Nil" href="#Nil">type Nil struct</a>

```
searchKey: types.Nil
```

```Go
type Nil struct {
	object
}
```

Nil represents the predeclared value nil. 

#### <a id="Nil.String" href="#Nil.String">func (obj *Nil) String() string</a>

```
searchKey: types.Nil.String
```

```Go
func (obj *Nil) String() string
```

### <a id="objset" href="#objset">type objset map[string]types.Object</a>

```
searchKey: types.objset
tags: [private]
```

```Go
type objset map[string]Object // initialized lazily

```

An objset is a set of objects identified by their unique id. The zero value for objset is a ready-to-use empty objset. 

#### <a id="objset.insert" href="#objset.insert">func (s *objset) insert(obj Object) Object</a>

```
searchKey: types.objset.insert
tags: [private]
```

```Go
func (s *objset) insert(obj Object) Object
```

insert attempts to insert an object obj into objset s. If s already contains an alternative object alt with the same name, insert leaves s unchanged and returns alt. Otherwise it inserts obj and returns nil. 

### <a id="operandMode" href="#operandMode">type operandMode byte</a>

```
searchKey: types.operandMode
tags: [private]
```

```Go
type operandMode byte
```

An operandMode specifies the (addressing) mode of an operand. 

### <a id="operand" href="#operand">type operand struct</a>

```
searchKey: types.operand
tags: [private]
```

```Go
type operand struct {
	mode operandMode
	expr ast.Expr
	typ  Type
	val  constant.Value
	id   builtinId
}
```

An operand represents an intermediate value during type checking. Operands have an (addressing) mode, the expression evaluating to the operand, the operand's type, a value for constants, and an id for built-in functions. The zero value of operand is a ready to use invalid operand. 

#### <a id="operand.convertibleTo" href="#operand.convertibleTo">func (x *operand) convertibleTo(check *Checker, T Type, reason *string) bool</a>

```
searchKey: types.operand.convertibleTo
tags: [private]
```

```Go
func (x *operand) convertibleTo(check *Checker, T Type, reason *string) bool
```

convertibleTo reports whether T(x) is valid. The check parameter may be nil if convertibleTo is invoked through an exported API call, i.e., when all methods have been type-checked. 

#### <a id="operand.Pos" href="#operand.Pos">func (x *operand) Pos() token.Pos</a>

```
searchKey: types.operand.Pos
tags: [private]
```

```Go
func (x *operand) Pos() token.Pos
```

Pos returns the position of the expression corresponding to x. If x is invalid the position is token.NoPos. 

#### <a id="operand.String" href="#operand.String">func (x *operand) String() string</a>

```
searchKey: types.operand.String
tags: [private]
```

```Go
func (x *operand) String() string
```

#### <a id="operand.setConst" href="#operand.setConst">func (x *operand) setConst(tok token.Token, lit string)</a>

```
searchKey: types.operand.setConst
tags: [private]
```

```Go
func (x *operand) setConst(tok token.Token, lit string)
```

setConst sets x to the untyped constant for literal lit. 

#### <a id="operand.isNil" href="#operand.isNil">func (x *operand) isNil() bool</a>

```
searchKey: types.operand.isNil
tags: [private]
```

```Go
func (x *operand) isNil() bool
```

isNil reports whether x is the nil value. 

#### <a id="operand.assignableTo" href="#operand.assignableTo">func (x *operand) assignableTo(check *Checker, T Type, reason *string) (bool, errorCode)</a>

```
searchKey: types.operand.assignableTo
tags: [private]
```

```Go
func (x *operand) assignableTo(check *Checker, T Type, reason *string) (bool, errorCode)
```

assignableTo reports whether x is assignable to a variable of type T. If the result is false and a non-nil reason is provided, it may be set to a more detailed explanation of the failure (result != ""). The returned error code is only valid if the (first) result is false. The check parameter may be nil if assignableTo is invoked through an exported API call, i.e., when all methods have been type-checked. 

### <a id="Package" href="#Package">type Package struct</a>

```
searchKey: types.Package
```

```Go
type Package struct {
	path     string
	name     string
	scope    *Scope
	complete bool
	imports  []*Package
	fake     bool // scope lookup errors are silently dropped if package is fake (internal use only)
	cgo      bool // uses of this package will be rewritten into uses of declarations from _cgo_gotypes.go
}
```

A Package describes a Go package. 

#### <a id="NewPackage" href="#NewPackage">func NewPackage(path, name string) *Package</a>

```
searchKey: types.NewPackage
```

```Go
func NewPackage(path, name string) *Package
```

NewPackage returns a new Package for the given package path and name. The package is not complete and contains no explicit imports. 

#### <a id="Package.Path" href="#Package.Path">func (pkg *Package) Path() string</a>

```
searchKey: types.Package.Path
```

```Go
func (pkg *Package) Path() string
```

Path returns the package path. 

#### <a id="Package.Name" href="#Package.Name">func (pkg *Package) Name() string</a>

```
searchKey: types.Package.Name
```

```Go
func (pkg *Package) Name() string
```

Name returns the package name. 

#### <a id="Package.SetName" href="#Package.SetName">func (pkg *Package) SetName(name string)</a>

```
searchKey: types.Package.SetName
```

```Go
func (pkg *Package) SetName(name string)
```

SetName sets the package name. 

#### <a id="Package.Scope" href="#Package.Scope">func (pkg *Package) Scope() *Scope</a>

```
searchKey: types.Package.Scope
```

```Go
func (pkg *Package) Scope() *Scope
```

Scope returns the (complete or incomplete) package scope holding the objects declared at package level (TypeNames, Consts, Vars, and Funcs). 

#### <a id="Package.Complete" href="#Package.Complete">func (pkg *Package) Complete() bool</a>

```
searchKey: types.Package.Complete
```

```Go
func (pkg *Package) Complete() bool
```

A package is complete if its scope contains (at least) all exported objects; otherwise it is incomplete. 

#### <a id="Package.MarkComplete" href="#Package.MarkComplete">func (pkg *Package) MarkComplete()</a>

```
searchKey: types.Package.MarkComplete
```

```Go
func (pkg *Package) MarkComplete()
```

MarkComplete marks a package as complete. 

#### <a id="Package.Imports" href="#Package.Imports">func (pkg *Package) Imports() []*Package</a>

```
searchKey: types.Package.Imports
```

```Go
func (pkg *Package) Imports() []*Package
```

Imports returns the list of packages directly imported by pkg; the list is in source order. 

If pkg was loaded from export data, Imports includes packages that provide package-level objects referenced by pkg. This may be more or less than the set of packages directly imported by pkg's source code. 

#### <a id="Package.SetImports" href="#Package.SetImports">func (pkg *Package) SetImports(list []*Package)</a>

```
searchKey: types.Package.SetImports
```

```Go
func (pkg *Package) SetImports(list []*Package)
```

SetImports sets the list of explicitly imported packages to list. It is the caller's responsibility to make sure list elements are unique. 

#### <a id="Package.String" href="#Package.String">func (pkg *Package) String() string</a>

```
searchKey: types.Package.String
```

```Go
func (pkg *Package) String() string
```

### <a id="ifacePair" href="#ifacePair">type ifacePair struct</a>

```
searchKey: types.ifacePair
tags: [private]
```

```Go
type ifacePair struct {
	x, y *Interface
	prev *ifacePair
}
```

An ifacePair is a node in a stack of interface type pairs compared for identity. 

#### <a id="ifacePair.identical" href="#ifacePair.identical">func (p *ifacePair) identical(q *ifacePair) bool</a>

```
searchKey: types.ifacePair.identical
tags: [private]
```

```Go
func (p *ifacePair) identical(q *ifacePair) bool
```

### <a id="declInfo" href="#declInfo">type declInfo struct</a>

```
searchKey: types.declInfo
tags: [private]
```

```Go
type declInfo struct {
	file      *Scope        // scope of file containing this declaration
	lhs       []*Var        // lhs of n:1 variable declarations, or nil
	vtyp      ast.Expr      // type, or nil (for const and var declarations only)
	init      ast.Expr      // init/orig expression, or nil (for const and var declarations only)
	inherited bool          // if set, the init expression is inherited from a previous constant declaration
	tdecl     *ast.TypeSpec // type declaration, or nil
	fdecl     *ast.FuncDecl // func declaration, or nil

	// The deps field tracks initialization expression dependencies.
	deps map[Object]bool // lazily initialized
}
```

A declInfo describes a package-level const, type, var, or func declaration. 

#### <a id="declInfo.hasInitializer" href="#declInfo.hasInitializer">func (d *declInfo) hasInitializer() bool</a>

```
searchKey: types.declInfo.hasInitializer
tags: [private]
```

```Go
func (d *declInfo) hasInitializer() bool
```

hasInitializer reports whether the declared object has an initialization expression or function body. 

#### <a id="declInfo.addDep" href="#declInfo.addDep">func (d *declInfo) addDep(obj Object)</a>

```
searchKey: types.declInfo.addDep
tags: [private]
```

```Go
func (d *declInfo) addDep(obj Object)
```

addDep adds obj to the set of objects d's init expression depends on. 

### <a id="inSourceOrder" href="#inSourceOrder">type inSourceOrder []types.Object</a>

```
searchKey: types.inSourceOrder
tags: [private]
```

```Go
type inSourceOrder []Object
```

inSourceOrder implements the sort.Sort interface. 

#### <a id="inSourceOrder.Len" href="#inSourceOrder.Len">func (a inSourceOrder) Len() int</a>

```
searchKey: types.inSourceOrder.Len
tags: [private]
```

```Go
func (a inSourceOrder) Len() int
```

#### <a id="inSourceOrder.Less" href="#inSourceOrder.Less">func (a inSourceOrder) Less(i, j int) bool</a>

```
searchKey: types.inSourceOrder.Less
tags: [private]
```

```Go
func (a inSourceOrder) Less(i, j int) bool
```

#### <a id="inSourceOrder.Swap" href="#inSourceOrder.Swap">func (a inSourceOrder) Swap(i, j int)</a>

```
searchKey: types.inSourceOrder.Swap
tags: [private]
```

```Go
func (a inSourceOrder) Swap(i, j int)
```

### <a id="sanitizer" href="#sanitizer">type sanitizer map[types.Type]types.Type</a>

```
searchKey: types.sanitizer
tags: [private]
```

```Go
type sanitizer map[Type]Type
```

#### <a id="sanitizer.typ" href="#sanitizer.typ">func (s sanitizer) typ(typ Type) Type</a>

```
searchKey: types.sanitizer.typ
tags: [private]
```

```Go
func (s sanitizer) typ(typ Type) Type
```

#### <a id="sanitizer.var_" href="#sanitizer.var_">func (s sanitizer) var_(v *Var)</a>

```
searchKey: types.sanitizer.var_
tags: [private]
```

```Go
func (s sanitizer) var_(v *Var)
```

#### <a id="sanitizer.varList" href="#sanitizer.varList">func (s sanitizer) varList(list []*Var)</a>

```
searchKey: types.sanitizer.varList
tags: [private]
```

```Go
func (s sanitizer) varList(list []*Var)
```

#### <a id="sanitizer.tuple" href="#sanitizer.tuple">func (s sanitizer) tuple(t *Tuple)</a>

```
searchKey: types.sanitizer.tuple
tags: [private]
```

```Go
func (s sanitizer) tuple(t *Tuple)
```

#### <a id="sanitizer.func_" href="#sanitizer.func_">func (s sanitizer) func_(f *Func)</a>

```
searchKey: types.sanitizer.func_
tags: [private]
```

```Go
func (s sanitizer) func_(f *Func)
```

#### <a id="sanitizer.funcList" href="#sanitizer.funcList">func (s sanitizer) funcList(list []*Func)</a>

```
searchKey: types.sanitizer.funcList
tags: [private]
```

```Go
func (s sanitizer) funcList(list []*Func)
```

#### <a id="sanitizer.typeList" href="#sanitizer.typeList">func (s sanitizer) typeList(list []Type)</a>

```
searchKey: types.sanitizer.typeList
tags: [private]
```

```Go
func (s sanitizer) typeList(list []Type)
```

### <a id="Scope" href="#Scope">type Scope struct</a>

```
searchKey: types.Scope
```

```Go
type Scope struct {
	parent   *Scope
	children []*Scope
	elems    map[string]Object // lazily allocated
	pos, end token.Pos         // scope extent; may be invalid
	comment  string            // for debugging only
	isFunc   bool              // set if this is a function scope (internal use only)
}
```

A Scope maintains a set of objects and links to its containing (parent) and contained (children) scopes. Objects may be inserted and looked up by name. The zero value for Scope is a ready-to-use empty scope. 

#### <a id="NewScope" href="#NewScope">func NewScope(parent *Scope, pos, end token.Pos, comment string) *Scope</a>

```
searchKey: types.NewScope
```

```Go
func NewScope(parent *Scope, pos, end token.Pos, comment string) *Scope
```

NewScope returns a new, empty scope contained in the given parent scope, if any. The comment is for debugging only. 

#### <a id="Scope.Parent" href="#Scope.Parent">func (s *Scope) Parent() *Scope</a>

```
searchKey: types.Scope.Parent
```

```Go
func (s *Scope) Parent() *Scope
```

Parent returns the scope's containing (parent) scope. 

#### <a id="Scope.Len" href="#Scope.Len">func (s *Scope) Len() int</a>

```
searchKey: types.Scope.Len
```

```Go
func (s *Scope) Len() int
```

Len returns the number of scope elements. 

#### <a id="Scope.Names" href="#Scope.Names">func (s *Scope) Names() []string</a>

```
searchKey: types.Scope.Names
```

```Go
func (s *Scope) Names() []string
```

Names returns the scope's element names in sorted order. 

#### <a id="Scope.NumChildren" href="#Scope.NumChildren">func (s *Scope) NumChildren() int</a>

```
searchKey: types.Scope.NumChildren
```

```Go
func (s *Scope) NumChildren() int
```

NumChildren returns the number of scopes nested in s. 

#### <a id="Scope.Child" href="#Scope.Child">func (s *Scope) Child(i int) *Scope</a>

```
searchKey: types.Scope.Child
```

```Go
func (s *Scope) Child(i int) *Scope
```

Child returns the i'th child scope for 0 <= i < NumChildren(). 

#### <a id="Scope.Lookup" href="#Scope.Lookup">func (s *Scope) Lookup(name string) Object</a>

```
searchKey: types.Scope.Lookup
```

```Go
func (s *Scope) Lookup(name string) Object
```

Lookup returns the object in scope s with the given name if such an object exists; otherwise the result is nil. 

#### <a id="Scope.LookupParent" href="#Scope.LookupParent">func (s *Scope) LookupParent(name string, pos token.Pos) (*Scope, Object)</a>

```
searchKey: types.Scope.LookupParent
```

```Go
func (s *Scope) LookupParent(name string, pos token.Pos) (*Scope, Object)
```

LookupParent follows the parent chain of scopes starting with s until it finds a scope where Lookup(name) returns a non-nil object, and then returns that scope and object. If a valid position pos is provided, only objects that were declared at or before pos are considered. If no such scope and object exists, the result is (nil, nil). 

Note that obj.Parent() may be different from the returned scope if the object was inserted into the scope and already had a parent at that time (see Insert). This can only happen for dot-imported objects whose scope is the scope of the package that exported them. 

#### <a id="Scope.Insert" href="#Scope.Insert">func (s *Scope) Insert(obj Object) Object</a>

```
searchKey: types.Scope.Insert
```

```Go
func (s *Scope) Insert(obj Object) Object
```

Insert attempts to insert an object obj into scope s. If s already contains an alternative object alt with the same name, Insert leaves s unchanged and returns alt. Otherwise it inserts obj, sets the object's parent scope if not already set, and returns nil. 

#### <a id="Scope.squash" href="#Scope.squash">func (s *Scope) squash(err func(obj, alt Object))</a>

```
searchKey: types.Scope.squash
tags: [private]
```

```Go
func (s *Scope) squash(err func(obj, alt Object))
```

squash merges s with its parent scope p by adding all objects of s to p, adding all children of s to the children of p, and removing s from p's children. The function f is called for each object obj in s which has an object alt in p. s should be discarded after having been squashed. 

#### <a id="Scope.Pos" href="#Scope.Pos">func (s *Scope) Pos() token.Pos</a>

```
searchKey: types.Scope.Pos
```

```Go
func (s *Scope) Pos() token.Pos
```

Pos and End describe the scope's source code extent [pos, end). The results are guaranteed to be valid only if the type-checked AST has complete position information. The extent is undefined for Universe and package scopes. 

#### <a id="Scope.End" href="#Scope.End">func (s *Scope) End() token.Pos</a>

```
searchKey: types.Scope.End
```

```Go
func (s *Scope) End() token.Pos
```

#### <a id="Scope.Contains" href="#Scope.Contains">func (s *Scope) Contains(pos token.Pos) bool</a>

```
searchKey: types.Scope.Contains
```

```Go
func (s *Scope) Contains(pos token.Pos) bool
```

Contains reports whether pos is within the scope's extent. The result is guaranteed to be valid only if the type-checked AST has complete position information. 

#### <a id="Scope.Innermost" href="#Scope.Innermost">func (s *Scope) Innermost(pos token.Pos) *Scope</a>

```
searchKey: types.Scope.Innermost
```

```Go
func (s *Scope) Innermost(pos token.Pos) *Scope
```

Innermost returns the innermost (child) scope containing pos. If pos is not within any scope, the result is nil. The result is also nil for the Universe scope. The result is guaranteed to be valid only if the type-checked AST has complete position information. 

#### <a id="Scope.WriteTo" href="#Scope.WriteTo">func (s *Scope) WriteTo(w io.Writer, n int, recurse bool)</a>

```
searchKey: types.Scope.WriteTo
```

```Go
func (s *Scope) WriteTo(w io.Writer, n int, recurse bool)
```

WriteTo writes a string representation of the scope to w, with the scope elements sorted by name. The level of indentation is controlled by n >= 0, with n == 0 for no indentation. If recurse is set, it also writes nested (children) scopes. 

#### <a id="Scope.String" href="#Scope.String">func (s *Scope) String() string</a>

```
searchKey: types.Scope.String
```

```Go
func (s *Scope) String() string
```

String returns a string representation of the scope, for debugging. 

### <a id="SelectionKind" href="#SelectionKind">type SelectionKind int</a>

```
searchKey: types.SelectionKind
```

```Go
type SelectionKind int
```

SelectionKind describes the kind of a selector expression x.f (excluding qualified identifiers). 

### <a id="Selection" href="#Selection">type Selection struct</a>

```
searchKey: types.Selection
```

```Go
type Selection struct {
	kind     SelectionKind
	recv     Type   // type of x
	obj      Object // object denoted by x.f
	index    []int  // path from x to x.f
	indirect bool   // set if there was any pointer indirection on the path
}
```

A Selection describes a selector expression x.f. For the declarations: 

```
type T struct{ x int; E }
type E struct{}
func (e E) m() {}
var p *T

```
the following relations exist: 

```
Selector    Kind          Recv    Obj    Type       Index     Indirect

p.x         FieldVal      T       x      int        {0}       true
p.m         MethodVal     *T      m      func()     {1, 0}    true
T.m         MethodExpr    T       m      func(T)    {1, 0}    false

```
#### <a id="Selection.Kind" href="#Selection.Kind">func (s *Selection) Kind() SelectionKind</a>

```
searchKey: types.Selection.Kind
```

```Go
func (s *Selection) Kind() SelectionKind
```

Kind returns the selection kind. 

#### <a id="Selection.Recv" href="#Selection.Recv">func (s *Selection) Recv() Type</a>

```
searchKey: types.Selection.Recv
```

```Go
func (s *Selection) Recv() Type
```

Recv returns the type of x in x.f. 

#### <a id="Selection.Obj" href="#Selection.Obj">func (s *Selection) Obj() Object</a>

```
searchKey: types.Selection.Obj
```

```Go
func (s *Selection) Obj() Object
```

Obj returns the object denoted by x.f; a *Var for a field selection, and a *Func in all other cases. 

#### <a id="Selection.Type" href="#Selection.Type">func (s *Selection) Type() Type</a>

```
searchKey: types.Selection.Type
```

```Go
func (s *Selection) Type() Type
```

Type returns the type of x.f, which may be different from the type of f. See Selection for more information. 

#### <a id="Selection.Index" href="#Selection.Index">func (s *Selection) Index() []int</a>

```
searchKey: types.Selection.Index
```

```Go
func (s *Selection) Index() []int
```

Index describes the path from x to f in x.f. The last index entry is the field or method index of the type declaring f; either: 

```
1) the list of declared methods of a named type; or
2) the list of methods of an interface type; or
3) the list of fields of a struct type.

```
The earlier index entries are the indices of the embedded fields implicitly traversed to get from (the type of) x to f, starting at embedding depth 0. 

#### <a id="Selection.Indirect" href="#Selection.Indirect">func (s *Selection) Indirect() bool</a>

```
searchKey: types.Selection.Indirect
```

```Go
func (s *Selection) Indirect() bool
```

Indirect reports whether any pointer indirection was required to get from x to f in x.f. 

#### <a id="Selection.String" href="#Selection.String">func (s *Selection) String() string</a>

```
searchKey: types.Selection.String
```

```Go
func (s *Selection) String() string
```

### <a id="Sizes" href="#Sizes">type Sizes interface</a>

```
searchKey: types.Sizes
```

```Go
type Sizes interface {
	// Alignof returns the alignment of a variable of type T.
	// Alignof must implement the alignment guarantees required by the spec.
	Alignof(T Type) int64

	// Offsetsof returns the offsets of the given struct fields, in bytes.
	// Offsetsof must implement the offset guarantees required by the spec.
	Offsetsof(fields []*Var) []int64

	// Sizeof returns the size of a variable of type T.
	// Sizeof must implement the size guarantees required by the spec.
	Sizeof(T Type) int64
}
```

Sizes defines the sizing functions for package unsafe. 

#### <a id="SizesFor" href="#SizesFor">func SizesFor(compiler, arch string) Sizes</a>

```
searchKey: types.SizesFor
```

```Go
func SizesFor(compiler, arch string) Sizes
```

SizesFor returns the Sizes used by a compiler for an architecture. The result is nil if a compiler/architecture pair is not known. 

Supported architectures for compiler "gc": "386", "arm", "arm64", "amd64", "amd64p32", "mips", "mipsle", "mips64", "mips64le", "ppc64", "ppc64le", "riscv64", "s390x", "sparc64", "wasm". 

### <a id="StdSizes" href="#StdSizes">type StdSizes struct</a>

```
searchKey: types.StdSizes
```

```Go
type StdSizes struct {
	WordSize int64 // word size in bytes - must be >= 4 (32bits)
	MaxAlign int64 // maximum alignment in bytes - must be >= 1
}
```

StdSizes is a convenience type for creating commonly used Sizes. It makes the following simplifying assumptions: 

```
	- The size of explicitly sized basic types (int16, etc.) is the
	  specified size.
	- The size of strings and interfaces is 2*WordSize.
	- The size of slices is 3*WordSize.
	- The size of an array of n elements corresponds to the size of
	  a struct of n consecutive fields of the array's element type.
     - The size of a struct is the offset of the last field plus that
	  field's size. As with all element types, if the struct is used
	  in an array its size must first be aligned to a multiple of the
	  struct's alignment.
	- All other types have size WordSize.
	- Arrays and structs are aligned per spec definition; all other
	  types are naturally aligned with a maximum alignment MaxAlign.

```
*StdSizes implements Sizes. 

#### <a id="StdSizes.Alignof" href="#StdSizes.Alignof">func (s *StdSizes) Alignof(T Type) int64</a>

```
searchKey: types.StdSizes.Alignof
```

```Go
func (s *StdSizes) Alignof(T Type) int64
```

#### <a id="StdSizes.Offsetsof" href="#StdSizes.Offsetsof">func (s *StdSizes) Offsetsof(fields []*Var) []int64</a>

```
searchKey: types.StdSizes.Offsetsof
```

```Go
func (s *StdSizes) Offsetsof(fields []*Var) []int64
```

#### <a id="StdSizes.Sizeof" href="#StdSizes.Sizeof">func (s *StdSizes) Sizeof(T Type) int64</a>

```
searchKey: types.StdSizes.Sizeof
```

```Go
func (s *StdSizes) Sizeof(T Type) int64
```

### <a id="stmtContext" href="#stmtContext">type stmtContext uint</a>

```
searchKey: types.stmtContext
tags: [private]
```

```Go
type stmtContext uint
```

stmtContext is a bitset describing which control-flow statements are permissible, and provides additional context information for better error messages. 

### <a id="valueMap" href="#valueMap">type valueMap map[interface{}][]types.valueType</a>

```
searchKey: types.valueMap
tags: [private]
```

```Go
type valueMap map[interface{}][]valueType // underlying Go value -> valueType

```

A valueMap maps a case value (of a basic Go type) to a list of positions where the same case value appeared, together with the corresponding case types. Since two case values may have the same "underlying" value but different types we need to also check the value's types (e.g., byte(1) vs myByte(1)) when the switch expression is of interface type. 

### <a id="valueType" href="#valueType">type valueType struct</a>

```
searchKey: types.valueType
tags: [private]
```

```Go
type valueType struct {
	pos token.Pos
	typ Type
}
```

A valueMap maps a case value (of a basic Go type) to a list of positions where the same case value appeared, together with the corresponding case types. Since two case values may have the same "underlying" value but different types we need to also check the value's types (e.g., byte(1) vs myByte(1)) when the switch expression is of interface type. 

### <a id="substMap" href="#substMap">type substMap struct</a>

```
searchKey: types.substMap
tags: [private]
```

```Go
type substMap struct {
	// The targs field is currently needed for *Named type substitution.
	// TODO(gri) rewrite that code, get rid of this field, and make this
	//           struct just the map (proj)
	targs []Type
	proj  map[*_TypeParam]Type
}
```

#### <a id="makeSubstMap" href="#makeSubstMap">func makeSubstMap(tpars []*TypeName, targs []Type) *substMap</a>

```
searchKey: types.makeSubstMap
tags: [private]
```

```Go
func makeSubstMap(tpars []*TypeName, targs []Type) *substMap
```

makeSubstMap creates a new substitution map mapping tpars[i] to targs[i]. If targs[i] is nil, tpars[i] is not substituted. 

#### <a id="substMap.String" href="#substMap.String">func (m *substMap) String() string</a>

```
searchKey: types.substMap.String
tags: [private]
```

```Go
func (m *substMap) String() string
```

#### <a id="substMap.empty" href="#substMap.empty">func (m *substMap) empty() bool</a>

```
searchKey: types.substMap.empty
tags: [private]
```

```Go
func (m *substMap) empty() bool
```

#### <a id="substMap.lookup" href="#substMap.lookup">func (m *substMap) lookup(tpar *_TypeParam) Type</a>

```
searchKey: types.substMap.lookup
tags: [private]
```

```Go
func (m *substMap) lookup(tpar *_TypeParam) Type
```

### <a id="subster" href="#subster">type subster struct</a>

```
searchKey: types.subster
tags: [private]
```

```Go
type subster struct {
	check *Checker
	pos   token.Pos
	cache map[Type]Type
	smap  *substMap
}
```

#### <a id="subster.typ" href="#subster.typ">func (subst *subster) typ(typ Type) Type</a>

```
searchKey: types.subster.typ
tags: [private]
```

```Go
func (subst *subster) typ(typ Type) Type
```

#### <a id="subster.typOrNil" href="#subster.typOrNil">func (subst *subster) typOrNil(typ Type) Type</a>

```
searchKey: types.subster.typOrNil
tags: [private]
```

```Go
func (subst *subster) typOrNil(typ Type) Type
```

typOrNil is like typ but if the argument is nil it is replaced with Typ[Invalid]. A nil type may appear in pathological cases such as type T[P any] []func(_ T([]_)) where an array/slice element is accessed before it is set up. 

#### <a id="subster.var_" href="#subster.var_">func (subst *subster) var_(v *Var) *Var</a>

```
searchKey: types.subster.var_
tags: [private]
```

```Go
func (subst *subster) var_(v *Var) *Var
```

#### <a id="subster.tuple" href="#subster.tuple">func (subst *subster) tuple(t *Tuple) *Tuple</a>

```
searchKey: types.subster.tuple
tags: [private]
```

```Go
func (subst *subster) tuple(t *Tuple) *Tuple
```

#### <a id="subster.varList" href="#subster.varList">func (subst *subster) varList(in []*Var) (out []*Var, copied bool)</a>

```
searchKey: types.subster.varList
tags: [private]
```

```Go
func (subst *subster) varList(in []*Var) (out []*Var, copied bool)
```

#### <a id="subster.func_" href="#subster.func_">func (subst *subster) func_(f *Func) *Func</a>

```
searchKey: types.subster.func_
tags: [private]
```

```Go
func (subst *subster) func_(f *Func) *Func
```

#### <a id="subster.funcList" href="#subster.funcList">func (subst *subster) funcList(in []*Func) (out []*Func, copied bool)</a>

```
searchKey: types.subster.funcList
tags: [private]
```

```Go
func (subst *subster) funcList(in []*Func) (out []*Func, copied bool)
```

#### <a id="subster.typeList" href="#subster.typeList">func (subst *subster) typeList(in []Type) (out []Type, copied bool)</a>

```
searchKey: types.subster.typeList
tags: [private]
```

```Go
func (subst *subster) typeList(in []Type) (out []Type, copied bool)
```

### <a id="Type" href="#Type">type Type interface</a>

```
searchKey: types.Type
```

```Go
type Type interface {
	// Underlying returns the underlying type of a type
	// w/o following forwarding chains. Only used by
	// client packages (here for backward-compatibility).
	Underlying() Type

	// String returns a string representation of a type.
	String() string
}
```

A Type represents a type of Go. All types implement the Type interface. 

#### <a id="implicitArrayDeref" href="#implicitArrayDeref">func implicitArrayDeref(typ Type) Type</a>

```
searchKey: types.implicitArrayDeref
tags: [private]
```

```Go
func implicitArrayDeref(typ Type) Type
```

implicitArrayDeref returns A if typ is of the form *A and A is an array; otherwise it returns typ. 

#### <a id="deref" href="#deref">func deref(typ Type) (Type, bool)</a>

```
searchKey: types.deref
tags: [private]
```

```Go
func deref(typ Type) (Type, bool)
```

deref dereferences typ if it is a *Pointer and returns its base and true. Otherwise it returns (typ, false). 

#### <a id="derefStructPtr" href="#derefStructPtr">func derefStructPtr(typ Type) Type</a>

```
searchKey: types.derefStructPtr
tags: [private]
```

```Go
func derefStructPtr(typ Type) Type
```

derefStructPtr dereferences typ if it is a (named or unnamed) pointer to a (named or unnamed) struct and returns its base. Otherwise it returns typ. 

#### <a id="Default" href="#Default">func Default(typ Type) Type</a>

```
searchKey: types.Default
```

```Go
func Default(typ Type) Type
```

Default returns the default "typed" type for an "untyped" type; it returns the incoming type for all other types. The default type for untyped nil is untyped nil. 

#### <a id="_NewSum" href="#_NewSum">func _NewSum(types []Type) Type</a>

```
searchKey: types._NewSum
tags: [private]
```

```Go
func _NewSum(types []Type) Type
```

_NewSum returns a new Sum type consisting of the provided types if there are more than one. If there is exactly one type, it returns that type. If the list of types is empty the result is nil. 

#### <a id="optype" href="#optype">func optype(typ Type) Type</a>

```
searchKey: types.optype
tags: [private]
```

```Go
func optype(typ Type) Type
```

optype returns a type's operational type. Except for type parameters, the operational type is the same as the underlying type (as returned by under). For Type parameters, the operational type is determined by the corresponding type bound's type list. The result may be the bottom or top type, but it is never the incoming type parameter. 

#### <a id="expand" href="#expand">func expand(typ Type) Type</a>

```
searchKey: types.expand
tags: [private]
```

```Go
func expand(typ Type) Type
```

expand expands a type instance into its instantiated type and leaves all other types alone. expand does not recurse. 

#### <a id="under" href="#under">func under(t Type) Type</a>

```
searchKey: types.under
tags: [private]
```

```Go
func under(t Type) Type
```

under returns the true expanded underlying type. If it doesn't exist, the result is Typ[Invalid]. under must only be called when a type is known to be fully set up. 

#### <a id="intersect" href="#intersect">func intersect(x, y Type) (r Type)</a>

```
searchKey: types.intersect
tags: [private]
```

```Go
func intersect(x, y Type) (r Type)
```

intersect computes the intersection of the types x and y. Note: A incomming nil type stands for the top type. A top type result is returned as nil. 

### <a id="BasicKind" href="#BasicKind">type BasicKind int</a>

```
searchKey: types.BasicKind
```

```Go
type BasicKind int
```

BasicKind describes the kind of basic type. 

### <a id="BasicInfo" href="#BasicInfo">type BasicInfo int</a>

```
searchKey: types.BasicInfo
```

```Go
type BasicInfo int
```

BasicInfo is a set of flags describing properties of a basic type. 

### <a id="Basic" href="#Basic">type Basic struct</a>

```
searchKey: types.Basic
```

```Go
type Basic struct {
	kind BasicKind
	info BasicInfo
	name string
}
```

A Basic represents a basic type. 

#### <a id="asBasic" href="#asBasic">func asBasic(t Type) *Basic</a>

```
searchKey: types.asBasic
tags: [private]
```

```Go
func asBasic(t Type) *Basic
```

#### <a id="Basic.Kind" href="#Basic.Kind">func (b *Basic) Kind() BasicKind</a>

```
searchKey: types.Basic.Kind
```

```Go
func (b *Basic) Kind() BasicKind
```

Kind returns the kind of basic type b. 

#### <a id="Basic.Info" href="#Basic.Info">func (b *Basic) Info() BasicInfo</a>

```
searchKey: types.Basic.Info
```

```Go
func (b *Basic) Info() BasicInfo
```

Info returns information about properties of basic type b. 

#### <a id="Basic.Name" href="#Basic.Name">func (b *Basic) Name() string</a>

```
searchKey: types.Basic.Name
```

```Go
func (b *Basic) Name() string
```

Name returns the name of basic type b. 

#### <a id="Basic.Underlying" href="#Basic.Underlying">func (t *Basic) Underlying() Type</a>

```
searchKey: types.Basic.Underlying
```

```Go
func (t *Basic) Underlying() Type
```

Type-specific implementations of Underlying. 

#### <a id="Basic.String" href="#Basic.String">func (t *Basic) String() string</a>

```
searchKey: types.Basic.String
```

```Go
func (t *Basic) String() string
```

Type-specific implementations of String. 

### <a id="Array" href="#Array">type Array struct</a>

```
searchKey: types.Array
```

```Go
type Array struct {
	len  int64
	elem Type
}
```

An Array represents an array type. 

#### <a id="NewArray" href="#NewArray">func NewArray(elem Type, len int64) *Array</a>

```
searchKey: types.NewArray
```

```Go
func NewArray(elem Type, len int64) *Array
```

NewArray returns a new array type for the given element type and length. A negative length indicates an unknown length. 

#### <a id="asArray" href="#asArray">func asArray(t Type) *Array</a>

```
searchKey: types.asArray
tags: [private]
```

```Go
func asArray(t Type) *Array
```

#### <a id="Array.Len" href="#Array.Len">func (a *Array) Len() int64</a>

```
searchKey: types.Array.Len
```

```Go
func (a *Array) Len() int64
```

Len returns the length of array a. A negative result indicates an unknown length. 

#### <a id="Array.Elem" href="#Array.Elem">func (a *Array) Elem() Type</a>

```
searchKey: types.Array.Elem
```

```Go
func (a *Array) Elem() Type
```

Elem returns element type of array a. 

#### <a id="Array.Underlying" href="#Array.Underlying">func (t *Array) Underlying() Type</a>

```
searchKey: types.Array.Underlying
```

```Go
func (t *Array) Underlying() Type
```

#### <a id="Array.String" href="#Array.String">func (t *Array) String() string</a>

```
searchKey: types.Array.String
```

```Go
func (t *Array) String() string
```

### <a id="Slice" href="#Slice">type Slice struct</a>

```
searchKey: types.Slice
```

```Go
type Slice struct {
	elem Type
}
```

A Slice represents a slice type. 

#### <a id="NewSlice" href="#NewSlice">func NewSlice(elem Type) *Slice</a>

```
searchKey: types.NewSlice
```

```Go
func NewSlice(elem Type) *Slice
```

NewSlice returns a new slice type for the given element type. 

#### <a id="asSlice" href="#asSlice">func asSlice(t Type) *Slice</a>

```
searchKey: types.asSlice
tags: [private]
```

```Go
func asSlice(t Type) *Slice
```

#### <a id="Slice.Elem" href="#Slice.Elem">func (s *Slice) Elem() Type</a>

```
searchKey: types.Slice.Elem
```

```Go
func (s *Slice) Elem() Type
```

Elem returns the element type of slice s. 

#### <a id="Slice.Underlying" href="#Slice.Underlying">func (t *Slice) Underlying() Type</a>

```
searchKey: types.Slice.Underlying
```

```Go
func (t *Slice) Underlying() Type
```

#### <a id="Slice.String" href="#Slice.String">func (t *Slice) String() string</a>

```
searchKey: types.Slice.String
```

```Go
func (t *Slice) String() string
```

### <a id="Struct" href="#Struct">type Struct struct</a>

```
searchKey: types.Struct
```

```Go
type Struct struct {
	fields []*Var
	tags   []string // field tags; nil if there are no tags
}
```

A Struct represents a struct type. 

#### <a id="NewStruct" href="#NewStruct">func NewStruct(fields []*Var, tags []string) *Struct</a>

```
searchKey: types.NewStruct
```

```Go
func NewStruct(fields []*Var, tags []string) *Struct
```

NewStruct returns a new struct with the given fields and corresponding field tags. If a field with index i has a tag, tags[i] must be that tag, but len(tags) may be only as long as required to hold the tag with the largest index i. Consequently, if no field has a tag, tags may be nil. 

#### <a id="asStruct" href="#asStruct">func asStruct(t Type) *Struct</a>

```
searchKey: types.asStruct
tags: [private]
```

```Go
func asStruct(t Type) *Struct
```

#### <a id="Struct.NumFields" href="#Struct.NumFields">func (s *Struct) NumFields() int</a>

```
searchKey: types.Struct.NumFields
```

```Go
func (s *Struct) NumFields() int
```

NumFields returns the number of fields in the struct (including blank and embedded fields). 

#### <a id="Struct.Field" href="#Struct.Field">func (s *Struct) Field(i int) *Var</a>

```
searchKey: types.Struct.Field
```

```Go
func (s *Struct) Field(i int) *Var
```

Field returns the i'th field for 0 <= i < NumFields(). 

#### <a id="Struct.Tag" href="#Struct.Tag">func (s *Struct) Tag(i int) string</a>

```
searchKey: types.Struct.Tag
```

```Go
func (s *Struct) Tag(i int) string
```

Tag returns the i'th field tag for 0 <= i < NumFields(). 

#### <a id="Struct.Underlying" href="#Struct.Underlying">func (t *Struct) Underlying() Type</a>

```
searchKey: types.Struct.Underlying
```

```Go
func (t *Struct) Underlying() Type
```

#### <a id="Struct.String" href="#Struct.String">func (t *Struct) String() string</a>

```
searchKey: types.Struct.String
```

```Go
func (t *Struct) String() string
```

### <a id="Pointer" href="#Pointer">type Pointer struct</a>

```
searchKey: types.Pointer
```

```Go
type Pointer struct {
	base Type // element type
}
```

A Pointer represents a pointer type. 

#### <a id="NewPointer" href="#NewPointer">func NewPointer(elem Type) *Pointer</a>

```
searchKey: types.NewPointer
```

```Go
func NewPointer(elem Type) *Pointer
```

NewPointer returns a new pointer type for the given element (base) type. 

#### <a id="asPointer" href="#asPointer">func asPointer(t Type) *Pointer</a>

```
searchKey: types.asPointer
tags: [private]
```

```Go
func asPointer(t Type) *Pointer
```

#### <a id="Pointer.Elem" href="#Pointer.Elem">func (p *Pointer) Elem() Type</a>

```
searchKey: types.Pointer.Elem
```

```Go
func (p *Pointer) Elem() Type
```

Elem returns the element type for the given pointer p. 

#### <a id="Pointer.Underlying" href="#Pointer.Underlying">func (t *Pointer) Underlying() Type</a>

```
searchKey: types.Pointer.Underlying
```

```Go
func (t *Pointer) Underlying() Type
```

#### <a id="Pointer.String" href="#Pointer.String">func (t *Pointer) String() string</a>

```
searchKey: types.Pointer.String
```

```Go
func (t *Pointer) String() string
```

### <a id="Tuple" href="#Tuple">type Tuple struct</a>

```
searchKey: types.Tuple
```

```Go
type Tuple struct {
	vars []*Var
}
```

A Tuple represents an ordered list of variables; a nil *Tuple is a valid (empty) tuple. Tuples are used as components of signatures and to represent the type of multiple assignments; they are not first class types of Go. 

#### <a id="NewTuple" href="#NewTuple">func NewTuple(x ...*Var) *Tuple</a>

```
searchKey: types.NewTuple
```

```Go
func NewTuple(x ...*Var) *Tuple
```

NewTuple returns a new tuple for the given variables. 

#### <a id="asTuple" href="#asTuple">func asTuple(t Type) *Tuple</a>

```
searchKey: types.asTuple
tags: [private]
```

```Go
func asTuple(t Type) *Tuple
```

#### <a id="Tuple.Len" href="#Tuple.Len">func (t *Tuple) Len() int</a>

```
searchKey: types.Tuple.Len
```

```Go
func (t *Tuple) Len() int
```

Len returns the number variables of tuple t. 

#### <a id="Tuple.At" href="#Tuple.At">func (t *Tuple) At(i int) *Var</a>

```
searchKey: types.Tuple.At
```

```Go
func (t *Tuple) At(i int) *Var
```

At returns the i'th variable of tuple t. 

#### <a id="Tuple.Underlying" href="#Tuple.Underlying">func (t *Tuple) Underlying() Type</a>

```
searchKey: types.Tuple.Underlying
```

```Go
func (t *Tuple) Underlying() Type
```

#### <a id="Tuple.String" href="#Tuple.String">func (t *Tuple) String() string</a>

```
searchKey: types.Tuple.String
```

```Go
func (t *Tuple) String() string
```

### <a id="Signature" href="#Signature">type Signature struct</a>

```
searchKey: types.Signature
```

```Go
type Signature struct {
	// We need to keep the scope in Signature (rather than passing it around
	// and store it in the Func Object) because when type-checking a function
	// literal we call the general type checker which returns a general Type.
	// We then unpack the *Signature and use the scope for the literal body.
	rparams  []*TypeName // receiver type parameters from left to right, or nil
	tparams  []*TypeName // type parameters from left to right, or nil
	scope    *Scope      // function scope, present for package-local signatures
	recv     *Var        // nil if not a method
	params   *Tuple      // (incoming) parameters from left to right; or nil
	results  *Tuple      // (outgoing) results from left to right; or nil
	variadic bool        // true if the last parameter's type is of the form ...T (or string, for append built-in only)
}
```

A Signature represents a (non-builtin) function or method type. The receiver is ignored when comparing signatures for identity. 

#### <a id="makeSig" href="#makeSig">func makeSig(res Type, args ...Type) *Signature</a>

```
searchKey: types.makeSig
tags: [private]
```

```Go
func makeSig(res Type, args ...Type) *Signature
```

makeSig makes a signature for the given argument and result types. Default types are used for untyped arguments, and res may be nil. 

#### <a id="NewSignature" href="#NewSignature">func NewSignature(recv *Var, params, results *Tuple, variadic bool) *Signature</a>

```
searchKey: types.NewSignature
```

```Go
func NewSignature(recv *Var, params, results *Tuple, variadic bool) *Signature
```

NewSignature returns a new function type for the given receiver, parameters, and results, either of which may be nil. If variadic is set, the function is variadic, it must have at least one parameter, and the last parameter must be of unnamed slice type. 

#### <a id="asSignature" href="#asSignature">func asSignature(t Type) *Signature</a>

```
searchKey: types.asSignature
tags: [private]
```

```Go
func asSignature(t Type) *Signature
```

#### <a id="Signature.Recv" href="#Signature.Recv">func (s *Signature) Recv() *Var</a>

```
searchKey: types.Signature.Recv
```

```Go
func (s *Signature) Recv() *Var
```

Recv returns the receiver of signature s (if a method), or nil if a function. It is ignored when comparing signatures for identity. 

For an abstract method, Recv returns the enclosing interface either as a *Named or an *Interface. Due to embedding, an interface may contain methods whose receiver type is a different interface. 

#### <a id="Signature._TParams" href="#Signature._TParams">func (s *Signature) _TParams() []*TypeName</a>

```
searchKey: types.Signature._TParams
tags: [private]
```

```Go
func (s *Signature) _TParams() []*TypeName
```

_TParams returns the type parameters of signature s, or nil. 

#### <a id="Signature._SetTParams" href="#Signature._SetTParams">func (s *Signature) _SetTParams(tparams []*TypeName)</a>

```
searchKey: types.Signature._SetTParams
tags: [private]
```

```Go
func (s *Signature) _SetTParams(tparams []*TypeName)
```

_SetTParams sets the type parameters of signature s. 

#### <a id="Signature.Params" href="#Signature.Params">func (s *Signature) Params() *Tuple</a>

```
searchKey: types.Signature.Params
```

```Go
func (s *Signature) Params() *Tuple
```

Params returns the parameters of signature s, or nil. 

#### <a id="Signature.Results" href="#Signature.Results">func (s *Signature) Results() *Tuple</a>

```
searchKey: types.Signature.Results
```

```Go
func (s *Signature) Results() *Tuple
```

Results returns the results of signature s, or nil. 

#### <a id="Signature.Variadic" href="#Signature.Variadic">func (s *Signature) Variadic() bool</a>

```
searchKey: types.Signature.Variadic
```

```Go
func (s *Signature) Variadic() bool
```

Variadic reports whether the signature s is variadic. 

#### <a id="Signature.Underlying" href="#Signature.Underlying">func (t *Signature) Underlying() Type</a>

```
searchKey: types.Signature.Underlying
```

```Go
func (t *Signature) Underlying() Type
```

#### <a id="Signature.String" href="#Signature.String">func (t *Signature) String() string</a>

```
searchKey: types.Signature.String
```

```Go
func (t *Signature) String() string
```

### <a id="_Sum" href="#_Sum">type _Sum struct</a>

```
searchKey: types._Sum
tags: [private]
```

```Go
type _Sum struct {
	types []Type // types are unique
}
```

A _Sum represents a set of possible types. Sums are currently used to represent type lists of interfaces and thus the underlying types of type parameters; they are not first class types of Go. 

#### <a id="asSum" href="#asSum">func asSum(t Type) *_Sum</a>

```
searchKey: types.asSum
tags: [private]
```

```Go
func asSum(t Type) *_Sum
```

#### <a id="_Sum.is" href="#_Sum.is">func (s *_Sum) is(pred func(Type) bool) bool</a>

```
searchKey: types._Sum.is
tags: [private]
```

```Go
func (s *_Sum) is(pred func(Type) bool) bool
```

is reports whether all types in t satisfy pred. 

#### <a id="_Sum.Underlying" href="#_Sum.Underlying">func (t *_Sum) Underlying() Type</a>

```
searchKey: types._Sum.Underlying
tags: [private]
```

```Go
func (t *_Sum) Underlying() Type
```

#### <a id="_Sum.String" href="#_Sum.String">func (t *_Sum) String() string</a>

```
searchKey: types._Sum.String
tags: [private]
```

```Go
func (t *_Sum) String() string
```

### <a id="Interface" href="#Interface">type Interface struct</a>

```
searchKey: types.Interface
```

```Go
type Interface struct {
	methods   []*Func // ordered list of explicitly declared methods
	types     Type    // (possibly a Sum) type declared with a type list (TODO(gri) need better field name)
	embeddeds []Type  // ordered list of explicitly embedded types

	allMethods []*Func // ordered list of methods declared with or embedded in this interface (TODO(gri): replace with mset)
	allTypes   Type    // intersection of all embedded and locally declared types  (TODO(gri) need better field name)

	obj Object // type declaration defining this interface; or nil (for better error messages)
}
```

An Interface represents an interface type. 

#### <a id="NewInterface" href="#NewInterface">func NewInterface(methods []*Func, embeddeds []*Named) *Interface</a>

```
searchKey: types.NewInterface
tags: [deprecated]
```

```Go
func NewInterface(methods []*Func, embeddeds []*Named) *Interface
```

NewInterface returns a new (incomplete) interface for the given methods and embedded types. Each embedded type must have an underlying type of interface type. NewInterface takes ownership of the provided methods and may modify their types by setting missing receivers. To compute the method set of the interface, Complete must be called. 

Deprecated: Use NewInterfaceType instead which allows any (even non-defined) interface types to be embedded. This is necessary for interfaces that embed alias type names referring to non-defined (literal) interface types. 

#### <a id="NewInterfaceType" href="#NewInterfaceType">func NewInterfaceType(methods []*Func, embeddeds []Type) *Interface</a>

```
searchKey: types.NewInterfaceType
```

```Go
func NewInterfaceType(methods []*Func, embeddeds []Type) *Interface
```

NewInterfaceType returns a new (incomplete) interface for the given methods and embedded types. Each embedded type must have an underlying type of interface type (this property is not verified for defined types, which may be in the process of being set up and which don't have a valid underlying type yet). NewInterfaceType takes ownership of the provided methods and may modify their types by setting missing receivers. To compute the method set of the interface, Complete must be called. 

#### <a id="asInterface" href="#asInterface">func asInterface(t Type) *Interface</a>

```
searchKey: types.asInterface
tags: [private]
```

```Go
func asInterface(t Type) *Interface
```

#### <a id="Interface.is" href="#Interface.is">func (t *Interface) is(pred func(Type) bool) bool</a>

```
searchKey: types.Interface.is
tags: [private]
```

```Go
func (t *Interface) is(pred func(Type) bool) bool
```

is reports whether interface t represents types that all satisfy pred. 

#### <a id="Interface.NumExplicitMethods" href="#Interface.NumExplicitMethods">func (t *Interface) NumExplicitMethods() int</a>

```
searchKey: types.Interface.NumExplicitMethods
```

```Go
func (t *Interface) NumExplicitMethods() int
```

NumExplicitMethods returns the number of explicitly declared methods of interface t. 

#### <a id="Interface.ExplicitMethod" href="#Interface.ExplicitMethod">func (t *Interface) ExplicitMethod(i int) *Func</a>

```
searchKey: types.Interface.ExplicitMethod
```

```Go
func (t *Interface) ExplicitMethod(i int) *Func
```

ExplicitMethod returns the i'th explicitly declared method of interface t for 0 <= i < t.NumExplicitMethods(). The methods are ordered by their unique Id. 

#### <a id="Interface.NumEmbeddeds" href="#Interface.NumEmbeddeds">func (t *Interface) NumEmbeddeds() int</a>

```
searchKey: types.Interface.NumEmbeddeds
```

```Go
func (t *Interface) NumEmbeddeds() int
```

NumEmbeddeds returns the number of embedded types in interface t. 

#### <a id="Interface.Embedded" href="#Interface.Embedded">func (t *Interface) Embedded(i int) *Named</a>

```
searchKey: types.Interface.Embedded
tags: [deprecated]
```

```Go
func (t *Interface) Embedded(i int) *Named
```

Embedded returns the i'th embedded defined (*Named) type of interface t for 0 <= i < t.NumEmbeddeds(). The result is nil if the i'th embedded type is not a defined type. 

Deprecated: Use EmbeddedType which is not restricted to defined (*Named) types. 

#### <a id="Interface.EmbeddedType" href="#Interface.EmbeddedType">func (t *Interface) EmbeddedType(i int) Type</a>

```
searchKey: types.Interface.EmbeddedType
```

```Go
func (t *Interface) EmbeddedType(i int) Type
```

EmbeddedType returns the i'th embedded type of interface t for 0 <= i < t.NumEmbeddeds(). 

#### <a id="Interface.NumMethods" href="#Interface.NumMethods">func (t *Interface) NumMethods() int</a>

```
searchKey: types.Interface.NumMethods
```

```Go
func (t *Interface) NumMethods() int
```

NumMethods returns the total number of methods of interface t. The interface must have been completed. 

#### <a id="Interface.assertCompleteness" href="#Interface.assertCompleteness">func (t *Interface) assertCompleteness()</a>

```
searchKey: types.Interface.assertCompleteness
tags: [private]
```

```Go
func (t *Interface) assertCompleteness()
```

#### <a id="Interface.Method" href="#Interface.Method">func (t *Interface) Method(i int) *Func</a>

```
searchKey: types.Interface.Method
```

```Go
func (t *Interface) Method(i int) *Func
```

Method returns the i'th method of interface t for 0 <= i < t.NumMethods(). The methods are ordered by their unique Id. The interface must have been completed. 

#### <a id="Interface.Empty" href="#Interface.Empty">func (t *Interface) Empty() bool</a>

```
searchKey: types.Interface.Empty
```

```Go
func (t *Interface) Empty() bool
```

Empty reports whether t is the empty interface. 

#### <a id="Interface._HasTypeList" href="#Interface._HasTypeList">func (t *Interface) _HasTypeList() bool</a>

```
searchKey: types.Interface._HasTypeList
tags: [private]
```

```Go
func (t *Interface) _HasTypeList() bool
```

_HasTypeList reports whether interface t has a type list, possibly from an embedded type. 

#### <a id="Interface._IsComparable" href="#Interface._IsComparable">func (t *Interface) _IsComparable() bool</a>

```
searchKey: types.Interface._IsComparable
tags: [private]
```

```Go
func (t *Interface) _IsComparable() bool
```

_IsComparable reports whether interface t is or embeds the predeclared interface "comparable". 

#### <a id="Interface._IsConstraint" href="#Interface._IsConstraint">func (t *Interface) _IsConstraint() bool</a>

```
searchKey: types.Interface._IsConstraint
tags: [private]
```

```Go
func (t *Interface) _IsConstraint() bool
```

_IsConstraint reports t.HasTypeList() || t.IsComparable(). 

#### <a id="Interface.iterate" href="#Interface.iterate">func (t *Interface) iterate(f func(*Interface) bool, seen map[*Interface]bool) bool</a>

```
searchKey: types.Interface.iterate
tags: [private]
```

```Go
func (t *Interface) iterate(f func(*Interface) bool, seen map[*Interface]bool) bool
```

iterate calls f with t and then with any embedded interface of t, recursively, until f returns true. iterate reports whether any call to f returned true. 

#### <a id="Interface.isSatisfiedBy" href="#Interface.isSatisfiedBy">func (t *Interface) isSatisfiedBy(typ Type) bool</a>

```
searchKey: types.Interface.isSatisfiedBy
tags: [private]
```

```Go
func (t *Interface) isSatisfiedBy(typ Type) bool
```

isSatisfiedBy reports whether interface t's type list is satisfied by the type typ. If the type list is empty (absent), typ trivially satisfies the interface. TODO(gri) This is not a great name. Eventually, we should have a more comprehensive 

```
"implements" predicate.

```
#### <a id="Interface.Complete" href="#Interface.Complete">func (t *Interface) Complete() *Interface</a>

```
searchKey: types.Interface.Complete
```

```Go
func (t *Interface) Complete() *Interface
```

Complete computes the interface's method set. It must be called by users of NewInterfaceType and NewInterface after the interface's embedded types are fully defined and before using the interface type in any way other than to form other types. The interface must not contain duplicate methods or a panic occurs. Complete returns the receiver. 

#### <a id="Interface.Underlying" href="#Interface.Underlying">func (t *Interface) Underlying() Type</a>

```
searchKey: types.Interface.Underlying
```

```Go
func (t *Interface) Underlying() Type
```

#### <a id="Interface.String" href="#Interface.String">func (t *Interface) String() string</a>

```
searchKey: types.Interface.String
```

```Go
func (t *Interface) String() string
```

### <a id="Map" href="#Map">type Map struct</a>

```
searchKey: types.Map
```

```Go
type Map struct {
	key, elem Type
}
```

A Map represents a map type. 

#### <a id="NewMap" href="#NewMap">func NewMap(key, elem Type) *Map</a>

```
searchKey: types.NewMap
```

```Go
func NewMap(key, elem Type) *Map
```

NewMap returns a new map for the given key and element types. 

#### <a id="asMap" href="#asMap">func asMap(t Type) *Map</a>

```
searchKey: types.asMap
tags: [private]
```

```Go
func asMap(t Type) *Map
```

#### <a id="Map.Key" href="#Map.Key">func (m *Map) Key() Type</a>

```
searchKey: types.Map.Key
```

```Go
func (m *Map) Key() Type
```

Key returns the key type of map m. 

#### <a id="Map.Elem" href="#Map.Elem">func (m *Map) Elem() Type</a>

```
searchKey: types.Map.Elem
```

```Go
func (m *Map) Elem() Type
```

Elem returns the element type of map m. 

#### <a id="Map.Underlying" href="#Map.Underlying">func (t *Map) Underlying() Type</a>

```
searchKey: types.Map.Underlying
```

```Go
func (t *Map) Underlying() Type
```

#### <a id="Map.String" href="#Map.String">func (t *Map) String() string</a>

```
searchKey: types.Map.String
```

```Go
func (t *Map) String() string
```

### <a id="Chan" href="#Chan">type Chan struct</a>

```
searchKey: types.Chan
```

```Go
type Chan struct {
	dir  ChanDir
	elem Type
}
```

A Chan represents a channel type. 

#### <a id="NewChan" href="#NewChan">func NewChan(dir ChanDir, elem Type) *Chan</a>

```
searchKey: types.NewChan
```

```Go
func NewChan(dir ChanDir, elem Type) *Chan
```

NewChan returns a new channel type for the given direction and element type. 

#### <a id="asChan" href="#asChan">func asChan(t Type) *Chan</a>

```
searchKey: types.asChan
tags: [private]
```

```Go
func asChan(t Type) *Chan
```

#### <a id="Chan.Dir" href="#Chan.Dir">func (c *Chan) Dir() ChanDir</a>

```
searchKey: types.Chan.Dir
```

```Go
func (c *Chan) Dir() ChanDir
```

Dir returns the direction of channel c. 

#### <a id="Chan.Elem" href="#Chan.Elem">func (c *Chan) Elem() Type</a>

```
searchKey: types.Chan.Elem
```

```Go
func (c *Chan) Elem() Type
```

Elem returns the element type of channel c. 

#### <a id="Chan.Underlying" href="#Chan.Underlying">func (t *Chan) Underlying() Type</a>

```
searchKey: types.Chan.Underlying
```

```Go
func (t *Chan) Underlying() Type
```

#### <a id="Chan.String" href="#Chan.String">func (t *Chan) String() string</a>

```
searchKey: types.Chan.String
```

```Go
func (t *Chan) String() string
```

### <a id="ChanDir" href="#ChanDir">type ChanDir int</a>

```
searchKey: types.ChanDir
```

```Go
type ChanDir int
```

A ChanDir value indicates a channel direction. 

### <a id="Named" href="#Named">type Named struct</a>

```
searchKey: types.Named
```

```Go
type Named struct {
	check      *Checker    // for Named.under implementation; nilled once under has been called
	info       typeInfo    // for cycle detection
	obj        *TypeName   // corresponding declared object
	orig       Type        // type (on RHS of declaration) this *Named type is derived of (for cycle reporting)
	underlying Type        // possibly a *Named during setup; never a *Named once set up completely
	tparams    []*TypeName // type parameters, or nil
	targs      []Type      // type arguments (after instantiation), or nil
	methods    []*Func     // methods declared for this type (not the method set of this type); signatures are type-checked lazily
}
```

A Named represents a named (defined) type. 

#### <a id="NewNamed" href="#NewNamed">func NewNamed(obj *TypeName, underlying Type, methods []*Func) *Named</a>

```
searchKey: types.NewNamed
```

```Go
func NewNamed(obj *TypeName, underlying Type, methods []*Func) *Named
```

NewNamed returns a new named type for the given type name, underlying type, and associated methods. If the given type name obj doesn't have a type yet, its type is set to the returned named type. The underlying type must not be a *Named. 

#### <a id="asNamed" href="#asNamed">func asNamed(t Type) *Named</a>

```
searchKey: types.asNamed
tags: [private]
```

```Go
func asNamed(t Type) *Named
```

#### <a id="Named.under" href="#Named.under">func (n0 *Named) under() Type</a>

```
searchKey: types.Named.under
tags: [private]
```

```Go
func (n0 *Named) under() Type
```

under returns the expanded underlying type of n0; possibly by following forward chains of named types. If an underlying type is found, resolve the chain by setting the underlying type for each defined type in the chain before returning it. If no underlying type is found or a cycle is detected, the result is Typ[Invalid]. If a cycle is detected and n0.check != nil, the cycle is reported. 

#### <a id="Named.setUnderlying" href="#Named.setUnderlying">func (n *Named) setUnderlying(typ Type)</a>

```
searchKey: types.Named.setUnderlying
tags: [private]
```

```Go
func (n *Named) setUnderlying(typ Type)
```

#### <a id="Named.Obj" href="#Named.Obj">func (t *Named) Obj() *TypeName</a>

```
searchKey: types.Named.Obj
```

```Go
func (t *Named) Obj() *TypeName
```

Obj returns the type name for the named type t. 

#### <a id="Named._TParams" href="#Named._TParams">func (t *Named) _TParams() []*TypeName</a>

```
searchKey: types.Named._TParams
tags: [private]
```

```Go
func (t *Named) _TParams() []*TypeName
```

_TParams returns the type parameters of the named type t, or nil. The result is non-nil for an (originally) parameterized type even if it is instantiated. 

#### <a id="Named._TArgs" href="#Named._TArgs">func (t *Named) _TArgs() []Type</a>

```
searchKey: types.Named._TArgs
tags: [private]
```

```Go
func (t *Named) _TArgs() []Type
```

_TArgs returns the type arguments after instantiation of the named type t, or nil if not instantiated. 

#### <a id="Named._SetTArgs" href="#Named._SetTArgs">func (t *Named) _SetTArgs(args []Type)</a>

```
searchKey: types.Named._SetTArgs
tags: [private]
```

```Go
func (t *Named) _SetTArgs(args []Type)
```

_SetTArgs sets the type arguments of Named. 

#### <a id="Named.NumMethods" href="#Named.NumMethods">func (t *Named) NumMethods() int</a>

```
searchKey: types.Named.NumMethods
```

```Go
func (t *Named) NumMethods() int
```

NumMethods returns the number of explicit methods whose receiver is named type t. 

#### <a id="Named.Method" href="#Named.Method">func (t *Named) Method(i int) *Func</a>

```
searchKey: types.Named.Method
```

```Go
func (t *Named) Method(i int) *Func
```

Method returns the i'th method of named type t for 0 <= i < t.NumMethods(). 

#### <a id="Named.SetUnderlying" href="#Named.SetUnderlying">func (t *Named) SetUnderlying(underlying Type)</a>

```
searchKey: types.Named.SetUnderlying
```

```Go
func (t *Named) SetUnderlying(underlying Type)
```

SetUnderlying sets the underlying type and marks t as complete. 

#### <a id="Named.AddMethod" href="#Named.AddMethod">func (t *Named) AddMethod(m *Func)</a>

```
searchKey: types.Named.AddMethod
```

```Go
func (t *Named) AddMethod(m *Func)
```

AddMethod adds method m unless it is already in the method list. 

#### <a id="Named.Underlying" href="#Named.Underlying">func (t *Named) Underlying() Type</a>

```
searchKey: types.Named.Underlying
```

```Go
func (t *Named) Underlying() Type
```

#### <a id="Named.String" href="#Named.String">func (t *Named) String() string</a>

```
searchKey: types.Named.String
```

```Go
func (t *Named) String() string
```

### <a id="_TypeParam" href="#_TypeParam">type _TypeParam struct</a>

```
searchKey: types._TypeParam
tags: [private]
```

```Go
type _TypeParam struct {
	check *Checker  // for lazy type bound completion
	id    uint64    // unique id
	obj   *TypeName // corresponding type name
	index int       // parameter index
	bound Type      // *Named or *Interface; underlying type is always *Interface
}
```

A _TypeParam represents a type parameter type. 

#### <a id="asTypeParam" href="#asTypeParam">func asTypeParam(t Type) *_TypeParam</a>

```
searchKey: types.asTypeParam
tags: [private]
```

```Go
func asTypeParam(t Type) *_TypeParam
```

#### <a id="_TypeParam.Bound" href="#_TypeParam.Bound">func (t *_TypeParam) Bound() *Interface</a>

```
searchKey: types._TypeParam.Bound
tags: [private]
```

```Go
func (t *_TypeParam) Bound() *Interface
```

#### <a id="_TypeParam.Underlying" href="#_TypeParam.Underlying">func (t *_TypeParam) Underlying() Type</a>

```
searchKey: types._TypeParam.Underlying
tags: [private]
```

```Go
func (t *_TypeParam) Underlying() Type
```

#### <a id="_TypeParam.String" href="#_TypeParam.String">func (t *_TypeParam) String() string</a>

```
searchKey: types._TypeParam.String
tags: [private]
```

```Go
func (t *_TypeParam) String() string
```

### <a id="instance" href="#instance">type instance struct</a>

```
searchKey: types.instance
tags: [private]
```

```Go
type instance struct {
	check   *Checker    // for lazy instantiation
	pos     token.Pos   // position of type instantiation; for error reporting only
	base    *Named      // parameterized type to be instantiated
	targs   []Type      // type arguments
	poslist []token.Pos // position of each targ; for error reporting only
	value   Type        // base(targs...) after instantiation or Typ[Invalid]; nil if not yet set
}
```

An instance represents an instantiated generic type syntactically (without expanding the instantiation). Type instances appear only during type-checking and are replaced by their fully instantiated (expanded) types before the end of type-checking. 

#### <a id="instance.expand" href="#instance.expand">func (t *instance) expand() Type</a>

```
searchKey: types.instance.expand
tags: [private]
```

```Go
func (t *instance) expand() Type
```

expand returns the instantiated (= expanded) type of t. The result is either an instantiated *Named type, or Typ[Invalid] if there was an error. 

#### <a id="instance.Underlying" href="#instance.Underlying">func (t *instance) Underlying() Type</a>

```
searchKey: types.instance.Underlying
tags: [private]
```

```Go
func (t *instance) Underlying() Type
```

#### <a id="instance.String" href="#instance.String">func (t *instance) String() string</a>

```
searchKey: types.instance.String
tags: [private]
```

```Go
func (t *instance) String() string
```

### <a id="bottom" href="#bottom">type bottom struct{}</a>

```
searchKey: types.bottom
tags: [private]
```

```Go
type bottom struct{}
```

bottom represents the bottom of the type lattice. It is the underlying type of a type parameter that cannot be satisfied by any type, usually because the intersection of type constraints left nothing). 

#### <a id="bottom.Underlying" href="#bottom.Underlying">func (t *bottom) Underlying() Type</a>

```
searchKey: types.bottom.Underlying
tags: [private]
```

```Go
func (t *bottom) Underlying() Type
```

#### <a id="bottom.String" href="#bottom.String">func (t *bottom) String() string</a>

```
searchKey: types.bottom.String
tags: [private]
```

```Go
func (t *bottom) String() string
```

### <a id="top" href="#top">type top struct{}</a>

```
searchKey: types.top
tags: [private]
```

```Go
type top struct{}
```

top represents the top of the type lattice. It is the underlying type of a type parameter that can be satisfied by any type (ignoring methods), usually because the type constraint has no type list. 

#### <a id="top.Underlying" href="#top.Underlying">func (t *top) Underlying() Type</a>

```
searchKey: types.top.Underlying
tags: [private]
```

```Go
func (t *top) Underlying() Type
```

#### <a id="top.String" href="#top.String">func (t *top) String() string</a>

```
searchKey: types.top.String
tags: [private]
```

```Go
func (t *top) String() string
```

### <a id="Qualifier" href="#Qualifier">type Qualifier func(*std/go/types.Package) string</a>

```
searchKey: types.Qualifier
```

```Go
type Qualifier func(*Package) string
```

A Qualifier controls how named package-level objects are printed in calls to TypeString, ObjectString, and SelectionString. 

These three formatting routines call the Qualifier for each package-level object O, and if the Qualifier returns a non-empty string p, the object is printed in the form p.O. If it returns an empty string, only the object name O is printed. 

Using a nil Qualifier is equivalent to using (*Package).Path: the object is qualified by the import path, e.g., "encoding/json.Marshal". 

#### <a id="RelativeTo" href="#RelativeTo">func RelativeTo(pkg *Package) Qualifier</a>

```
searchKey: types.RelativeTo
```

```Go
func RelativeTo(pkg *Package) Qualifier
```

RelativeTo returns a Qualifier that fully qualifies members of all packages other than pkg. 

### <a id="byUniqueTypeName" href="#byUniqueTypeName">type byUniqueTypeName []types.Type</a>

```
searchKey: types.byUniqueTypeName
tags: [private]
```

```Go
type byUniqueTypeName []Type
```

byUniqueTypeName named type lists can be sorted by their unique type names. 

#### <a id="byUniqueTypeName.Len" href="#byUniqueTypeName.Len">func (a byUniqueTypeName) Len() int</a>

```
searchKey: types.byUniqueTypeName.Len
tags: [private]
```

```Go
func (a byUniqueTypeName) Len() int
```

#### <a id="byUniqueTypeName.Less" href="#byUniqueTypeName.Less">func (a byUniqueTypeName) Less(i, j int) bool</a>

```
searchKey: types.byUniqueTypeName.Less
tags: [private]
```

```Go
func (a byUniqueTypeName) Less(i, j int) bool
```

#### <a id="byUniqueTypeName.Swap" href="#byUniqueTypeName.Swap">func (a byUniqueTypeName) Swap(i, j int)</a>

```
searchKey: types.byUniqueTypeName.Swap
tags: [private]
```

```Go
func (a byUniqueTypeName) Swap(i, j int)
```

### <a id="byUniqueMethodName" href="#byUniqueMethodName">type byUniqueMethodName []*types.Func</a>

```
searchKey: types.byUniqueMethodName
tags: [private]
```

```Go
type byUniqueMethodName []*Func
```

byUniqueMethodName method lists can be sorted by their unique method names. 

#### <a id="byUniqueMethodName.Len" href="#byUniqueMethodName.Len">func (a byUniqueMethodName) Len() int</a>

```
searchKey: types.byUniqueMethodName.Len
tags: [private]
```

```Go
func (a byUniqueMethodName) Len() int
```

#### <a id="byUniqueMethodName.Less" href="#byUniqueMethodName.Less">func (a byUniqueMethodName) Less(i, j int) bool</a>

```
searchKey: types.byUniqueMethodName.Less
tags: [private]
```

```Go
func (a byUniqueMethodName) Less(i, j int) bool
```

#### <a id="byUniqueMethodName.Swap" href="#byUniqueMethodName.Swap">func (a byUniqueMethodName) Swap(i, j int)</a>

```
searchKey: types.byUniqueMethodName.Swap
tags: [private]
```

```Go
func (a byUniqueMethodName) Swap(i, j int)
```

### <a id="unifier" href="#unifier">type unifier struct</a>

```
searchKey: types.unifier
tags: [private]
```

```Go
type unifier struct {
	check *Checker
	exact bool
	x, y  tparamsList // x and y must initialized via tparamsList.init
	types []Type      // inferred types, shared by x and y
}
```

A unifier maintains the current type parameters for x and y and the respective types inferred for each type parameter. A unifier is created by calling newUnifier. 

#### <a id="newUnifier" href="#newUnifier">func newUnifier(check *Checker, exact bool) *unifier</a>

```
searchKey: types.newUnifier
tags: [private]
```

```Go
func newUnifier(check *Checker, exact bool) *unifier
```

newUnifier returns a new unifier. If exact is set, unification requires unified types to match exactly. If exact is not set, a named type's underlying type is considered if unification would fail otherwise, and the direction of channels is ignored. 

#### <a id="unifier.unify" href="#unifier.unify">func (u *unifier) unify(x, y Type) bool</a>

```
searchKey: types.unifier.unify
tags: [private]
```

```Go
func (u *unifier) unify(x, y Type) bool
```

unify attempts to unify x and y and reports whether it succeeded. 

#### <a id="unifier.join" href="#unifier.join">func (u *unifier) join(i, j int) bool</a>

```
searchKey: types.unifier.join
tags: [private]
```

```Go
func (u *unifier) join(i, j int) bool
```

join unifies the i'th type parameter of x with the j'th type parameter of y. If both type parameters already have a type associated with them and they are not joined, join fails and return false. 

#### <a id="unifier.nifyEq" href="#unifier.nifyEq">func (u *unifier) nifyEq(x, y Type, p *ifacePair) bool</a>

```
searchKey: types.unifier.nifyEq
tags: [private]
```

```Go
func (u *unifier) nifyEq(x, y Type, p *ifacePair) bool
```

#### <a id="unifier.nify" href="#unifier.nify">func (u *unifier) nify(x, y Type, p *ifacePair) bool</a>

```
searchKey: types.unifier.nify
tags: [private]
```

```Go
func (u *unifier) nify(x, y Type, p *ifacePair) bool
```

nify implements the core unification algorithm which is an adapted version of Checker.identical0. For changes to that code the corresponding changes should be made here. Must not be called directly from outside the unifier. 

### <a id="tparamsList" href="#tparamsList">type tparamsList struct</a>

```
searchKey: types.tparamsList
tags: [private]
```

```Go
type tparamsList struct {
	unifier *unifier
	tparams []*TypeName
	// For each tparams element, there is a corresponding type slot index in indices.
	// index  < 0: unifier.types[-index-1] == nil
	// index == 0: no type slot allocated yet
	// index  > 0: unifier.types[index-1] == typ
	// Joined tparams elements share the same type slot and thus have the same index.
	// By using a negative index for nil types we don't need to check unifier.types
	// to see if we have a type or not.
	indices []int // len(d.indices) == len(d.tparams)
}
```

A tparamsList describes a list of type parameters and the types inferred for them. 

#### <a id="tparamsList.String" href="#tparamsList.String">func (d *tparamsList) String() string</a>

```
searchKey: types.tparamsList.String
tags: [private]
```

```Go
func (d *tparamsList) String() string
```

String returns a string representation for a tparamsList. For debugging. 

#### <a id="tparamsList.init.unify.go" href="#tparamsList.init.unify.go">func (d *tparamsList) init(tparams []*TypeName)</a>

```
searchKey: types.tparamsList.init
tags: [private]
```

```Go
func (d *tparamsList) init(tparams []*TypeName)
```

init initializes d with the given type parameters. The type parameters must be in the order in which they appear in their declaration (this ensures that the tparams indices match the respective type parameter index). 

#### <a id="tparamsList.index" href="#tparamsList.index">func (d *tparamsList) index(typ Type) int</a>

```
searchKey: types.tparamsList.index
tags: [private]
```

```Go
func (d *tparamsList) index(typ Type) int
```

If typ is a type parameter of d, index returns the type parameter index. Otherwise, the result is < 0. 

#### <a id="tparamsList.setIndex" href="#tparamsList.setIndex">func (d *tparamsList) setIndex(i, tj int)</a>

```
searchKey: types.tparamsList.setIndex
tags: [private]
```

```Go
func (d *tparamsList) setIndex(i, tj int)
```

setIndex sets the type slot index for the i'th type parameter (and all its joined parameters) to tj. The type parameter must have a (possibly nil) type slot associated with it. 

#### <a id="tparamsList.at" href="#tparamsList.at">func (d *tparamsList) at(i int) Type</a>

```
searchKey: types.tparamsList.at
tags: [private]
```

```Go
func (d *tparamsList) at(i int) Type
```

at returns the type set for the i'th type parameter; or nil. 

#### <a id="tparamsList.set" href="#tparamsList.set">func (d *tparamsList) set(i int, typ Type)</a>

```
searchKey: types.tparamsList.set
tags: [private]
```

```Go
func (d *tparamsList) set(i int, typ Type)
```

set sets the type typ for the i'th type parameter; typ must not be nil and it must not have been set before. 

#### <a id="tparamsList.types" href="#tparamsList.types">func (d *tparamsList) types() (list []Type, index int)</a>

```
searchKey: types.tparamsList.types
tags: [private]
```

```Go
func (d *tparamsList) types() (list []Type, index int)
```

types returns the list of inferred types (via unification) for the type parameters described by d, and an index. If all types were inferred, the returned index is < 0. Otherwise, it is the index of the first type parameter which couldn't be inferred; i.e., for which list[index] is nil. 

### <a id="builtinId" href="#builtinId">type builtinId int</a>

```
searchKey: types.builtinId
tags: [private]
```

```Go
type builtinId int
```

A builtinId is the id of a builtin function. 

### <a id="version" href="#version">type version struct</a>

```
searchKey: types.version
tags: [private]
```

```Go
type version struct {
	major, minor int
}
```

#### <a id="parseGoVersion" href="#parseGoVersion">func parseGoVersion(s string) (v version, err error)</a>

```
searchKey: types.parseGoVersion
tags: [private]
```

```Go
func parseGoVersion(s string) (v version, err error)
```

parseGoVersion parses a Go version string (such as "go1.12") and returns the version, or an error. If s is the empty string, the version is 0.0. 

## <a id="func" href="#func">Functions</a>

### <a id="srcimporter_setUsesCgo" href="#srcimporter_setUsesCgo">func srcimporter_setUsesCgo(conf *Config)</a>

```
searchKey: types.srcimporter_setUsesCgo
tags: [private]
```

```Go
func srcimporter_setUsesCgo(conf *Config)
```

### <a id="AssertableTo" href="#AssertableTo">func AssertableTo(V *Interface, T Type) bool</a>

```
searchKey: types.AssertableTo
```

```Go
func AssertableTo(V *Interface, T Type) bool
```

AssertableTo reports whether a value of type V can be asserted to have type T. 

### <a id="AssignableTo" href="#AssignableTo">func AssignableTo(V, T Type) bool</a>

```
searchKey: types.AssignableTo
```

```Go
func AssignableTo(V, T Type) bool
```

AssignableTo reports whether a value of type V is assignable to a variable of type T. 

### <a id="ConvertibleTo" href="#ConvertibleTo">func ConvertibleTo(V, T Type) bool</a>

```
searchKey: types.ConvertibleTo
```

```Go
func ConvertibleTo(V, T Type) bool
```

ConvertibleTo reports whether a value of type V is convertible to a value of type T. 

### <a id="Implements" href="#Implements">func Implements(V Type, T *Interface) bool</a>

```
searchKey: types.Implements
```

```Go
func Implements(V Type, T *Interface) bool
```

Implements reports whether type V implements interface T. 

### <a id="Identical" href="#Identical">func Identical(x, y Type) bool</a>

```
searchKey: types.Identical
```

```Go
func Identical(x, y Type) bool
```

Identical reports whether x and y are identical types. Receivers of Signature types are ignored. 

### <a id="IdenticalIgnoreTags" href="#IdenticalIgnoreTags">func IdenticalIgnoreTags(x, y Type) bool</a>

```
searchKey: types.IdenticalIgnoreTags
```

```Go
func IdenticalIgnoreTags(x, y Type) bool
```

IdenticalIgnoreTags reports whether x and y are identical types if tags are ignored. Receivers of Signature types are ignored. 

### <a id="getInferred" href="#getInferred">func getInferred(info *Info) map[ast.Expr]_Inferred</a>

```
searchKey: types.getInferred
tags: [private]
```

```Go
func getInferred(info *Info) map[ast.Expr]_Inferred
```

### <a id="unparen" href="#unparen">func unparen(e ast.Expr) ast.Expr</a>

```
searchKey: types.unparen
tags: [private]
```

```Go
func unparen(e ast.Expr) ast.Expr
```

unparen returns e with any enclosing parentheses stripped. 

### <a id="isUintptr" href="#isUintptr">func isUintptr(typ Type) bool</a>

```
searchKey: types.isUintptr
tags: [private]
```

```Go
func isUintptr(typ Type) bool
```

### <a id="isUnsafePointer" href="#isUnsafePointer">func isUnsafePointer(typ Type) bool</a>

```
searchKey: types.isUnsafePointer
tags: [private]
```

```Go
func isUnsafePointer(typ Type) bool
```

### <a id="isPointer" href="#isPointer">func isPointer(typ Type) bool</a>

```
searchKey: types.isPointer
tags: [private]
```

```Go
func isPointer(typ Type) bool
```

### <a id="isBytesOrRunes" href="#isBytesOrRunes">func isBytesOrRunes(typ Type) bool</a>

```
searchKey: types.isBytesOrRunes
tags: [private]
```

```Go
func isBytesOrRunes(typ Type) bool
```

### <a id="pathString" href="#pathString">func pathString(path []Object) string</a>

```
searchKey: types.pathString
tags: [private]
```

```Go
func pathString(path []Object) string
```

pathString returns a string of the form a->b-> ... ->g for a path [a, b, ... g]. 

### <a id="firstInSrc" href="#firstInSrc">func firstInSrc(path []Object) int</a>

```
searchKey: types.firstInSrc
tags: [private]
```

```Go
func firstInSrc(path []Object) int
```

firstInSrc reports the index of the object with the "smallest" source position in path. path must not be empty. 

### <a id="assert" href="#assert">func assert(p bool)</a>

```
searchKey: types.assert
tags: [private]
```

```Go
func assert(p bool)
```

### <a id="unreachable" href="#unreachable">func unreachable()</a>

```
searchKey: types.unreachable
tags: [private]
```

```Go
func unreachable()
```

### <a id="stripAnnotations" href="#stripAnnotations">func stripAnnotations(s string) string</a>

```
searchKey: types.stripAnnotations
tags: [private]
```

```Go
func stripAnnotations(s string) string
```

stripAnnotations removes internal (type) annotations from s. 

### <a id="CheckExpr" href="#CheckExpr">func CheckExpr(fset *token.FileSet, pkg *Package, pos token.Pos, expr ast.Expr, info *Info) (err error)</a>

```
searchKey: types.CheckExpr
```

```Go
func CheckExpr(fset *token.FileSet, pkg *Package, pos token.Pos, expr ast.Expr, info *Info) (err error)
```

CheckExpr type checks the expression expr as if it had appeared at position pos of package pkg. Type information about the expression is recorded in info. 

If pkg == nil, the Universe scope is used and the provided position pos is ignored. If pkg != nil, and pos is invalid, the package scope is used. Otherwise, pos must belong to the package. 

An error is returned if pos is not within the package or if the node cannot be type-checked. 

Note: Eval and CheckExpr should not be used instead of running Check to compute types and values, but in addition to Check, as these functions ignore the context in which an expression is used (e.g., an assignment). Thus, top-level untyped constants will return an untyped type rather then the respective context-specific type. 

### <a id="init.expr.go" href="#init.expr.go">func init()</a>

```
searchKey: types.init
tags: [private]
```

```Go
func init()
```

### <a id="opName" href="#opName">func opName(e ast.Expr) string</a>

```
searchKey: types.opName
tags: [private]
```

```Go
func opName(e ast.Expr) string
```

opName returns the name of an operation, or the empty string. For now, only operations that might overflow are handled. TODO(gri) Expand this to a general mechanism giving names to 

```
nodes?

```
### <a id="isShift" href="#isShift">func isShift(op token.Token) bool</a>

```
searchKey: types.isShift
tags: [private]
```

```Go
func isShift(op token.Token) bool
```

### <a id="isComparison" href="#isComparison">func isComparison(op token.Token) bool</a>

```
searchKey: types.isComparison
tags: [private]
```

```Go
func isComparison(op token.Token) bool
```

### <a id="fitsFloat32" href="#fitsFloat32">func fitsFloat32(x constant.Value) bool</a>

```
searchKey: types.fitsFloat32
tags: [private]
```

```Go
func fitsFloat32(x constant.Value) bool
```

### <a id="roundFloat32" href="#roundFloat32">func roundFloat32(x constant.Value) constant.Value</a>

```
searchKey: types.roundFloat32
tags: [private]
```

```Go
func roundFloat32(x constant.Value) constant.Value
```

### <a id="fitsFloat64" href="#fitsFloat64">func fitsFloat64(x constant.Value) bool</a>

```
searchKey: types.fitsFloat64
tags: [private]
```

```Go
func fitsFloat64(x constant.Value) bool
```

### <a id="roundFloat64" href="#roundFloat64">func roundFloat64(x constant.Value) constant.Value</a>

```
searchKey: types.roundFloat64
tags: [private]
```

```Go
func roundFloat64(x constant.Value) constant.Value
```

### <a id="representableConst" href="#representableConst">func representableConst(x constant.Value, check *Checker, typ *Basic, rounded *constant.Value) bool</a>

```
searchKey: types.representableConst
tags: [private]
```

```Go
func representableConst(x constant.Value, check *Checker, typ *Basic, rounded *constant.Value) bool
```

representableConst reports whether x can be represented as value of the given basic type and for the configuration provided (only needed for int/uint sizes). 

If rounded != nil, *rounded is set to the rounded value of x for representable floating-point and complex values, and to an Int value for integer values; it is left alone otherwise. It is ok to provide the addressof the first argument for rounded. 

The check parameter may be nil if representableConst is invoked (indirectly) through an exported API call (AssignableTo, ConvertibleTo) because we don't need the Checker's config for those calls. 

### <a id="init.expr.go.0xc05a5bcd60" href="#init.expr.go.0xc05a5bcd60">func init()</a>

```
searchKey: types.init
tags: [private]
```

```Go
func init()
```

### <a id="keyVal" href="#keyVal">func keyVal(x constant.Value) interface{}</a>

```
searchKey: types.keyVal
tags: [private]
```

```Go
func keyVal(x constant.Value) interface{}
```

### <a id="ExprString" href="#ExprString">func ExprString(x ast.Expr) string</a>

```
searchKey: types.ExprString
```

```Go
func ExprString(x ast.Expr) string
```

ExprString returns the (possibly shortened) string representation for x. Shortened representations are suitable for user interfaces but may not necessarily follow Go syntax. 

### <a id="WriteExpr" href="#WriteExpr">func WriteExpr(buf *bytes.Buffer, x ast.Expr)</a>

```
searchKey: types.WriteExpr
```

```Go
func WriteExpr(buf *bytes.Buffer, x ast.Expr)
```

WriteExpr writes the (possibly shortened) string representation for x to buf. Shortened representations are suitable for user interfaces but may not necessarily follow Go syntax. 

### <a id="writeSigExpr" href="#writeSigExpr">func writeSigExpr(buf *bytes.Buffer, sig *ast.FuncType)</a>

```
searchKey: types.writeSigExpr
tags: [private]
```

```Go
func writeSigExpr(buf *bytes.Buffer, sig *ast.FuncType)
```

### <a id="writeFieldList" href="#writeFieldList">func writeFieldList(buf *bytes.Buffer, list []*ast.Field, sep string, iface bool)</a>

```
searchKey: types.writeFieldList
tags: [private]
```

```Go
func writeFieldList(buf *bytes.Buffer, list []*ast.Field, sep string, iface bool)
```

### <a id="writeIdentList" href="#writeIdentList">func writeIdentList(buf *bytes.Buffer, list []*ast.Ident)</a>

```
searchKey: types.writeIdentList
tags: [private]
```

```Go
func writeIdentList(buf *bytes.Buffer, list []*ast.Ident)
```

### <a id="writeExprList" href="#writeExprList">func writeExprList(buf *bytes.Buffer, list []ast.Expr)</a>

```
searchKey: types.writeExprList
tags: [private]
```

```Go
func writeExprList(buf *bytes.Buffer, list []ast.Expr)
```

### <a id="typeNamesString" href="#typeNamesString">func typeNamesString(list []*TypeName) string</a>

```
searchKey: types.typeNamesString
tags: [private]
```

```Go
func typeNamesString(list []*TypeName) string
```

typeNamesString produces a string containing all the type names in list suitable for human consumption. 

### <a id="isParameterized" href="#isParameterized">func isParameterized(tparams []*TypeName, typ Type) bool</a>

```
searchKey: types.isParameterized
tags: [private]
```

```Go
func isParameterized(tparams []*TypeName, typ Type) bool
```

IsParameterized reports whether typ contains any of the type parameters of tparams. 

### <a id="findPath" href="#findPath">func findPath(objMap map[Object]*declInfo, from, to Object, seen map[Object]bool) []Object</a>

```
searchKey: types.findPath
tags: [private]
```

```Go
func findPath(objMap map[Object]*declInfo, from, to Object, seen map[Object]bool) []Object
```

findPath returns the (reversed) list of objects []Object{to, ... from} such that there is a path of object dependencies from 'from' to 'to'. If there is no such path, the result is nil. 

### <a id="dependencyGraph" href="#dependencyGraph">func dependencyGraph(objMap map[Object]*declInfo) []*graphNode</a>

```
searchKey: types.dependencyGraph
tags: [private]
```

```Go
func dependencyGraph(objMap map[Object]*declInfo) []*graphNode
```

dependencyGraph computes the object dependency graph from the given objMap, with any function nodes removed. The resulting graph contains only constants and variables. 

### <a id="concat" href="#concat">func concat(list []int, i int) []int</a>

```
searchKey: types.concat
tags: [private]
```

```Go
func concat(list []int, i int) []int
```

concat returns the result of concatenating list and i. The result does not share its underlying array with list. 

### <a id="fieldIndex" href="#fieldIndex">func fieldIndex(fields []*Var, pkg *Package, name string) int</a>

```
searchKey: types.fieldIndex
tags: [private]
```

```Go
func fieldIndex(fields []*Var, pkg *Package, name string) int
```

fieldIndex returns the index for the field with matching package and name, or a value < 0. 

### <a id="ptrRecv" href="#ptrRecv">func ptrRecv(f *Func) bool</a>

```
searchKey: types.ptrRecv
tags: [private]
```

```Go
func ptrRecv(f *Func) bool
```

ptrRecv reports whether the receiver is of the form *T. 

### <a id="Id" href="#Id">func Id(pkg *Package, name string) string</a>

```
searchKey: types.Id
```

```Go
func Id(pkg *Package, name string) string
```

Id returns name if it is exported, otherwise it returns the name qualified with the package path. 

### <a id="writeObject" href="#writeObject">func writeObject(buf *bytes.Buffer, obj Object, qf Qualifier)</a>

```
searchKey: types.writeObject
tags: [private]
```

```Go
func writeObject(buf *bytes.Buffer, obj Object, qf Qualifier)
```

### <a id="writePackage" href="#writePackage">func writePackage(buf *bytes.Buffer, pkg *Package, qf Qualifier)</a>

```
searchKey: types.writePackage
tags: [private]
```

```Go
func writePackage(buf *bytes.Buffer, pkg *Package, qf Qualifier)
```

### <a id="ObjectString" href="#ObjectString">func ObjectString(obj Object, qf Qualifier) string</a>

```
searchKey: types.ObjectString
```

```Go
func ObjectString(obj Object, qf Qualifier) string
```

ObjectString returns the string form of obj. The Qualifier controls the printing of package-level objects, and may be nil. 

### <a id="writeFuncName" href="#writeFuncName">func writeFuncName(buf *bytes.Buffer, f *Func, qf Qualifier)</a>

```
searchKey: types.writeFuncName
tags: [private]
```

```Go
func writeFuncName(buf *bytes.Buffer, f *Func, qf Qualifier)
```

### <a id="operandString" href="#operandString">func operandString(x *operand, qf Qualifier) string</a>

```
searchKey: types.operandString
tags: [private]
```

```Go
func operandString(x *operand, qf Qualifier) string
```

Operand string formats (not all "untyped" cases can appear due to the type system, but they fall out naturally here) 

mode       format 

invalid    <expr> (               <mode>                    ) novalue    <expr> (               <mode>                    ) builtin    <expr> (               <mode>                    ) typexpr    <expr> (               <mode>                    ) 

constant   <expr> (<untyped kind> <mode>                    ) constant   <expr> (               <mode>       of type <typ>) constant   <expr> (<untyped kind> <mode> <val>              ) constant   <expr> (               <mode> <val> of type <typ>) 

variable   <expr> (<untyped kind> <mode>                    ) variable   <expr> (               <mode>       of type <typ>) 

mapindex   <expr> (<untyped kind> <mode>                    ) mapindex   <expr> (               <mode>       of type <typ>) 

value      <expr> (<untyped kind> <mode>                    ) value      <expr> (               <mode>       of type <typ>) 

commaok    <expr> (<untyped kind> <mode>                    ) commaok    <expr> (               <mode>       of type <typ>) 

commaerr   <expr> (<untyped kind> <mode>                    ) commaerr   <expr> (               <mode>       of type <typ>) 

cgofunc    <expr> (<untyped kind> <mode>                    ) cgofunc    <expr> (               <mode>       of type <typ>) 

### <a id="isNamed" href="#isNamed">func isNamed(typ Type) bool</a>

```
searchKey: types.isNamed
tags: [private]
```

```Go
func isNamed(typ Type) bool
```

isNamed reports whether typ has a name. isNamed may be called with types that are not fully set up. 

### <a id="isGeneric" href="#isGeneric">func isGeneric(typ Type) bool</a>

```
searchKey: types.isGeneric
tags: [private]
```

```Go
func isGeneric(typ Type) bool
```

isGeneric reports whether a type is a generic, uninstantiated type (generic signatures are not included). 

### <a id="is" href="#is">func is(typ Type, what BasicInfo) bool</a>

```
searchKey: types.is
tags: [private]
```

```Go
func is(typ Type, what BasicInfo) bool
```

### <a id="isBoolean" href="#isBoolean">func isBoolean(typ Type) bool</a>

```
searchKey: types.isBoolean
tags: [private]
```

```Go
func isBoolean(typ Type) bool
```

### <a id="isInteger" href="#isInteger">func isInteger(typ Type) bool</a>

```
searchKey: types.isInteger
tags: [private]
```

```Go
func isInteger(typ Type) bool
```

### <a id="isUnsigned" href="#isUnsigned">func isUnsigned(typ Type) bool</a>

```
searchKey: types.isUnsigned
tags: [private]
```

```Go
func isUnsigned(typ Type) bool
```

### <a id="isFloat" href="#isFloat">func isFloat(typ Type) bool</a>

```
searchKey: types.isFloat
tags: [private]
```

```Go
func isFloat(typ Type) bool
```

### <a id="isComplex" href="#isComplex">func isComplex(typ Type) bool</a>

```
searchKey: types.isComplex
tags: [private]
```

```Go
func isComplex(typ Type) bool
```

### <a id="isNumeric" href="#isNumeric">func isNumeric(typ Type) bool</a>

```
searchKey: types.isNumeric
tags: [private]
```

```Go
func isNumeric(typ Type) bool
```

### <a id="isString" href="#isString">func isString(typ Type) bool</a>

```
searchKey: types.isString
tags: [private]
```

```Go
func isString(typ Type) bool
```

### <a id="isIntegerOrFloat" href="#isIntegerOrFloat">func isIntegerOrFloat(typ Type) bool</a>

```
searchKey: types.isIntegerOrFloat
tags: [private]
```

```Go
func isIntegerOrFloat(typ Type) bool
```

Note that if typ is a type parameter, isInteger(typ) || isFloat(typ) does not produce the expected result because a type list that contains both an integer and a floating-point type is neither (all) integers, nor (all) floats. Use isIntegerOrFloat instead. 

### <a id="isNumericOrString" href="#isNumericOrString">func isNumericOrString(typ Type) bool</a>

```
searchKey: types.isNumericOrString
tags: [private]
```

```Go
func isNumericOrString(typ Type) bool
```

isNumericOrString is the equivalent of isIntegerOrFloat for isNumeric(typ) || isString(typ). 

### <a id="isTyped" href="#isTyped">func isTyped(typ Type) bool</a>

```
searchKey: types.isTyped
tags: [private]
```

```Go
func isTyped(typ Type) bool
```

isTyped reports whether typ is typed; i.e., not an untyped constant or boolean. isTyped may be called with types that are not fully set up. 

### <a id="isUntyped" href="#isUntyped">func isUntyped(typ Type) bool</a>

```
searchKey: types.isUntyped
tags: [private]
```

```Go
func isUntyped(typ Type) bool
```

isUntyped(typ) is the same as !isTyped(typ). 

### <a id="isOrdered" href="#isOrdered">func isOrdered(typ Type) bool</a>

```
searchKey: types.isOrdered
tags: [private]
```

```Go
func isOrdered(typ Type) bool
```

### <a id="isConstType" href="#isConstType">func isConstType(typ Type) bool</a>

```
searchKey: types.isConstType
tags: [private]
```

```Go
func isConstType(typ Type) bool
```

### <a id="IsInterface" href="#IsInterface">func IsInterface(typ Type) bool</a>

```
searchKey: types.IsInterface
```

```Go
func IsInterface(typ Type) bool
```

IsInterface reports whether typ is an interface type. 

### <a id="Comparable" href="#Comparable">func Comparable(T Type) bool</a>

```
searchKey: types.Comparable
```

```Go
func Comparable(T Type) bool
```

Comparable reports whether values of type T are comparable. 

### <a id="comparable" href="#comparable">func comparable(T Type, seen map[Type]bool) bool</a>

```
searchKey: types.comparable
tags: [private]
```

```Go
func comparable(T Type, seen map[Type]bool) bool
```

### <a id="hasNil" href="#hasNil">func hasNil(typ Type) bool</a>

```
searchKey: types.hasNil
tags: [private]
```

```Go
func hasNil(typ Type) bool
```

hasNil reports whether a type includes the nil value. 

### <a id="validatedImportPath" href="#validatedImportPath">func validatedImportPath(path string) (string, error)</a>

```
searchKey: types.validatedImportPath
tags: [private]
```

```Go
func validatedImportPath(path string) (string, error)
```

### <a id="dir" href="#dir">func dir(path string) string</a>

```
searchKey: types.dir
tags: [private]
```

```Go
func dir(path string) string
```

dir makes a good-faith attempt to return the directory portion of path. If path is empty, the result is ".". (Per the go/build package dependency tests, we cannot import path/filepath and simply use filepath.Dir.) 

### <a id="hasBreak" href="#hasBreak">func hasBreak(s ast.Stmt, label string, implicit bool) bool</a>

```
searchKey: types.hasBreak
tags: [private]
```

```Go
func hasBreak(s ast.Stmt, label string, implicit bool) bool
```

hasBreak reports if s is or contains a break statement referring to the label-ed statement or implicit-ly the closest outer breakable statement. 

### <a id="hasBreakList" href="#hasBreakList">func hasBreakList(list []ast.Stmt, label string, implicit bool) bool</a>

```
searchKey: types.hasBreakList
tags: [private]
```

```Go
func hasBreakList(list []ast.Stmt, label string, implicit bool) bool
```

### <a id="sanitizeInfo" href="#sanitizeInfo">func sanitizeInfo(info *Info)</a>

```
searchKey: types.sanitizeInfo
tags: [private]
```

```Go
func sanitizeInfo(info *Info)
```

sanitizeInfo walks the types contained in info to ensure that all instances are expanded. 

This includes some objects that may be shared across concurrent type-checking passes (such as those in the universe scope), so we are careful here not to write types that are already sanitized. This avoids a data race as any shared types should already be sanitized. 

### <a id="SelectionString" href="#SelectionString">func SelectionString(s *Selection, qf Qualifier) string</a>

```
searchKey: types.SelectionString
```

```Go
func SelectionString(s *Selection, qf Qualifier) string
```

SelectionString returns the string form of s. The Qualifier controls the printing of package-level objects, and may be nil. 

Examples: 

```
"field (T) f int"
"method (T) f(X) Y"
"method expr (T) f(X) Y"

```
### <a id="align" href="#align">func align(x, a int64) int64</a>

```
searchKey: types.align
tags: [private]
```

```Go
func align(x, a int64) int64
```

align returns the smallest y >= x such that y % a == 0. 

### <a id="trimTrailingEmptyStmts" href="#trimTrailingEmptyStmts">func trimTrailingEmptyStmts(list []ast.Stmt) []ast.Stmt</a>

```
searchKey: types.trimTrailingEmptyStmts
tags: [private]
```

```Go
func trimTrailingEmptyStmts(list []ast.Stmt) []ast.Stmt
```

### <a id="assignOp" href="#assignOp">func assignOp(op token.Token) token.Token</a>

```
searchKey: types.assignOp
tags: [private]
```

```Go
func assignOp(op token.Token) token.Token
```

### <a id="goVal" href="#goVal">func goVal(val constant.Value) interface{}</a>

```
searchKey: types.goVal
tags: [private]
```

```Go
func goVal(val constant.Value) interface{}
```

goVal returns the Go value for val, or nil. 

### <a id="isVarName" href="#isVarName">func isVarName(x ast.Expr) bool</a>

```
searchKey: types.isVarName
tags: [private]
```

```Go
func isVarName(x ast.Expr) bool
```

isVarName reports whether x is a non-nil, non-blank (_) expression. 

### <a id="rangeKeyVal" href="#rangeKeyVal">func rangeKeyVal(typ Type, wantKey, wantVal bool) (Type, Type, string)</a>

```
searchKey: types.rangeKeyVal
tags: [private]
```

```Go
func rangeKeyVal(typ Type, wantKey, wantVal bool) (Type, Type, string)
```

rangeKeyVal returns the key and value type produced by a range clause over an expression of type typ, and possibly an error message. If the range clause is not permitted the returned key is nil or msg is not empty (in that case we still may have a non-nil key type which can be used to reduce the chance for follow-on errors). The wantKey, wantVal, and hasVal flags indicate which of the iteration variables are used or present; this matters if we range over a generic type where not all keys or values are of the same type. 

### <a id="instantiatedHash" href="#instantiatedHash">func instantiatedHash(typ *Named, targs []Type) string</a>

```
searchKey: types.instantiatedHash
tags: [private]
```

```Go
func instantiatedHash(typ *Named, targs []Type) string
```

TODO(gri) Eventually, this should be more sophisticated. 

```
It won't work correctly for locally declared types.

```
### <a id="typeListString" href="#typeListString">func typeListString(list []Type) string</a>

```
searchKey: types.typeListString
tags: [private]
```

```Go
func typeListString(list []Type) string
```

### <a id="unpackType" href="#unpackType">func unpackType(typ Type) []Type</a>

```
searchKey: types.unpackType
tags: [private]
```

```Go
func unpackType(typ Type) []Type
```

unpack unpacks a type into a list of types. TODO(gri) Try to eliminate the need for this function. 

### <a id="nextId" href="#nextId">func nextId() uint64</a>

```
searchKey: types.nextId
tags: [private]
```

```Go
func nextId() uint64
```

nextId returns a value increasing monotonically by 1 with each call, starting with 1. It may be called concurrently. 

### <a id="init.type.go" href="#init.type.go">func init()</a>

```
searchKey: types.init
tags: [private]
```

```Go
func init()
```

### <a id="TypeString" href="#TypeString">func TypeString(typ Type, qf Qualifier) string</a>

```
searchKey: types.TypeString
```

```Go
func TypeString(typ Type, qf Qualifier) string
```

TypeString returns the string representation of typ. The Qualifier controls the printing of package-level objects, and may be nil. 

### <a id="WriteType" href="#WriteType">func WriteType(buf *bytes.Buffer, typ Type, qf Qualifier)</a>

```
searchKey: types.WriteType
```

```Go
func WriteType(buf *bytes.Buffer, typ Type, qf Qualifier)
```

WriteType writes the string representation of typ to buf. The Qualifier controls the printing of package-level objects, and may be nil. 

### <a id="writeType" href="#writeType">func writeType(buf *bytes.Buffer, typ Type, qf Qualifier, visited []Type)</a>

```
searchKey: types.writeType
tags: [private]
```

```Go
func writeType(buf *bytes.Buffer, typ Type, qf Qualifier, visited []Type)
```

### <a id="writeTypeList" href="#writeTypeList">func writeTypeList(buf *bytes.Buffer, list []Type, qf Qualifier, visited []Type)</a>

```
searchKey: types.writeTypeList
tags: [private]
```

```Go
func writeTypeList(buf *bytes.Buffer, list []Type, qf Qualifier, visited []Type)
```

### <a id="writeTParamList" href="#writeTParamList">func writeTParamList(buf *bytes.Buffer, list []*TypeName, qf Qualifier, visited []Type)</a>

```
searchKey: types.writeTParamList
tags: [private]
```

```Go
func writeTParamList(buf *bytes.Buffer, list []*TypeName, qf Qualifier, visited []Type)
```

### <a id="writeTypeName" href="#writeTypeName">func writeTypeName(buf *bytes.Buffer, obj *TypeName, qf Qualifier)</a>

```
searchKey: types.writeTypeName
tags: [private]
```

```Go
func writeTypeName(buf *bytes.Buffer, obj *TypeName, qf Qualifier)
```

### <a id="writeTuple" href="#writeTuple">func writeTuple(buf *bytes.Buffer, tup *Tuple, variadic bool, qf Qualifier, visited []Type)</a>

```
searchKey: types.writeTuple
tags: [private]
```

```Go
func writeTuple(buf *bytes.Buffer, tup *Tuple, variadic bool, qf Qualifier, visited []Type)
```

### <a id="WriteSignature" href="#WriteSignature">func WriteSignature(buf *bytes.Buffer, sig *Signature, qf Qualifier)</a>

```
searchKey: types.WriteSignature
```

```Go
func WriteSignature(buf *bytes.Buffer, sig *Signature, qf Qualifier)
```

WriteSignature writes the representation of the signature sig to buf, without a leading "func" keyword. The Qualifier controls the printing of package-level objects, and may be nil. 

### <a id="writeSignature" href="#writeSignature">func writeSignature(buf *bytes.Buffer, sig *Signature, qf Qualifier, visited []Type)</a>

```
searchKey: types.writeSignature
tags: [private]
```

```Go
func writeSignature(buf *bytes.Buffer, sig *Signature, qf Qualifier, visited []Type)
```

### <a id="subscript" href="#subscript">func subscript(x uint64) string</a>

```
searchKey: types.subscript
tags: [private]
```

```Go
func subscript(x uint64) string
```

subscript returns the decimal (utf8) representation of x using subscript digits. 

### <a id="isubst" href="#isubst">func isubst(x ast.Expr, smap map[*ast.Ident]*ast.Ident) ast.Expr</a>

```
searchKey: types.isubst
tags: [private]
```

```Go
func isubst(x ast.Expr, smap map[*ast.Ident]*ast.Ident) ast.Expr
```

isubst returns an x with identifiers substituted per the substitution map smap. isubst only handles the case of (valid) method receiver type expressions correctly. 

### <a id="goTypeName" href="#goTypeName">func goTypeName(typ Type) string</a>

```
searchKey: types.goTypeName
tags: [private]
```

```Go
func goTypeName(typ Type) string
```

goTypeName returns the Go type name for typ and removes any occurrences of "types." from that name. 

### <a id="sortTypes" href="#sortTypes">func sortTypes(list []Type)</a>

```
searchKey: types.sortTypes
tags: [private]
```

```Go
func sortTypes(list []Type)
```

### <a id="sortName" href="#sortName">func sortName(t Type) string</a>

```
searchKey: types.sortName
tags: [private]
```

```Go
func sortName(t Type) string
```

### <a id="sortMethods" href="#sortMethods">func sortMethods(list []*Func)</a>

```
searchKey: types.sortMethods
tags: [private]
```

```Go
func sortMethods(list []*Func)
```

### <a id="assertSortedMethods" href="#assertSortedMethods">func assertSortedMethods(list []*Func)</a>

```
searchKey: types.assertSortedMethods
tags: [private]
```

```Go
func assertSortedMethods(list []*Func)
```

### <a id="embeddedFieldIdent" href="#embeddedFieldIdent">func embeddedFieldIdent(e ast.Expr) *ast.Ident</a>

```
searchKey: types.embeddedFieldIdent
tags: [private]
```

```Go
func embeddedFieldIdent(e ast.Expr) *ast.Ident
```

### <a id="includes" href="#includes">func includes(list []Type, typ Type) bool</a>

```
searchKey: types.includes
tags: [private]
```

```Go
func includes(list []Type, typ Type) bool
```

includes reports whether typ is in list. 

### <a id="defPredeclaredTypes" href="#defPredeclaredTypes">func defPredeclaredTypes()</a>

```
searchKey: types.defPredeclaredTypes
tags: [private]
```

```Go
func defPredeclaredTypes()
```

### <a id="defPredeclaredConsts" href="#defPredeclaredConsts">func defPredeclaredConsts()</a>

```
searchKey: types.defPredeclaredConsts
tags: [private]
```

```Go
func defPredeclaredConsts()
```

### <a id="defPredeclaredNil" href="#defPredeclaredNil">func defPredeclaredNil()</a>

```
searchKey: types.defPredeclaredNil
tags: [private]
```

```Go
func defPredeclaredNil()
```

### <a id="defPredeclaredFuncs" href="#defPredeclaredFuncs">func defPredeclaredFuncs()</a>

```
searchKey: types.defPredeclaredFuncs
tags: [private]
```

```Go
func defPredeclaredFuncs()
```

### <a id="DefPredeclaredTestFuncs" href="#DefPredeclaredTestFuncs">func DefPredeclaredTestFuncs()</a>

```
searchKey: types.DefPredeclaredTestFuncs
```

```Go
func DefPredeclaredTestFuncs()
```

DefPredeclaredTestFuncs defines the assert and trace built-ins. These built-ins are intended for debugging and testing of this package only. 

### <a id="defPredeclaredComparable" href="#defPredeclaredComparable">func defPredeclaredComparable()</a>

```
searchKey: types.defPredeclaredComparable
tags: [private]
```

```Go
func defPredeclaredComparable()
```

### <a id="init.universe.go" href="#init.universe.go">func init()</a>

```
searchKey: types.init
tags: [private]
```

```Go
func init()
```

### <a id="def" href="#def">func def(obj Object)</a>

```
searchKey: types.def
tags: [private]
```

```Go
func def(obj Object)
```

Objects with names containing blanks are internal and not entered into a scope. Objects with exported names are inserted in the unsafe package scope; other objects are inserted in the universe scope. 

### <a id="TestStripAnnotations" href="#TestStripAnnotations">func TestStripAnnotations(t *testing.T)</a>

```
searchKey: types.TestStripAnnotations
tags: [private]
```

```Go
func TestStripAnnotations(t *testing.T)
```

### <a id="TestIsAlias" href="#TestIsAlias">func TestIsAlias(t *testing.T)</a>

```
searchKey: types.TestIsAlias
tags: [private]
```

```Go
func TestIsAlias(t *testing.T)
```

### <a id="TestEmbeddedMethod" href="#TestEmbeddedMethod">func TestEmbeddedMethod(t *testing.T)</a>

```
searchKey: types.TestEmbeddedMethod
tags: [private]
```

```Go
func TestEmbeddedMethod(t *testing.T)
```

TestEmbeddedMethod checks that an embedded method is represented by the same Func Object as the original method. See also issue #34421. 

### <a id="TestSizeof" href="#TestSizeof">func TestSizeof(t *testing.T)</a>

```
searchKey: types.TestSizeof
tags: [private]
```

```Go
func TestSizeof(t *testing.T)
```

Signal size changes of important structures. 

### <a id="TestZeroTok" href="#TestZeroTok">func TestZeroTok(t *testing.T)</a>

```
searchKey: types.TestZeroTok
tags: [private]
```

```Go
func TestZeroTok(t *testing.T)
```

### <a id="TestAssignOp" href="#TestAssignOp">func TestAssignOp(t *testing.T)</a>

```
searchKey: types.TestAssignOp
tags: [private]
```

```Go
func TestAssignOp(t *testing.T)
```

### <a id="ResetId" href="#ResetId">func ResetId()</a>

```
searchKey: types.ResetId
tags: [private]
```

```Go
func ResetId()
```

Upon calling ResetId, nextId starts with 1 again. It may be called concurrently. This is only needed for tests where we may want to have a consistent numbering for each individual test case. 

### <a id="SetGoVersion" href="#SetGoVersion">func SetGoVersion(config *Config, goVersion string)</a>

```
searchKey: types.SetGoVersion
tags: [private]
```

```Go
func SetGoVersion(config *Config, goVersion string)
```

SetGoVersion sets the unexported goVersion field on config, so that tests which assert on behavior for older Go versions can set it. 

