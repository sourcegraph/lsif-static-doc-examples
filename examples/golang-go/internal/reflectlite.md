# Package reflectlite

Package reflectlite implements lightweight version of reflect, not using any package except for "runtime" and "unsafe". 

## Index

* [Constants](#const)
    * [const Array](#Array)
    * [const Bool](#Bool)
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
    * [const bothDir](#bothDir)
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
    * [const ptrSize](#ptrSize)
    * [const recvDir](#recvDir)
    * [const sendDir](#sendDir)
    * [const tflagExtraStar](#tflagExtraStar)
    * [const tflagNamed](#tflagNamed)
    * [const tflagRegularMemory](#tflagRegularMemory)
    * [const tflagUncommon](#tflagUncommon)
* [Variables](#var)
    * [var dummy](#dummy)
    * [var kindNames](#kindNames)
    * [var pinUnexpMethI](#pinUnexpMethI)
* [Types](#type)
    * [type Buffer struct](#Buffer)
    * [type EmbedWithUnexpMeth struct{}](#EmbedWithUnexpMeth)
        * [func (EmbedWithUnexpMeth) f()](#EmbedWithUnexpMeth.f)
    * [type Kind uint](#Kind)
        * [func (k Kind) String() string](#Kind.String)
    * [type Type interface](#Type)
        * [func StructFieldType(t *structType, i int) Type](#StructFieldType)
        * [func TField(typ Type, i int) Type](#TField)
        * [func TypeOf(i interface{}) Type](#TypeOf)
        * [func toType(t *rtype) Type](#toType)
    * [type Value struct](#Value)
        * [func Field(v Value, i int) Value](#Field)
        * [func ValueOf(i interface{}) Value](#ValueOf)
        * [func Zero(typ Type) Value](#Zero)
        * [func unpackEface(i interface{}) Value](#unpackEface)
        * [func (v Value) CanSet() bool](#Value.CanSet)
        * [func (v Value) Elem() Value](#Value.Elem)
        * [func (v Value) IsNil() bool](#Value.IsNil)
        * [func (v Value) IsValid() bool](#Value.IsValid)
        * [func (v Value) Kind() Kind](#Value.Kind)
        * [func (v Value) Len() int](#Value.Len)
        * [func (v Value) Set(x Value)](#Value.Set)
        * [func (v Value) Type() Type](#Value.Type)
        * [func (v Value) assignTo(context string, dst *rtype, target unsafe.Pointer) Value](#Value.assignTo)
        * [func (v Value) numMethod() int](#Value.numMethod)
        * [func (v Value) pointer() unsafe.Pointer](#Value.pointer)
    * [type ValueError struct](#ValueError)
        * [func (e *ValueError) Error() string](#ValueError.Error)
    * [type arrayType struct](#arrayType)
    * [type chanDir int](#chanDir)
    * [type chanType struct](#chanType)
    * [type emptyInterface struct](#emptyInterface)
    * [type flag uintptr](#flag)
        * [func (f flag) kind() Kind](#flag.kind)
        * [func (f flag) mustBeAssignable()](#flag.mustBeAssignable)
        * [func (f flag) mustBeExported()](#flag.mustBeExported)
        * [func (f flag) ro() flag](#flag.ro)
    * [type funcType struct](#funcType)
        * [func (t *funcType) in() []*rtype](#funcType.in)
        * [func (t *funcType) out() []*rtype](#funcType.out)
    * [type imethod struct](#imethod)
    * [type interfaceType struct](#interfaceType)
        * [func (t *interfaceType) NumMethod() int](#interfaceType.NumMethod)
    * [type mapType struct](#mapType)
    * [type method struct](#method)
    * [type name struct](#name)
        * [func (n name) data(off int, whySafe string) *byte](#name.data)
        * [func (n name) hasTag() bool](#name.hasTag)
        * [func (n name) isExported() bool](#name.isExported)
        * [func (n name) name() (s string)](#name.name)
        * [func (n name) pkgPath() string](#name.pkgPath)
        * [func (n name) readVarint(off int) (int, int)](#name.readVarint)
        * [func (n name) tag() (s string)](#name.tag)
    * [type nameOff int32](#nameOff)
    * [type pinUnexpMeth interface](#pinUnexpMeth)
    * [type ptrType struct](#ptrType)
    * [type rtype struct](#rtype)
        * [func (t *rtype) AssignableTo(u Type) bool](#rtype.AssignableTo)
        * [func (t *rtype) Comparable() bool](#rtype.Comparable)
        * [func (t *rtype) Elem() Type](#rtype.Elem)
        * [func (t *rtype) Implements(u Type) bool](#rtype.Implements)
        * [func (t *rtype) In(i int) Type](#rtype.In)
        * [func (t *rtype) Key() Type](#rtype.Key)
        * [func (t *rtype) Kind() Kind](#rtype.Kind)
        * [func (t *rtype) Len() int](#rtype.Len)
        * [func (t *rtype) Name() string](#rtype.Name)
        * [func (t *rtype) NumField() int](#rtype.NumField)
        * [func (t *rtype) NumIn() int](#rtype.NumIn)
        * [func (t *rtype) NumMethod() int](#rtype.NumMethod)
        * [func (t *rtype) NumOut() int](#rtype.NumOut)
        * [func (t *rtype) Out(i int) Type](#rtype.Out)
        * [func (t *rtype) PkgPath() string](#rtype.PkgPath)
        * [func (t *rtype) Size() uintptr](#rtype.Size)
        * [func (t *rtype) String() string](#rtype.String)
        * [func (t *rtype) chanDir() chanDir](#rtype.chanDir)
        * [func (t *rtype) common() *rtype](#rtype.common)
        * [func (t *rtype) exportedMethods() []method](#rtype.exportedMethods)
        * [func (t *rtype) hasName() bool](#rtype.hasName)
        * [func (t *rtype) nameOff(off nameOff) name](#rtype.nameOff)
        * [func (t *rtype) pointers() bool](#rtype.pointers)
        * [func (t *rtype) typeOff(off typeOff) *rtype](#rtype.typeOff)
        * [func (t *rtype) uncommon() *uncommonType](#rtype.uncommon)
    * [type sliceType struct](#sliceType)
    * [type structField struct](#structField)
        * [func (f *structField) embedded() bool](#structField.embedded)
        * [func (f *structField) offset() uintptr](#structField.offset)
    * [type structType struct](#structType)
    * [type structTypeUncommon struct](#structTypeUncommon)
    * [type textOff int32](#textOff)
    * [type tflag uint8](#tflag)
    * [type typeOff int32](#typeOff)
    * [type uncommonType struct](#uncommonType)
        * [func (t *uncommonType) exportedMethods() []method](#uncommonType.exportedMethods)
        * [func (t *uncommonType) methods() []method](#uncommonType.methods)
* [Functions](#func)
    * [func FirstMethodNameBytes(t Type) *byte](#FirstMethodNameBytes)
    * [func Swapper(slice interface{}) func(i, j int)](#Swapper)
    * [func ToInterface(v Value) (i interface{})](#ToInterface)
    * [func add(p unsafe.Pointer, x uintptr, whySafe string) unsafe.Pointer](#add)
    * [func arrayAt(p unsafe.Pointer, i int, eltSize uintptr, whySafe string) unsafe.Pointer](#arrayAt)
    * [func chanlen(unsafe.Pointer) int](#chanlen)
    * [func directlyAssignable(T, V *rtype) bool](#directlyAssignable)
    * [func escapes(x interface{})](#escapes)
    * [func haveIdenticalType(T, V Type, cmpTags bool) bool](#haveIdenticalType)
    * [func haveIdenticalUnderlyingType(T, V *rtype, cmpTags bool) bool](#haveIdenticalUnderlyingType)
    * [func ifaceE2I(t *rtype, src interface{}, dst unsafe.Pointer)](#ifaceE2I)
    * [func ifaceIndir(t *rtype) bool](#ifaceIndir)
    * [func implements(T, V *rtype) bool](#implements)
    * [func maplen(unsafe.Pointer) int](#maplen)
    * [func methodName() string](#methodName)
    * [func packEface(v Value) interface{}](#packEface)
    * [func resolveNameOff(ptrInModule unsafe.Pointer, off int32) unsafe.Pointer](#resolveNameOff)
    * [func resolveTypeOff(rtype unsafe.Pointer, off int32) unsafe.Pointer](#resolveTypeOff)
    * [func typedmemmove(t *rtype, dst, src unsafe.Pointer)](#typedmemmove)
    * [func unsafe_New(*rtype) unsafe.Pointer](#unsafe_New)
    * [func valueInterface(v Value) interface{}](#valueInterface)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="Array" href="#Array">const Array</a>

```
searchKey: reflectlite.Array
tags: [constant number]
```

```Go
const Array
```

### <a id="Bool" href="#Bool">const Bool</a>

```
searchKey: reflectlite.Bool
tags: [constant number]
```

```Go
const Bool
```

### <a id="Chan" href="#Chan">const Chan</a>

```
searchKey: reflectlite.Chan
tags: [constant number]
```

```Go
const Chan
```

### <a id="Complex128" href="#Complex128">const Complex128</a>

```
searchKey: reflectlite.Complex128
tags: [constant number]
```

```Go
const Complex128
```

### <a id="Complex64" href="#Complex64">const Complex64</a>

```
searchKey: reflectlite.Complex64
tags: [constant number]
```

```Go
const Complex64
```

### <a id="Float32" href="#Float32">const Float32</a>

```
searchKey: reflectlite.Float32
tags: [constant number]
```

```Go
const Float32
```

### <a id="Float64" href="#Float64">const Float64</a>

```
searchKey: reflectlite.Float64
tags: [constant number]
```

```Go
const Float64
```

### <a id="Func" href="#Func">const Func</a>

```
searchKey: reflectlite.Func
tags: [constant number]
```

```Go
const Func
```

### <a id="Int" href="#Int">const Int</a>

```
searchKey: reflectlite.Int
tags: [constant number]
```

```Go
const Int
```

### <a id="Int16" href="#Int16">const Int16</a>

```
searchKey: reflectlite.Int16
tags: [constant number]
```

```Go
const Int16
```

### <a id="Int32" href="#Int32">const Int32</a>

```
searchKey: reflectlite.Int32
tags: [constant number]
```

```Go
const Int32
```

### <a id="Int64" href="#Int64">const Int64</a>

```
searchKey: reflectlite.Int64
tags: [constant number]
```

```Go
const Int64
```

### <a id="Int8" href="#Int8">const Int8</a>

```
searchKey: reflectlite.Int8
tags: [constant number]
```

```Go
const Int8
```

### <a id="Interface" href="#Interface">const Interface</a>

```
searchKey: reflectlite.Interface
tags: [constant number]
```

```Go
const Interface
```

### <a id="Invalid" href="#Invalid">const Invalid</a>

```
searchKey: reflectlite.Invalid
tags: [constant number]
```

```Go
const Invalid Kind = iota
```

### <a id="Map" href="#Map">const Map</a>

```
searchKey: reflectlite.Map
tags: [constant number]
```

```Go
const Map
```

### <a id="Ptr" href="#Ptr">const Ptr</a>

```
searchKey: reflectlite.Ptr
tags: [constant number]
```

```Go
const Ptr
```

### <a id="Slice" href="#Slice">const Slice</a>

```
searchKey: reflectlite.Slice
tags: [constant number]
```

```Go
const Slice
```

### <a id="String" href="#String">const String</a>

```
searchKey: reflectlite.String
tags: [constant number]
```

```Go
const String
```

### <a id="Struct" href="#Struct">const Struct</a>

```
searchKey: reflectlite.Struct
tags: [constant number]
```

```Go
const Struct
```

### <a id="Uint" href="#Uint">const Uint</a>

```
searchKey: reflectlite.Uint
tags: [constant number]
```

```Go
const Uint
```

### <a id="Uint16" href="#Uint16">const Uint16</a>

```
searchKey: reflectlite.Uint16
tags: [constant number]
```

```Go
const Uint16
```

### <a id="Uint32" href="#Uint32">const Uint32</a>

```
searchKey: reflectlite.Uint32
tags: [constant number]
```

```Go
const Uint32
```

### <a id="Uint64" href="#Uint64">const Uint64</a>

```
searchKey: reflectlite.Uint64
tags: [constant number]
```

```Go
const Uint64
```

### <a id="Uint8" href="#Uint8">const Uint8</a>

```
searchKey: reflectlite.Uint8
tags: [constant number]
```

```Go
const Uint8
```

### <a id="Uintptr" href="#Uintptr">const Uintptr</a>

```
searchKey: reflectlite.Uintptr
tags: [constant number]
```

```Go
const Uintptr
```

### <a id="UnsafePointer" href="#UnsafePointer">const UnsafePointer</a>

```
searchKey: reflectlite.UnsafePointer
tags: [constant number]
```

```Go
const UnsafePointer
```

### <a id="bothDir" href="#bothDir">const bothDir</a>

```
searchKey: reflectlite.bothDir
tags: [constant number private]
```

```Go
const bothDir = recvDir | sendDir // chan

```

### <a id="flagAddr" href="#flagAddr">const flagAddr</a>

```
searchKey: reflectlite.flagAddr
tags: [constant number private]
```

```Go
const flagAddr flag = 1 << 8
```

### <a id="flagEmbedRO" href="#flagEmbedRO">const flagEmbedRO</a>

```
searchKey: reflectlite.flagEmbedRO
tags: [constant number private]
```

```Go
const flagEmbedRO flag = 1 << 6
```

### <a id="flagIndir" href="#flagIndir">const flagIndir</a>

```
searchKey: reflectlite.flagIndir
tags: [constant number private]
```

```Go
const flagIndir flag = 1 << 7
```

### <a id="flagKindMask" href="#flagKindMask">const flagKindMask</a>

```
searchKey: reflectlite.flagKindMask
tags: [constant number private]
```

```Go
const flagKindMask flag = 1<<flagKindWidth - 1
```

### <a id="flagKindWidth" href="#flagKindWidth">const flagKindWidth</a>

```
searchKey: reflectlite.flagKindWidth
tags: [constant number private]
```

```Go
const flagKindWidth = 5 // there are 27 kinds

```

### <a id="flagMethod" href="#flagMethod">const flagMethod</a>

```
searchKey: reflectlite.flagMethod
tags: [constant number private]
```

```Go
const flagMethod flag = 1 << 9
```

### <a id="flagMethodShift" href="#flagMethodShift">const flagMethodShift</a>

```
searchKey: reflectlite.flagMethodShift
tags: [constant number private]
```

```Go
const flagMethodShift = 10
```

### <a id="flagRO" href="#flagRO">const flagRO</a>

```
searchKey: reflectlite.flagRO
tags: [constant number private]
```

```Go
const flagRO flag = flagStickyRO | flagEmbedRO
```

### <a id="flagStickyRO" href="#flagStickyRO">const flagStickyRO</a>

```
searchKey: reflectlite.flagStickyRO
tags: [constant number private]
```

```Go
const flagStickyRO flag = 1 << 5
```

### <a id="kindDirectIface" href="#kindDirectIface">const kindDirectIface</a>

```
searchKey: reflectlite.kindDirectIface
tags: [constant number private]
```

```Go
const kindDirectIface = 1 << 5
```

### <a id="kindGCProg" href="#kindGCProg">const kindGCProg</a>

```
searchKey: reflectlite.kindGCProg
tags: [constant number private]
```

```Go
const kindGCProg = 1 << 6 // Type.gc points to GC program

```

### <a id="kindMask" href="#kindMask">const kindMask</a>

```
searchKey: reflectlite.kindMask
tags: [constant number private]
```

```Go
const kindMask = (1 << 5) - 1
```

### <a id="ptrSize" href="#ptrSize">const ptrSize</a>

```
searchKey: reflectlite.ptrSize
tags: [constant number private]
```

```Go
const ptrSize = 4 << (^uintptr(0) >> 63) // unsafe.Sizeof(uintptr(0)) but an ideal const

```

### <a id="recvDir" href="#recvDir">const recvDir</a>

```
searchKey: reflectlite.recvDir
tags: [constant number private]
```

```Go
const recvDir chanDir = 1 << iota // <-chan

```

### <a id="sendDir" href="#sendDir">const sendDir</a>

```
searchKey: reflectlite.sendDir
tags: [constant number private]
```

```Go
const sendDir // chan<-

```

### <a id="tflagExtraStar" href="#tflagExtraStar">const tflagExtraStar</a>

```
searchKey: reflectlite.tflagExtraStar
tags: [constant number private]
```

```Go
const tflagExtraStar tflag = 1 << 1
```

tflagExtraStar means the name in the str field has an extraneous '*' prefix. This is because for most types T in a program, the type *T also exists and reusing the str data saves binary size. 

### <a id="tflagNamed" href="#tflagNamed">const tflagNamed</a>

```
searchKey: reflectlite.tflagNamed
tags: [constant number private]
```

```Go
const tflagNamed tflag = 1 << 2
```

tflagNamed means the type has a name. 

### <a id="tflagRegularMemory" href="#tflagRegularMemory">const tflagRegularMemory</a>

```
searchKey: reflectlite.tflagRegularMemory
tags: [constant number private]
```

```Go
const tflagRegularMemory tflag = 1 << 3
```

tflagRegularMemory means that equal and hash functions can treat this type as a single region of t.size bytes. 

### <a id="tflagUncommon" href="#tflagUncommon">const tflagUncommon</a>

```
searchKey: reflectlite.tflagUncommon
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

```
tags: [package private]
```

### <a id="dummy" href="#dummy">var dummy</a>

```
searchKey: reflectlite.dummy
tags: [variable struct private]
```

```Go
var dummy struct {
	b bool
	x interface{}
}
```

### <a id="kindNames" href="#kindNames">var kindNames</a>

```
searchKey: reflectlite.kindNames
tags: [variable array string private]
```

```Go
var kindNames = ...
```

### <a id="pinUnexpMethI" href="#pinUnexpMethI">var pinUnexpMethI</a>

```
searchKey: reflectlite.pinUnexpMethI
tags: [variable interface private]
```

```Go
var pinUnexpMethI = pinUnexpMeth(EmbedWithUnexpMeth{})
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Buffer" href="#Buffer">type Buffer struct</a>

```
searchKey: reflectlite.Buffer
tags: [struct private]
```

```Go
type Buffer struct {
	buf []byte
}
```

### <a id="EmbedWithUnexpMeth" href="#EmbedWithUnexpMeth">type EmbedWithUnexpMeth struct{}</a>

```
searchKey: reflectlite.EmbedWithUnexpMeth
tags: [struct private]
```

```Go
type EmbedWithUnexpMeth struct{}
```

#### <a id="EmbedWithUnexpMeth.f" href="#EmbedWithUnexpMeth.f">func (EmbedWithUnexpMeth) f()</a>

```
searchKey: reflectlite.EmbedWithUnexpMeth.f
tags: [function private]
```

```Go
func (EmbedWithUnexpMeth) f()
```

### <a id="Kind" href="#Kind">type Kind uint</a>

```
searchKey: reflectlite.Kind
tags: [number]
```

```Go
type Kind uint
```

A Kind represents the specific kind of type that a Type represents. The zero Kind is not a valid kind. 

#### <a id="Kind.String" href="#Kind.String">func (k Kind) String() string</a>

```
searchKey: reflectlite.Kind.String
tags: [function]
```

```Go
func (k Kind) String() string
```

String returns the name of k. 

### <a id="Type" href="#Type">type Type interface</a>

```
searchKey: reflectlite.Type
tags: [interface]
```

```Go
type Type interface {

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

	// Kind returns the specific kind of this type.
	Kind() Kind

	// Implements reports whether the type implements the interface type u.
	Implements(u Type) bool

	// AssignableTo reports whether a value of the type is assignable to type u.
	AssignableTo(u Type) bool

	// Comparable reports whether values of this type are comparable.
	Comparable() bool

	// String returns a string representation of the type.
	// The string representation may use shortened package names
	// (e.g., base64 instead of "encoding/base64") and is not
	// guaranteed to be unique among types. To test for type identity,
	// compare the Types directly.
	String() string

	// Elem returns a type's element type.
	// It panics if the type's Kind is not Ptr.
	Elem() Type

	common() *rtype
	uncommon() *uncommonType
}
```

Type is the representation of a Go type. 

Not all methods apply to all kinds of types. Restrictions, if any, are noted in the documentation for each method. Use the Kind method to find out the kind of type before calling kind-specific methods. Calling a method inappropriate to the kind of type causes a run-time panic. 

Type values are comparable, such as with the == operator, so they can be used as map keys. Two Type values are equal if they represent identical types. 

#### <a id="StructFieldType" href="#StructFieldType">func StructFieldType(t *structType, i int) Type</a>

```
searchKey: reflectlite.StructFieldType
tags: [method private]
```

```Go
func StructFieldType(t *structType, i int) Type
```

Field returns the i'th struct field. 

#### <a id="TField" href="#TField">func TField(typ Type, i int) Type</a>

```
searchKey: reflectlite.TField
tags: [method private]
```

```Go
func TField(typ Type, i int) Type
```

#### <a id="TypeOf" href="#TypeOf">func TypeOf(i interface{}) Type</a>

```
searchKey: reflectlite.TypeOf
tags: [method]
```

```Go
func TypeOf(i interface{}) Type
```

TypeOf returns the reflection Type that represents the dynamic type of i. If i is a nil interface value, TypeOf returns nil. 

#### <a id="toType" href="#toType">func toType(t *rtype) Type</a>

```
searchKey: reflectlite.toType
tags: [method private]
```

```Go
func toType(t *rtype) Type
```

toType converts from a *rtype to a Type that can be returned to the client of package reflect. In gc, the only concern is that a nil *rtype must be replaced by a nil Type, but in gccgo this function takes care of ensuring that multiple *rtype for the same type are coalesced into a single Type. 

### <a id="Value" href="#Value">type Value struct</a>

```
searchKey: reflectlite.Value
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
	// Value cannot represent method values.
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

#### <a id="Field" href="#Field">func Field(v Value, i int) Value</a>

```
searchKey: reflectlite.Field
tags: [method private]
```

```Go
func Field(v Value, i int) Value
```

Field returns the i'th field of the struct v. It panics if v's Kind is not Struct or i is out of range. 

#### <a id="ValueOf" href="#ValueOf">func ValueOf(i interface{}) Value</a>

```
searchKey: reflectlite.ValueOf
tags: [method]
```

```Go
func ValueOf(i interface{}) Value
```

ValueOf returns a new Value initialized to the concrete value stored in the interface i. ValueOf(nil) returns the zero Value. 

#### <a id="Zero" href="#Zero">func Zero(typ Type) Value</a>

```
searchKey: reflectlite.Zero
tags: [method private]
```

```Go
func Zero(typ Type) Value
```

Zero returns a Value representing the zero value for the specified type. The result is different from the zero value of the Value struct, which represents no value at all. For example, Zero(TypeOf(42)) returns a Value with Kind Int and value 0. The returned value is neither addressable nor settable. 

#### <a id="unpackEface" href="#unpackEface">func unpackEface(i interface{}) Value</a>

```
searchKey: reflectlite.unpackEface
tags: [method private]
```

```Go
func unpackEface(i interface{}) Value
```

unpackEface converts the empty interface i to a Value. 

#### <a id="Value.CanSet" href="#Value.CanSet">func (v Value) CanSet() bool</a>

```
searchKey: reflectlite.Value.CanSet
tags: [function]
```

```Go
func (v Value) CanSet() bool
```

CanSet reports whether the value of v can be changed. A Value can be changed only if it is addressable and was not obtained by the use of unexported struct fields. If CanSet returns false, calling Set or any type-specific setter (e.g., SetBool, SetInt) will panic. 

#### <a id="Value.Elem" href="#Value.Elem">func (v Value) Elem() Value</a>

```
searchKey: reflectlite.Value.Elem
tags: [function]
```

```Go
func (v Value) Elem() Value
```

Elem returns the value that the interface v contains or that the pointer v points to. It panics if v's Kind is not Interface or Ptr. It returns the zero Value if v is nil. 

#### <a id="Value.IsNil" href="#Value.IsNil">func (v Value) IsNil() bool</a>

```
searchKey: reflectlite.Value.IsNil
tags: [function]
```

```Go
func (v Value) IsNil() bool
```

IsNil reports whether its argument v is nil. The argument must be a chan, func, interface, map, pointer, or slice value; if it is not, IsNil panics. Note that IsNil is not always equivalent to a regular comparison with nil in Go. For example, if v was created by calling ValueOf with an uninitialized interface variable i, i==nil will be true but v.IsNil will panic as v will be the zero Value. 

#### <a id="Value.IsValid" href="#Value.IsValid">func (v Value) IsValid() bool</a>

```
searchKey: reflectlite.Value.IsValid
tags: [function]
```

```Go
func (v Value) IsValid() bool
```

IsValid reports whether v represents a value. It returns false if v is the zero Value. If IsValid returns false, all other methods except String panic. Most functions and methods never return an invalid Value. If one does, its documentation states the conditions explicitly. 

#### <a id="Value.Kind" href="#Value.Kind">func (v Value) Kind() Kind</a>

```
searchKey: reflectlite.Value.Kind
tags: [function]
```

```Go
func (v Value) Kind() Kind
```

Kind returns v's Kind. If v is the zero Value (IsValid returns false), Kind returns Invalid. 

#### <a id="Value.Len" href="#Value.Len">func (v Value) Len() int</a>

```
searchKey: reflectlite.Value.Len
tags: [function]
```

```Go
func (v Value) Len() int
```

Len returns v's length. It panics if v's Kind is not Array, Chan, Map, Slice, or String. 

#### <a id="Value.Set" href="#Value.Set">func (v Value) Set(x Value)</a>

```
searchKey: reflectlite.Value.Set
tags: [method]
```

```Go
func (v Value) Set(x Value)
```

Set assigns x to the value v. It panics if CanSet returns false. As in Go, x's value must be assignable to v's type. 

#### <a id="Value.Type" href="#Value.Type">func (v Value) Type() Type</a>

```
searchKey: reflectlite.Value.Type
tags: [function]
```

```Go
func (v Value) Type() Type
```

Type returns v's type. 

#### <a id="Value.assignTo" href="#Value.assignTo">func (v Value) assignTo(context string, dst *rtype, target unsafe.Pointer) Value</a>

```
searchKey: reflectlite.Value.assignTo
tags: [method private]
```

```Go
func (v Value) assignTo(context string, dst *rtype, target unsafe.Pointer) Value
```

assignTo returns a value v that can be assigned directly to typ. It panics if v is not assignable to typ. For a conversion to an interface type, target is a suggested scratch space to use. 

#### <a id="Value.numMethod" href="#Value.numMethod">func (v Value) numMethod() int</a>

```
searchKey: reflectlite.Value.numMethod
tags: [function private]
```

```Go
func (v Value) numMethod() int
```

NumMethod returns the number of exported methods in the value's method set. 

#### <a id="Value.pointer" href="#Value.pointer">func (v Value) pointer() unsafe.Pointer</a>

```
searchKey: reflectlite.Value.pointer
tags: [function private]
```

```Go
func (v Value) pointer() unsafe.Pointer
```

pointer returns the underlying pointer represented by v. v.Kind() must be Ptr, Map, Chan, Func, or UnsafePointer 

### <a id="ValueError" href="#ValueError">type ValueError struct</a>

```
searchKey: reflectlite.ValueError
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
searchKey: reflectlite.ValueError.Error
tags: [function]
```

```Go
func (e *ValueError) Error() string
```

### <a id="arrayType" href="#arrayType">type arrayType struct</a>

```
searchKey: reflectlite.arrayType
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

### <a id="chanDir" href="#chanDir">type chanDir int</a>

```
searchKey: reflectlite.chanDir
tags: [number private]
```

```Go
type chanDir int
```

chanDir represents a channel type's direction. 

### <a id="chanType" href="#chanType">type chanType struct</a>

```
searchKey: reflectlite.chanType
tags: [struct private]
```

```Go
type chanType struct {
	rtype
	elem *rtype  // channel element type
	dir  uintptr // channel direction (chanDir)
}
```

chanType represents a channel type. 

### <a id="emptyInterface" href="#emptyInterface">type emptyInterface struct</a>

```
searchKey: reflectlite.emptyInterface
tags: [struct private]
```

```Go
type emptyInterface struct {
	typ  *rtype
	word unsafe.Pointer
}
```

emptyInterface is the header for an interface{} value. 

### <a id="flag" href="#flag">type flag uintptr</a>

```
searchKey: reflectlite.flag
tags: [number private]
```

```Go
type flag uintptr
```

#### <a id="flag.kind" href="#flag.kind">func (f flag) kind() Kind</a>

```
searchKey: reflectlite.flag.kind
tags: [function private]
```

```Go
func (f flag) kind() Kind
```

#### <a id="flag.mustBeAssignable" href="#flag.mustBeAssignable">func (f flag) mustBeAssignable()</a>

```
searchKey: reflectlite.flag.mustBeAssignable
tags: [function private]
```

```Go
func (f flag) mustBeAssignable()
```

mustBeAssignable panics if f records that the value is not assignable, which is to say that either it was obtained using an unexported field or it is not addressable. 

#### <a id="flag.mustBeExported" href="#flag.mustBeExported">func (f flag) mustBeExported()</a>

```
searchKey: reflectlite.flag.mustBeExported
tags: [function private]
```

```Go
func (f flag) mustBeExported()
```

mustBeExported panics if f records that the value was obtained using an unexported field. 

#### <a id="flag.ro" href="#flag.ro">func (f flag) ro() flag</a>

```
searchKey: reflectlite.flag.ro
tags: [function private]
```

```Go
func (f flag) ro() flag
```

### <a id="funcType" href="#funcType">type funcType struct</a>

```
searchKey: reflectlite.funcType
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
#### <a id="funcType.in" href="#funcType.in">func (t *funcType) in() []*rtype</a>

```
searchKey: reflectlite.funcType.in
tags: [function private]
```

```Go
func (t *funcType) in() []*rtype
```

#### <a id="funcType.out" href="#funcType.out">func (t *funcType) out() []*rtype</a>

```
searchKey: reflectlite.funcType.out
tags: [function private]
```

```Go
func (t *funcType) out() []*rtype
```

### <a id="imethod" href="#imethod">type imethod struct</a>

```
searchKey: reflectlite.imethod
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
searchKey: reflectlite.interfaceType
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

#### <a id="interfaceType.NumMethod" href="#interfaceType.NumMethod">func (t *interfaceType) NumMethod() int</a>

```
searchKey: reflectlite.interfaceType.NumMethod
tags: [function private]
```

```Go
func (t *interfaceType) NumMethod() int
```

NumMethod returns the number of interface methods in the type's method set. 

### <a id="mapType" href="#mapType">type mapType struct</a>

```
searchKey: reflectlite.mapType
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
searchKey: reflectlite.method
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

### <a id="name" href="#name">type name struct</a>

```
searchKey: reflectlite.name
tags: [struct private]
```

```Go
type name struct {
	bytes *byte
}
```

name is an encoded type name with optional extra data. 

The first byte is a bit field containing: 

```
1<<0 the name is exported
1<<1 tag data follows the name
1<<2 pkgPath nameOff follows the name and tag

```
The next two bytes are the data length: 

```
l := uint16(data[1])<<8 | uint16(data[2])

```
Bytes [3:3+l] are the string data. 

If tag data follows then bytes 3+l and 3+l+1 are the tag length, with the data following. 

If the import path follows, then 4 bytes at the end of the data form a nameOff. The import path is only set for concrete methods that are defined in a different package than their type. 

If a name starts with "*", then the exported bit represents whether the pointed to type is exported. 

#### <a id="name.data" href="#name.data">func (n name) data(off int, whySafe string) *byte</a>

```
searchKey: reflectlite.name.data
tags: [method private]
```

```Go
func (n name) data(off int, whySafe string) *byte
```

#### <a id="name.hasTag" href="#name.hasTag">func (n name) hasTag() bool</a>

```
searchKey: reflectlite.name.hasTag
tags: [function private]
```

```Go
func (n name) hasTag() bool
```

#### <a id="name.isExported" href="#name.isExported">func (n name) isExported() bool</a>

```
searchKey: reflectlite.name.isExported
tags: [function private]
```

```Go
func (n name) isExported() bool
```

#### <a id="name.name" href="#name.name">func (n name) name() (s string)</a>

```
searchKey: reflectlite.name.name
tags: [function private]
```

```Go
func (n name) name() (s string)
```

#### <a id="name.pkgPath" href="#name.pkgPath">func (n name) pkgPath() string</a>

```
searchKey: reflectlite.name.pkgPath
tags: [function private]
```

```Go
func (n name) pkgPath() string
```

#### <a id="name.readVarint" href="#name.readVarint">func (n name) readVarint(off int) (int, int)</a>

```
searchKey: reflectlite.name.readVarint
tags: [method private]
```

```Go
func (n name) readVarint(off int) (int, int)
```

readVarint parses a varint as encoded by encoding/binary. It returns the number of encoded bytes and the encoded value. 

#### <a id="name.tag" href="#name.tag">func (n name) tag() (s string)</a>

```
searchKey: reflectlite.name.tag
tags: [function private]
```

```Go
func (n name) tag() (s string)
```

### <a id="nameOff" href="#nameOff">type nameOff int32</a>

```
searchKey: reflectlite.nameOff
tags: [number private]
```

```Go
type nameOff int32 // offset to a name

```

### <a id="pinUnexpMeth" href="#pinUnexpMeth">type pinUnexpMeth interface</a>

```
searchKey: reflectlite.pinUnexpMeth
tags: [interface private]
```

```Go
type pinUnexpMeth interface {
	f()
}
```

### <a id="ptrType" href="#ptrType">type ptrType struct</a>

```
searchKey: reflectlite.ptrType
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
searchKey: reflectlite.rtype
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

#### <a id="rtype.AssignableTo" href="#rtype.AssignableTo">func (t *rtype) AssignableTo(u Type) bool</a>

```
searchKey: reflectlite.rtype.AssignableTo
tags: [method private]
```

```Go
func (t *rtype) AssignableTo(u Type) bool
```

#### <a id="rtype.Comparable" href="#rtype.Comparable">func (t *rtype) Comparable() bool</a>

```
searchKey: reflectlite.rtype.Comparable
tags: [function private]
```

```Go
func (t *rtype) Comparable() bool
```

#### <a id="rtype.Elem" href="#rtype.Elem">func (t *rtype) Elem() Type</a>

```
searchKey: reflectlite.rtype.Elem
tags: [function private]
```

```Go
func (t *rtype) Elem() Type
```

#### <a id="rtype.Implements" href="#rtype.Implements">func (t *rtype) Implements(u Type) bool</a>

```
searchKey: reflectlite.rtype.Implements
tags: [method private]
```

```Go
func (t *rtype) Implements(u Type) bool
```

#### <a id="rtype.In" href="#rtype.In">func (t *rtype) In(i int) Type</a>

```
searchKey: reflectlite.rtype.In
tags: [method private]
```

```Go
func (t *rtype) In(i int) Type
```

#### <a id="rtype.Key" href="#rtype.Key">func (t *rtype) Key() Type</a>

```
searchKey: reflectlite.rtype.Key
tags: [function private]
```

```Go
func (t *rtype) Key() Type
```

#### <a id="rtype.Kind" href="#rtype.Kind">func (t *rtype) Kind() Kind</a>

```
searchKey: reflectlite.rtype.Kind
tags: [function private]
```

```Go
func (t *rtype) Kind() Kind
```

#### <a id="rtype.Len" href="#rtype.Len">func (t *rtype) Len() int</a>

```
searchKey: reflectlite.rtype.Len
tags: [function private]
```

```Go
func (t *rtype) Len() int
```

#### <a id="rtype.Name" href="#rtype.Name">func (t *rtype) Name() string</a>

```
searchKey: reflectlite.rtype.Name
tags: [function private]
```

```Go
func (t *rtype) Name() string
```

#### <a id="rtype.NumField" href="#rtype.NumField">func (t *rtype) NumField() int</a>

```
searchKey: reflectlite.rtype.NumField
tags: [function private]
```

```Go
func (t *rtype) NumField() int
```

#### <a id="rtype.NumIn" href="#rtype.NumIn">func (t *rtype) NumIn() int</a>

```
searchKey: reflectlite.rtype.NumIn
tags: [function private]
```

```Go
func (t *rtype) NumIn() int
```

#### <a id="rtype.NumMethod" href="#rtype.NumMethod">func (t *rtype) NumMethod() int</a>

```
searchKey: reflectlite.rtype.NumMethod
tags: [function private]
```

```Go
func (t *rtype) NumMethod() int
```

#### <a id="rtype.NumOut" href="#rtype.NumOut">func (t *rtype) NumOut() int</a>

```
searchKey: reflectlite.rtype.NumOut
tags: [function private]
```

```Go
func (t *rtype) NumOut() int
```

#### <a id="rtype.Out" href="#rtype.Out">func (t *rtype) Out(i int) Type</a>

```
searchKey: reflectlite.rtype.Out
tags: [method private]
```

```Go
func (t *rtype) Out(i int) Type
```

#### <a id="rtype.PkgPath" href="#rtype.PkgPath">func (t *rtype) PkgPath() string</a>

```
searchKey: reflectlite.rtype.PkgPath
tags: [function private]
```

```Go
func (t *rtype) PkgPath() string
```

#### <a id="rtype.Size" href="#rtype.Size">func (t *rtype) Size() uintptr</a>

```
searchKey: reflectlite.rtype.Size
tags: [function private]
```

```Go
func (t *rtype) Size() uintptr
```

#### <a id="rtype.String" href="#rtype.String">func (t *rtype) String() string</a>

```
searchKey: reflectlite.rtype.String
tags: [function private]
```

```Go
func (t *rtype) String() string
```

#### <a id="rtype.chanDir" href="#rtype.chanDir">func (t *rtype) chanDir() chanDir</a>

```
searchKey: reflectlite.rtype.chanDir
tags: [function private]
```

```Go
func (t *rtype) chanDir() chanDir
```

#### <a id="rtype.common" href="#rtype.common">func (t *rtype) common() *rtype</a>

```
searchKey: reflectlite.rtype.common
tags: [function private]
```

```Go
func (t *rtype) common() *rtype
```

#### <a id="rtype.exportedMethods" href="#rtype.exportedMethods">func (t *rtype) exportedMethods() []method</a>

```
searchKey: reflectlite.rtype.exportedMethods
tags: [function private]
```

```Go
func (t *rtype) exportedMethods() []method
```

#### <a id="rtype.hasName" href="#rtype.hasName">func (t *rtype) hasName() bool</a>

```
searchKey: reflectlite.rtype.hasName
tags: [function private]
```

```Go
func (t *rtype) hasName() bool
```

#### <a id="rtype.nameOff" href="#rtype.nameOff">func (t *rtype) nameOff(off nameOff) name</a>

```
searchKey: reflectlite.rtype.nameOff
tags: [method private]
```

```Go
func (t *rtype) nameOff(off nameOff) name
```

#### <a id="rtype.pointers" href="#rtype.pointers">func (t *rtype) pointers() bool</a>

```
searchKey: reflectlite.rtype.pointers
tags: [function private]
```

```Go
func (t *rtype) pointers() bool
```

#### <a id="rtype.typeOff" href="#rtype.typeOff">func (t *rtype) typeOff(off typeOff) *rtype</a>

```
searchKey: reflectlite.rtype.typeOff
tags: [method private]
```

```Go
func (t *rtype) typeOff(off typeOff) *rtype
```

#### <a id="rtype.uncommon" href="#rtype.uncommon">func (t *rtype) uncommon() *uncommonType</a>

```
searchKey: reflectlite.rtype.uncommon
tags: [function private]
```

```Go
func (t *rtype) uncommon() *uncommonType
```

### <a id="sliceType" href="#sliceType">type sliceType struct</a>

```
searchKey: reflectlite.sliceType
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
searchKey: reflectlite.structField
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

#### <a id="structField.embedded" href="#structField.embedded">func (f *structField) embedded() bool</a>

```
searchKey: reflectlite.structField.embedded
tags: [function private]
```

```Go
func (f *structField) embedded() bool
```

#### <a id="structField.offset" href="#structField.offset">func (f *structField) offset() uintptr</a>

```
searchKey: reflectlite.structField.offset
tags: [function private]
```

```Go
func (f *structField) offset() uintptr
```

### <a id="structType" href="#structType">type structType struct</a>

```
searchKey: reflectlite.structType
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

### <a id="structTypeUncommon" href="#structTypeUncommon">type structTypeUncommon struct</a>

```
searchKey: reflectlite.structTypeUncommon
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
searchKey: reflectlite.textOff
tags: [number private]
```

```Go
type textOff int32 // offset from top of text section

```

### <a id="tflag" href="#tflag">type tflag uint8</a>

```
searchKey: reflectlite.tflag
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
searchKey: reflectlite.typeOff
tags: [number private]
```

```Go
type typeOff int32 // offset to an *rtype

```

### <a id="uncommonType" href="#uncommonType">type uncommonType struct</a>

```
searchKey: reflectlite.uncommonType
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
searchKey: reflectlite.uncommonType.exportedMethods
tags: [function private]
```

```Go
func (t *uncommonType) exportedMethods() []method
```

#### <a id="uncommonType.methods" href="#uncommonType.methods">func (t *uncommonType) methods() []method</a>

```
searchKey: reflectlite.uncommonType.methods
tags: [function private]
```

```Go
func (t *uncommonType) methods() []method
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="FirstMethodNameBytes" href="#FirstMethodNameBytes">func FirstMethodNameBytes(t Type) *byte</a>

```
searchKey: reflectlite.FirstMethodNameBytes
tags: [method private]
```

```Go
func FirstMethodNameBytes(t Type) *byte
```

### <a id="Swapper" href="#Swapper">func Swapper(slice interface{}) func(i, j int)</a>

```
searchKey: reflectlite.Swapper
tags: [method]
```

```Go
func Swapper(slice interface{}) func(i, j int)
```

Swapper returns a function that swaps the elements in the provided slice. 

Swapper panics if the provided interface is not a slice. 

### <a id="ToInterface" href="#ToInterface">func ToInterface(v Value) (i interface{})</a>

```
searchKey: reflectlite.ToInterface
tags: [method private]
```

```Go
func ToInterface(v Value) (i interface{})
```

ToInterface returns v's current value as an interface{}. It is equivalent to: 

```
var i interface{} = (v's underlying value)

```
It panics if the Value was obtained by accessing unexported struct fields. 

### <a id="add" href="#add">func add(p unsafe.Pointer, x uintptr, whySafe string) unsafe.Pointer</a>

```
searchKey: reflectlite.add
tags: [method private]
```

```Go
func add(p unsafe.Pointer, x uintptr, whySafe string) unsafe.Pointer
```

add returns p+x. 

The whySafe string is ignored, so that the function still inlines as efficiently as p+x, but all call sites should use the string to record why the addition is safe, which is to say why the addition does not cause x to advance to the very end of p's allocation and therefore point incorrectly at the next block in memory. 

### <a id="arrayAt" href="#arrayAt">func arrayAt(p unsafe.Pointer, i int, eltSize uintptr, whySafe string) unsafe.Pointer</a>

```
searchKey: reflectlite.arrayAt
tags: [method private]
```

```Go
func arrayAt(p unsafe.Pointer, i int, eltSize uintptr, whySafe string) unsafe.Pointer
```

arrayAt returns the i-th element of p, an array whose elements are eltSize bytes wide. The array pointed at by p must have at least i+1 elements: it is invalid (but impossible to check here) to pass i >= len, because then the result will point outside the array. whySafe must explain why i < len. (Passing "i < len" is fine; the benefit is to surface this assumption at the call site.) 

### <a id="chanlen" href="#chanlen">func chanlen(unsafe.Pointer) int</a>

```
searchKey: reflectlite.chanlen
tags: [method private]
```

```Go
func chanlen(unsafe.Pointer) int
```

implemented in runtime: 

### <a id="directlyAssignable" href="#directlyAssignable">func directlyAssignable(T, V *rtype) bool</a>

```
searchKey: reflectlite.directlyAssignable
tags: [method private]
```

```Go
func directlyAssignable(T, V *rtype) bool
```

directlyAssignable reports whether a value x of type V can be directly assigned (using memmove) to a value of type T. [https://golang.org/doc/go_spec.html#Assignability](https://golang.org/doc/go_spec.html#Assignability) Ignoring the interface rules (implemented elsewhere) and the ideal constant rules (no ideal constants at run time). 

### <a id="escapes" href="#escapes">func escapes(x interface{})</a>

```
searchKey: reflectlite.escapes
tags: [method private]
```

```Go
func escapes(x interface{})
```

Dummy annotation marking that the value x escapes, for use in cases where the reflect code is so clever that the compiler cannot follow. 

### <a id="haveIdenticalType" href="#haveIdenticalType">func haveIdenticalType(T, V Type, cmpTags bool) bool</a>

```
searchKey: reflectlite.haveIdenticalType
tags: [method private]
```

```Go
func haveIdenticalType(T, V Type, cmpTags bool) bool
```

### <a id="haveIdenticalUnderlyingType" href="#haveIdenticalUnderlyingType">func haveIdenticalUnderlyingType(T, V *rtype, cmpTags bool) bool</a>

```
searchKey: reflectlite.haveIdenticalUnderlyingType
tags: [method private]
```

```Go
func haveIdenticalUnderlyingType(T, V *rtype, cmpTags bool) bool
```

### <a id="ifaceE2I" href="#ifaceE2I">func ifaceE2I(t *rtype, src interface{}, dst unsafe.Pointer)</a>

```
searchKey: reflectlite.ifaceE2I
tags: [method private]
```

```Go
func ifaceE2I(t *rtype, src interface{}, dst unsafe.Pointer)
```

### <a id="ifaceIndir" href="#ifaceIndir">func ifaceIndir(t *rtype) bool</a>

```
searchKey: reflectlite.ifaceIndir
tags: [method private]
```

```Go
func ifaceIndir(t *rtype) bool
```

ifaceIndir reports whether t is stored indirectly in an interface value. 

### <a id="implements" href="#implements">func implements(T, V *rtype) bool</a>

```
searchKey: reflectlite.implements
tags: [method private]
```

```Go
func implements(T, V *rtype) bool
```

implements reports whether the type V implements the interface type T. 

### <a id="maplen" href="#maplen">func maplen(unsafe.Pointer) int</a>

```
searchKey: reflectlite.maplen
tags: [method private]
```

```Go
func maplen(unsafe.Pointer) int
```

### <a id="methodName" href="#methodName">func methodName() string</a>

```
searchKey: reflectlite.methodName
tags: [function private]
```

```Go
func methodName() string
```

methodName returns the name of the calling method, assumed to be two stack frames above. 

### <a id="packEface" href="#packEface">func packEface(v Value) interface{}</a>

```
searchKey: reflectlite.packEface
tags: [method private]
```

```Go
func packEface(v Value) interface{}
```

packEface converts v to the empty interface. 

### <a id="resolveNameOff" href="#resolveNameOff">func resolveNameOff(ptrInModule unsafe.Pointer, off int32) unsafe.Pointer</a>

```
searchKey: reflectlite.resolveNameOff
tags: [method private]
```

```Go
func resolveNameOff(ptrInModule unsafe.Pointer, off int32) unsafe.Pointer
```

resolveNameOff resolves a name offset from a base pointer. The (*rtype).nameOff method is a convenience wrapper for this function. Implemented in the runtime package. 

### <a id="resolveTypeOff" href="#resolveTypeOff">func resolveTypeOff(rtype unsafe.Pointer, off int32) unsafe.Pointer</a>

```
searchKey: reflectlite.resolveTypeOff
tags: [method private]
```

```Go
func resolveTypeOff(rtype unsafe.Pointer, off int32) unsafe.Pointer
```

resolveTypeOff resolves an *rtype offset from a base type. The (*rtype).typeOff method is a convenience wrapper for this function. Implemented in the runtime package. 

### <a id="typedmemmove" href="#typedmemmove">func typedmemmove(t *rtype, dst, src unsafe.Pointer)</a>

```
searchKey: reflectlite.typedmemmove
tags: [method private]
```

```Go
func typedmemmove(t *rtype, dst, src unsafe.Pointer)
```

typedmemmove copies a value of type t to dst from src. 

### <a id="unsafe_New" href="#unsafe_New">func unsafe_New(*rtype) unsafe.Pointer</a>

```
searchKey: reflectlite.unsafe_New
tags: [method private]
```

```Go
func unsafe_New(*rtype) unsafe.Pointer
```

implemented in package runtime 

### <a id="valueInterface" href="#valueInterface">func valueInterface(v Value) interface{}</a>

```
searchKey: reflectlite.valueInterface
tags: [method private]
```

```Go
func valueInterface(v Value) interface{}
```

