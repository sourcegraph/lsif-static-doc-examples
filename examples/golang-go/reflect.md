# Package reflect

Package reflect implements run-time reflection, allowing a program to manipulate objects with arbitrary types. The typical use is to take a value with static type interface{} and extract its dynamic type information by calling TypeOf, which returns a Type. 

A call to ValueOf returns a Value representing the run-time data. Zero takes a Type and returns a Value representing a zero value for that type. 

See "The Laws of Reflection" for an introduction to reflection in Go: [https://golang.org/doc/articles/laws_of_reflection.html](https://golang.org/doc/articles/laws_of_reflection.html) 

## Index

* Subpages
  * [reflect/internal](reflect/internal.md)
* [Constants](#const)
    * [const Array](#Array)
    * [const Bool](#Bool)
    * [const BothDir](#BothDir)
    * [const Chan](#Chan)
    * [const Complex128](#Complex128)
    * [const Complex64](#Complex64)
    * [const Float32](#Float32)
    * [const Float64](#Float64)
    * [const Func](#Func)
    * [const Int](#Int)
    * [const Int16](#Int16)
    * [const Int32](#Int32)
    * [const Int64](#Int64)
    * [const Int8](#Int8)
    * [const Interface](#Interface)
    * [const Invalid](#Invalid)
    * [const Map](#Map)
    * [const Ptr](#Ptr)
    * [const PtrSize](#PtrSize)
    * [const RecvDir](#RecvDir)
    * [const SelectDefault](#SelectDefault)
    * [const SelectRecv](#SelectRecv)
    * [const SelectSend](#SelectSend)
    * [const SendDir](#SendDir)
    * [const Slice](#Slice)
    * [const String](#String)
    * [const Struct](#Struct)
    * [const Uint](#Uint)
    * [const Uint16](#Uint16)
    * [const Uint32](#Uint32)
    * [const Uint64](#Uint64)
    * [const Uint8](#Uint8)
    * [const Uintptr](#Uintptr)
    * [const UnsafePointer](#UnsafePointer)
    * [const abiStepBad](#abiStepBad)
    * [const abiStepFloatReg](#abiStepFloatReg)
    * [const abiStepIntReg](#abiStepIntReg)
    * [const abiStepPointer](#abiStepPointer)
    * [const abiStepStack](#abiStepStack)
    * [const bucketSize](#bucketSize)
    * [const debugReflectCall](#debugReflectCall)
    * [const flagAddr](#flagAddr)
    * [const flagEmbedRO](#flagEmbedRO)
    * [const flagIndir](#flagIndir)
    * [const flagKindMask](#flagKindMask)
    * [const flagKindWidth](#flagKindWidth)
    * [const flagMethod](#flagMethod)
    * [const flagMethodShift](#flagMethodShift)
    * [const flagRO](#flagRO)
    * [const flagStickyRO](#flagStickyRO)
    * [const kindDirectIface](#kindDirectIface)
    * [const kindGCProg](#kindGCProg)
    * [const kindMask](#kindMask)
    * [const maxKeySize](#maxKeySize)
    * [const maxPtrmaskBytes](#maxPtrmaskBytes)
    * [const maxValSize](#maxValSize)
    * [const maxZero](#maxZero)
    * [const ptrSize](#ptrSize)
    * [const tflagExtraStar](#tflagExtraStar)
    * [const tflagNamed](#tflagNamed)
    * [const tflagRegularMemory](#tflagRegularMemory)
    * [const tflagUncommon](#tflagUncommon)
* [Variables](#var)
    * [var CallGC](#CallGC)
    * [var GCBits](#GCBits)
    * [var callGC](#callGC)
    * [var dummy](#dummy)
    * [var floatArgRegs](#floatArgRegs)
    * [var floatRegSize](#floatRegSize)
    * [var funcLookupCache](#funcLookupCache)
    * [var intArgRegs](#intArgRegs)
    * [var kindNames](#kindNames)
    * [var layoutCache](#layoutCache)
    * [var lookupCache](#lookupCache)
    * [var pinUnexpMethI](#pinUnexpMethI)
    * [var ptrMap](#ptrMap)
    * [var structLookupCache](#structLookupCache)
    * [var uint8Type](#uint8Type)
    * [var zeroVal](#zeroVal)
* [Types](#type)
    * [type Buffer struct](#Buffer)
    * [type ChanDir int](#ChanDir)
        * [func (d ChanDir) String() string](#ChanDir.String)
    * [type EmbedWithUnexpMeth struct{}](#EmbedWithUnexpMeth)
        * [func (EmbedWithUnexpMeth) f()](#EmbedWithUnexpMeth.f)
    * [type Kind uint](#Kind)
        * [func (k Kind) String() string](#Kind.String)
    * [type MapIter struct](#MapIter)
        * [func (it *MapIter) Key() Value](#MapIter.Key)
        * [func (it *MapIter) Next() bool](#MapIter.Next)
        * [func (it *MapIter) Value() Value](#MapIter.Value)
    * [type Method struct](#Method)
        * [func (m Method) IsExported() bool](#Method.IsExported)
    * [type OtherPkgFields struct](#OtherPkgFields)
    * [type SelectCase struct](#SelectCase)
    * [type SelectDir int](#SelectDir)
    * [type SliceHeader struct](#SliceHeader)
    * [type StringHeader struct](#StringHeader)
    * [type StructField struct](#StructField)
        * [func (f StructField) IsExported() bool](#StructField.IsExported)
    * [type StructTag string](#StructTag)
        * [func (tag StructTag) Get(key string) string](#StructTag.Get)
        * [func (tag StructTag) Lookup(key string) (value string, ok bool)](#StructTag.Lookup)
    * [type Type interface](#Type)
        * [func ArrayOf(length int, elem Type) Type](#ArrayOf)
        * [func CachedBucketOf(m Type) Type](#CachedBucketOf)
        * [func ChanOf(dir ChanDir, t Type) Type](#ChanOf)
        * [func FuncLayout(t Type, rcvr Type) (frametype Type, argSize, retOffset uintptr, stack, gc, inReg, outReg []byte, ptrs bool)](#FuncLayout)
        * [func FuncOf(in, out []Type, variadic bool) Type](#FuncOf)
        * [func MapBucketOf(x, y Type) Type](#MapBucketOf)
        * [func MapOf(key, elem Type) Type](#MapOf)
        * [func PtrTo(t Type) Type](#PtrTo)
        * [func SliceOf(t Type) Type](#SliceOf)
        * [func StructOf(fields []StructField) Type](#StructOf)
        * [func TypeOf(i interface{}) Type](#TypeOf)
        * [func toType(t *rtype) Type](#toType)
    * [type Value struct](#Value)
        * [func Append(s Value, x ...Value) Value](#Append)
        * [func AppendSlice(s, t Value) Value](#AppendSlice)
        * [func Indirect(v Value) Value](#Indirect)
        * [func MakeChan(typ Type, buffer int) Value](#MakeChan)
        * [func MakeFunc(typ Type, fn func(args []Value) (results []Value)) Value](#MakeFunc)
        * [func MakeMap(typ Type) Value](#MakeMap)
        * [func MakeMapWithSize(typ Type, n int) Value](#MakeMapWithSize)
        * [func MakeRO(v Value) Value](#MakeRO)
        * [func MakeSlice(typ Type, len, cap int) Value](#MakeSlice)
        * [func New(typ Type) Value](#New)
        * [func NewAt(typ Type, p unsafe.Pointer) Value](#NewAt)
        * [func Select(cases []SelectCase) (chosen int, recv Value, recvOK bool)](#Select)
        * [func ValueOf(i interface{}) Value](#ValueOf)
        * [func Zero(typ Type) Value](#Zero)
        * [func copyVal(typ *rtype, fl flag, ptr unsafe.Pointer) Value](#copyVal)
        * [func cvtBytesString(v Value, t Type) Value](#cvtBytesString)
        * [func cvtComplex(v Value, t Type) Value](#cvtComplex)
        * [func cvtDirect(v Value, typ Type) Value](#cvtDirect)
        * [func cvtFloat(v Value, t Type) Value](#cvtFloat)
        * [func cvtFloatInt(v Value, t Type) Value](#cvtFloatInt)
        * [func cvtFloatUint(v Value, t Type) Value](#cvtFloatUint)
        * [func cvtI2I(v Value, typ Type) Value](#cvtI2I)
        * [func cvtInt(v Value, t Type) Value](#cvtInt)
        * [func cvtIntFloat(v Value, t Type) Value](#cvtIntFloat)
        * [func cvtIntString(v Value, t Type) Value](#cvtIntString)
        * [func cvtRunesString(v Value, t Type) Value](#cvtRunesString)
        * [func cvtSliceArrayPtr(v Value, t Type) Value](#cvtSliceArrayPtr)
        * [func cvtStringBytes(v Value, t Type) Value](#cvtStringBytes)
        * [func cvtStringRunes(v Value, t Type) Value](#cvtStringRunes)
        * [func cvtT2I(v Value, typ Type) Value](#cvtT2I)
        * [func cvtUint(v Value, t Type) Value](#cvtUint)
        * [func cvtUintFloat(v Value, t Type) Value](#cvtUintFloat)
        * [func cvtUintString(v Value, t Type) Value](#cvtUintString)
        * [func grow(s Value, extra int) (Value, int, int)](#grow)
        * [func makeBytes(f flag, v []byte, t Type) Value](#makeBytes)
        * [func makeComplex(f flag, v complex128, t Type) Value](#makeComplex)
        * [func makeFloat(f flag, v float64, t Type) Value](#makeFloat)
        * [func makeFloat32(f flag, v float32, t Type) Value](#makeFloat32)
        * [func makeInt(f flag, bits uint64, t Type) Value](#makeInt)
        * [func makeMethodValue(op string, v Value) Value](#makeMethodValue)
        * [func makeRunes(f flag, v []rune, t Type) Value](#makeRunes)
        * [func makeString(f flag, v string, t Type) Value](#makeString)
        * [func unpackEface(i interface{}) Value](#unpackEface)
        * [func (v Value) Addr() Value](#Value.Addr)
        * [func (v Value) Bool() bool](#Value.Bool)
        * [func (v Value) Bytes() []byte](#Value.Bytes)
        * [func (v Value) Call(in []Value) []Value](#Value.Call)
        * [func (v Value) CallSlice(in []Value) []Value](#Value.CallSlice)
        * [func (v Value) CanAddr() bool](#Value.CanAddr)
        * [func (v Value) CanInterface() bool](#Value.CanInterface)
        * [func (v Value) CanSet() bool](#Value.CanSet)
        * [func (v Value) Cap() int](#Value.Cap)
        * [func (v Value) Close()](#Value.Close)
        * [func (v Value) Complex() complex128](#Value.Complex)
        * [func (v Value) Convert(t Type) Value](#Value.Convert)
        * [func (v Value) Elem() Value](#Value.Elem)
        * [func (v Value) Field(i int) Value](#Value.Field)
        * [func (v Value) FieldByIndex(index []int) Value](#Value.FieldByIndex)
        * [func (v Value) FieldByName(name string) Value](#Value.FieldByName)
        * [func (v Value) FieldByNameFunc(match func(string) bool) Value](#Value.FieldByNameFunc)
        * [func (v Value) Float() float64](#Value.Float)
        * [func (v Value) Index(i int) Value](#Value.Index)
        * [func (v Value) Int() int64](#Value.Int)
        * [func (v Value) Interface() (i interface{})](#Value.Interface)
        * [func (v Value) InterfaceData() [2]uintptr](#Value.InterfaceData)
        * [func (v Value) IsNil() bool](#Value.IsNil)
        * [func (v Value) IsValid() bool](#Value.IsValid)
        * [func (v Value) IsZero() bool](#Value.IsZero)
        * [func (v Value) Kind() Kind](#Value.Kind)
        * [func (v Value) Len() int](#Value.Len)
        * [func (v Value) MapIndex(key Value) Value](#Value.MapIndex)
        * [func (v Value) MapKeys() []Value](#Value.MapKeys)
        * [func (v Value) MapRange() *MapIter](#Value.MapRange)
        * [func (v Value) Method(i int) Value](#Value.Method)
        * [func (v Value) MethodByName(name string) Value](#Value.MethodByName)
        * [func (v Value) NumField() int](#Value.NumField)
        * [func (v Value) NumMethod() int](#Value.NumMethod)
        * [func (v Value) OverflowComplex(x complex128) bool](#Value.OverflowComplex)
        * [func (v Value) OverflowFloat(x float64) bool](#Value.OverflowFloat)
        * [func (v Value) OverflowInt(x int64) bool](#Value.OverflowInt)
        * [func (v Value) OverflowUint(x uint64) bool](#Value.OverflowUint)
        * [func (v Value) Pointer() uintptr](#Value.Pointer)
        * [func (v Value) Recv() (x Value, ok bool)](#Value.Recv)
        * [func (v Value) Send(x Value)](#Value.Send)
        * [func (v Value) Set(x Value)](#Value.Set)
        * [func (v Value) SetBool(x bool)](#Value.SetBool)
        * [func (v Value) SetBytes(x []byte)](#Value.SetBytes)
        * [func (v Value) SetCap(n int)](#Value.SetCap)
        * [func (v Value) SetComplex(x complex128)](#Value.SetComplex)
        * [func (v Value) SetFloat(x float64)](#Value.SetFloat)
        * [func (v Value) SetInt(x int64)](#Value.SetInt)
        * [func (v Value) SetLen(n int)](#Value.SetLen)
        * [func (v Value) SetMapIndex(key, elem Value)](#Value.SetMapIndex)
        * [func (v Value) SetPointer(x unsafe.Pointer)](#Value.SetPointer)
        * [func (v Value) SetString(x string)](#Value.SetString)
        * [func (v Value) SetUint(x uint64)](#Value.SetUint)
        * [func (v Value) Slice(i, j int) Value](#Value.Slice)
        * [func (v Value) Slice3(i, j, k int) Value](#Value.Slice3)
        * [func (v Value) String() string](#Value.String)
        * [func (v Value) TryRecv() (x Value, ok bool)](#Value.TryRecv)
        * [func (v Value) TrySend(x Value) bool](#Value.TrySend)
        * [func (v Value) Type() Type](#Value.Type)
        * [func (v Value) Uint() uint64](#Value.Uint)
        * [func (v Value) UnsafeAddr() uintptr](#Value.UnsafeAddr)
        * [func (v Value) assignTo(context string, dst *rtype, target unsafe.Pointer) Value](#Value.assignTo)
        * [func (v Value) call(op string, in []Value) []Value](#Value.call)
        * [func (v Value) pointer() unsafe.Pointer](#Value.pointer)
        * [func (v Value) recv(nb bool) (val Value, ok bool)](#Value.recv)
        * [func (v Value) runes() []rune](#Value.runes)
        * [func (v Value) send(x Value, nb bool) (selected bool)](#Value.send)
        * [func (v Value) setRunes(x []rune)](#Value.setRunes)
    * [type ValueError struct](#ValueError)
        * [func (e *ValueError) Error() string](#ValueError.Error)
    * [type abiDesc struct](#abiDesc)
        * [func funcLayout(t *funcType, rcvr *rtype) (frametype *rtype, framePool *sync.Pool, abi abiDesc)](#funcLayout)
        * [func newAbiDesc(t *funcType, rcvr *rtype) abiDesc](#newAbiDesc)
        * [func (a *abiDesc) dump()](#abiDesc.dump)
    * [type abiSeq struct](#abiSeq)
        * [func (a *abiSeq) addArg(t *rtype) *abiStep](#abiSeq.addArg)
        * [func (a *abiSeq) addRcvr(rcvr *rtype) (*abiStep, bool)](#abiSeq.addRcvr)
        * [func (a *abiSeq) assignFloatN(offset, size uintptr, n int) bool](#abiSeq.assignFloatN)
        * [func (a *abiSeq) assignIntN(offset, size uintptr, n int, ptrMap uint8) bool](#abiSeq.assignIntN)
        * [func (a *abiSeq) dump()](#abiSeq.dump)
        * [func (a *abiSeq) regAssign(t *rtype, offset uintptr) bool](#abiSeq.regAssign)
        * [func (a *abiSeq) stackAssign(size, alignment uintptr)](#abiSeq.stackAssign)
        * [func (a *abiSeq) stepsForValue(i int) []abiStep](#abiSeq.stepsForValue)
    * [type abiStep struct](#abiStep)
    * [type abiStepKind int](#abiStepKind)
    * [type arrayType struct](#arrayType)
    * [type bitVector struct](#bitVector)
        * [func (bv *bitVector) append(bit uint8)](#bitVector.append)
    * [type cacheKey struct](#cacheKey)
    * [type chanType struct](#chanType)
    * [type emptyInterface struct](#emptyInterface)
    * [type fieldScan struct](#fieldScan)
    * [type flag uintptr](#flag)
        * [func (f flag) kind() Kind](#flag.kind)
        * [func (f flag) mustBe(expected Kind)](#flag.mustBe)
        * [func (f flag) mustBeAssignable()](#flag.mustBeAssignable)
        * [func (f flag) mustBeAssignableSlow()](#flag.mustBeAssignableSlow)
        * [func (f flag) mustBeExported()](#flag.mustBeExported)
        * [func (f flag) mustBeExportedSlow()](#flag.mustBeExportedSlow)
        * [func (f flag) ro() flag](#flag.ro)
    * [type funcType struct](#funcType)
        * [func methodReceiver(op string, v Value, methodIndex int) (rcvrtype *rtype, t *funcType, fn unsafe.Pointer)](#methodReceiver)
        * [func (t *funcType) in() []*rtype](#funcType.in)
        * [func (t *funcType) out() []*rtype](#funcType.out)
    * [type funcTypeFixed128 struct](#funcTypeFixed128)
    * [type funcTypeFixed16 struct](#funcTypeFixed16)
    * [type funcTypeFixed32 struct](#funcTypeFixed32)
    * [type funcTypeFixed4 struct](#funcTypeFixed4)
    * [type funcTypeFixed64 struct](#funcTypeFixed64)
    * [type funcTypeFixed8 struct](#funcTypeFixed8)
    * [type imethod struct](#imethod)
    * [type interfaceType struct](#interfaceType)
        * [func (t *interfaceType) Method(i int) (m Method)](#interfaceType.Method)
        * [func (t *interfaceType) MethodByName(name string) (m Method, ok bool)](#interfaceType.MethodByName)
        * [func (t *interfaceType) NumMethod() int](#interfaceType.NumMethod)
    * [type layoutKey struct](#layoutKey)
    * [type layoutType struct](#layoutType)
    * [type makeFuncCtxt struct](#makeFuncCtxt)
    * [type makeFuncImpl struct](#makeFuncImpl)
    * [type mapType struct](#mapType)
    * [type method struct](#method)
    * [type methodValue struct](#methodValue)
    * [type name struct](#name)
        * [func newName(n, tag string, exported bool) name](#newName)
        * [func (n name) data(off int, whySafe string) *byte](#name.data)
        * [func (n name) hasTag() bool](#name.hasTag)
        * [func (n name) isExported() bool](#name.isExported)
        * [func (n name) name() (s string)](#name.name)
        * [func (n name) pkgPath() string](#name.pkgPath)
        * [func (n name) readVarint(off int) (int, int)](#name.readVarint)
        * [func (n name) tag() (s string)](#name.tag)
    * [type nameOff int32](#nameOff)
        * [func resolveReflectName(n name) nameOff](#resolveReflectName)
    * [type nonEmptyInterface struct](#nonEmptyInterface)
    * [type pinUnexpMeth interface](#pinUnexpMeth)
    * [type ptrType struct](#ptrType)
    * [type rtype struct](#rtype)
        * [func bucketOf(ktyp, etyp *rtype) *rtype](#bucketOf)
        * [func rtypeOff(section unsafe.Pointer, off int32) *rtype](#rtypeOff)
        * [func (t *rtype) Align() int](#rtype.Align)
        * [func (t *rtype) AssignableTo(u Type) bool](#rtype.AssignableTo)
        * [func (t *rtype) Bits() int](#rtype.Bits)
        * [func (t *rtype) ChanDir() ChanDir](#rtype.ChanDir)
        * [func (t *rtype) Comparable() bool](#rtype.Comparable)
        * [func (t *rtype) ConvertibleTo(u Type) bool](#rtype.ConvertibleTo)
        * [func (t *rtype) Elem() Type](#rtype.Elem)
        * [func (t *rtype) Field(i int) StructField](#rtype.Field)
        * [func (t *rtype) FieldAlign() int](#rtype.FieldAlign)
        * [func (t *rtype) FieldByIndex(index []int) StructField](#rtype.FieldByIndex)
        * [func (t *rtype) FieldByName(name string) (StructField, bool)](#rtype.FieldByName)
        * [func (t *rtype) FieldByNameFunc(match func(string) bool) (StructField, bool)](#rtype.FieldByNameFunc)
        * [func (t *rtype) Implements(u Type) bool](#rtype.Implements)
        * [func (t *rtype) In(i int) Type](#rtype.In)
        * [func (t *rtype) IsVariadic() bool](#rtype.IsVariadic)
        * [func (t *rtype) Key() Type](#rtype.Key)
        * [func (t *rtype) Kind() Kind](#rtype.Kind)
        * [func (t *rtype) Len() int](#rtype.Len)
        * [func (t *rtype) Method(i int) (m Method)](#rtype.Method)
        * [func (t *rtype) MethodByName(name string) (m Method, ok bool)](#rtype.MethodByName)
        * [func (t *rtype) Name() string](#rtype.Name)
        * [func (t *rtype) NumField() int](#rtype.NumField)
        * [func (t *rtype) NumIn() int](#rtype.NumIn)
        * [func (t *rtype) NumMethod() int](#rtype.NumMethod)
        * [func (t *rtype) NumOut() int](#rtype.NumOut)
        * [func (t *rtype) Out(i int) Type](#rtype.Out)
        * [func (t *rtype) PkgPath() string](#rtype.PkgPath)
        * [func (t *rtype) Size() uintptr](#rtype.Size)
        * [func (t *rtype) String() string](#rtype.String)
        * [func (t *rtype) common() *rtype](#rtype.common)
        * [func (t *rtype) exportedMethods() []method](#rtype.exportedMethods)
        * [func (t *rtype) gcSlice(begin, end uintptr) []byte](#rtype.gcSlice)
        * [func (t *rtype) hasName() bool](#rtype.hasName)
        * [func (t *rtype) nameOff(off nameOff) name](#rtype.nameOff)
        * [func (t *rtype) pointers() bool](#rtype.pointers)
        * [func (t *rtype) ptrTo() *rtype](#rtype.ptrTo)
        * [func (t *rtype) textOff(off textOff) unsafe.Pointer](#rtype.textOff)
        * [func (t *rtype) typeOff(off typeOff) *rtype](#rtype.typeOff)
        * [func (t *rtype) uncommon() *uncommonType](#rtype.uncommon)
    * [type runtimeSelect struct](#runtimeSelect)
    * [type sliceType struct](#sliceType)
    * [type structField struct](#structField)
        * [func runtimeStructField(field StructField) (structField, string)](#runtimeStructField)
        * [func (f *structField) embedded() bool](#structField.embedded)
        * [func (f *structField) offset() uintptr](#structField.offset)
    * [type structType struct](#structType)
        * [func (t *structType) Field(i int) (f StructField)](#structType.Field)
        * [func (t *structType) FieldByIndex(index []int) (f StructField)](#structType.FieldByIndex)
        * [func (t *structType) FieldByName(name string) (f StructField, present bool)](#structType.FieldByName)
        * [func (t *structType) FieldByNameFunc(match func(string) bool) (result StructField, ok bool)](#structType.FieldByNameFunc)
    * [type structTypeUncommon struct](#structTypeUncommon)
    * [type textOff int32](#textOff)
        * [func resolveReflectText(ptr unsafe.Pointer) textOff](#resolveReflectText)
    * [type tflag uint8](#tflag)
    * [type typeOff int32](#typeOff)
        * [func resolveReflectType(t *rtype) typeOff](#resolveReflectType)
    * [type uncommonType struct](#uncommonType)
        * [func (t *uncommonType) exportedMethods() []method](#uncommonType.exportedMethods)
        * [func (t *uncommonType) methods() []method](#uncommonType.methods)
    * [type visibleFieldsWalker struct](#visibleFieldsWalker)
        * [func (w *visibleFieldsWalker) walk(t Type)](#visibleFieldsWalker.walk)
    * [type visit struct](#visit)
* [Functions](#func)
    * [func Copy(dst, src Value) int](#Copy)
    * [func DeepEqual(x, y interface{}) bool](#DeepEqual)
    * [func FirstMethodNameBytes(t Type) *byte](#FirstMethodNameBytes)
    * [func IsExported(t Type) bool](#IsExported)
    * [func IsRO(v Value) bool](#IsRO)
    * [func ResolveReflectName(s string)](#ResolveReflectName)
    * [func SetArgRegs(ints, floats int, floatSize uintptr) (oldInts, oldFloats int, oldFloatSize uintptr)](#SetArgRegs)
    * [func Swapper(slice interface{}) func(i, j int)](#Swapper)
    * [func TypeLinks() []string](#TypeLinks)
    * [func VisibleFields(t Type) []StructField](#VisibleFields)
    * [func add(p unsafe.Pointer, x uintptr, whySafe string) unsafe.Pointer](#add)
    * [func addReflectOff(ptr unsafe.Pointer) int32](#addReflectOff)
    * [func addTypeBits(bv *bitVector, offset uintptr, t *rtype)](#addTypeBits)
    * [func align(x, n uintptr) uintptr](#align)
    * [func appendGCProg(dst []byte, typ *rtype) []byte](#appendGCProg)
    * [func appendVarint(x []byte, v uintptr) []byte](#appendVarint)
    * [func arrayAt(p unsafe.Pointer, i int, eltSize uintptr, whySafe string) unsafe.Pointer](#arrayAt)
    * [func call(stackArgsType *rtype, f, stackArgs unsafe.Pointer, stackArgsSize, stackRetOffset, frameSize uint32, regArgs *abi.RegArgs)](#call)
    * [func callMethod(ctxt *methodValue, frame unsafe.Pointer, retValid *bool, regs *abi.RegArgs)](#callMethod)
    * [func callReflect(ctxt *makeFuncImpl, frame unsafe.Pointer, retValid *bool, regs *abi.RegArgs)](#callReflect)
    * [func chancap(ch unsafe.Pointer) int](#chancap)
    * [func chanclose(ch unsafe.Pointer)](#chanclose)
    * [func chanlen(ch unsafe.Pointer) int](#chanlen)
    * [func chanrecv(ch unsafe.Pointer, nb bool, val unsafe.Pointer) (selected, received bool)](#chanrecv)
    * [func chansend(ch unsafe.Pointer, val unsafe.Pointer, nb bool) bool](#chansend)
    * [func clearLayoutCache()](#clearLayoutCache)
    * [func convertOp(dst, src *rtype) func(Value, Type) Value](#convertOp)
    * [func deepValueEqual(v1, v2 Value, visited map[visit]bool) bool](#deepValueEqual)
    * [func directlyAssignable(T, V *rtype) bool](#directlyAssignable)
    * [func dumpPtrBitMap(b abi.IntArgRegBitmap)](#dumpPtrBitMap)
    * [func emitGCMask(out []byte, base uintptr, typ *rtype, n uintptr)](#emitGCMask)
    * [func escapes(x interface{})](#escapes)
    * [func fnv1(x uint32, list ...byte) uint32](#fnv1)
    * [func funcName(f func([]Value) []Value) string](#funcName)
    * [func funcStr(ft *funcType) string](#funcStr)
    * [func gcbits(interface{}) []byte](#gcbits)
    * [func hashMightPanic(t *rtype) bool](#hashMightPanic)
    * [func haveIdenticalType(T, V Type, cmpTags bool) bool](#haveIdenticalType)
    * [func haveIdenticalUnderlyingType(T, V *rtype, cmpTags bool) bool](#haveIdenticalUnderlyingType)
    * [func ifaceE2I(t *rtype, src interface{}, dst unsafe.Pointer)](#ifaceE2I)
    * [func ifaceIndir(t *rtype) bool](#ifaceIndir)
    * [func implements(T, V *rtype) bool](#implements)
    * [func isLetter(ch rune) bool](#isLetter)
    * [func isReflexive(t *rtype) bool](#isReflexive)
    * [func isValidFieldName(fieldName string) bool](#isValidFieldName)
    * [func makeFuncStub()](#makeFuncStub)
    * [func makechan(typ *rtype, size int) (ch unsafe.Pointer)](#makechan)
    * [func makemap(t *rtype, cap int) (m unsafe.Pointer)](#makemap)
    * [func mapaccess(t *rtype, m unsafe.Pointer, key unsafe.Pointer) (val unsafe.Pointer)](#mapaccess)
    * [func mapassign(t *rtype, m unsafe.Pointer, key, val unsafe.Pointer)](#mapassign)
    * [func mapdelete(t *rtype, m unsafe.Pointer, key unsafe.Pointer)](#mapdelete)
    * [func mapiterelem(it unsafe.Pointer) (elem unsafe.Pointer)](#mapiterelem)
    * [func mapiterinit(t *rtype, m unsafe.Pointer) unsafe.Pointer](#mapiterinit)
    * [func mapiterkey(it unsafe.Pointer) (key unsafe.Pointer)](#mapiterkey)
    * [func mapiternext(it unsafe.Pointer)](#mapiternext)
    * [func maplen(m unsafe.Pointer) int](#maplen)
    * [func memmove(dst, src unsafe.Pointer, size uintptr)](#memmove)
    * [func methodName() string](#methodName)
    * [func methodNameSkip() string](#methodNameSkip)
    * [func methodValueCall()](#methodValueCall)
    * [func moveMakeFuncArgPtrs(ctxt *makeFuncCtxt, args *abi.RegArgs)](#moveMakeFuncArgPtrs)
    * [func needKeyUpdate(t *rtype) bool](#needKeyUpdate)
    * [func overflowFloat32(x float64) bool](#overflowFloat32)
    * [func packEface(v Value) interface{}](#packEface)
    * [func resolveNameOff(ptrInModule unsafe.Pointer, off int32) unsafe.Pointer](#resolveNameOff)
    * [func resolveTextOff(rtype unsafe.Pointer, off int32) unsafe.Pointer](#resolveTextOff)
    * [func resolveTypeOff(rtype unsafe.Pointer, off int32) unsafe.Pointer](#resolveTypeOff)
    * [func rselect([]runtimeSelect) (chosen int, recvOK bool)](#rselect)
    * [func specialChannelAssignability(T, V *rtype) bool](#specialChannelAssignability)
    * [func storeRcvr(v Value, p unsafe.Pointer)](#storeRcvr)
    * [func typedmemclr(t *rtype, ptr unsafe.Pointer)](#typedmemclr)
    * [func typedmemclrpartial(t *rtype, ptr unsafe.Pointer, off, size uintptr)](#typedmemclrpartial)
    * [func typedmemmove(t *rtype, dst, src unsafe.Pointer)](#typedmemmove)
    * [func typedmemmovepartial(t *rtype, dst, src unsafe.Pointer, off, size uintptr)](#typedmemmovepartial)
    * [func typedslicecopy(elemType *rtype, dst, src unsafeheader.Slice) int](#typedslicecopy)
    * [func typehash(t *rtype, p unsafe.Pointer, h uintptr) uintptr](#typehash)
    * [func typelinks() (sections []unsafe.Pointer, offset [][]int32)](#typelinks)
    * [func typeptrdata(t *rtype) uintptr](#typeptrdata)
    * [func typesByString(s string) []*rtype](#typesByString)
    * [func typesMustMatch(what string, t1, t2 Type)](#typesMustMatch)
    * [func unsafe_New(*rtype) unsafe.Pointer](#unsafe_New)
    * [func unsafe_NewArray(*rtype, int) unsafe.Pointer](#unsafe_NewArray)
    * [func valueInterface(v Value, safe bool) interface{}](#valueInterface)
    * [func writeVarint(buf []byte, n int) int](#writeVarint)


## <a id="const" href="#const">Constants</a>

### <a id="Array" href="#Array">const Array</a>

```
searchKey: reflect.Array
tags: [constant number]
```

```Go
const Array
```

### <a id="Bool" href="#Bool">const Bool</a>

```
searchKey: reflect.Bool
tags: [constant number]
```

```Go
const Bool
```

### <a id="BothDir" href="#BothDir">const BothDir</a>

```
searchKey: reflect.BothDir
tags: [constant number]
```

```Go
const BothDir = RecvDir | SendDir // chan

```

### <a id="Chan" href="#Chan">const Chan</a>

```
searchKey: reflect.Chan
tags: [constant number]
```

```Go
const Chan
```

### <a id="Complex128" href="#Complex128">const Complex128</a>

```
searchKey: reflect.Complex128
tags: [constant number]
```

```Go
const Complex128
```

### <a id="Complex64" href="#Complex64">const Complex64</a>

```
searchKey: reflect.Complex64
tags: [constant number]
```

```Go
const Complex64
```

### <a id="Float32" href="#Float32">const Float32</a>

```
searchKey: reflect.Float32
tags: [constant number]
```

```Go
const Float32
```

### <a id="Float64" href="#Float64">const Float64</a>

```
searchKey: reflect.Float64
tags: [constant number]
```

```Go
const Float64
```

### <a id="Func" href="#Func">const Func</a>

```
searchKey: reflect.Func
tags: [constant number]
```

```Go
const Func
```

### <a id="Int" href="#Int">const Int</a>

```
searchKey: reflect.Int
tags: [constant number]
```

```Go
const Int
```

### <a id="Int16" href="#Int16">const Int16</a>

```
searchKey: reflect.Int16
tags: [constant number]
```

```Go
const Int16
```

### <a id="Int32" href="#Int32">const Int32</a>

```
searchKey: reflect.Int32
tags: [constant number]
```

```Go
const Int32
```

### <a id="Int64" href="#Int64">const Int64</a>

```
searchKey: reflect.Int64
tags: [constant number]
```

```Go
const Int64
```

### <a id="Int8" href="#Int8">const Int8</a>

```
searchKey: reflect.Int8
tags: [constant number]
```

```Go
const Int8
```

### <a id="Interface" href="#Interface">const Interface</a>

```
searchKey: reflect.Interface
tags: [constant number]
```

```Go
const Interface
```

### <a id="Invalid" href="#Invalid">const Invalid</a>

```
searchKey: reflect.Invalid
tags: [constant number]
```

```Go
const Invalid Kind = iota
```

### <a id="Map" href="#Map">const Map</a>

```
searchKey: reflect.Map
tags: [constant number]
```

```Go
const Map
```

### <a id="Ptr" href="#Ptr">const Ptr</a>

```
searchKey: reflect.Ptr
tags: [constant number]
```

```Go
const Ptr
```

### <a id="PtrSize" href="#PtrSize">const PtrSize</a>

```
searchKey: reflect.PtrSize
tags: [constant number private]
```

```Go
const PtrSize = ptrSize
```

### <a id="RecvDir" href="#RecvDir">const RecvDir</a>

```
searchKey: reflect.RecvDir
tags: [constant number]
```

```Go
const RecvDir ChanDir = 1 << iota // <-chan

```

### <a id="SelectDefault" href="#SelectDefault">const SelectDefault</a>

```
searchKey: reflect.SelectDefault
tags: [constant number]
```

```Go
const SelectDefault // default

```

### <a id="SelectRecv" href="#SelectRecv">const SelectRecv</a>

```
searchKey: reflect.SelectRecv
tags: [constant number]
```

```Go
const SelectRecv // case <-Chan:

```

### <a id="SelectSend" href="#SelectSend">const SelectSend</a>

```
searchKey: reflect.SelectSend
tags: [constant number]
```

```Go
const SelectSend // case Chan <- Send

```

### <a id="SendDir" href="#SendDir">const SendDir</a>

```
searchKey: reflect.SendDir
tags: [constant number]
```

```Go
const SendDir // chan<-

```

### <a id="Slice" href="#Slice">const Slice</a>

```
searchKey: reflect.Slice
tags: [constant number]
```

```Go
const Slice
```

### <a id="String" href="#String">const String</a>

```
searchKey: reflect.String
tags: [constant number]
```

```Go
const String
```

### <a id="Struct" href="#Struct">const Struct</a>

```
searchKey: reflect.Struct
tags: [constant number]
```

```Go
const Struct
```

### <a id="Uint" href="#Uint">const Uint</a>

```
searchKey: reflect.Uint
tags: [constant number]
```

```Go
const Uint
```

### <a id="Uint16" href="#Uint16">const Uint16</a>

```
searchKey: reflect.Uint16
tags: [constant number]
```

```Go
const Uint16
```

### <a id="Uint32" href="#Uint32">const Uint32</a>

```
searchKey: reflect.Uint32
tags: [constant number]
```

```Go
const Uint32
```

### <a id="Uint64" href="#Uint64">const Uint64</a>

```
searchKey: reflect.Uint64
tags: [constant number]
```

```Go
const Uint64
```

### <a id="Uint8" href="#Uint8">const Uint8</a>

```
searchKey: reflect.Uint8
tags: [constant number]
```

```Go
const Uint8
```

### <a id="Uintptr" href="#Uintptr">const Uintptr</a>

```
searchKey: reflect.Uintptr
tags: [constant number]
```

```Go
const Uintptr
```

### <a id="UnsafePointer" href="#UnsafePointer">const UnsafePointer</a>

```
searchKey: reflect.UnsafePointer
tags: [constant number]
```

```Go
const UnsafePointer
```

### <a id="abiStepBad" href="#abiStepBad">const abiStepBad</a>

```
searchKey: reflect.abiStepBad
tags: [constant number private]
```

```Go
const abiStepBad abiStepKind = iota
```

### <a id="abiStepFloatReg" href="#abiStepFloatReg">const abiStepFloatReg</a>

```
searchKey: reflect.abiStepFloatReg
tags: [constant number private]
```

```Go
const abiStepFloatReg // copy to/from FP register

```

### <a id="abiStepIntReg" href="#abiStepIntReg">const abiStepIntReg</a>

```
searchKey: reflect.abiStepIntReg
tags: [constant number private]
```

```Go
const abiStepIntReg // copy to/from integer register

```

### <a id="abiStepPointer" href="#abiStepPointer">const abiStepPointer</a>

```
searchKey: reflect.abiStepPointer
tags: [constant number private]
```

```Go
const abiStepPointer // copy pointer to/from integer register

```

### <a id="abiStepStack" href="#abiStepStack">const abiStepStack</a>

```
searchKey: reflect.abiStepStack
tags: [constant number private]
```

```Go
const abiStepStack // copy to/from stack

```

### <a id="bucketSize" href="#bucketSize">const bucketSize</a>

```
searchKey: reflect.bucketSize
tags: [constant number private]
```

```Go
const bucketSize uintptr = 8
```

Make sure these routines stay in sync with ../../runtime/map.go! These types exist only for GC, so we only fill out GC relevant info. Currently, that's just size and the GC program. We also fill in string for possible debugging use. 

### <a id="debugReflectCall" href="#debugReflectCall">const debugReflectCall</a>

```
searchKey: reflect.debugReflectCall
tags: [constant boolean private]
```

```Go
const debugReflectCall = false
```

### <a id="flagAddr" href="#flagAddr">const flagAddr</a>

```
searchKey: reflect.flagAddr
tags: [constant number private]
```

```Go
const flagAddr flag = 1 << 8
```

### <a id="flagEmbedRO" href="#flagEmbedRO">const flagEmbedRO</a>

```
searchKey: reflect.flagEmbedRO
tags: [constant number private]
```

```Go
const flagEmbedRO flag = 1 << 6
```

### <a id="flagIndir" href="#flagIndir">const flagIndir</a>

```
searchKey: reflect.flagIndir
tags: [constant number private]
```

```Go
const flagIndir flag = 1 << 7
```

### <a id="flagKindMask" href="#flagKindMask">const flagKindMask</a>

```
searchKey: reflect.flagKindMask
tags: [constant number private]
```

```Go
const flagKindMask flag = 1<<flagKindWidth - 1
```

### <a id="flagKindWidth" href="#flagKindWidth">const flagKindWidth</a>

```
searchKey: reflect.flagKindWidth
tags: [constant number private]
```

```Go
const flagKindWidth = 5 // there are 27 kinds

```

### <a id="flagMethod" href="#flagMethod">const flagMethod</a>

```
searchKey: reflect.flagMethod
tags: [constant number private]
```

```Go
const flagMethod flag = 1 << 9
```

### <a id="flagMethodShift" href="#flagMethodShift">const flagMethodShift</a>

```
searchKey: reflect.flagMethodShift
tags: [constant number private]
```

```Go
const flagMethodShift = 10
```

### <a id="flagRO" href="#flagRO">const flagRO</a>

```
searchKey: reflect.flagRO
tags: [constant number private]
```

```Go
const flagRO flag = flagStickyRO | flagEmbedRO
```

### <a id="flagStickyRO" href="#flagStickyRO">const flagStickyRO</a>

```
searchKey: reflect.flagStickyRO
tags: [constant number private]
```

```Go
const flagStickyRO flag = 1 << 5
```

### <a id="kindDirectIface" href="#kindDirectIface">const kindDirectIface</a>

```
searchKey: reflect.kindDirectIface
tags: [constant number private]
```

```Go
const kindDirectIface = 1 << 5
```

### <a id="kindGCProg" href="#kindGCProg">const kindGCProg</a>

```
searchKey: reflect.kindGCProg
tags: [constant number private]
```

```Go
const kindGCProg = 1 << 6 // Type.gc points to GC program

```

### <a id="kindMask" href="#kindMask">const kindMask</a>

```
searchKey: reflect.kindMask
tags: [constant number private]
```

```Go
const kindMask = (1 << 5) - 1
```

### <a id="maxKeySize" href="#maxKeySize">const maxKeySize</a>

```
searchKey: reflect.maxKeySize
tags: [constant number private]
```

```Go
const maxKeySize uintptr = 128
```

Make sure these routines stay in sync with ../../runtime/map.go! These types exist only for GC, so we only fill out GC relevant info. Currently, that's just size and the GC program. We also fill in string for possible debugging use. 

### <a id="maxPtrmaskBytes" href="#maxPtrmaskBytes">const maxPtrmaskBytes</a>

```
searchKey: reflect.maxPtrmaskBytes
tags: [constant number private]
```

```Go
const maxPtrmaskBytes = 2048
```

See cmd/compile/internal/gc/reflect.go for derivation of constant. 

### <a id="maxValSize" href="#maxValSize">const maxValSize</a>

```
searchKey: reflect.maxValSize
tags: [constant number private]
```

```Go
const maxValSize uintptr = 128
```

Make sure these routines stay in sync with ../../runtime/map.go! These types exist only for GC, so we only fill out GC relevant info. Currently, that's just size and the GC program. We also fill in string for possible debugging use. 

### <a id="maxZero" href="#maxZero">const maxZero</a>

```
searchKey: reflect.maxZero
tags: [constant number private]
```

```Go
const maxZero = 1024
```

must match declarations in runtime/map.go. 

### <a id="ptrSize" href="#ptrSize">const ptrSize</a>

```
searchKey: reflect.ptrSize
tags: [constant number private]
```

```Go
const ptrSize = 4 << (^uintptr(0) >> 63) // unsafe.Sizeof(uintptr(0)) but an ideal const

```

### <a id="tflagExtraStar" href="#tflagExtraStar">const tflagExtraStar</a>

```
searchKey: reflect.tflagExtraStar
tags: [constant number private]
```

```Go
const tflagExtraStar tflag = 1 << 1
```

tflagExtraStar means the name in the str field has an extraneous '*' prefix. This is because for most types T in a program, the type *T also exists and reusing the str data saves binary size. 

### <a id="tflagNamed" href="#tflagNamed">const tflagNamed</a>

```
searchKey: reflect.tflagNamed
tags: [constant number private]
```

```Go
const tflagNamed tflag = 1 << 2
```

tflagNamed means the type has a name. 

### <a id="tflagRegularMemory" href="#tflagRegularMemory">const tflagRegularMemory</a>

```
searchKey: reflect.tflagRegularMemory
tags: [constant number private]
```

```Go
const tflagRegularMemory tflag = 1 << 3
```

tflagRegularMemory means that equal and hash functions can treat this type as a single region of t.size bytes. 

### <a id="tflagUncommon" href="#tflagUncommon">const tflagUncommon</a>

```
searchKey: reflect.tflagUncommon
tags: [constant number private]
```

```Go
const tflagUncommon tflag = 1 << 0
```

tflagUncommon means that there is a pointer, *uncommonType, just beyond the outer type structure. 

For example, if t.Kind() == Struct and t.tflag&tflagUncommon != 0, then t has uncommonType data and it can be accessed as: 

```
type tUncommon struct {
	structType
	u uncommonType
}
u := &(*tUncommon)(unsafe.Pointer(t)).u

```
## <a id="var" href="#var">Variables</a>

### <a id="CallGC" href="#CallGC">var CallGC</a>

```
searchKey: reflect.CallGC
tags: [variable boolean private]
```

```Go
var CallGC = &callGC
```

### <a id="GCBits" href="#GCBits">var GCBits</a>

```
searchKey: reflect.GCBits
tags: [variable function private]
```

```Go
var GCBits = gcbits
```

### <a id="callGC" href="#callGC">var callGC</a>

```
searchKey: reflect.callGC
tags: [variable boolean private]
```

```Go
var callGC bool // for testing; see TestCallMethodJump

```

### <a id="dummy" href="#dummy">var dummy</a>

```
searchKey: reflect.dummy
tags: [variable struct private]
```

```Go
var dummy struct {
	b bool
	x interface{}
}
```

### <a id="floatArgRegs" href="#floatArgRegs">var floatArgRegs</a>

```
searchKey: reflect.floatArgRegs
tags: [variable private]
```

```Go
var floatArgRegs = abi.FloatArgRegs * goexperiment.RegabiArgsInt
```

These variables are used by the register assignment algorithm in this file. 

They should be modified with care (no other reflect code may be executing) and are generally only modified when testing this package. 

They should never be set higher than their internal/abi constant counterparts, because the system relies on a structure that is at least large enough to hold the registers the system supports. 

Currently they're set to zero because using the actual constants will break every part of the toolchain that uses reflect to call functions (e.g. go test, or anything that uses text/template). The values that are currently commented out there should be the actual values once we're ready to use the register ABI everywhere. 

### <a id="floatRegSize" href="#floatRegSize">var floatRegSize</a>

```
searchKey: reflect.floatRegSize
tags: [variable private]
```

```Go
var floatRegSize = uintptr(abi.EffectiveFloatRegSize * goexperiment.RegabiArgsInt)
```

These variables are used by the register assignment algorithm in this file. 

They should be modified with care (no other reflect code may be executing) and are generally only modified when testing this package. 

They should never be set higher than their internal/abi constant counterparts, because the system relies on a structure that is at least large enough to hold the registers the system supports. 

Currently they're set to zero because using the actual constants will break every part of the toolchain that uses reflect to call functions (e.g. go test, or anything that uses text/template). The values that are currently commented out there should be the actual values once we're ready to use the register ABI everywhere. 

### <a id="funcLookupCache" href="#funcLookupCache">var funcLookupCache</a>

```
searchKey: reflect.funcLookupCache
tags: [variable struct private]
```

```Go
var funcLookupCache struct {
	sync.Mutex // Guards stores (but not loads) on m.

	// m is a map[uint32][]*rtype keyed by the hash calculated in FuncOf.
	// Elements of m are append-only and thus safe for concurrent reading.
	m sync.Map
} = ...
```

The funcLookupCache caches FuncOf lookups. FuncOf does not share the common lookupCache since cacheKey is not sufficient to represent functions unambiguously. 

### <a id="intArgRegs" href="#intArgRegs">var intArgRegs</a>

```
searchKey: reflect.intArgRegs
tags: [variable private]
```

```Go
var intArgRegs = abi.IntArgRegs * goexperiment.RegabiArgsInt
```

These variables are used by the register assignment algorithm in this file. 

They should be modified with care (no other reflect code may be executing) and are generally only modified when testing this package. 

They should never be set higher than their internal/abi constant counterparts, because the system relies on a structure that is at least large enough to hold the registers the system supports. 

Currently they're set to zero because using the actual constants will break every part of the toolchain that uses reflect to call functions (e.g. go test, or anything that uses text/template). The values that are currently commented out there should be the actual values once we're ready to use the register ABI everywhere. 

### <a id="kindNames" href="#kindNames">var kindNames</a>

```
searchKey: reflect.kindNames
tags: [variable array string private]
```

```Go
var kindNames = ...
```

### <a id="layoutCache" href="#layoutCache">var layoutCache</a>

```
searchKey: reflect.layoutCache
tags: [variable struct private]
```

```Go
var layoutCache sync.Map // map[layoutKey]layoutType

```

### <a id="lookupCache" href="#lookupCache">var lookupCache</a>

```
searchKey: reflect.lookupCache
tags: [variable struct private]
```

```Go
var lookupCache sync.Map // map[cacheKey]*rtype

```

The lookupCache caches ArrayOf, ChanOf, MapOf and SliceOf lookups. 

### <a id="pinUnexpMethI" href="#pinUnexpMethI">var pinUnexpMethI</a>

```
searchKey: reflect.pinUnexpMethI
tags: [variable interface private]
```

```Go
var pinUnexpMethI = pinUnexpMeth(EmbedWithUnexpMeth{})
```

### <a id="ptrMap" href="#ptrMap">var ptrMap</a>

```
searchKey: reflect.ptrMap
tags: [variable struct private]
```

```Go
var ptrMap sync.Map // map[*rtype]*ptrType

```

ptrMap is the cache for PtrTo. 

### <a id="structLookupCache" href="#structLookupCache">var structLookupCache</a>

```
searchKey: reflect.structLookupCache
tags: [variable struct private]
```

```Go
var structLookupCache struct {
	sync.Mutex // Guards stores (but not loads) on m.

	// m is a map[uint32][]Type keyed by the hash calculated in StructOf.
	// Elements in m are append-only and thus safe for concurrent reading.
	m sync.Map
} = ...
```

The structLookupCache caches StructOf lookups. StructOf does not share the common lookupCache since we need to pin the memory associated with *structTypeFixedN. 

### <a id="uint8Type" href="#uint8Type">var uint8Type</a>

```
searchKey: reflect.uint8Type
tags: [variable struct private]
```

```Go
var uint8Type = TypeOf(uint8(0)).(*rtype)
```

### <a id="zeroVal" href="#zeroVal">var zeroVal</a>

```
searchKey: reflect.zeroVal
tags: [variable array number private]
```

```Go
var zeroVal [maxZero]byte
```

## <a id="type" href="#type">Types</a>

### <a id="Buffer" href="#Buffer">type Buffer struct</a>

```
searchKey: reflect.Buffer
tags: [struct private]
```

```Go
type Buffer struct {
	buf []byte
}
```

### <a id="ChanDir" href="#ChanDir">type ChanDir int</a>

```
searchKey: reflect.ChanDir
tags: [number]
```

```Go
type ChanDir int
```

ChanDir represents a channel type's direction. 

#### <a id="ChanDir.String" href="#ChanDir.String">func (d ChanDir) String() string</a>

```
searchKey: reflect.ChanDir.String
tags: [method]
```

```Go
func (d ChanDir) String() string
```

### <a id="EmbedWithUnexpMeth" href="#EmbedWithUnexpMeth">type EmbedWithUnexpMeth struct{}</a>

```
searchKey: reflect.EmbedWithUnexpMeth
tags: [struct private]
```

```Go
type EmbedWithUnexpMeth struct{}
```

#### <a id="EmbedWithUnexpMeth.f" href="#EmbedWithUnexpMeth.f">func (EmbedWithUnexpMeth) f()</a>

```
searchKey: reflect.EmbedWithUnexpMeth.f
tags: [method private]
```

```Go
func (EmbedWithUnexpMeth) f()
```

### <a id="Kind" href="#Kind">type Kind uint</a>

```
searchKey: reflect.Kind
tags: [number]
```

```Go
type Kind uint
```

A Kind represents the specific kind of type that a Type represents. The zero Kind is not a valid kind. 

#### <a id="Kind.String" href="#Kind.String">func (k Kind) String() string</a>

```
searchKey: reflect.Kind.String
tags: [method]
```

```Go
func (k Kind) String() string
```

String returns the name of k. 

### <a id="MapIter" href="#MapIter">type MapIter struct</a>

```
searchKey: reflect.MapIter
tags: [struct]
```

```Go
type MapIter struct {
	m  Value
	it unsafe.Pointer
}
```

A MapIter is an iterator for ranging over a map. See Value.MapRange. 

#### <a id="MapIter.Key" href="#MapIter.Key">func (it *MapIter) Key() Value</a>

```
searchKey: reflect.MapIter.Key
tags: [method]
```

```Go
func (it *MapIter) Key() Value
```

Key returns the key of the iterator's current map entry. 

#### <a id="MapIter.Next" href="#MapIter.Next">func (it *MapIter) Next() bool</a>

```
searchKey: reflect.MapIter.Next
tags: [method]
```

```Go
func (it *MapIter) Next() bool
```

Next advances the map iterator and reports whether there is another entry. It returns false when the iterator is exhausted; subsequent calls to Key, Value, or Next will panic. 

#### <a id="MapIter.Value" href="#MapIter.Value">func (it *MapIter) Value() Value</a>

```
searchKey: reflect.MapIter.Value
tags: [method]
```

```Go
func (it *MapIter) Value() Value
```

Value returns the value of the iterator's current map entry. 

### <a id="Method" href="#Method">type Method struct</a>

```
searchKey: reflect.Method
tags: [struct]
```

```Go
type Method struct {
	// Name is the method name.
	Name string

	// PkgPath is the package path that qualifies a lower case (unexported)
	// method name. It is empty for upper case (exported) method names.
	// The combination of PkgPath and Name uniquely identifies a method
	// in a method set.
	// See https://golang.org/ref/spec#Uniqueness_of_identifiers
	PkgPath string

	Type  Type  // method type
	Func  Value // func with receiver as first argument
	Index int   // index for Type.Method
}
```

Method represents a single method. 

#### <a id="Method.IsExported" href="#Method.IsExported">func (m Method) IsExported() bool</a>

```
searchKey: reflect.Method.IsExported
tags: [method]
```

```Go
func (m Method) IsExported() bool
```

IsExported reports whether the method is exported. 

### <a id="OtherPkgFields" href="#OtherPkgFields">type OtherPkgFields struct</a>

```
searchKey: reflect.OtherPkgFields
tags: [struct private]
```

```Go
type OtherPkgFields struct {
	OtherExported   int
	otherUnexported int
}
```

### <a id="SelectCase" href="#SelectCase">type SelectCase struct</a>

```
searchKey: reflect.SelectCase
tags: [struct]
```

```Go
type SelectCase struct {
	Dir  SelectDir // direction of case
	Chan Value     // channel to use (for send or receive)
	Send Value     // value to send (for send)
}
```

A SelectCase describes a single case in a select operation. The kind of case depends on Dir, the communication direction. 

If Dir is SelectDefault, the case represents a default case. Chan and Send must be zero Values. 

If Dir is SelectSend, the case represents a send operation. Normally Chan's underlying value must be a channel, and Send's underlying value must be assignable to the channel's element type. As a special case, if Chan is a zero Value, then the case is ignored, and the field Send will also be ignored and may be either zero or non-zero. 

If Dir is SelectRecv, the case represents a receive operation. Normally Chan's underlying value must be a channel and Send must be a zero Value. If Chan is a zero Value, then the case is ignored, but Send must still be a zero Value. When a receive operation is selected, the received Value is returned by Select. 

### <a id="SelectDir" href="#SelectDir">type SelectDir int</a>

```
searchKey: reflect.SelectDir
tags: [number]
```

```Go
type SelectDir int
```

A SelectDir describes the communication direction of a select case. 

### <a id="SliceHeader" href="#SliceHeader">type SliceHeader struct</a>

```
searchKey: reflect.SliceHeader
tags: [struct]
```

```Go
type SliceHeader struct {
	Data uintptr
	Len  int
	Cap  int
}
```

SliceHeader is the runtime representation of a slice. It cannot be used safely or portably and its representation may change in a later release. Moreover, the Data field is not sufficient to guarantee the data it references will not be garbage collected, so programs must keep a separate, correctly typed pointer to the underlying data. 

### <a id="StringHeader" href="#StringHeader">type StringHeader struct</a>

```
searchKey: reflect.StringHeader
tags: [struct]
```

```Go
type StringHeader struct {
	Data uintptr
	Len  int
}
```

StringHeader is the runtime representation of a string. It cannot be used safely or portably and its representation may change in a later release. Moreover, the Data field is not sufficient to guarantee the data it references will not be garbage collected, so programs must keep a separate, correctly typed pointer to the underlying data. 

### <a id="StructField" href="#StructField">type StructField struct</a>

```
searchKey: reflect.StructField
tags: [struct]
```

```Go
type StructField struct {
	// Name is the field name.
	Name string

	// PkgPath is the package path that qualifies a lower case (unexported)
	// field name. It is empty for upper case (exported) field names.
	// See https://golang.org/ref/spec#Uniqueness_of_identifiers
	PkgPath string

	Type      Type      // field type
	Tag       StructTag // field tag string
	Offset    uintptr   // offset within struct, in bytes
	Index     []int     // index sequence for Type.FieldByIndex
	Anonymous bool      // is an embedded field
}
```

A StructField describes a single field in a struct. 

#### <a id="StructField.IsExported" href="#StructField.IsExported">func (f StructField) IsExported() bool</a>

```
searchKey: reflect.StructField.IsExported
tags: [method]
```

```Go
func (f StructField) IsExported() bool
```

IsExported reports whether the field is exported. 

### <a id="StructTag" href="#StructTag">type StructTag string</a>

```
searchKey: reflect.StructTag
tags: [string]
```

```Go
type StructTag string
```

A StructTag is the tag string in a struct field. 

By convention, tag strings are a concatenation of optionally space-separated key:"value" pairs. Each key is a non-empty string consisting of non-control characters other than space (U+0020 ' '), quote (U+0022 '"'), and colon (U+003A ':').  Each value is quoted using U+0022 '"' characters and Go string literal syntax. 

#### <a id="StructTag.Get" href="#StructTag.Get">func (tag StructTag) Get(key string) string</a>

```
searchKey: reflect.StructTag.Get
tags: [method]
```

```Go
func (tag StructTag) Get(key string) string
```

Get returns the value associated with key in the tag string. If there is no such key in the tag, Get returns the empty string. If the tag does not have the conventional format, the value returned by Get is unspecified. To determine whether a tag is explicitly set to the empty string, use Lookup. 

#### <a id="StructTag.Lookup" href="#StructTag.Lookup">func (tag StructTag) Lookup(key string) (value string, ok bool)</a>

```
searchKey: reflect.StructTag.Lookup
tags: [method]
```

```Go
func (tag StructTag) Lookup(key string) (value string, ok bool)
```

Lookup returns the value associated with key in the tag string. If the key is present in the tag the value (which may be empty) is returned. Otherwise the returned value will be the empty string. The ok return value reports whether the value was explicitly set in the tag string. If the tag does not have the conventional format, the value returned by Lookup is unspecified. 

### <a id="Type" href="#Type">type Type interface</a>

```
searchKey: reflect.Type
tags: [interface]
```

```Go
type Type interface {

	// Align returns the alignment in bytes of a value of
	// this type when allocated in memory.
	Align() int

	// FieldAlign returns the alignment in bytes of a value of
	// this type when used as a field in a struct.
	FieldAlign() int

	// Method returns the i'th method in the type's method set.
	// It panics if i is not in the range [0, NumMethod()).
	//
	// For a non-interface type T or *T, the returned Method's Type and Func
	// fields describe a function whose first argument is the receiver,
	// and only exported methods are accessible.
	//
	// For an interface type, the returned Method's Type field gives the
	// method signature, without a receiver, and the Func field is nil.
	//
	// Methods are sorted in lexicographic order.
	Method(int) Method

	// MethodByName returns the method with that name in the type's
	// method set and a boolean indicating if the method was found.
	//
	// For a non-interface type T or *T, the returned Method's Type and Func
	// fields describe a function whose first argument is the receiver.
	//
	// For an interface type, the returned Method's Type field gives the
	// method signature, without a receiver, and the Func field is nil.
	MethodByName(string) (Method, bool)

	// NumMethod returns the number of methods accessible using Method.
	//
	// Note that NumMethod counts unexported methods only for interface types.
	NumMethod() int

	// Name returns the type's name within its package for a defined type.
	// For other (non-defined) types it returns the empty string.
	Name() string

	// PkgPath returns a defined type's package path, that is, the import path
	// that uniquely identifies the package, such as "encoding/base64".
	// If the type was predeclared (string, error) or not defined (*T, struct{},
	// []int, or A where A is an alias for a non-defined type), the package path
	// will be the empty string.
	PkgPath() string

	// Size returns the number of bytes needed to store
	// a value of the given type; it is analogous to unsafe.Sizeof.
	Size() uintptr

	// String returns a string representation of the type.
	// The string representation may use shortened package names
	// (e.g., base64 instead of "encoding/base64") and is not
	// guaranteed to be unique among types. To test for type identity,
	// compare the Types directly.
	String() string

	// Kind returns the specific kind of this type.
	Kind() Kind

	// Implements reports whether the type implements the interface type u.
	Implements(u Type) bool

	// AssignableTo reports whether a value of the type is assignable to type u.
	AssignableTo(u Type) bool

	// ConvertibleTo reports whether a value of the type is convertible to type u.
	// Even if ConvertibleTo returns true, the conversion may still panic.
	// For example, a slice of type []T is convertible to *[N]T,
	// but the conversion will panic if its length is less than N.
	ConvertibleTo(u Type) bool

	// Comparable reports whether values of this type are comparable.
	// Even if Comparable returns true, the comparison may still panic.
	// For example, values of interface type are comparable,
	// but the comparison will panic if their dynamic type is not comparable.
	Comparable() bool

	// Bits returns the size of the type in bits.
	// It panics if the type's Kind is not one of the
	// sized or unsized Int, Uint, Float, or Complex kinds.
	Bits() int

	// ChanDir returns a channel type's direction.
	// It panics if the type's Kind is not Chan.
	ChanDir() ChanDir

	// IsVariadic reports whether a function type's final input parameter
	// is a "..." parameter. If so, t.In(t.NumIn() - 1) returns the parameter's
	// implicit actual type []T.
	//
	// For concreteness, if t represents func(x int, y ... float64), then
	//
	//	t.NumIn() == 2
	//	t.In(0) is the reflect.Type for "int"
	//	t.In(1) is the reflect.Type for "[]float64"
	//	t.IsVariadic() == true
	//
	// IsVariadic panics if the type's Kind is not Func.
	IsVariadic() bool

	// Elem returns a type's element type.
	// It panics if the type's Kind is not Array, Chan, Map, Ptr, or Slice.
	Elem() Type

	// Field returns a struct type's i'th field.
	// It panics if the type's Kind is not Struct.
	// It panics if i is not in the range [0, NumField()).
	Field(i int) StructField

	// FieldByIndex returns the nested field corresponding
	// to the index sequence. It is equivalent to calling Field
	// successively for each index i.
	// It panics if the type's Kind is not Struct.
	FieldByIndex(index []int) StructField

	// FieldByName returns the struct field with the given name
	// and a boolean indicating if the field was found.
	FieldByName(name string) (StructField, bool)

	// FieldByNameFunc returns the struct field with a name
	// that satisfies the match function and a boolean indicating if
	// the field was found.
	//
	// FieldByNameFunc considers the fields in the struct itself
	// and then the fields in any embedded structs, in breadth first order,
	// stopping at the shallowest nesting depth containing one or more
	// fields satisfying the match function. If multiple fields at that depth
	// satisfy the match function, they cancel each other
	// and FieldByNameFunc returns no match.
	// This behavior mirrors Go's handling of name lookup in
	// structs containing embedded fields.
	FieldByNameFunc(match func(string) bool) (StructField, bool)

	// In returns the type of a function type's i'th input parameter.
	// It panics if the type's Kind is not Func.
	// It panics if i is not in the range [0, NumIn()).
	In(i int) Type

	// Key returns a map type's key type.
	// It panics if the type's Kind is not Map.
	Key() Type

	// Len returns an array type's length.
	// It panics if the type's Kind is not Array.
	Len() int

	// NumField returns a struct type's field count.
	// It panics if the type's Kind is not Struct.
	NumField() int

	// NumIn returns a function type's input parameter count.
	// It panics if the type's Kind is not Func.
	NumIn() int

	// NumOut returns a function type's output parameter count.
	// It panics if the type's Kind is not Func.
	NumOut() int

	// Out returns the type of a function type's i'th output parameter.
	// It panics if the type's Kind is not Func.
	// It panics if i is not in the range [0, NumOut()).
	Out(i int) Type

	common() *rtype
	uncommon() *uncommonType
}
```

Type is the representation of a Go type. 

Not all methods apply to all kinds of types. Restrictions, if any, are noted in the documentation for each method. Use the Kind method to find out the kind of type before calling kind-specific methods. Calling a method inappropriate to the kind of type causes a run-time panic. 

Type values are comparable, such as with the == operator, so they can be used as map keys. Two Type values are equal if they represent identical types. 

#### <a id="ArrayOf" href="#ArrayOf">func ArrayOf(length int, elem Type) Type</a>

```
searchKey: reflect.ArrayOf
tags: [function]
```

```Go
func ArrayOf(length int, elem Type) Type
```

ArrayOf returns the array type with the given length and element type. For example, if t represents int, ArrayOf(5, t) represents [5]int. 

If the resulting type would be larger than the available address space, ArrayOf panics. 

#### <a id="CachedBucketOf" href="#CachedBucketOf">func CachedBucketOf(m Type) Type</a>

```
searchKey: reflect.CachedBucketOf
tags: [function private]
```

```Go
func CachedBucketOf(m Type) Type
```

#### <a id="ChanOf" href="#ChanOf">func ChanOf(dir ChanDir, t Type) Type</a>

```
searchKey: reflect.ChanOf
tags: [function]
```

```Go
func ChanOf(dir ChanDir, t Type) Type
```

ChanOf returns the channel type with the given direction and element type. For example, if t represents int, ChanOf(RecvDir, t) represents <-chan int. 

The gc runtime imposes a limit of 64 kB on channel element types. If t's size is equal to or exceeds this limit, ChanOf panics. 

#### <a id="FuncLayout" href="#FuncLayout">func FuncLayout(t Type, rcvr Type) (frametype Type, argSize, retOffset uintptr, stack, gc, inReg, outReg []byte, ptrs bool)</a>

```
searchKey: reflect.FuncLayout
tags: [function private]
```

```Go
func FuncLayout(t Type, rcvr Type) (frametype Type, argSize, retOffset uintptr, stack, gc, inReg, outReg []byte, ptrs bool)
```

FuncLayout calls funcLayout and returns a subset of the results for testing. 

Bitmaps like stack, gc, inReg, and outReg are expanded such that each bit takes up one byte, so that writing out test cases is a little clearer. If ptrs is false, gc will be nil. 

#### <a id="FuncOf" href="#FuncOf">func FuncOf(in, out []Type, variadic bool) Type</a>

```
searchKey: reflect.FuncOf
tags: [function]
```

```Go
func FuncOf(in, out []Type, variadic bool) Type
```

FuncOf returns the function type with the given argument and result types. For example if k represents int and e represents string, FuncOf([]Type{k}, []Type{e}, false) represents func(int) string. 

The variadic argument controls whether the function is variadic. FuncOf panics if the in[len(in)-1] does not represent a slice and variadic is true. 

#### <a id="MapBucketOf" href="#MapBucketOf">func MapBucketOf(x, y Type) Type</a>

```
searchKey: reflect.MapBucketOf
tags: [function private]
```

```Go
func MapBucketOf(x, y Type) Type
```

#### <a id="MapOf" href="#MapOf">func MapOf(key, elem Type) Type</a>

```
searchKey: reflect.MapOf
tags: [function]
```

```Go
func MapOf(key, elem Type) Type
```

MapOf returns the map type with the given key and element types. For example, if k represents int and e represents string, MapOf(k, e) represents map[int]string. 

If the key type is not a valid map key type (that is, if it does not implement Go's == operator), MapOf panics. 

#### <a id="PtrTo" href="#PtrTo">func PtrTo(t Type) Type</a>

```
searchKey: reflect.PtrTo
tags: [function]
```

```Go
func PtrTo(t Type) Type
```

PtrTo returns the pointer type with element t. For example, if t represents type Foo, PtrTo(t) represents *Foo. 

#### <a id="SliceOf" href="#SliceOf">func SliceOf(t Type) Type</a>

```
searchKey: reflect.SliceOf
tags: [function]
```

```Go
func SliceOf(t Type) Type
```

SliceOf returns the slice type with element type t. For example, if t represents int, SliceOf(t) represents []int. 

#### <a id="StructOf" href="#StructOf">func StructOf(fields []StructField) Type</a>

```
searchKey: reflect.StructOf
tags: [function]
```

```Go
func StructOf(fields []StructField) Type
```

StructOf returns the struct type containing fields. The Offset and Index fields are ignored and computed as they would be by the compiler. 

StructOf currently does not generate wrapper methods for embedded fields and panics if passed unexported StructFields. These limitations may be lifted in a future version. 

#### <a id="TypeOf" href="#TypeOf">func TypeOf(i interface{}) Type</a>

```
searchKey: reflect.TypeOf
tags: [function]
```

```Go
func TypeOf(i interface{}) Type
```

TypeOf returns the reflection Type that represents the dynamic type of i. If i is a nil interface value, TypeOf returns nil. 

#### <a id="toType" href="#toType">func toType(t *rtype) Type</a>

```
searchKey: reflect.toType
tags: [function private]
```

```Go
func toType(t *rtype) Type
```

toType converts from a *rtype to a Type that can be returned to the client of package reflect. In gc, the only concern is that a nil *rtype must be replaced by a nil Type, but in gccgo this function takes care of ensuring that multiple *rtype for the same type are coalesced into a single Type. 

### <a id="Value" href="#Value">type Value struct</a>

```
searchKey: reflect.Value
tags: [struct]
```

```Go
type Value struct {
	// typ holds the type of the value represented by a Value.
	typ *rtype

	// Pointer-valued data or, if flagIndir is set, pointer to data.
	// Valid when either flagIndir is set or typ.pointers() is true.
	ptr unsafe.Pointer

	// flag holds metadata about the value.
	// The lowest bits are flag bits:
	//	- flagStickyRO: obtained via unexported not embedded field, so read-only
	//	- flagEmbedRO: obtained via unexported embedded field, so read-only
	//	- flagIndir: val holds a pointer to the data
	//	- flagAddr: v.CanAddr is true (implies flagIndir)
	//	- flagMethod: v is a method value.
	// The next five bits give the Kind of the value.
	// This repeats typ.Kind() except for method values.
	// The remaining 23+ bits give a method number for method values.
	// If flag.kind() != Func, code can assume that flagMethod is unset.
	// If ifaceIndir(typ), code can assume that flagIndir is set.
	flag
}
```

Value is the reflection interface to a Go value. 

Not all methods apply to all kinds of values. Restrictions, if any, are noted in the documentation for each method. Use the Kind method to find out the kind of value before calling kind-specific methods. Calling a method inappropriate to the kind of type causes a run time panic. 

The zero Value represents no value. Its IsValid method returns false, its Kind method returns Invalid, its String method returns "<invalid Value>", and all other methods panic. Most functions and methods never return an invalid value. If one does, its documentation states the conditions explicitly. 

A Value can be used concurrently by multiple goroutines provided that the underlying Go value can be used concurrently for the equivalent direct operations. 

To compare two Values, compare the results of the Interface method. Using == on two Values does not compare the underlying values they represent. 

#### <a id="Append" href="#Append">func Append(s Value, x ...Value) Value</a>

```
searchKey: reflect.Append
tags: [function]
```

```Go
func Append(s Value, x ...Value) Value
```

Append appends the values x to a slice s and returns the resulting slice. As in Go, each x's value must be assignable to the slice's element type. 

#### <a id="AppendSlice" href="#AppendSlice">func AppendSlice(s, t Value) Value</a>

```
searchKey: reflect.AppendSlice
tags: [function]
```

```Go
func AppendSlice(s, t Value) Value
```

AppendSlice appends a slice t to a slice s and returns the resulting slice. The slices s and t must have the same element type. 

#### <a id="Indirect" href="#Indirect">func Indirect(v Value) Value</a>

```
searchKey: reflect.Indirect
tags: [function]
```

```Go
func Indirect(v Value) Value
```

Indirect returns the value that v points to. If v is a nil pointer, Indirect returns a zero Value. If v is not a pointer, Indirect returns v. 

#### <a id="MakeChan" href="#MakeChan">func MakeChan(typ Type, buffer int) Value</a>

```
searchKey: reflect.MakeChan
tags: [function]
```

```Go
func MakeChan(typ Type, buffer int) Value
```

MakeChan creates a new channel with the specified type and buffer size. 

#### <a id="MakeFunc" href="#MakeFunc">func MakeFunc(typ Type, fn func(args []Value) (results []Value)) Value</a>

```
searchKey: reflect.MakeFunc
tags: [function]
```

```Go
func MakeFunc(typ Type, fn func(args []Value) (results []Value)) Value
```

MakeFunc returns a new function of the given Type that wraps the function fn. When called, that new function does the following: 

```
- converts its arguments to a slice of Values.
- runs results := fn(args).
- returns the results as a slice of Values, one per formal result.

```
The implementation fn can assume that the argument Value slice has the number and type of arguments given by typ. If typ describes a variadic function, the final Value is itself a slice representing the variadic arguments, as in the body of a variadic function. The result Value slice returned by fn must have the number and type of results given by typ. 

The Value.Call method allows the caller to invoke a typed function in terms of Values; in contrast, MakeFunc allows the caller to implement a typed function in terms of Values. 

The Examples section of the documentation includes an illustration of how to use MakeFunc to build a swap function for different types. 

#### <a id="MakeMap" href="#MakeMap">func MakeMap(typ Type) Value</a>

```
searchKey: reflect.MakeMap
tags: [function]
```

```Go
func MakeMap(typ Type) Value
```

MakeMap creates a new map with the specified type. 

#### <a id="MakeMapWithSize" href="#MakeMapWithSize">func MakeMapWithSize(typ Type, n int) Value</a>

```
searchKey: reflect.MakeMapWithSize
tags: [function]
```

```Go
func MakeMapWithSize(typ Type, n int) Value
```

MakeMapWithSize creates a new map with the specified type and initial space for approximately n elements. 

#### <a id="MakeRO" href="#MakeRO">func MakeRO(v Value) Value</a>

```
searchKey: reflect.MakeRO
tags: [function private]
```

```Go
func MakeRO(v Value) Value
```

MakeRO returns a copy of v with the read-only flag set. 

#### <a id="MakeSlice" href="#MakeSlice">func MakeSlice(typ Type, len, cap int) Value</a>

```
searchKey: reflect.MakeSlice
tags: [function]
```

```Go
func MakeSlice(typ Type, len, cap int) Value
```

MakeSlice creates a new zero-initialized slice value for the specified slice type, length, and capacity. 

#### <a id="New" href="#New">func New(typ Type) Value</a>

```
searchKey: reflect.New
tags: [function]
```

```Go
func New(typ Type) Value
```

New returns a Value representing a pointer to a new zero value for the specified type. That is, the returned Value's Type is PtrTo(typ). 

#### <a id="NewAt" href="#NewAt">func NewAt(typ Type, p unsafe.Pointer) Value</a>

```
searchKey: reflect.NewAt
tags: [function]
```

```Go
func NewAt(typ Type, p unsafe.Pointer) Value
```

NewAt returns a Value representing a pointer to a value of the specified type, using p as that pointer. 

#### <a id="Select" href="#Select">func Select(cases []SelectCase) (chosen int, recv Value, recvOK bool)</a>

```
searchKey: reflect.Select
tags: [function]
```

```Go
func Select(cases []SelectCase) (chosen int, recv Value, recvOK bool)
```

Select executes a select operation described by the list of cases. Like the Go select statement, it blocks until at least one of the cases can proceed, makes a uniform pseudo-random choice, and then executes that case. It returns the index of the chosen case and, if that case was a receive operation, the value received and a boolean indicating whether the value corresponds to a send on the channel (as opposed to a zero value received because the channel is closed). Select supports a maximum of 65536 cases. 

#### <a id="ValueOf" href="#ValueOf">func ValueOf(i interface{}) Value</a>

```
searchKey: reflect.ValueOf
tags: [function]
```

```Go
func ValueOf(i interface{}) Value
```

ValueOf returns a new Value initialized to the concrete value stored in the interface i. ValueOf(nil) returns the zero Value. 

#### <a id="Zero" href="#Zero">func Zero(typ Type) Value</a>

```
searchKey: reflect.Zero
tags: [function]
```

```Go
func Zero(typ Type) Value
```

Zero returns a Value representing the zero value for the specified type. The result is different from the zero value of the Value struct, which represents no value at all. For example, Zero(TypeOf(42)) returns a Value with Kind Int and value 0. The returned value is neither addressable nor settable. 

#### <a id="copyVal" href="#copyVal">func copyVal(typ *rtype, fl flag, ptr unsafe.Pointer) Value</a>

```
searchKey: reflect.copyVal
tags: [function private]
```

```Go
func copyVal(typ *rtype, fl flag, ptr unsafe.Pointer) Value
```

copyVal returns a Value containing the map key or value at ptr, allocating a new variable as needed. 

#### <a id="cvtBytesString" href="#cvtBytesString">func cvtBytesString(v Value, t Type) Value</a>

```
searchKey: reflect.cvtBytesString
tags: [function private]
```

```Go
func cvtBytesString(v Value, t Type) Value
```

convertOp: []byte -> string 

#### <a id="cvtComplex" href="#cvtComplex">func cvtComplex(v Value, t Type) Value</a>

```
searchKey: reflect.cvtComplex
tags: [function private]
```

```Go
func cvtComplex(v Value, t Type) Value
```

convertOp: complexXX -> complexXX 

#### <a id="cvtDirect" href="#cvtDirect">func cvtDirect(v Value, typ Type) Value</a>

```
searchKey: reflect.cvtDirect
tags: [function private]
```

```Go
func cvtDirect(v Value, typ Type) Value
```

convertOp: direct copy 

#### <a id="cvtFloat" href="#cvtFloat">func cvtFloat(v Value, t Type) Value</a>

```
searchKey: reflect.cvtFloat
tags: [function private]
```

```Go
func cvtFloat(v Value, t Type) Value
```

convertOp: floatXX -> floatXX 

#### <a id="cvtFloatInt" href="#cvtFloatInt">func cvtFloatInt(v Value, t Type) Value</a>

```
searchKey: reflect.cvtFloatInt
tags: [function private]
```

```Go
func cvtFloatInt(v Value, t Type) Value
```

convertOp: floatXX -> intXX 

#### <a id="cvtFloatUint" href="#cvtFloatUint">func cvtFloatUint(v Value, t Type) Value</a>

```
searchKey: reflect.cvtFloatUint
tags: [function private]
```

```Go
func cvtFloatUint(v Value, t Type) Value
```

convertOp: floatXX -> uintXX 

#### <a id="cvtI2I" href="#cvtI2I">func cvtI2I(v Value, typ Type) Value</a>

```
searchKey: reflect.cvtI2I
tags: [function private]
```

```Go
func cvtI2I(v Value, typ Type) Value
```

convertOp: interface -> interface 

#### <a id="cvtInt" href="#cvtInt">func cvtInt(v Value, t Type) Value</a>

```
searchKey: reflect.cvtInt
tags: [function private]
```

```Go
func cvtInt(v Value, t Type) Value
```

convertOp: intXX -> [u]intXX 

#### <a id="cvtIntFloat" href="#cvtIntFloat">func cvtIntFloat(v Value, t Type) Value</a>

```
searchKey: reflect.cvtIntFloat
tags: [function private]
```

```Go
func cvtIntFloat(v Value, t Type) Value
```

convertOp: intXX -> floatXX 

#### <a id="cvtIntString" href="#cvtIntString">func cvtIntString(v Value, t Type) Value</a>

```
searchKey: reflect.cvtIntString
tags: [function private]
```

```Go
func cvtIntString(v Value, t Type) Value
```

convertOp: intXX -> string 

#### <a id="cvtRunesString" href="#cvtRunesString">func cvtRunesString(v Value, t Type) Value</a>

```
searchKey: reflect.cvtRunesString
tags: [function private]
```

```Go
func cvtRunesString(v Value, t Type) Value
```

convertOp: []rune -> string 

#### <a id="cvtSliceArrayPtr" href="#cvtSliceArrayPtr">func cvtSliceArrayPtr(v Value, t Type) Value</a>

```
searchKey: reflect.cvtSliceArrayPtr
tags: [function private]
```

```Go
func cvtSliceArrayPtr(v Value, t Type) Value
```

convertOp: []T -> *[N]T 

#### <a id="cvtStringBytes" href="#cvtStringBytes">func cvtStringBytes(v Value, t Type) Value</a>

```
searchKey: reflect.cvtStringBytes
tags: [function private]
```

```Go
func cvtStringBytes(v Value, t Type) Value
```

convertOp: string -> []byte 

#### <a id="cvtStringRunes" href="#cvtStringRunes">func cvtStringRunes(v Value, t Type) Value</a>

```
searchKey: reflect.cvtStringRunes
tags: [function private]
```

```Go
func cvtStringRunes(v Value, t Type) Value
```

convertOp: string -> []rune 

#### <a id="cvtT2I" href="#cvtT2I">func cvtT2I(v Value, typ Type) Value</a>

```
searchKey: reflect.cvtT2I
tags: [function private]
```

```Go
func cvtT2I(v Value, typ Type) Value
```

convertOp: concrete -> interface 

#### <a id="cvtUint" href="#cvtUint">func cvtUint(v Value, t Type) Value</a>

```
searchKey: reflect.cvtUint
tags: [function private]
```

```Go
func cvtUint(v Value, t Type) Value
```

convertOp: uintXX -> [u]intXX 

#### <a id="cvtUintFloat" href="#cvtUintFloat">func cvtUintFloat(v Value, t Type) Value</a>

```
searchKey: reflect.cvtUintFloat
tags: [function private]
```

```Go
func cvtUintFloat(v Value, t Type) Value
```

convertOp: uintXX -> floatXX 

#### <a id="cvtUintString" href="#cvtUintString">func cvtUintString(v Value, t Type) Value</a>

```
searchKey: reflect.cvtUintString
tags: [function private]
```

```Go
func cvtUintString(v Value, t Type) Value
```

convertOp: uintXX -> string 

#### <a id="grow" href="#grow">func grow(s Value, extra int) (Value, int, int)</a>

```
searchKey: reflect.grow
tags: [function private]
```

```Go
func grow(s Value, extra int) (Value, int, int)
```

grow grows the slice s so that it can hold extra more values, allocating more capacity if needed. It also returns the old and new slice lengths. 

#### <a id="makeBytes" href="#makeBytes">func makeBytes(f flag, v []byte, t Type) Value</a>

```
searchKey: reflect.makeBytes
tags: [function private]
```

```Go
func makeBytes(f flag, v []byte, t Type) Value
```

#### <a id="makeComplex" href="#makeComplex">func makeComplex(f flag, v complex128, t Type) Value</a>

```
searchKey: reflect.makeComplex
tags: [function private]
```

```Go
func makeComplex(f flag, v complex128, t Type) Value
```

makeComplex returns a Value of type t equal to v (possibly truncated to complex64), where t is a complex64 or complex128 type. 

#### <a id="makeFloat" href="#makeFloat">func makeFloat(f flag, v float64, t Type) Value</a>

```
searchKey: reflect.makeFloat
tags: [function private]
```

```Go
func makeFloat(f flag, v float64, t Type) Value
```

makeFloat returns a Value of type t equal to v (possibly truncated to float32), where t is a float32 or float64 type. 

#### <a id="makeFloat32" href="#makeFloat32">func makeFloat32(f flag, v float32, t Type) Value</a>

```
searchKey: reflect.makeFloat32
tags: [function private]
```

```Go
func makeFloat32(f flag, v float32, t Type) Value
```

makeFloat returns a Value of type t equal to v, where t is a float32 type. 

#### <a id="makeInt" href="#makeInt">func makeInt(f flag, bits uint64, t Type) Value</a>

```
searchKey: reflect.makeInt
tags: [function private]
```

```Go
func makeInt(f flag, bits uint64, t Type) Value
```

makeInt returns a Value of type t equal to bits (possibly truncated), where t is a signed or unsigned int type. 

#### <a id="makeMethodValue" href="#makeMethodValue">func makeMethodValue(op string, v Value) Value</a>

```
searchKey: reflect.makeMethodValue
tags: [function private]
```

```Go
func makeMethodValue(op string, v Value) Value
```

makeMethodValue converts v from the rcvr+method index representation of a method value to an actual method func value, which is basically the receiver value with a special bit set, into a true func value - a value holding an actual func. The output is semantically equivalent to the input as far as the user of package reflect can tell, but the true func representation can be handled by code like Convert and Interface and Assign. 

#### <a id="makeRunes" href="#makeRunes">func makeRunes(f flag, v []rune, t Type) Value</a>

```
searchKey: reflect.makeRunes
tags: [function private]
```

```Go
func makeRunes(f flag, v []rune, t Type) Value
```

#### <a id="makeString" href="#makeString">func makeString(f flag, v string, t Type) Value</a>

```
searchKey: reflect.makeString
tags: [function private]
```

```Go
func makeString(f flag, v string, t Type) Value
```

#### <a id="unpackEface" href="#unpackEface">func unpackEface(i interface{}) Value</a>

```
searchKey: reflect.unpackEface
tags: [function private]
```

```Go
func unpackEface(i interface{}) Value
```

unpackEface converts the empty interface i to a Value. 

#### <a id="Value.Addr" href="#Value.Addr">func (v Value) Addr() Value</a>

```
searchKey: reflect.Value.Addr
tags: [method]
```

```Go
func (v Value) Addr() Value
```

Addr returns a pointer value representing the address of v. It panics if CanAddr() returns false. Addr is typically used to obtain a pointer to a struct field or slice element in order to call a method that requires a pointer receiver. 

#### <a id="Value.Bool" href="#Value.Bool">func (v Value) Bool() bool</a>

```
searchKey: reflect.Value.Bool
tags: [method]
```

```Go
func (v Value) Bool() bool
```

Bool returns v's underlying value. It panics if v's kind is not Bool. 

#### <a id="Value.Bytes" href="#Value.Bytes">func (v Value) Bytes() []byte</a>

```
searchKey: reflect.Value.Bytes
tags: [method]
```

```Go
func (v Value) Bytes() []byte
```

Bytes returns v's underlying value. It panics if v's underlying value is not a slice of bytes. 

#### <a id="Value.Call" href="#Value.Call">func (v Value) Call(in []Value) []Value</a>

```
searchKey: reflect.Value.Call
tags: [method]
```

```Go
func (v Value) Call(in []Value) []Value
```

Call calls the function v with the input arguments in. For example, if len(in) == 3, v.Call(in) represents the Go call v(in[0], in[1], in[2]). Call panics if v's Kind is not Func. It returns the output results as Values. As in Go, each input argument must be assignable to the type of the function's corresponding input parameter. If v is a variadic function, Call creates the variadic slice parameter itself, copying in the corresponding values. 

#### <a id="Value.CallSlice" href="#Value.CallSlice">func (v Value) CallSlice(in []Value) []Value</a>

```
searchKey: reflect.Value.CallSlice
tags: [method]
```

```Go
func (v Value) CallSlice(in []Value) []Value
```

CallSlice calls the variadic function v with the input arguments in, assigning the slice in[len(in)-1] to v's final variadic argument. For example, if len(in) == 3, v.CallSlice(in) represents the Go call v(in[0], in[1], in[2]...). CallSlice panics if v's Kind is not Func or if v is not variadic. It returns the output results as Values. As in Go, each input argument must be assignable to the type of the function's corresponding input parameter. 

#### <a id="Value.CanAddr" href="#Value.CanAddr">func (v Value) CanAddr() bool</a>

```
searchKey: reflect.Value.CanAddr
tags: [method]
```

```Go
func (v Value) CanAddr() bool
```

CanAddr reports whether the value's address can be obtained with Addr. Such values are called addressable. A value is addressable if it is an element of a slice, an element of an addressable array, a field of an addressable struct, or the result of dereferencing a pointer. If CanAddr returns false, calling Addr will panic. 

#### <a id="Value.CanInterface" href="#Value.CanInterface">func (v Value) CanInterface() bool</a>

```
searchKey: reflect.Value.CanInterface
tags: [method]
```

```Go
func (v Value) CanInterface() bool
```

CanInterface reports whether Interface can be used without panicking. 

#### <a id="Value.CanSet" href="#Value.CanSet">func (v Value) CanSet() bool</a>

```
searchKey: reflect.Value.CanSet
tags: [method]
```

```Go
func (v Value) CanSet() bool
```

CanSet reports whether the value of v can be changed. A Value can be changed only if it is addressable and was not obtained by the use of unexported struct fields. If CanSet returns false, calling Set or any type-specific setter (e.g., SetBool, SetInt) will panic. 

#### <a id="Value.Cap" href="#Value.Cap">func (v Value) Cap() int</a>

```
searchKey: reflect.Value.Cap
tags: [method]
```

```Go
func (v Value) Cap() int
```

Cap returns v's capacity. It panics if v's Kind is not Array, Chan, or Slice. 

#### <a id="Value.Close" href="#Value.Close">func (v Value) Close()</a>

```
searchKey: reflect.Value.Close
tags: [method]
```

```Go
func (v Value) Close()
```

Close closes the channel v. It panics if v's Kind is not Chan. 

#### <a id="Value.Complex" href="#Value.Complex">func (v Value) Complex() complex128</a>

```
searchKey: reflect.Value.Complex
tags: [method]
```

```Go
func (v Value) Complex() complex128
```

Complex returns v's underlying value, as a complex128. It panics if v's Kind is not Complex64 or Complex128 

#### <a id="Value.Convert" href="#Value.Convert">func (v Value) Convert(t Type) Value</a>

```
searchKey: reflect.Value.Convert
tags: [method]
```

```Go
func (v Value) Convert(t Type) Value
```

Convert returns the value v converted to type t. If the usual Go conversion rules do not allow conversion of the value v to type t, or if converting v to type t panics, Convert panics. 

#### <a id="Value.Elem" href="#Value.Elem">func (v Value) Elem() Value</a>

```
searchKey: reflect.Value.Elem
tags: [method]
```

```Go
func (v Value) Elem() Value
```

Elem returns the value that the interface v contains or that the pointer v points to. It panics if v's Kind is not Interface or Ptr. It returns the zero Value if v is nil. 

#### <a id="Value.Field" href="#Value.Field">func (v Value) Field(i int) Value</a>

```
searchKey: reflect.Value.Field
tags: [method]
```

```Go
func (v Value) Field(i int) Value
```

Field returns the i'th field of the struct v. It panics if v's Kind is not Struct or i is out of range. 

#### <a id="Value.FieldByIndex" href="#Value.FieldByIndex">func (v Value) FieldByIndex(index []int) Value</a>

```
searchKey: reflect.Value.FieldByIndex
tags: [method]
```

```Go
func (v Value) FieldByIndex(index []int) Value
```

FieldByIndex returns the nested field corresponding to index. It panics if v's Kind is not struct. 

#### <a id="Value.FieldByName" href="#Value.FieldByName">func (v Value) FieldByName(name string) Value</a>

```
searchKey: reflect.Value.FieldByName
tags: [method]
```

```Go
func (v Value) FieldByName(name string) Value
```

FieldByName returns the struct field with the given name. It returns the zero Value if no field was found. It panics if v's Kind is not struct. 

#### <a id="Value.FieldByNameFunc" href="#Value.FieldByNameFunc">func (v Value) FieldByNameFunc(match func(string) bool) Value</a>

```
searchKey: reflect.Value.FieldByNameFunc
tags: [method]
```

```Go
func (v Value) FieldByNameFunc(match func(string) bool) Value
```

FieldByNameFunc returns the struct field with a name that satisfies the match function. It panics if v's Kind is not struct. It returns the zero Value if no field was found. 

#### <a id="Value.Float" href="#Value.Float">func (v Value) Float() float64</a>

```
searchKey: reflect.Value.Float
tags: [method]
```

```Go
func (v Value) Float() float64
```

Float returns v's underlying value, as a float64. It panics if v's Kind is not Float32 or Float64 

#### <a id="Value.Index" href="#Value.Index">func (v Value) Index(i int) Value</a>

```
searchKey: reflect.Value.Index
tags: [method]
```

```Go
func (v Value) Index(i int) Value
```

Index returns v's i'th element. It panics if v's Kind is not Array, Slice, or String or i is out of range. 

#### <a id="Value.Int" href="#Value.Int">func (v Value) Int() int64</a>

```
searchKey: reflect.Value.Int
tags: [method]
```

```Go
func (v Value) Int() int64
```

Int returns v's underlying value, as an int64. It panics if v's Kind is not Int, Int8, Int16, Int32, or Int64. 

#### <a id="Value.Interface" href="#Value.Interface">func (v Value) Interface() (i interface{})</a>

```
searchKey: reflect.Value.Interface
tags: [method]
```

```Go
func (v Value) Interface() (i interface{})
```

Interface returns v's current value as an interface{}. It is equivalent to: 

```
var i interface{} = (v's underlying value)

```
It panics if the Value was obtained by accessing unexported struct fields. 

#### <a id="Value.InterfaceData" href="#Value.InterfaceData">func (v Value) InterfaceData() [2]uintptr</a>

```
searchKey: reflect.Value.InterfaceData
tags: [method]
```

```Go
func (v Value) InterfaceData() [2]uintptr
```

InterfaceData returns the interface v's value as a uintptr pair. It panics if v's Kind is not Interface. 

#### <a id="Value.IsNil" href="#Value.IsNil">func (v Value) IsNil() bool</a>

```
searchKey: reflect.Value.IsNil
tags: [method]
```

```Go
func (v Value) IsNil() bool
```

IsNil reports whether its argument v is nil. The argument must be a chan, func, interface, map, pointer, or slice value; if it is not, IsNil panics. Note that IsNil is not always equivalent to a regular comparison with nil in Go. For example, if v was created by calling ValueOf with an uninitialized interface variable i, i==nil will be true but v.IsNil will panic as v will be the zero Value. 

#### <a id="Value.IsValid" href="#Value.IsValid">func (v Value) IsValid() bool</a>

```
searchKey: reflect.Value.IsValid
tags: [method]
```

```Go
func (v Value) IsValid() bool
```

IsValid reports whether v represents a value. It returns false if v is the zero Value. If IsValid returns false, all other methods except String panic. Most functions and methods never return an invalid Value. If one does, its documentation states the conditions explicitly. 

#### <a id="Value.IsZero" href="#Value.IsZero">func (v Value) IsZero() bool</a>

```
searchKey: reflect.Value.IsZero
tags: [method]
```

```Go
func (v Value) IsZero() bool
```

IsZero reports whether v is the zero value for its type. It panics if the argument is invalid. 

#### <a id="Value.Kind" href="#Value.Kind">func (v Value) Kind() Kind</a>

```
searchKey: reflect.Value.Kind
tags: [method]
```

```Go
func (v Value) Kind() Kind
```

Kind returns v's Kind. If v is the zero Value (IsValid returns false), Kind returns Invalid. 

#### <a id="Value.Len" href="#Value.Len">func (v Value) Len() int</a>

```
searchKey: reflect.Value.Len
tags: [method]
```

```Go
func (v Value) Len() int
```

Len returns v's length. It panics if v's Kind is not Array, Chan, Map, Slice, or String. 

#### <a id="Value.MapIndex" href="#Value.MapIndex">func (v Value) MapIndex(key Value) Value</a>

```
searchKey: reflect.Value.MapIndex
tags: [method]
```

```Go
func (v Value) MapIndex(key Value) Value
```

MapIndex returns the value associated with key in the map v. It panics if v's Kind is not Map. It returns the zero Value if key is not found in the map or if v represents a nil map. As in Go, the key's value must be assignable to the map's key type. 

#### <a id="Value.MapKeys" href="#Value.MapKeys">func (v Value) MapKeys() []Value</a>

```
searchKey: reflect.Value.MapKeys
tags: [method]
```

```Go
func (v Value) MapKeys() []Value
```

MapKeys returns a slice containing all the keys present in the map, in unspecified order. It panics if v's Kind is not Map. It returns an empty slice if v represents a nil map. 

#### <a id="Value.MapRange" href="#Value.MapRange">func (v Value) MapRange() *MapIter</a>

```
searchKey: reflect.Value.MapRange
tags: [method]
```

```Go
func (v Value) MapRange() *MapIter
```

MapRange returns a range iterator for a map. It panics if v's Kind is not Map. 

Call Next to advance the iterator, and Key/Value to access each entry. Next returns false when the iterator is exhausted. MapRange follows the same iteration semantics as a range statement. 

Example: 

```
iter := reflect.ValueOf(m).MapRange()
for iter.Next() {
	k := iter.Key()
	v := iter.Value()
	...
}

```
#### <a id="Value.Method" href="#Value.Method">func (v Value) Method(i int) Value</a>

```
searchKey: reflect.Value.Method
tags: [method]
```

```Go
func (v Value) Method(i int) Value
```

Method returns a function value corresponding to v's i'th method. The arguments to a Call on the returned function should not include a receiver; the returned function will always use v as the receiver. Method panics if i is out of range or if v is a nil interface value. 

#### <a id="Value.MethodByName" href="#Value.MethodByName">func (v Value) MethodByName(name string) Value</a>

```
searchKey: reflect.Value.MethodByName
tags: [method]
```

```Go
func (v Value) MethodByName(name string) Value
```

MethodByName returns a function value corresponding to the method of v with the given name. The arguments to a Call on the returned function should not include a receiver; the returned function will always use v as the receiver. It returns the zero Value if no method was found. 

#### <a id="Value.NumField" href="#Value.NumField">func (v Value) NumField() int</a>

```
searchKey: reflect.Value.NumField
tags: [method]
```

```Go
func (v Value) NumField() int
```

NumField returns the number of fields in the struct v. It panics if v's Kind is not Struct. 

#### <a id="Value.NumMethod" href="#Value.NumMethod">func (v Value) NumMethod() int</a>

```
searchKey: reflect.Value.NumMethod
tags: [method]
```

```Go
func (v Value) NumMethod() int
```

NumMethod returns the number of exported methods in the value's method set. 

#### <a id="Value.OverflowComplex" href="#Value.OverflowComplex">func (v Value) OverflowComplex(x complex128) bool</a>

```
searchKey: reflect.Value.OverflowComplex
tags: [method]
```

```Go
func (v Value) OverflowComplex(x complex128) bool
```

OverflowComplex reports whether the complex128 x cannot be represented by v's type. It panics if v's Kind is not Complex64 or Complex128. 

#### <a id="Value.OverflowFloat" href="#Value.OverflowFloat">func (v Value) OverflowFloat(x float64) bool</a>

```
searchKey: reflect.Value.OverflowFloat
tags: [method]
```

```Go
func (v Value) OverflowFloat(x float64) bool
```

OverflowFloat reports whether the float64 x cannot be represented by v's type. It panics if v's Kind is not Float32 or Float64. 

#### <a id="Value.OverflowInt" href="#Value.OverflowInt">func (v Value) OverflowInt(x int64) bool</a>

```
searchKey: reflect.Value.OverflowInt
tags: [method]
```

```Go
func (v Value) OverflowInt(x int64) bool
```

OverflowInt reports whether the int64 x cannot be represented by v's type. It panics if v's Kind is not Int, Int8, Int16, Int32, or Int64. 

#### <a id="Value.OverflowUint" href="#Value.OverflowUint">func (v Value) OverflowUint(x uint64) bool</a>

```
searchKey: reflect.Value.OverflowUint
tags: [method]
```

```Go
func (v Value) OverflowUint(x uint64) bool
```

OverflowUint reports whether the uint64 x cannot be represented by v's type. It panics if v's Kind is not Uint, Uintptr, Uint8, Uint16, Uint32, or Uint64. 

#### <a id="Value.Pointer" href="#Value.Pointer">func (v Value) Pointer() uintptr</a>

```
searchKey: reflect.Value.Pointer
tags: [method]
```

```Go
func (v Value) Pointer() uintptr
```

Pointer returns v's value as a uintptr. It returns uintptr instead of unsafe.Pointer so that code using reflect cannot obtain unsafe.Pointers without importing the unsafe package explicitly. It panics if v's Kind is not Chan, Func, Map, Ptr, Slice, or UnsafePointer. 

If v's Kind is Func, the returned pointer is an underlying code pointer, but not necessarily enough to identify a single function uniquely. The only guarantee is that the result is zero if and only if v is a nil func Value. 

If v's Kind is Slice, the returned pointer is to the first element of the slice. If the slice is nil the returned value is 0.  If the slice is empty but non-nil the return value is non-zero. 

#### <a id="Value.Recv" href="#Value.Recv">func (v Value) Recv() (x Value, ok bool)</a>

```
searchKey: reflect.Value.Recv
tags: [method]
```

```Go
func (v Value) Recv() (x Value, ok bool)
```

Recv receives and returns a value from the channel v. It panics if v's Kind is not Chan. The receive blocks until a value is ready. The boolean value ok is true if the value x corresponds to a send on the channel, false if it is a zero value received because the channel is closed. 

#### <a id="Value.Send" href="#Value.Send">func (v Value) Send(x Value)</a>

```
searchKey: reflect.Value.Send
tags: [method]
```

```Go
func (v Value) Send(x Value)
```

Send sends x on the channel v. It panics if v's kind is not Chan or if x's type is not the same type as v's element type. As in Go, x's value must be assignable to the channel's element type. 

#### <a id="Value.Set" href="#Value.Set">func (v Value) Set(x Value)</a>

```
searchKey: reflect.Value.Set
tags: [method]
```

```Go
func (v Value) Set(x Value)
```

Set assigns x to the value v. It panics if CanSet returns false. As in Go, x's value must be assignable to v's type. 

#### <a id="Value.SetBool" href="#Value.SetBool">func (v Value) SetBool(x bool)</a>

```
searchKey: reflect.Value.SetBool
tags: [method]
```

```Go
func (v Value) SetBool(x bool)
```

SetBool sets v's underlying value. It panics if v's Kind is not Bool or if CanSet() is false. 

#### <a id="Value.SetBytes" href="#Value.SetBytes">func (v Value) SetBytes(x []byte)</a>

```
searchKey: reflect.Value.SetBytes
tags: [method]
```

```Go
func (v Value) SetBytes(x []byte)
```

SetBytes sets v's underlying value. It panics if v's underlying value is not a slice of bytes. 

#### <a id="Value.SetCap" href="#Value.SetCap">func (v Value) SetCap(n int)</a>

```
searchKey: reflect.Value.SetCap
tags: [method]
```

```Go
func (v Value) SetCap(n int)
```

SetCap sets v's capacity to n. It panics if v's Kind is not Slice or if n is smaller than the length or greater than the capacity of the slice. 

#### <a id="Value.SetComplex" href="#Value.SetComplex">func (v Value) SetComplex(x complex128)</a>

```
searchKey: reflect.Value.SetComplex
tags: [method]
```

```Go
func (v Value) SetComplex(x complex128)
```

SetComplex sets v's underlying value to x. It panics if v's Kind is not Complex64 or Complex128, or if CanSet() is false. 

#### <a id="Value.SetFloat" href="#Value.SetFloat">func (v Value) SetFloat(x float64)</a>

```
searchKey: reflect.Value.SetFloat
tags: [method]
```

```Go
func (v Value) SetFloat(x float64)
```

SetFloat sets v's underlying value to x. It panics if v's Kind is not Float32 or Float64, or if CanSet() is false. 

#### <a id="Value.SetInt" href="#Value.SetInt">func (v Value) SetInt(x int64)</a>

```
searchKey: reflect.Value.SetInt
tags: [method]
```

```Go
func (v Value) SetInt(x int64)
```

SetInt sets v's underlying value to x. It panics if v's Kind is not Int, Int8, Int16, Int32, or Int64, or if CanSet() is false. 

#### <a id="Value.SetLen" href="#Value.SetLen">func (v Value) SetLen(n int)</a>

```
searchKey: reflect.Value.SetLen
tags: [method]
```

```Go
func (v Value) SetLen(n int)
```

SetLen sets v's length to n. It panics if v's Kind is not Slice or if n is negative or greater than the capacity of the slice. 

#### <a id="Value.SetMapIndex" href="#Value.SetMapIndex">func (v Value) SetMapIndex(key, elem Value)</a>

```
searchKey: reflect.Value.SetMapIndex
tags: [method]
```

```Go
func (v Value) SetMapIndex(key, elem Value)
```

SetMapIndex sets the element associated with key in the map v to elem. It panics if v's Kind is not Map. If elem is the zero Value, SetMapIndex deletes the key from the map. Otherwise if v holds a nil map, SetMapIndex will panic. As in Go, key's elem must be assignable to the map's key type, and elem's value must be assignable to the map's elem type. 

#### <a id="Value.SetPointer" href="#Value.SetPointer">func (v Value) SetPointer(x unsafe.Pointer)</a>

```
searchKey: reflect.Value.SetPointer
tags: [method]
```

```Go
func (v Value) SetPointer(x unsafe.Pointer)
```

SetPointer sets the unsafe.Pointer value v to x. It panics if v's Kind is not UnsafePointer. 

#### <a id="Value.SetString" href="#Value.SetString">func (v Value) SetString(x string)</a>

```
searchKey: reflect.Value.SetString
tags: [method]
```

```Go
func (v Value) SetString(x string)
```

SetString sets v's underlying value to x. It panics if v's Kind is not String or if CanSet() is false. 

#### <a id="Value.SetUint" href="#Value.SetUint">func (v Value) SetUint(x uint64)</a>

```
searchKey: reflect.Value.SetUint
tags: [method]
```

```Go
func (v Value) SetUint(x uint64)
```

SetUint sets v's underlying value to x. It panics if v's Kind is not Uint, Uintptr, Uint8, Uint16, Uint32, or Uint64, or if CanSet() is false. 

#### <a id="Value.Slice" href="#Value.Slice">func (v Value) Slice(i, j int) Value</a>

```
searchKey: reflect.Value.Slice
tags: [method]
```

```Go
func (v Value) Slice(i, j int) Value
```

Slice returns v[i:j]. It panics if v's Kind is not Array, Slice or String, or if v is an unaddressable array, or if the indexes are out of bounds. 

#### <a id="Value.Slice3" href="#Value.Slice3">func (v Value) Slice3(i, j, k int) Value</a>

```
searchKey: reflect.Value.Slice3
tags: [method]
```

```Go
func (v Value) Slice3(i, j, k int) Value
```

Slice3 is the 3-index form of the slice operation: it returns v[i:j:k]. It panics if v's Kind is not Array or Slice, or if v is an unaddressable array, or if the indexes are out of bounds. 

#### <a id="Value.String" href="#Value.String">func (v Value) String() string</a>

```
searchKey: reflect.Value.String
tags: [method]
```

```Go
func (v Value) String() string
```

String returns the string v's underlying value, as a string. String is a special case because of Go's String method convention. Unlike the other getters, it does not panic if v's Kind is not String. Instead, it returns a string of the form "<T value>" where T is v's type. The fmt package treats Values specially. It does not call their String method implicitly but instead prints the concrete values they hold. 

#### <a id="Value.TryRecv" href="#Value.TryRecv">func (v Value) TryRecv() (x Value, ok bool)</a>

```
searchKey: reflect.Value.TryRecv
tags: [method]
```

```Go
func (v Value) TryRecv() (x Value, ok bool)
```

TryRecv attempts to receive a value from the channel v but will not block. It panics if v's Kind is not Chan. If the receive delivers a value, x is the transferred value and ok is true. If the receive cannot finish without blocking, x is the zero Value and ok is false. If the channel is closed, x is the zero value for the channel's element type and ok is false. 

#### <a id="Value.TrySend" href="#Value.TrySend">func (v Value) TrySend(x Value) bool</a>

```
searchKey: reflect.Value.TrySend
tags: [method]
```

```Go
func (v Value) TrySend(x Value) bool
```

TrySend attempts to send x on the channel v but will not block. It panics if v's Kind is not Chan. It reports whether the value was sent. As in Go, x's value must be assignable to the channel's element type. 

#### <a id="Value.Type" href="#Value.Type">func (v Value) Type() Type</a>

```
searchKey: reflect.Value.Type
tags: [method]
```

```Go
func (v Value) Type() Type
```

Type returns v's type. 

#### <a id="Value.Uint" href="#Value.Uint">func (v Value) Uint() uint64</a>

```
searchKey: reflect.Value.Uint
tags: [method]
```

```Go
func (v Value) Uint() uint64
```

Uint returns v's underlying value, as a uint64. It panics if v's Kind is not Uint, Uintptr, Uint8, Uint16, Uint32, or Uint64. 

#### <a id="Value.UnsafeAddr" href="#Value.UnsafeAddr">func (v Value) UnsafeAddr() uintptr</a>

```
searchKey: reflect.Value.UnsafeAddr
tags: [method]
```

```Go
func (v Value) UnsafeAddr() uintptr
```

UnsafeAddr returns a pointer to v's data. It is for advanced clients that also import the "unsafe" package. It panics if v is not addressable. 

#### <a id="Value.assignTo" href="#Value.assignTo">func (v Value) assignTo(context string, dst *rtype, target unsafe.Pointer) Value</a>

```
searchKey: reflect.Value.assignTo
tags: [method private]
```

```Go
func (v Value) assignTo(context string, dst *rtype, target unsafe.Pointer) Value
```

assignTo returns a value v that can be assigned directly to typ. It panics if v is not assignable to typ. For a conversion to an interface type, target is a suggested scratch space to use. target must be initialized memory (or nil). 

#### <a id="Value.call" href="#Value.call">func (v Value) call(op string, in []Value) []Value</a>

```
searchKey: reflect.Value.call
tags: [method private]
```

```Go
func (v Value) call(op string, in []Value) []Value
```

#### <a id="Value.pointer" href="#Value.pointer">func (v Value) pointer() unsafe.Pointer</a>

```
searchKey: reflect.Value.pointer
tags: [method private]
```

```Go
func (v Value) pointer() unsafe.Pointer
```

pointer returns the underlying pointer represented by v. v.Kind() must be Ptr, Map, Chan, Func, or UnsafePointer if v.Kind() == Ptr, the base type must not be go:notinheap. 

#### <a id="Value.recv" href="#Value.recv">func (v Value) recv(nb bool) (val Value, ok bool)</a>

```
searchKey: reflect.Value.recv
tags: [method private]
```

```Go
func (v Value) recv(nb bool) (val Value, ok bool)
```

internal recv, possibly non-blocking (nb). v is known to be a channel. 

#### <a id="Value.runes" href="#Value.runes">func (v Value) runes() []rune</a>

```
searchKey: reflect.Value.runes
tags: [method private]
```

```Go
func (v Value) runes() []rune
```

runes returns v's underlying value. It panics if v's underlying value is not a slice of runes (int32s). 

#### <a id="Value.send" href="#Value.send">func (v Value) send(x Value, nb bool) (selected bool)</a>

```
searchKey: reflect.Value.send
tags: [method private]
```

```Go
func (v Value) send(x Value, nb bool) (selected bool)
```

internal send, possibly non-blocking. v is known to be a channel. 

#### <a id="Value.setRunes" href="#Value.setRunes">func (v Value) setRunes(x []rune)</a>

```
searchKey: reflect.Value.setRunes
tags: [method private]
```

```Go
func (v Value) setRunes(x []rune)
```

setRunes sets v's underlying value. It panics if v's underlying value is not a slice of runes (int32s). 

### <a id="ValueError" href="#ValueError">type ValueError struct</a>

```
searchKey: reflect.ValueError
tags: [struct]
```

```Go
type ValueError struct {
	Method string
	Kind   Kind
}
```

A ValueError occurs when a Value method is invoked on a Value that does not support it. Such cases are documented in the description of each method. 

#### <a id="ValueError.Error" href="#ValueError.Error">func (e *ValueError) Error() string</a>

```
searchKey: reflect.ValueError.Error
tags: [method]
```

```Go
func (e *ValueError) Error() string
```

### <a id="abiDesc" href="#abiDesc">type abiDesc struct</a>

```
searchKey: reflect.abiDesc
tags: [struct private]
```

```Go
type abiDesc struct {
	// call and ret represent the translation steps for
	// the call and return paths of a Go function.
	call, ret abiSeq

	// These fields describe the stack space allocated
	// for the call. stackCallArgsSize is the amount of space
	// reserved for arguments but not return values. retOffset
	// is the offset at which return values begin, and
	// spill is the size in bytes of additional space reserved
	// to spill argument registers into in case of preemption in
	// reflectcall's stack frame.
	stackCallArgsSize, retOffset, spill uintptr

	// stackPtrs is a bitmap that indicates whether
	// each word in the ABI stack space (stack-assigned
	// args + return values) is a pointer. Used
	// as the heap pointer bitmap for stack space
	// passed to reflectcall.
	stackPtrs *bitVector

	// inRegPtrs is a bitmap whose i'th bit indicates
	// whether the i'th integer argument register contains
	// a pointer. Used by makeFuncStub and methodValueCall
	// to make result pointers visible to the GC.
	//
	// outRegPtrs is the same, but for result values.
	// Used by reflectcall to make result pointers visible
	// to the GC.
	inRegPtrs, outRegPtrs abi.IntArgRegBitmap
}
```

abiDesc describes the ABI for a function or method. 

#### <a id="funcLayout" href="#funcLayout">func funcLayout(t *funcType, rcvr *rtype) (frametype *rtype, framePool *sync.Pool, abi abiDesc)</a>

```
searchKey: reflect.funcLayout
tags: [function private]
```

```Go
func funcLayout(t *funcType, rcvr *rtype) (frametype *rtype, framePool *sync.Pool, abi abiDesc)
```

funcLayout computes a struct type representing the layout of the stack-assigned function arguments and return values for the function type t. If rcvr != nil, rcvr specifies the type of the receiver. The returned type exists only for GC, so we only fill out GC relevant info. Currently, that's just size and the GC program. We also fill in the name for possible debugging use. 

#### <a id="newAbiDesc" href="#newAbiDesc">func newAbiDesc(t *funcType, rcvr *rtype) abiDesc</a>

```
searchKey: reflect.newAbiDesc
tags: [function private]
```

```Go
func newAbiDesc(t *funcType, rcvr *rtype) abiDesc
```

#### <a id="abiDesc.dump" href="#abiDesc.dump">func (a *abiDesc) dump()</a>

```
searchKey: reflect.abiDesc.dump
tags: [method private]
```

```Go
func (a *abiDesc) dump()
```

### <a id="abiSeq" href="#abiSeq">type abiSeq struct</a>

```
searchKey: reflect.abiSeq
tags: [struct private]
```

```Go
type abiSeq struct {
	// steps is the set of instructions.
	//
	// The instructions are grouped together by whole arguments,
	// with the starting index for the instructions
	// of the i'th Go value available in valueStart.
	//
	// For instance, if this abiSeq represents 3 arguments
	// passed to a function, then the 2nd argument's steps
	// begin at steps[valueStart[1]].
	//
	// Because reflect accepts Go arguments in distinct
	// Values and each Value is stored separately, each abiStep
	// that begins a new argument will have its offset
	// field == 0.
	steps      []abiStep
	valueStart []int

	stackBytes   uintptr // stack space used
	iregs, fregs int     // registers used
}
```

abiSeq represents a sequence of ABI instructions for copying from a series of reflect.Values to a call frame (for call arguments) or vice-versa (for call results). 

An abiSeq should be populated by calling its addArg method. 

#### <a id="abiSeq.addArg" href="#abiSeq.addArg">func (a *abiSeq) addArg(t *rtype) *abiStep</a>

```
searchKey: reflect.abiSeq.addArg
tags: [method private]
```

```Go
func (a *abiSeq) addArg(t *rtype) *abiStep
```

addArg extends the abiSeq with a new Go value of type t. 

If the value was stack-assigned, returns the single abiStep describing that translation, and nil otherwise. 

#### <a id="abiSeq.addRcvr" href="#abiSeq.addRcvr">func (a *abiSeq) addRcvr(rcvr *rtype) (*abiStep, bool)</a>

```
searchKey: reflect.abiSeq.addRcvr
tags: [method private]
```

```Go
func (a *abiSeq) addRcvr(rcvr *rtype) (*abiStep, bool)
```

addRcvr extends the abiSeq with a new method call receiver according to the interface calling convention. 

If the receiver was stack-assigned, returns the single abiStep describing that translation, and nil otherwise. Returns true if the receiver is a pointer. 

#### <a id="abiSeq.assignFloatN" href="#abiSeq.assignFloatN">func (a *abiSeq) assignFloatN(offset, size uintptr, n int) bool</a>

```
searchKey: reflect.abiSeq.assignFloatN
tags: [method private]
```

```Go
func (a *abiSeq) assignFloatN(offset, size uintptr, n int) bool
```

assignFloatN assigns n values to registers, each "size" bytes large, from the data at [offset, offset+n*size) in memory. Each value at [offset+i*size, offset+(i+1)*size) for i < n is assigned to the next n floating-point registers. 

Returns whether assignment succeeded. 

#### <a id="abiSeq.assignIntN" href="#abiSeq.assignIntN">func (a *abiSeq) assignIntN(offset, size uintptr, n int, ptrMap uint8) bool</a>

```
searchKey: reflect.abiSeq.assignIntN
tags: [method private]
```

```Go
func (a *abiSeq) assignIntN(offset, size uintptr, n int, ptrMap uint8) bool
```

assignIntN assigns n values to registers, each "size" bytes large, from the data at [offset, offset+n*size) in memory. Each value at [offset+i*size, offset+(i+1)*size) for i < n is assigned to the next n integer registers. 

Bit i in ptrMap indicates whether the i'th value is a pointer. n must be <= 8. 

Returns whether assignment succeeded. 

#### <a id="abiSeq.dump" href="#abiSeq.dump">func (a *abiSeq) dump()</a>

```
searchKey: reflect.abiSeq.dump
tags: [method private]
```

```Go
func (a *abiSeq) dump()
```

#### <a id="abiSeq.regAssign" href="#abiSeq.regAssign">func (a *abiSeq) regAssign(t *rtype, offset uintptr) bool</a>

```
searchKey: reflect.abiSeq.regAssign
tags: [method private]
```

```Go
func (a *abiSeq) regAssign(t *rtype, offset uintptr) bool
```

regAssign attempts to reserve argument registers for a value of type t, stored at some offset. 

It returns whether or not the assignment succeeded, but leaves any changes it made to a.steps behind, so the caller must undo that work by adjusting a.steps if it fails. 

This method along with the assign* methods represent the complete register-assignment algorithm for the Go ABI. 

#### <a id="abiSeq.stackAssign" href="#abiSeq.stackAssign">func (a *abiSeq) stackAssign(size, alignment uintptr)</a>

```
searchKey: reflect.abiSeq.stackAssign
tags: [method private]
```

```Go
func (a *abiSeq) stackAssign(size, alignment uintptr)
```

stackAssign reserves space for one value that is "size" bytes large with alignment "alignment" to the stack. 

Should not be called directly; use addArg instead. 

#### <a id="abiSeq.stepsForValue" href="#abiSeq.stepsForValue">func (a *abiSeq) stepsForValue(i int) []abiStep</a>

```
searchKey: reflect.abiSeq.stepsForValue
tags: [method private]
```

```Go
func (a *abiSeq) stepsForValue(i int) []abiStep
```

stepsForValue returns the ABI instructions for translating the i'th Go argument or return value represented by this abiSeq to the Go ABI. 

### <a id="abiStep" href="#abiStep">type abiStep struct</a>

```
searchKey: reflect.abiStep
tags: [struct private]
```

```Go
type abiStep struct {
	kind abiStepKind

	// offset and size together describe a part of a Go value
	// in memory.
	offset uintptr
	size   uintptr // size in bytes of the part

	// These fields describe the ABI side of the translation.
	stkOff uintptr // stack offset, used if kind == abiStepStack
	ireg   int     // integer register index, used if kind == abiStepIntReg or kind == abiStepPointer
	freg   int     // FP register index, used if kind == abiStepFloatReg
}
```

abiStep represents an ABI "instruction." Each instruction describes one part of how to translate between a Go value in memory and a call frame. 

### <a id="abiStepKind" href="#abiStepKind">type abiStepKind int</a>

```
searchKey: reflect.abiStepKind
tags: [number private]
```

```Go
type abiStepKind int
```

abiStepKind is the "op-code" for an abiStep instruction. 

### <a id="arrayType" href="#arrayType">type arrayType struct</a>

```
searchKey: reflect.arrayType
tags: [struct private]
```

```Go
type arrayType struct {
	rtype
	elem  *rtype // array element type
	slice *rtype // slice type
	len   uintptr
}
```

arrayType represents a fixed array type. 

### <a id="bitVector" href="#bitVector">type bitVector struct</a>

```
searchKey: reflect.bitVector
tags: [struct private]
```

```Go
type bitVector struct {
	n    uint32 // number of bits
	data []byte
}
```

Note: this type must agree with runtime.bitvector. 

#### <a id="bitVector.append" href="#bitVector.append">func (bv *bitVector) append(bit uint8)</a>

```
searchKey: reflect.bitVector.append
tags: [method private]
```

```Go
func (bv *bitVector) append(bit uint8)
```

append a bit to the bitmap. 

### <a id="cacheKey" href="#cacheKey">type cacheKey struct</a>

```
searchKey: reflect.cacheKey
tags: [struct private]
```

```Go
type cacheKey struct {
	kind  Kind
	t1    *rtype
	t2    *rtype
	extra uintptr
}
```

A cacheKey is the key for use in the lookupCache. Four values describe any of the types we are looking for: type kind, one or two subtypes, and an extra integer. 

### <a id="chanType" href="#chanType">type chanType struct</a>

```
searchKey: reflect.chanType
tags: [struct private]
```

```Go
type chanType struct {
	rtype
	elem *rtype  // channel element type
	dir  uintptr // channel direction (ChanDir)
}
```

chanType represents a channel type. 

### <a id="emptyInterface" href="#emptyInterface">type emptyInterface struct</a>

```
searchKey: reflect.emptyInterface
tags: [struct private]
```

```Go
type emptyInterface struct {
	typ  *rtype
	word unsafe.Pointer
}
```

emptyInterface is the header for an interface{} value. 

### <a id="fieldScan" href="#fieldScan">type fieldScan struct</a>

```
searchKey: reflect.fieldScan
tags: [struct private]
```

```Go
type fieldScan struct {
	typ   *structType
	index []int
}
```

A fieldScan represents an item on the fieldByNameFunc scan work list. 

### <a id="flag" href="#flag">type flag uintptr</a>

```
searchKey: reflect.flag
tags: [number private]
```

```Go
type flag uintptr
```

#### <a id="flag.kind" href="#flag.kind">func (f flag) kind() Kind</a>

```
searchKey: reflect.flag.kind
tags: [method private]
```

```Go
func (f flag) kind() Kind
```

#### <a id="flag.mustBe" href="#flag.mustBe">func (f flag) mustBe(expected Kind)</a>

```
searchKey: reflect.flag.mustBe
tags: [method private]
```

```Go
func (f flag) mustBe(expected Kind)
```

mustBe panics if f's kind is not expected. Making this a method on flag instead of on Value (and embedding flag in Value) means that we can write the very clear v.mustBe(Bool) and have it compile into v.flag.mustBe(Bool), which will only bother to copy the single important word for the receiver. 

#### <a id="flag.mustBeAssignable" href="#flag.mustBeAssignable">func (f flag) mustBeAssignable()</a>

```
searchKey: reflect.flag.mustBeAssignable
tags: [method private]
```

```Go
func (f flag) mustBeAssignable()
```

mustBeAssignable panics if f records that the value is not assignable, which is to say that either it was obtained using an unexported field or it is not addressable. 

#### <a id="flag.mustBeAssignableSlow" href="#flag.mustBeAssignableSlow">func (f flag) mustBeAssignableSlow()</a>

```
searchKey: reflect.flag.mustBeAssignableSlow
tags: [method private]
```

```Go
func (f flag) mustBeAssignableSlow()
```

#### <a id="flag.mustBeExported" href="#flag.mustBeExported">func (f flag) mustBeExported()</a>

```
searchKey: reflect.flag.mustBeExported
tags: [method private]
```

```Go
func (f flag) mustBeExported()
```

mustBeExported panics if f records that the value was obtained using an unexported field. 

#### <a id="flag.mustBeExportedSlow" href="#flag.mustBeExportedSlow">func (f flag) mustBeExportedSlow()</a>

```
searchKey: reflect.flag.mustBeExportedSlow
tags: [method private]
```

```Go
func (f flag) mustBeExportedSlow()
```

#### <a id="flag.ro" href="#flag.ro">func (f flag) ro() flag</a>

```
searchKey: reflect.flag.ro
tags: [method private]
```

```Go
func (f flag) ro() flag
```

### <a id="funcType" href="#funcType">type funcType struct</a>

```
searchKey: reflect.funcType
tags: [struct private]
```

```Go
type funcType struct {
	rtype
	inCount  uint16
	outCount uint16 // top bit is set if last input parameter is ...
}
```

funcType represents a function type. 

A *rtype for each in and out parameter is stored in an array that directly follows the funcType (and possibly its uncommonType). So a function type with one method, one input, and one output is: 

```
struct {
	funcType
	uncommonType
	[2]*rtype    // [0] is in, [1] is out
}

```
#### <a id="methodReceiver" href="#methodReceiver">func methodReceiver(op string, v Value, methodIndex int) (rcvrtype *rtype, t *funcType, fn unsafe.Pointer)</a>

```
searchKey: reflect.methodReceiver
tags: [function private]
```

```Go
func methodReceiver(op string, v Value, methodIndex int) (rcvrtype *rtype, t *funcType, fn unsafe.Pointer)
```

methodReceiver returns information about the receiver described by v. The Value v may or may not have the flagMethod bit set, so the kind cached in v.flag should not be used. The return value rcvrtype gives the method's actual receiver type. The return value t gives the method type signature (without the receiver). The return value fn is a pointer to the method code. 

#### <a id="funcType.in" href="#funcType.in">func (t *funcType) in() []*rtype</a>

```
searchKey: reflect.funcType.in
tags: [method private]
```

```Go
func (t *funcType) in() []*rtype
```

#### <a id="funcType.out" href="#funcType.out">func (t *funcType) out() []*rtype</a>

```
searchKey: reflect.funcType.out
tags: [method private]
```

```Go
func (t *funcType) out() []*rtype
```

### <a id="funcTypeFixed128" href="#funcTypeFixed128">type funcTypeFixed128 struct</a>

```
searchKey: reflect.funcTypeFixed128
tags: [struct private]
```

```Go
type funcTypeFixed128 struct {
	funcType
	args [128]*rtype
}
```

### <a id="funcTypeFixed16" href="#funcTypeFixed16">type funcTypeFixed16 struct</a>

```
searchKey: reflect.funcTypeFixed16
tags: [struct private]
```

```Go
type funcTypeFixed16 struct {
	funcType
	args [16]*rtype
}
```

### <a id="funcTypeFixed32" href="#funcTypeFixed32">type funcTypeFixed32 struct</a>

```
searchKey: reflect.funcTypeFixed32
tags: [struct private]
```

```Go
type funcTypeFixed32 struct {
	funcType
	args [32]*rtype
}
```

### <a id="funcTypeFixed4" href="#funcTypeFixed4">type funcTypeFixed4 struct</a>

```
searchKey: reflect.funcTypeFixed4
tags: [struct private]
```

```Go
type funcTypeFixed4 struct {
	funcType
	args [4]*rtype
}
```

TODO(crawshaw): as these funcTypeFixedN structs have no methods, they could be defined at runtime using the StructOf function. 

### <a id="funcTypeFixed64" href="#funcTypeFixed64">type funcTypeFixed64 struct</a>

```
searchKey: reflect.funcTypeFixed64
tags: [struct private]
```

```Go
type funcTypeFixed64 struct {
	funcType
	args [64]*rtype
}
```

### <a id="funcTypeFixed8" href="#funcTypeFixed8">type funcTypeFixed8 struct</a>

```
searchKey: reflect.funcTypeFixed8
tags: [struct private]
```

```Go
type funcTypeFixed8 struct {
	funcType
	args [8]*rtype
}
```

### <a id="imethod" href="#imethod">type imethod struct</a>

```
searchKey: reflect.imethod
tags: [struct private]
```

```Go
type imethod struct {
	name nameOff // name of method
	typ  typeOff // .(*FuncType) underneath
}
```

imethod represents a method on an interface type 

### <a id="interfaceType" href="#interfaceType">type interfaceType struct</a>

```
searchKey: reflect.interfaceType
tags: [struct private]
```

```Go
type interfaceType struct {
	rtype
	pkgPath name      // import path
	methods []imethod // sorted by hash
}
```

interfaceType represents an interface type. 

#### <a id="interfaceType.Method" href="#interfaceType.Method">func (t *interfaceType) Method(i int) (m Method)</a>

```
searchKey: reflect.interfaceType.Method
tags: [method private]
```

```Go
func (t *interfaceType) Method(i int) (m Method)
```

Method returns the i'th method in the type's method set. 

#### <a id="interfaceType.MethodByName" href="#interfaceType.MethodByName">func (t *interfaceType) MethodByName(name string) (m Method, ok bool)</a>

```
searchKey: reflect.interfaceType.MethodByName
tags: [method private]
```

```Go
func (t *interfaceType) MethodByName(name string) (m Method, ok bool)
```

MethodByName method with the given name in the type's method set. 

#### <a id="interfaceType.NumMethod" href="#interfaceType.NumMethod">func (t *interfaceType) NumMethod() int</a>

```
searchKey: reflect.interfaceType.NumMethod
tags: [method private]
```

```Go
func (t *interfaceType) NumMethod() int
```

NumMethod returns the number of interface methods in the type's method set. 

### <a id="layoutKey" href="#layoutKey">type layoutKey struct</a>

```
searchKey: reflect.layoutKey
tags: [struct private]
```

```Go
type layoutKey struct {
	ftyp *funcType // function signature
	rcvr *rtype    // receiver type, or nil if none
}
```

### <a id="layoutType" href="#layoutType">type layoutType struct</a>

```
searchKey: reflect.layoutType
tags: [struct private]
```

```Go
type layoutType struct {
	t         *rtype
	framePool *sync.Pool
	abi       abiDesc
}
```

### <a id="makeFuncCtxt" href="#makeFuncCtxt">type makeFuncCtxt struct</a>

```
searchKey: reflect.makeFuncCtxt
tags: [struct private]
```

```Go
type makeFuncCtxt struct {
	fn      uintptr
	stack   *bitVector // ptrmap for both stack args and results
	argLen  uintptr    // just args
	regPtrs abi.IntArgRegBitmap
}
```

This structure must be kept in sync with runtime.reflectMethodValue. Any changes should be reflected in all both. 

### <a id="makeFuncImpl" href="#makeFuncImpl">type makeFuncImpl struct</a>

```
searchKey: reflect.makeFuncImpl
tags: [struct private]
```

```Go
type makeFuncImpl struct {
	makeFuncCtxt
	ftyp *funcType
	fn   func([]Value) []Value
}
```

makeFuncImpl is the closure value implementing the function returned by MakeFunc. The first three words of this type must be kept in sync with methodValue and runtime.reflectMethodValue. Any changes should be reflected in all three. 

### <a id="mapType" href="#mapType">type mapType struct</a>

```
searchKey: reflect.mapType
tags: [struct private]
```

```Go
type mapType struct {
	rtype
	key    *rtype // map key type
	elem   *rtype // map element (value) type
	bucket *rtype // internal bucket structure
	// function for hashing keys (ptr to key, seed) -> hash
	hasher     func(unsafe.Pointer, uintptr) uintptr
	keysize    uint8  // size of key slot
	valuesize  uint8  // size of value slot
	bucketsize uint16 // size of bucket
	flags      uint32
}
```

mapType represents a map type. 

### <a id="method" href="#method">type method struct</a>

```
searchKey: reflect.method
tags: [struct private]
```

```Go
type method struct {
	name nameOff // name of method
	mtyp typeOff // method type (without receiver)
	ifn  textOff // fn used in interface call (one-word receiver)
	tfn  textOff // fn used for normal method call
}
```

Method on non-interface type 

### <a id="methodValue" href="#methodValue">type methodValue struct</a>

```
searchKey: reflect.methodValue
tags: [struct private]
```

```Go
type methodValue struct {
	makeFuncCtxt
	method int
	rcvr   Value
}
```

The first 3 words of this type must be kept in sync with makeFuncImpl and runtime.reflectMethodValue. Any changes should be reflected in all three. 

### <a id="name" href="#name">type name struct</a>

```
searchKey: reflect.name
tags: [struct private]
```

```Go
type name struct {
	bytes *byte
}
```

#### <a id="newName" href="#newName">func newName(n, tag string, exported bool) name</a>

```
searchKey: reflect.newName
tags: [function private]
```

```Go
func newName(n, tag string, exported bool) name
```

#### <a id="name.data" href="#name.data">func (n name) data(off int, whySafe string) *byte</a>

```
searchKey: reflect.name.data
tags: [method private]
```

```Go
func (n name) data(off int, whySafe string) *byte
```

#### <a id="name.hasTag" href="#name.hasTag">func (n name) hasTag() bool</a>

```
searchKey: reflect.name.hasTag
tags: [method private]
```

```Go
func (n name) hasTag() bool
```

#### <a id="name.isExported" href="#name.isExported">func (n name) isExported() bool</a>

```
searchKey: reflect.name.isExported
tags: [method private]
```

```Go
func (n name) isExported() bool
```

#### <a id="name.name" href="#name.name">func (n name) name() (s string)</a>

```
searchKey: reflect.name.name
tags: [method private]
```

```Go
func (n name) name() (s string)
```

#### <a id="name.pkgPath" href="#name.pkgPath">func (n name) pkgPath() string</a>

```
searchKey: reflect.name.pkgPath
tags: [method private]
```

```Go
func (n name) pkgPath() string
```

#### <a id="name.readVarint" href="#name.readVarint">func (n name) readVarint(off int) (int, int)</a>

```
searchKey: reflect.name.readVarint
tags: [method private]
```

```Go
func (n name) readVarint(off int) (int, int)
```

readVarint parses a varint as encoded by encoding/binary. It returns the number of encoded bytes and the encoded value. 

#### <a id="name.tag" href="#name.tag">func (n name) tag() (s string)</a>

```
searchKey: reflect.name.tag
tags: [method private]
```

```Go
func (n name) tag() (s string)
```

### <a id="nameOff" href="#nameOff">type nameOff int32</a>

```
searchKey: reflect.nameOff
tags: [number private]
```

```Go
type nameOff int32 // offset to a name

```

#### <a id="resolveReflectName" href="#resolveReflectName">func resolveReflectName(n name) nameOff</a>

```
searchKey: reflect.resolveReflectName
tags: [function private]
```

```Go
func resolveReflectName(n name) nameOff
```

resolveReflectName adds a name to the reflection lookup map in the runtime. It returns a new nameOff that can be used to refer to the pointer. 

### <a id="nonEmptyInterface" href="#nonEmptyInterface">type nonEmptyInterface struct</a>

```
searchKey: reflect.nonEmptyInterface
tags: [struct private]
```

```Go
type nonEmptyInterface struct {
	// see ../runtime/iface.go:/Itab
	itab *struct {
		ityp *rtype // static interface type
		typ  *rtype // dynamic concrete type
		hash uint32 // copy of typ.hash
		_    [4]byte
		fun  [100000]unsafe.Pointer // method table
	}
	word unsafe.Pointer
}
```

nonEmptyInterface is the header for an interface value with methods. 

### <a id="pinUnexpMeth" href="#pinUnexpMeth">type pinUnexpMeth interface</a>

```
searchKey: reflect.pinUnexpMeth
tags: [interface private]
```

```Go
type pinUnexpMeth interface {
	f()
}
```

### <a id="ptrType" href="#ptrType">type ptrType struct</a>

```
searchKey: reflect.ptrType
tags: [struct private]
```

```Go
type ptrType struct {
	rtype
	elem *rtype // pointer element (pointed at) type
}
```

ptrType represents a pointer type. 

### <a id="rtype" href="#rtype">type rtype struct</a>

```
searchKey: reflect.rtype
tags: [struct private]
```

```Go
type rtype struct {
	size       uintptr
	ptrdata    uintptr // number of bytes in the type that can contain pointers
	hash       uint32  // hash of type; avoids computation in hash tables
	tflag      tflag   // extra type information flags
	align      uint8   // alignment of variable with this type
	fieldAlign uint8   // alignment of struct field with this type
	kind       uint8   // enumeration for C
	// function for comparing objects of this type
	// (ptr to object A, ptr to object B) -> ==?
	equal     func(unsafe.Pointer, unsafe.Pointer) bool
	gcdata    *byte   // garbage collection data
	str       nameOff // string form
	ptrToThis typeOff // type for pointer to this type, may be zero
}
```

rtype is the common implementation of most values. It is embedded in other struct types. 

rtype must be kept in sync with ../runtime/type.go:/^type._type. 

#### <a id="bucketOf" href="#bucketOf">func bucketOf(ktyp, etyp *rtype) *rtype</a>

```
searchKey: reflect.bucketOf
tags: [function private]
```

```Go
func bucketOf(ktyp, etyp *rtype) *rtype
```

#### <a id="rtypeOff" href="#rtypeOff">func rtypeOff(section unsafe.Pointer, off int32) *rtype</a>

```
searchKey: reflect.rtypeOff
tags: [function private]
```

```Go
func rtypeOff(section unsafe.Pointer, off int32) *rtype
```

#### <a id="rtype.Align" href="#rtype.Align">func (t *rtype) Align() int</a>

```
searchKey: reflect.rtype.Align
tags: [method private]
```

```Go
func (t *rtype) Align() int
```

#### <a id="rtype.AssignableTo" href="#rtype.AssignableTo">func (t *rtype) AssignableTo(u Type) bool</a>

```
searchKey: reflect.rtype.AssignableTo
tags: [method private]
```

```Go
func (t *rtype) AssignableTo(u Type) bool
```

#### <a id="rtype.Bits" href="#rtype.Bits">func (t *rtype) Bits() int</a>

```
searchKey: reflect.rtype.Bits
tags: [method private]
```

```Go
func (t *rtype) Bits() int
```

#### <a id="rtype.ChanDir" href="#rtype.ChanDir">func (t *rtype) ChanDir() ChanDir</a>

```
searchKey: reflect.rtype.ChanDir
tags: [method private]
```

```Go
func (t *rtype) ChanDir() ChanDir
```

#### <a id="rtype.Comparable" href="#rtype.Comparable">func (t *rtype) Comparable() bool</a>

```
searchKey: reflect.rtype.Comparable
tags: [method private]
```

```Go
func (t *rtype) Comparable() bool
```

#### <a id="rtype.ConvertibleTo" href="#rtype.ConvertibleTo">func (t *rtype) ConvertibleTo(u Type) bool</a>

```
searchKey: reflect.rtype.ConvertibleTo
tags: [method private]
```

```Go
func (t *rtype) ConvertibleTo(u Type) bool
```

#### <a id="rtype.Elem" href="#rtype.Elem">func (t *rtype) Elem() Type</a>

```
searchKey: reflect.rtype.Elem
tags: [method private]
```

```Go
func (t *rtype) Elem() Type
```

#### <a id="rtype.Field" href="#rtype.Field">func (t *rtype) Field(i int) StructField</a>

```
searchKey: reflect.rtype.Field
tags: [method private]
```

```Go
func (t *rtype) Field(i int) StructField
```

#### <a id="rtype.FieldAlign" href="#rtype.FieldAlign">func (t *rtype) FieldAlign() int</a>

```
searchKey: reflect.rtype.FieldAlign
tags: [method private]
```

```Go
func (t *rtype) FieldAlign() int
```

#### <a id="rtype.FieldByIndex" href="#rtype.FieldByIndex">func (t *rtype) FieldByIndex(index []int) StructField</a>

```
searchKey: reflect.rtype.FieldByIndex
tags: [method private]
```

```Go
func (t *rtype) FieldByIndex(index []int) StructField
```

#### <a id="rtype.FieldByName" href="#rtype.FieldByName">func (t *rtype) FieldByName(name string) (StructField, bool)</a>

```
searchKey: reflect.rtype.FieldByName
tags: [method private]
```

```Go
func (t *rtype) FieldByName(name string) (StructField, bool)
```

#### <a id="rtype.FieldByNameFunc" href="#rtype.FieldByNameFunc">func (t *rtype) FieldByNameFunc(match func(string) bool) (StructField, bool)</a>

```
searchKey: reflect.rtype.FieldByNameFunc
tags: [method private]
```

```Go
func (t *rtype) FieldByNameFunc(match func(string) bool) (StructField, bool)
```

#### <a id="rtype.Implements" href="#rtype.Implements">func (t *rtype) Implements(u Type) bool</a>

```
searchKey: reflect.rtype.Implements
tags: [method private]
```

```Go
func (t *rtype) Implements(u Type) bool
```

#### <a id="rtype.In" href="#rtype.In">func (t *rtype) In(i int) Type</a>

```
searchKey: reflect.rtype.In
tags: [method private]
```

```Go
func (t *rtype) In(i int) Type
```

#### <a id="rtype.IsVariadic" href="#rtype.IsVariadic">func (t *rtype) IsVariadic() bool</a>

```
searchKey: reflect.rtype.IsVariadic
tags: [method private]
```

```Go
func (t *rtype) IsVariadic() bool
```

#### <a id="rtype.Key" href="#rtype.Key">func (t *rtype) Key() Type</a>

```
searchKey: reflect.rtype.Key
tags: [method private]
```

```Go
func (t *rtype) Key() Type
```

#### <a id="rtype.Kind" href="#rtype.Kind">func (t *rtype) Kind() Kind</a>

```
searchKey: reflect.rtype.Kind
tags: [method private]
```

```Go
func (t *rtype) Kind() Kind
```

#### <a id="rtype.Len" href="#rtype.Len">func (t *rtype) Len() int</a>

```
searchKey: reflect.rtype.Len
tags: [method private]
```

```Go
func (t *rtype) Len() int
```

#### <a id="rtype.Method" href="#rtype.Method">func (t *rtype) Method(i int) (m Method)</a>

```
searchKey: reflect.rtype.Method
tags: [method private]
```

```Go
func (t *rtype) Method(i int) (m Method)
```

#### <a id="rtype.MethodByName" href="#rtype.MethodByName">func (t *rtype) MethodByName(name string) (m Method, ok bool)</a>

```
searchKey: reflect.rtype.MethodByName
tags: [method private]
```

```Go
func (t *rtype) MethodByName(name string) (m Method, ok bool)
```

#### <a id="rtype.Name" href="#rtype.Name">func (t *rtype) Name() string</a>

```
searchKey: reflect.rtype.Name
tags: [method private]
```

```Go
func (t *rtype) Name() string
```

#### <a id="rtype.NumField" href="#rtype.NumField">func (t *rtype) NumField() int</a>

```
searchKey: reflect.rtype.NumField
tags: [method private]
```

```Go
func (t *rtype) NumField() int
```

#### <a id="rtype.NumIn" href="#rtype.NumIn">func (t *rtype) NumIn() int</a>

```
searchKey: reflect.rtype.NumIn
tags: [method private]
```

```Go
func (t *rtype) NumIn() int
```

#### <a id="rtype.NumMethod" href="#rtype.NumMethod">func (t *rtype) NumMethod() int</a>

```
searchKey: reflect.rtype.NumMethod
tags: [method private]
```

```Go
func (t *rtype) NumMethod() int
```

#### <a id="rtype.NumOut" href="#rtype.NumOut">func (t *rtype) NumOut() int</a>

```
searchKey: reflect.rtype.NumOut
tags: [method private]
```

```Go
func (t *rtype) NumOut() int
```

#### <a id="rtype.Out" href="#rtype.Out">func (t *rtype) Out(i int) Type</a>

```
searchKey: reflect.rtype.Out
tags: [method private]
```

```Go
func (t *rtype) Out(i int) Type
```

#### <a id="rtype.PkgPath" href="#rtype.PkgPath">func (t *rtype) PkgPath() string</a>

```
searchKey: reflect.rtype.PkgPath
tags: [method private]
```

```Go
func (t *rtype) PkgPath() string
```

#### <a id="rtype.Size" href="#rtype.Size">func (t *rtype) Size() uintptr</a>

```
searchKey: reflect.rtype.Size
tags: [method private]
```

```Go
func (t *rtype) Size() uintptr
```

#### <a id="rtype.String" href="#rtype.String">func (t *rtype) String() string</a>

```
searchKey: reflect.rtype.String
tags: [method private]
```

```Go
func (t *rtype) String() string
```

#### <a id="rtype.common" href="#rtype.common">func (t *rtype) common() *rtype</a>

```
searchKey: reflect.rtype.common
tags: [method private]
```

```Go
func (t *rtype) common() *rtype
```

#### <a id="rtype.exportedMethods" href="#rtype.exportedMethods">func (t *rtype) exportedMethods() []method</a>

```
searchKey: reflect.rtype.exportedMethods
tags: [method private]
```

```Go
func (t *rtype) exportedMethods() []method
```

#### <a id="rtype.gcSlice" href="#rtype.gcSlice">func (t *rtype) gcSlice(begin, end uintptr) []byte</a>

```
searchKey: reflect.rtype.gcSlice
tags: [method private]
```

```Go
func (t *rtype) gcSlice(begin, end uintptr) []byte
```

#### <a id="rtype.hasName" href="#rtype.hasName">func (t *rtype) hasName() bool</a>

```
searchKey: reflect.rtype.hasName
tags: [method private]
```

```Go
func (t *rtype) hasName() bool
```

#### <a id="rtype.nameOff" href="#rtype.nameOff">func (t *rtype) nameOff(off nameOff) name</a>

```
searchKey: reflect.rtype.nameOff
tags: [method private]
```

```Go
func (t *rtype) nameOff(off nameOff) name
```

#### <a id="rtype.pointers" href="#rtype.pointers">func (t *rtype) pointers() bool</a>

```
searchKey: reflect.rtype.pointers
tags: [method private]
```

```Go
func (t *rtype) pointers() bool
```

#### <a id="rtype.ptrTo" href="#rtype.ptrTo">func (t *rtype) ptrTo() *rtype</a>

```
searchKey: reflect.rtype.ptrTo
tags: [method private]
```

```Go
func (t *rtype) ptrTo() *rtype
```

#### <a id="rtype.textOff" href="#rtype.textOff">func (t *rtype) textOff(off textOff) unsafe.Pointer</a>

```
searchKey: reflect.rtype.textOff
tags: [method private]
```

```Go
func (t *rtype) textOff(off textOff) unsafe.Pointer
```

#### <a id="rtype.typeOff" href="#rtype.typeOff">func (t *rtype) typeOff(off typeOff) *rtype</a>

```
searchKey: reflect.rtype.typeOff
tags: [method private]
```

```Go
func (t *rtype) typeOff(off typeOff) *rtype
```

#### <a id="rtype.uncommon" href="#rtype.uncommon">func (t *rtype) uncommon() *uncommonType</a>

```
searchKey: reflect.rtype.uncommon
tags: [method private]
```

```Go
func (t *rtype) uncommon() *uncommonType
```

### <a id="runtimeSelect" href="#runtimeSelect">type runtimeSelect struct</a>

```
searchKey: reflect.runtimeSelect
tags: [struct private]
```

```Go
type runtimeSelect struct {
	dir SelectDir      // SelectSend, SelectRecv or SelectDefault
	typ *rtype         // channel type
	ch  unsafe.Pointer // channel
	val unsafe.Pointer // ptr to data (SendDir) or ptr to receive buffer (RecvDir)
}
```

A runtimeSelect is a single case passed to rselect. This must match ../runtime/select.go:/runtimeSelect 

### <a id="sliceType" href="#sliceType">type sliceType struct</a>

```
searchKey: reflect.sliceType
tags: [struct private]
```

```Go
type sliceType struct {
	rtype
	elem *rtype // slice element type
}
```

sliceType represents a slice type. 

### <a id="structField" href="#structField">type structField struct</a>

```
searchKey: reflect.structField
tags: [struct private]
```

```Go
type structField struct {
	name        name    // name is always non-empty
	typ         *rtype  // type of field
	offsetEmbed uintptr // byte offset of field<<1 | isEmbedded
}
```

Struct field 

#### <a id="runtimeStructField" href="#runtimeStructField">func runtimeStructField(field StructField) (structField, string)</a>

```
searchKey: reflect.runtimeStructField
tags: [function private]
```

```Go
func runtimeStructField(field StructField) (structField, string)
```

runtimeStructField takes a StructField value passed to StructOf and returns both the corresponding internal representation, of type structField, and the pkgpath value to use for this field. 

#### <a id="structField.embedded" href="#structField.embedded">func (f *structField) embedded() bool</a>

```
searchKey: reflect.structField.embedded
tags: [method private]
```

```Go
func (f *structField) embedded() bool
```

#### <a id="structField.offset" href="#structField.offset">func (f *structField) offset() uintptr</a>

```
searchKey: reflect.structField.offset
tags: [method private]
```

```Go
func (f *structField) offset() uintptr
```

### <a id="structType" href="#structType">type structType struct</a>

```
searchKey: reflect.structType
tags: [struct private]
```

```Go
type structType struct {
	rtype
	pkgPath name
	fields  []structField // sorted by offset
}
```

structType represents a struct type. 

#### <a id="structType.Field" href="#structType.Field">func (t *structType) Field(i int) (f StructField)</a>

```
searchKey: reflect.structType.Field
tags: [method private]
```

```Go
func (t *structType) Field(i int) (f StructField)
```

Field returns the i'th struct field. 

#### <a id="structType.FieldByIndex" href="#structType.FieldByIndex">func (t *structType) FieldByIndex(index []int) (f StructField)</a>

```
searchKey: reflect.structType.FieldByIndex
tags: [method private]
```

```Go
func (t *structType) FieldByIndex(index []int) (f StructField)
```

FieldByIndex returns the nested field corresponding to index. 

#### <a id="structType.FieldByName" href="#structType.FieldByName">func (t *structType) FieldByName(name string) (f StructField, present bool)</a>

```
searchKey: reflect.structType.FieldByName
tags: [method private]
```

```Go
func (t *structType) FieldByName(name string) (f StructField, present bool)
```

FieldByName returns the struct field with the given name and a boolean to indicate if the field was found. 

#### <a id="structType.FieldByNameFunc" href="#structType.FieldByNameFunc">func (t *structType) FieldByNameFunc(match func(string) bool) (result StructField, ok bool)</a>

```
searchKey: reflect.structType.FieldByNameFunc
tags: [method private]
```

```Go
func (t *structType) FieldByNameFunc(match func(string) bool) (result StructField, ok bool)
```

FieldByNameFunc returns the struct field with a name that satisfies the match function and a boolean to indicate if the field was found. 

### <a id="structTypeUncommon" href="#structTypeUncommon">type structTypeUncommon struct</a>

```
searchKey: reflect.structTypeUncommon
tags: [struct private]
```

```Go
type structTypeUncommon struct {
	structType
	u uncommonType
}
```

### <a id="textOff" href="#textOff">type textOff int32</a>

```
searchKey: reflect.textOff
tags: [number private]
```

```Go
type textOff int32 // offset from top of text section

```

#### <a id="resolveReflectText" href="#resolveReflectText">func resolveReflectText(ptr unsafe.Pointer) textOff</a>

```
searchKey: reflect.resolveReflectText
tags: [function private]
```

```Go
func resolveReflectText(ptr unsafe.Pointer) textOff
```

resolveReflectText adds a function pointer to the reflection lookup map in the runtime. It returns a new textOff that can be used to refer to the pointer. 

### <a id="tflag" href="#tflag">type tflag uint8</a>

```
searchKey: reflect.tflag
tags: [number private]
```

```Go
type tflag uint8
```

tflag is used by an rtype to signal what extra type information is available in the memory directly following the rtype value. 

tflag values must be kept in sync with copies in: 

```
cmd/compile/internal/gc/reflect.go
cmd/link/internal/ld/decodesym.go
runtime/type.go

```
### <a id="typeOff" href="#typeOff">type typeOff int32</a>

```
searchKey: reflect.typeOff
tags: [number private]
```

```Go
type typeOff int32 // offset to an *rtype

```

#### <a id="resolveReflectType" href="#resolveReflectType">func resolveReflectType(t *rtype) typeOff</a>

```
searchKey: reflect.resolveReflectType
tags: [function private]
```

```Go
func resolveReflectType(t *rtype) typeOff
```

resolveReflectType adds a *rtype to the reflection lookup map in the runtime. It returns a new typeOff that can be used to refer to the pointer. 

### <a id="uncommonType" href="#uncommonType">type uncommonType struct</a>

```
searchKey: reflect.uncommonType
tags: [struct private]
```

```Go
type uncommonType struct {
	pkgPath nameOff // import path; empty for built-in types like int, string
	mcount  uint16  // number of methods
	xcount  uint16  // number of exported methods
	moff    uint32  // offset from this uncommontype to [mcount]method
	_       uint32  // unused
}
```

uncommonType is present only for defined types or types with methods (if T is a defined type, the uncommonTypes for T and *T have methods). Using a pointer to this struct reduces the overall size required to describe a non-defined type with no methods. 

#### <a id="uncommonType.exportedMethods" href="#uncommonType.exportedMethods">func (t *uncommonType) exportedMethods() []method</a>

```
searchKey: reflect.uncommonType.exportedMethods
tags: [method private]
```

```Go
func (t *uncommonType) exportedMethods() []method
```

#### <a id="uncommonType.methods" href="#uncommonType.methods">func (t *uncommonType) methods() []method</a>

```
searchKey: reflect.uncommonType.methods
tags: [method private]
```

```Go
func (t *uncommonType) methods() []method
```

### <a id="visibleFieldsWalker" href="#visibleFieldsWalker">type visibleFieldsWalker struct</a>

```
searchKey: reflect.visibleFieldsWalker
tags: [struct private]
```

```Go
type visibleFieldsWalker struct {
	byName   map[string]int
	visiting map[Type]bool
	fields   []StructField
	index    []int
}
```

#### <a id="visibleFieldsWalker.walk" href="#visibleFieldsWalker.walk">func (w *visibleFieldsWalker) walk(t Type)</a>

```
searchKey: reflect.visibleFieldsWalker.walk
tags: [method private]
```

```Go
func (w *visibleFieldsWalker) walk(t Type)
```

walk walks all the fields in the struct type t, visiting fields in index preorder and appending them to w.fields (this maintains the required ordering). Fields that have been overridden have their Name field cleared. 

### <a id="visit" href="#visit">type visit struct</a>

```
searchKey: reflect.visit
tags: [struct private]
```

```Go
type visit struct {
	a1  unsafe.Pointer
	a2  unsafe.Pointer
	typ Type
}
```

During deepValueEqual, must keep track of checks that are in progress. The comparison algorithm assumes that all checks in progress are true when it reencounters them. Visited comparisons are stored in a map indexed by visit. 

## <a id="func" href="#func">Functions</a>

### <a id="Copy" href="#Copy">func Copy(dst, src Value) int</a>

```
searchKey: reflect.Copy
tags: [function]
```

```Go
func Copy(dst, src Value) int
```

Copy copies the contents of src into dst until either dst has been filled or src has been exhausted. It returns the number of elements copied. Dst and src each must have kind Slice or Array, and dst and src must have the same element type. 

As a special case, src can have kind String if the element type of dst is kind Uint8. 

### <a id="DeepEqual" href="#DeepEqual">func DeepEqual(x, y interface{}) bool</a>

```
searchKey: reflect.DeepEqual
tags: [function]
```

```Go
func DeepEqual(x, y interface{}) bool
```

DeepEqual reports whether x and y are `deeply equal,' defined as follows. Two values of identical type are deeply equal if one of the following cases applies. Values of distinct types are never deeply equal. 

Array values are deeply equal when their corresponding elements are deeply equal. 

Struct values are deeply equal if their corresponding fields, both exported and unexported, are deeply equal. 

Func values are deeply equal if both are nil; otherwise they are not deeply equal. 

Interface values are deeply equal if they hold deeply equal concrete values. 

Map values are deeply equal when all of the following are true: they are both nil or both non-nil, they have the same length, and either they are the same map object or their corresponding keys (matched using Go equality) map to deeply equal values. 

Pointer values are deeply equal if they are equal using Go's == operator or if they point to deeply equal values. 

Slice values are deeply equal when all of the following are true: they are both nil or both non-nil, they have the same length, and either they point to the same initial entry of the same underlying array (that is, &x[0] == &y[0]) or their corresponding elements (up to length) are deeply equal. Note that a non-nil empty slice and a nil slice (for example, []byte{} and []byte(nil)) are not deeply equal. 

Other values - numbers, bools, strings, and channels - are deeply equal if they are equal using Go's == operator. 

In general DeepEqual is a recursive relaxation of Go's == operator. However, this idea is impossible to implement without some inconsistency. Specifically, it is possible for a value to be unequal to itself, either because it is of func type (uncomparable in general) or because it is a floating-point NaN value (not equal to itself in floating-point comparison), or because it is an array, struct, or interface containing such a value. On the other hand, pointer values are always equal to themselves, even if they point at or contain such problematic values, because they compare equal using Go's == operator, and that is a sufficient condition to be deeply equal, regardless of content. DeepEqual has been defined so that the same short-cut applies to slices and maps: if x and y are the same slice or the same map, they are deeply equal regardless of content. 

As DeepEqual traverses the data values it may find a cycle. The second and subsequent times that DeepEqual compares two pointer values that have been compared before, it treats the values as equal rather than examining the values to which they point. This ensures that DeepEqual terminates. 

### <a id="FirstMethodNameBytes" href="#FirstMethodNameBytes">func FirstMethodNameBytes(t Type) *byte</a>

```
searchKey: reflect.FirstMethodNameBytes
tags: [function private]
```

```Go
func FirstMethodNameBytes(t Type) *byte
```

### <a id="IsExported" href="#IsExported">func IsExported(t Type) bool</a>

```
searchKey: reflect.IsExported
tags: [function private]
```

```Go
func IsExported(t Type) bool
```

### <a id="IsRO" href="#IsRO">func IsRO(v Value) bool</a>

```
searchKey: reflect.IsRO
tags: [function private]
```

```Go
func IsRO(v Value) bool
```

IsRO reports whether v's read-only flag is set. 

### <a id="ResolveReflectName" href="#ResolveReflectName">func ResolveReflectName(s string)</a>

```
searchKey: reflect.ResolveReflectName
tags: [function private]
```

```Go
func ResolveReflectName(s string)
```

### <a id="SetArgRegs" href="#SetArgRegs">func SetArgRegs(ints, floats int, floatSize uintptr) (oldInts, oldFloats int, oldFloatSize uintptr)</a>

```
searchKey: reflect.SetArgRegs
tags: [function private]
```

```Go
func SetArgRegs(ints, floats int, floatSize uintptr) (oldInts, oldFloats int, oldFloatSize uintptr)
```

### <a id="Swapper" href="#Swapper">func Swapper(slice interface{}) func(i, j int)</a>

```
searchKey: reflect.Swapper
tags: [function]
```

```Go
func Swapper(slice interface{}) func(i, j int)
```

Swapper returns a function that swaps the elements in the provided slice. 

Swapper panics if the provided interface is not a slice. 

### <a id="TypeLinks" href="#TypeLinks">func TypeLinks() []string</a>

```
searchKey: reflect.TypeLinks
tags: [function private]
```

```Go
func TypeLinks() []string
```

### <a id="VisibleFields" href="#VisibleFields">func VisibleFields(t Type) []StructField</a>

```
searchKey: reflect.VisibleFields
tags: [function]
```

```Go
func VisibleFields(t Type) []StructField
```

VisibleFields returns all the visible fields in t, which must be a struct type. A field is defined as visible if it's accessible directly with a FieldByName call. The returned fields include fields inside anonymous struct members and unexported fields. They follow the same order found in the struct, with anonymous fields followed immediately by their promoted fields. 

For each element e of the returned slice, the corresponding field can be retrieved from a value v of type t by calling v.FieldByIndex(e.Index). 

### <a id="add" href="#add">func add(p unsafe.Pointer, x uintptr, whySafe string) unsafe.Pointer</a>

```
searchKey: reflect.add
tags: [function private]
```

```Go
func add(p unsafe.Pointer, x uintptr, whySafe string) unsafe.Pointer
```

add returns p+x. 

The whySafe string is ignored, so that the function still inlines as efficiently as p+x, but all call sites should use the string to record why the addition is safe, which is to say why the addition does not cause x to advance to the very end of p's allocation and therefore point incorrectly at the next block in memory. 

### <a id="addReflectOff" href="#addReflectOff">func addReflectOff(ptr unsafe.Pointer) int32</a>

```
searchKey: reflect.addReflectOff
tags: [function private]
```

```Go
func addReflectOff(ptr unsafe.Pointer) int32
```

addReflectOff adds a pointer to the reflection lookup map in the runtime. It returns a new ID that can be used as a typeOff or textOff, and will be resolved correctly. Implemented in the runtime package. 

### <a id="addTypeBits" href="#addTypeBits">func addTypeBits(bv *bitVector, offset uintptr, t *rtype)</a>

```
searchKey: reflect.addTypeBits
tags: [function private]
```

```Go
func addTypeBits(bv *bitVector, offset uintptr, t *rtype)
```

### <a id="align" href="#align">func align(x, n uintptr) uintptr</a>

```
searchKey: reflect.align
tags: [function private]
```

```Go
func align(x, n uintptr) uintptr
```

align returns the result of rounding x up to a multiple of n. n must be a power of two. 

### <a id="appendGCProg" href="#appendGCProg">func appendGCProg(dst []byte, typ *rtype) []byte</a>

```
searchKey: reflect.appendGCProg
tags: [function private]
```

```Go
func appendGCProg(dst []byte, typ *rtype) []byte
```

appendGCProg appends the GC program for the first ptrdata bytes of typ to dst and returns the extended slice. 

### <a id="appendVarint" href="#appendVarint">func appendVarint(x []byte, v uintptr) []byte</a>

```
searchKey: reflect.appendVarint
tags: [function private]
```

```Go
func appendVarint(x []byte, v uintptr) []byte
```

### <a id="arrayAt" href="#arrayAt">func arrayAt(p unsafe.Pointer, i int, eltSize uintptr, whySafe string) unsafe.Pointer</a>

```
searchKey: reflect.arrayAt
tags: [function private]
```

```Go
func arrayAt(p unsafe.Pointer, i int, eltSize uintptr, whySafe string) unsafe.Pointer
```

arrayAt returns the i-th element of p, an array whose elements are eltSize bytes wide. The array pointed at by p must have at least i+1 elements: it is invalid (but impossible to check here) to pass i >= len, because then the result will point outside the array. whySafe must explain why i < len. (Passing "i < len" is fine; the benefit is to surface this assumption at the call site.) 

### <a id="call" href="#call">func call(stackArgsType *rtype, f, stackArgs unsafe.Pointer, stackArgsSize, stackRetOffset, frameSize uint32, regArgs *abi.RegArgs)</a>

```
searchKey: reflect.call
tags: [function private]
```

```Go
func call(stackArgsType *rtype, f, stackArgs unsafe.Pointer, stackArgsSize, stackRetOffset, frameSize uint32, regArgs *abi.RegArgs)
```

call calls fn with "stackArgsSize" bytes of stack arguments laid out at stackArgs and register arguments laid out in regArgs. frameSize is the total amount of stack space that will be reserved by call, so this should include enough space to spill register arguments to the stack in case of preemption. 

After fn returns, call copies stackArgsSize-stackRetOffset result bytes back into stackArgs+stackRetOffset before returning, for any return values passed on the stack. Register-based return values will be found in the same regArgs structure. 

regArgs must also be prepared with an appropriate ReturnIsPtr bitmap indicating which registers will contain pointer-valued return values. The purpose of this bitmap is to keep pointers visible to the GC between returning from reflectcall and actually using them. 

If copying result bytes back from the stack, the caller must pass the argument frame type as stackArgsType, so that call can execute appropriate write barriers during the copy. 

Arguments passed through to call do not escape. The type is used only in a very limited callee of call, the stackArgs are copied, and regArgs is only used in the call frame. 

### <a id="callMethod" href="#callMethod">func callMethod(ctxt *methodValue, frame unsafe.Pointer, retValid *bool, regs *abi.RegArgs)</a>

```
searchKey: reflect.callMethod
tags: [function private]
```

```Go
func callMethod(ctxt *methodValue, frame unsafe.Pointer, retValid *bool, regs *abi.RegArgs)
```

callMethod is the call implementation used by a function returned by makeMethodValue (used by v.Method(i).Interface()). It is a streamlined version of the usual reflect call: the caller has already laid out the argument frame for us, so we don't have to deal with individual Values for each argument. It is in this file so that it can be next to the two similar functions above. The remainder of the makeMethodValue implementation is in makefunc.go. 

NOTE: This function must be marked as a "wrapper" in the generated code, so that the linker can make it work correctly for panic and recover. The gc compilers know to do that for the name "reflect.callMethod". 

ctxt is the "closure" generated by makeVethodValue. frame is a pointer to the arguments to that closure on the stack. retValid points to a boolean which should be set when the results section of frame is set. 

regs contains the argument values passed in registers and will contain the values returned from ctxt.fn in registers. 

### <a id="callReflect" href="#callReflect">func callReflect(ctxt *makeFuncImpl, frame unsafe.Pointer, retValid *bool, regs *abi.RegArgs)</a>

```
searchKey: reflect.callReflect
tags: [function private]
```

```Go
func callReflect(ctxt *makeFuncImpl, frame unsafe.Pointer, retValid *bool, regs *abi.RegArgs)
```

callReflect is the call implementation used by a function returned by MakeFunc. In many ways it is the opposite of the method Value.call above. The method above converts a call using Values into a call of a function with a concrete argument frame, while callReflect converts a call of a function with a concrete argument frame into a call using Values. It is in this file so that it can be next to the call method above. The remainder of the MakeFunc implementation is in makefunc.go. 

NOTE: This function must be marked as a "wrapper" in the generated code, so that the linker can make it work correctly for panic and recover. The gc compilers know to do that for the name "reflect.callReflect". 

ctxt is the "closure" generated by MakeFunc. frame is a pointer to the arguments to that closure on the stack. retValid points to a boolean which should be set when the results section of frame is set. 

regs contains the argument values passed in registers and will contain the values returned from ctxt.fn in registers. 

### <a id="chancap" href="#chancap">func chancap(ch unsafe.Pointer) int</a>

```
searchKey: reflect.chancap
tags: [function private]
```

```Go
func chancap(ch unsafe.Pointer) int
```

implemented in ../runtime 

### <a id="chanclose" href="#chanclose">func chanclose(ch unsafe.Pointer)</a>

```
searchKey: reflect.chanclose
tags: [function private]
```

```Go
func chanclose(ch unsafe.Pointer)
```

### <a id="chanlen" href="#chanlen">func chanlen(ch unsafe.Pointer) int</a>

```
searchKey: reflect.chanlen
tags: [function private]
```

```Go
func chanlen(ch unsafe.Pointer) int
```

### <a id="chanrecv" href="#chanrecv">func chanrecv(ch unsafe.Pointer, nb bool, val unsafe.Pointer) (selected, received bool)</a>

```
searchKey: reflect.chanrecv
tags: [function private]
```

```Go
func chanrecv(ch unsafe.Pointer, nb bool, val unsafe.Pointer) (selected, received bool)
```

### <a id="chansend" href="#chansend">func chansend(ch unsafe.Pointer, val unsafe.Pointer, nb bool) bool</a>

```
searchKey: reflect.chansend
tags: [function private]
```

```Go
func chansend(ch unsafe.Pointer, val unsafe.Pointer, nb bool) bool
```

### <a id="clearLayoutCache" href="#clearLayoutCache">func clearLayoutCache()</a>

```
searchKey: reflect.clearLayoutCache
tags: [function private]
```

```Go
func clearLayoutCache()
```

### <a id="convertOp" href="#convertOp">func convertOp(dst, src *rtype) func(Value, Type) Value</a>

```
searchKey: reflect.convertOp
tags: [function private]
```

```Go
func convertOp(dst, src *rtype) func(Value, Type) Value
```

convertOp returns the function to convert a value of type src to a value of type dst. If the conversion is illegal, convertOp returns nil. 

### <a id="deepValueEqual" href="#deepValueEqual">func deepValueEqual(v1, v2 Value, visited map[visit]bool) bool</a>

```
searchKey: reflect.deepValueEqual
tags: [function private]
```

```Go
func deepValueEqual(v1, v2 Value, visited map[visit]bool) bool
```

Tests for deep equality using reflected types. The map argument tracks comparisons that have already been seen, which allows short circuiting on recursive types. 

### <a id="directlyAssignable" href="#directlyAssignable">func directlyAssignable(T, V *rtype) bool</a>

```
searchKey: reflect.directlyAssignable
tags: [function private]
```

```Go
func directlyAssignable(T, V *rtype) bool
```

directlyAssignable reports whether a value x of type V can be directly assigned (using memmove) to a value of type T. [https://golang.org/doc/go_spec.html#Assignability](https://golang.org/doc/go_spec.html#Assignability) Ignoring the interface rules (implemented elsewhere) and the ideal constant rules (no ideal constants at run time). 

### <a id="dumpPtrBitMap" href="#dumpPtrBitMap">func dumpPtrBitMap(b abi.IntArgRegBitmap)</a>

```
searchKey: reflect.dumpPtrBitMap
tags: [function private]
```

```Go
func dumpPtrBitMap(b abi.IntArgRegBitmap)
```

### <a id="emitGCMask" href="#emitGCMask">func emitGCMask(out []byte, base uintptr, typ *rtype, n uintptr)</a>

```
searchKey: reflect.emitGCMask
tags: [function private]
```

```Go
func emitGCMask(out []byte, base uintptr, typ *rtype, n uintptr)
```

emitGCMask writes the GC mask for [n]typ into out, starting at bit offset base. 

### <a id="escapes" href="#escapes">func escapes(x interface{})</a>

```
searchKey: reflect.escapes
tags: [function private]
```

```Go
func escapes(x interface{})
```

Dummy annotation marking that the value x escapes, for use in cases where the reflect code is so clever that the compiler cannot follow. 

### <a id="fnv1" href="#fnv1">func fnv1(x uint32, list ...byte) uint32</a>

```
searchKey: reflect.fnv1
tags: [function private]
```

```Go
func fnv1(x uint32, list ...byte) uint32
```

fnv1 incorporates the list of bytes into the hash x using the FNV-1 hash function. 

### <a id="funcName" href="#funcName">func funcName(f func([]Value) []Value) string</a>

```
searchKey: reflect.funcName
tags: [function private]
```

```Go
func funcName(f func([]Value) []Value) string
```

funcName returns the name of f, for use in error messages. 

### <a id="funcStr" href="#funcStr">func funcStr(ft *funcType) string</a>

```
searchKey: reflect.funcStr
tags: [function private]
```

```Go
func funcStr(ft *funcType) string
```

funcStr builds a string representation of a funcType. 

### <a id="gcbits" href="#gcbits">func gcbits(interface{}) []byte</a>

```
searchKey: reflect.gcbits
tags: [function private]
```

```Go
func gcbits(interface{}) []byte
```

### <a id="hashMightPanic" href="#hashMightPanic">func hashMightPanic(t *rtype) bool</a>

```
searchKey: reflect.hashMightPanic
tags: [function private]
```

```Go
func hashMightPanic(t *rtype) bool
```

hashMightPanic reports whether the hash of a map key of type t might panic. 

### <a id="haveIdenticalType" href="#haveIdenticalType">func haveIdenticalType(T, V Type, cmpTags bool) bool</a>

```
searchKey: reflect.haveIdenticalType
tags: [function private]
```

```Go
func haveIdenticalType(T, V Type, cmpTags bool) bool
```

### <a id="haveIdenticalUnderlyingType" href="#haveIdenticalUnderlyingType">func haveIdenticalUnderlyingType(T, V *rtype, cmpTags bool) bool</a>

```
searchKey: reflect.haveIdenticalUnderlyingType
tags: [function private]
```

```Go
func haveIdenticalUnderlyingType(T, V *rtype, cmpTags bool) bool
```

### <a id="ifaceE2I" href="#ifaceE2I">func ifaceE2I(t *rtype, src interface{}, dst unsafe.Pointer)</a>

```
searchKey: reflect.ifaceE2I
tags: [function private]
```

```Go
func ifaceE2I(t *rtype, src interface{}, dst unsafe.Pointer)
```

### <a id="ifaceIndir" href="#ifaceIndir">func ifaceIndir(t *rtype) bool</a>

```
searchKey: reflect.ifaceIndir
tags: [function private]
```

```Go
func ifaceIndir(t *rtype) bool
```

ifaceIndir reports whether t is stored indirectly in an interface value. 

### <a id="implements" href="#implements">func implements(T, V *rtype) bool</a>

```
searchKey: reflect.implements
tags: [function private]
```

```Go
func implements(T, V *rtype) bool
```

implements reports whether the type V implements the interface type T. 

### <a id="isLetter" href="#isLetter">func isLetter(ch rune) bool</a>

```
searchKey: reflect.isLetter
tags: [function private]
```

```Go
func isLetter(ch rune) bool
```

isLetter reports whether a given 'rune' is classified as a Letter. 

### <a id="isReflexive" href="#isReflexive">func isReflexive(t *rtype) bool</a>

```
searchKey: reflect.isReflexive
tags: [function private]
```

```Go
func isReflexive(t *rtype) bool
```

isReflexive reports whether the == operation on the type is reflexive. That is, x == x for all values x of type t. 

### <a id="isValidFieldName" href="#isValidFieldName">func isValidFieldName(fieldName string) bool</a>

```
searchKey: reflect.isValidFieldName
tags: [function private]
```

```Go
func isValidFieldName(fieldName string) bool
```

isValidFieldName checks if a string is a valid (struct) field name or not. 

According to the language spec, a field name should be an identifier. 

identifier = letter { letter | unicode_digit } . letter = unicode_letter | "_" . 

### <a id="makeFuncStub" href="#makeFuncStub">func makeFuncStub()</a>

```
searchKey: reflect.makeFuncStub
tags: [function private]
```

```Go
func makeFuncStub()
```

makeFuncStub is an assembly function that is the code half of the function returned from MakeFunc. It expects a *callReflectFunc as its context register, and its job is to invoke callReflect(ctxt, frame) where ctxt is the context register and frame is a pointer to the first word in the passed-in argument frame. 

### <a id="makechan" href="#makechan">func makechan(typ *rtype, size int) (ch unsafe.Pointer)</a>

```
searchKey: reflect.makechan
tags: [function private]
```

```Go
func makechan(typ *rtype, size int) (ch unsafe.Pointer)
```

### <a id="makemap" href="#makemap">func makemap(t *rtype, cap int) (m unsafe.Pointer)</a>

```
searchKey: reflect.makemap
tags: [function private]
```

```Go
func makemap(t *rtype, cap int) (m unsafe.Pointer)
```

### <a id="mapaccess" href="#mapaccess">func mapaccess(t *rtype, m unsafe.Pointer, key unsafe.Pointer) (val unsafe.Pointer)</a>

```
searchKey: reflect.mapaccess
tags: [function private]
```

```Go
func mapaccess(t *rtype, m unsafe.Pointer, key unsafe.Pointer) (val unsafe.Pointer)
```

### <a id="mapassign" href="#mapassign">func mapassign(t *rtype, m unsafe.Pointer, key, val unsafe.Pointer)</a>

```
searchKey: reflect.mapassign
tags: [function private]
```

```Go
func mapassign(t *rtype, m unsafe.Pointer, key, val unsafe.Pointer)
```

### <a id="mapdelete" href="#mapdelete">func mapdelete(t *rtype, m unsafe.Pointer, key unsafe.Pointer)</a>

```
searchKey: reflect.mapdelete
tags: [function private]
```

```Go
func mapdelete(t *rtype, m unsafe.Pointer, key unsafe.Pointer)
```

### <a id="mapiterelem" href="#mapiterelem">func mapiterelem(it unsafe.Pointer) (elem unsafe.Pointer)</a>

```
searchKey: reflect.mapiterelem
tags: [function private]
```

```Go
func mapiterelem(it unsafe.Pointer) (elem unsafe.Pointer)
```

### <a id="mapiterinit" href="#mapiterinit">func mapiterinit(t *rtype, m unsafe.Pointer) unsafe.Pointer</a>

```
searchKey: reflect.mapiterinit
tags: [function private]
```

```Go
func mapiterinit(t *rtype, m unsafe.Pointer) unsafe.Pointer
```

m escapes into the return value, but the caller of mapiterinit doesn't let the return value escape. 

### <a id="mapiterkey" href="#mapiterkey">func mapiterkey(it unsafe.Pointer) (key unsafe.Pointer)</a>

```
searchKey: reflect.mapiterkey
tags: [function private]
```

```Go
func mapiterkey(it unsafe.Pointer) (key unsafe.Pointer)
```

### <a id="mapiternext" href="#mapiternext">func mapiternext(it unsafe.Pointer)</a>

```
searchKey: reflect.mapiternext
tags: [function private]
```

```Go
func mapiternext(it unsafe.Pointer)
```

### <a id="maplen" href="#maplen">func maplen(m unsafe.Pointer) int</a>

```
searchKey: reflect.maplen
tags: [function private]
```

```Go
func maplen(m unsafe.Pointer) int
```

### <a id="memmove" href="#memmove">func memmove(dst, src unsafe.Pointer, size uintptr)</a>

```
searchKey: reflect.memmove
tags: [function private]
```

```Go
func memmove(dst, src unsafe.Pointer, size uintptr)
```

memmove copies size bytes to dst from src. No write barriers are used. 

### <a id="methodName" href="#methodName">func methodName() string</a>

```
searchKey: reflect.methodName
tags: [function private]
```

```Go
func methodName() string
```

methodName returns the name of the calling method, assumed to be two stack frames above. 

### <a id="methodNameSkip" href="#methodNameSkip">func methodNameSkip() string</a>

```
searchKey: reflect.methodNameSkip
tags: [function private]
```

```Go
func methodNameSkip() string
```

methodNameSkip is like methodName, but skips another stack frame. This is a separate function so that reflect.flag.mustBe will be inlined. 

### <a id="methodValueCall" href="#methodValueCall">func methodValueCall()</a>

```
searchKey: reflect.methodValueCall
tags: [function private]
```

```Go
func methodValueCall()
```

methodValueCall is an assembly function that is the code half of the function returned from makeMethodValue. It expects a *methodValue as its context register, and its job is to invoke callMethod(ctxt, frame) where ctxt is the context register and frame is a pointer to the first word in the passed-in argument frame. 

### <a id="moveMakeFuncArgPtrs" href="#moveMakeFuncArgPtrs">func moveMakeFuncArgPtrs(ctxt *makeFuncCtxt, args *abi.RegArgs)</a>

```
searchKey: reflect.moveMakeFuncArgPtrs
tags: [function private]
```

```Go
func moveMakeFuncArgPtrs(ctxt *makeFuncCtxt, args *abi.RegArgs)
```

moveMakeFuncArgPtrs uses ctxt.regPtrs to copy integer pointer arguments in args.Ints to args.Ptrs where the GC can see them. 

This is similar to what reflectcallmove does in the runtime, except that happens on the return path, whereas this happens on the call path. 

nosplit because pointers are being held in uintptr slots in args, so having our stack scanned now could lead to accidentally freeing memory. 

### <a id="needKeyUpdate" href="#needKeyUpdate">func needKeyUpdate(t *rtype) bool</a>

```
searchKey: reflect.needKeyUpdate
tags: [function private]
```

```Go
func needKeyUpdate(t *rtype) bool
```

needKeyUpdate reports whether map overwrites require the key to be copied. 

### <a id="overflowFloat32" href="#overflowFloat32">func overflowFloat32(x float64) bool</a>

```
searchKey: reflect.overflowFloat32
tags: [function private]
```

```Go
func overflowFloat32(x float64) bool
```

### <a id="packEface" href="#packEface">func packEface(v Value) interface{}</a>

```
searchKey: reflect.packEface
tags: [function private]
```

```Go
func packEface(v Value) interface{}
```

packEface converts v to the empty interface. 

### <a id="resolveNameOff" href="#resolveNameOff">func resolveNameOff(ptrInModule unsafe.Pointer, off int32) unsafe.Pointer</a>

```
searchKey: reflect.resolveNameOff
tags: [function private]
```

```Go
func resolveNameOff(ptrInModule unsafe.Pointer, off int32) unsafe.Pointer
```

resolveNameOff resolves a name offset from a base pointer. The (*rtype).nameOff method is a convenience wrapper for this function. Implemented in the runtime package. 

### <a id="resolveTextOff" href="#resolveTextOff">func resolveTextOff(rtype unsafe.Pointer, off int32) unsafe.Pointer</a>

```
searchKey: reflect.resolveTextOff
tags: [function private]
```

```Go
func resolveTextOff(rtype unsafe.Pointer, off int32) unsafe.Pointer
```

resolveTextOff resolves a function pointer offset from a base type. The (*rtype).textOff method is a convenience wrapper for this function. Implemented in the runtime package. 

### <a id="resolveTypeOff" href="#resolveTypeOff">func resolveTypeOff(rtype unsafe.Pointer, off int32) unsafe.Pointer</a>

```
searchKey: reflect.resolveTypeOff
tags: [function private]
```

```Go
func resolveTypeOff(rtype unsafe.Pointer, off int32) unsafe.Pointer
```

resolveTypeOff resolves an *rtype offset from a base type. The (*rtype).typeOff method is a convenience wrapper for this function. Implemented in the runtime package. 

### <a id="rselect" href="#rselect">func rselect([]runtimeSelect) (chosen int, recvOK bool)</a>

```
searchKey: reflect.rselect
tags: [function private]
```

```Go
func rselect([]runtimeSelect) (chosen int, recvOK bool)
```

rselect runs a select. It returns the index of the chosen case. If the case was a receive, val is filled in with the received value. The conventional OK bool indicates whether the receive corresponds to a sent value. 

### <a id="specialChannelAssignability" href="#specialChannelAssignability">func specialChannelAssignability(T, V *rtype) bool</a>

```
searchKey: reflect.specialChannelAssignability
tags: [function private]
```

```Go
func specialChannelAssignability(T, V *rtype) bool
```

specialChannelAssignability reports whether a value x of channel type V can be directly assigned (using memmove) to another channel type T. [https://golang.org/doc/go_spec.html#Assignability](https://golang.org/doc/go_spec.html#Assignability) T and V must be both of Chan kind. 

### <a id="storeRcvr" href="#storeRcvr">func storeRcvr(v Value, p unsafe.Pointer)</a>

```
searchKey: reflect.storeRcvr
tags: [function private]
```

```Go
func storeRcvr(v Value, p unsafe.Pointer)
```

v is a method receiver. Store at p the word which is used to encode that receiver at the start of the argument list. Reflect uses the "interface" calling convention for methods, which always uses one word to record the receiver. 

### <a id="typedmemclr" href="#typedmemclr">func typedmemclr(t *rtype, ptr unsafe.Pointer)</a>

```
searchKey: reflect.typedmemclr
tags: [function private]
```

```Go
func typedmemclr(t *rtype, ptr unsafe.Pointer)
```

typedmemclr zeros the value at ptr of type t. 

### <a id="typedmemclrpartial" href="#typedmemclrpartial">func typedmemclrpartial(t *rtype, ptr unsafe.Pointer, off, size uintptr)</a>

```
searchKey: reflect.typedmemclrpartial
tags: [function private]
```

```Go
func typedmemclrpartial(t *rtype, ptr unsafe.Pointer, off, size uintptr)
```

typedmemclrpartial is like typedmemclr but assumes that dst points off bytes into the value and only clears size bytes. 

### <a id="typedmemmove" href="#typedmemmove">func typedmemmove(t *rtype, dst, src unsafe.Pointer)</a>

```
searchKey: reflect.typedmemmove
tags: [function private]
```

```Go
func typedmemmove(t *rtype, dst, src unsafe.Pointer)
```

typedmemmove copies a value of type t to dst from src. 

### <a id="typedmemmovepartial" href="#typedmemmovepartial">func typedmemmovepartial(t *rtype, dst, src unsafe.Pointer, off, size uintptr)</a>

```
searchKey: reflect.typedmemmovepartial
tags: [function private]
```

```Go
func typedmemmovepartial(t *rtype, dst, src unsafe.Pointer, off, size uintptr)
```

typedmemmovepartial is like typedmemmove but assumes that dst and src point off bytes into the value and only copies size bytes. 

### <a id="typedslicecopy" href="#typedslicecopy">func typedslicecopy(elemType *rtype, dst, src unsafeheader.Slice) int</a>

```
searchKey: reflect.typedslicecopy
tags: [function private]
```

```Go
func typedslicecopy(elemType *rtype, dst, src unsafeheader.Slice) int
```

typedslicecopy copies a slice of elemType values from src to dst, returning the number of elements copied. 

### <a id="typehash" href="#typehash">func typehash(t *rtype, p unsafe.Pointer, h uintptr) uintptr</a>

```
searchKey: reflect.typehash
tags: [function private]
```

```Go
func typehash(t *rtype, p unsafe.Pointer, h uintptr) uintptr
```

### <a id="typelinks" href="#typelinks">func typelinks() (sections []unsafe.Pointer, offset [][]int32)</a>

```
searchKey: reflect.typelinks
tags: [function private]
```

```Go
func typelinks() (sections []unsafe.Pointer, offset [][]int32)
```

typelinks is implemented in package runtime. It returns a slice of the sections in each module, and a slice of *rtype offsets in each module. 

The types in each module are sorted by string. That is, the first two linked types of the first module are: 

```
d0 := sections[0]
t1 := (*rtype)(add(d0, offset[0][0]))
t2 := (*rtype)(add(d0, offset[0][1]))

```
and 

```
t1.String() < t2.String()

```
Note that strings are not unique identifiers for types: there can be more than one with a given string. Only types we might want to look up are included: pointers, channels, maps, slices, and arrays. 

### <a id="typeptrdata" href="#typeptrdata">func typeptrdata(t *rtype) uintptr</a>

```
searchKey: reflect.typeptrdata
tags: [function private]
```

```Go
func typeptrdata(t *rtype) uintptr
```

typeptrdata returns the length in bytes of the prefix of t containing pointer data. Anything after this offset is scalar data. keep in sync with ../cmd/compile/internal/gc/reflect.go 

### <a id="typesByString" href="#typesByString">func typesByString(s string) []*rtype</a>

```
searchKey: reflect.typesByString
tags: [function private]
```

```Go
func typesByString(s string) []*rtype
```

typesByString returns the subslice of typelinks() whose elements have the given string representation. It may be empty (no known types with that string) or may have multiple elements (multiple types with that string). 

### <a id="typesMustMatch" href="#typesMustMatch">func typesMustMatch(what string, t1, t2 Type)</a>

```
searchKey: reflect.typesMustMatch
tags: [function private]
```

```Go
func typesMustMatch(what string, t1, t2 Type)
```

### <a id="unsafe_New" href="#unsafe_New">func unsafe_New(*rtype) unsafe.Pointer</a>

```
searchKey: reflect.unsafe_New
tags: [function private]
```

```Go
func unsafe_New(*rtype) unsafe.Pointer
```

implemented in package runtime 

### <a id="unsafe_NewArray" href="#unsafe_NewArray">func unsafe_NewArray(*rtype, int) unsafe.Pointer</a>

```
searchKey: reflect.unsafe_NewArray
tags: [function private]
```

```Go
func unsafe_NewArray(*rtype, int) unsafe.Pointer
```

### <a id="valueInterface" href="#valueInterface">func valueInterface(v Value, safe bool) interface{}</a>

```
searchKey: reflect.valueInterface
tags: [function private]
```

```Go
func valueInterface(v Value, safe bool) interface{}
```

### <a id="writeVarint" href="#writeVarint">func writeVarint(buf []byte, n int) int</a>

```
searchKey: reflect.writeVarint
tags: [function private]
```

```Go
func writeVarint(buf []byte, n int) int
```

writeVarint writes n to buf in varint form. Returns the number of bytes written. n must be nonnegative. Writes at most 10 bytes. 

