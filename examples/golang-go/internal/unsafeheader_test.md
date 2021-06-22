# Package unsafeheader_test

## Index

* [Variables](#var)
    * [var unsafePointerType](#unsafePointerType)
    * [var uintptrType](#uintptrType)
* [Functions](#func)
    * [func TestTypeMatchesReflectType(t *testing.T)](#TestTypeMatchesReflectType)
    * [func testHeaderMatchesReflect(t *testing.T, header, reflectHeader interface{})](#testHeaderMatchesReflect)
    * [func typeCompatible(t, rt reflect.Type) bool](#typeCompatible)
    * [func TestWriteThroughHeader(t *testing.T)](#TestWriteThroughHeader)


## <a id="var" href="#var">Variables</a>

### <a id="unsafePointerType" href="#unsafePointerType">var unsafePointerType</a>

```
searchKey: unsafeheader_test.unsafePointerType
```

```Go
var unsafePointerType = reflect.TypeOf(unsafe.Pointer(nil))
```

### <a id="uintptrType" href="#uintptrType">var uintptrType</a>

```
searchKey: unsafeheader_test.uintptrType
```

```Go
var uintptrType = reflect.TypeOf(uintptr(0))
```

## <a id="func" href="#func">Functions</a>

### <a id="TestTypeMatchesReflectType" href="#TestTypeMatchesReflectType">func TestTypeMatchesReflectType(t *testing.T)</a>

```
searchKey: unsafeheader_test.TestTypeMatchesReflectType
```

```Go
func TestTypeMatchesReflectType(t *testing.T)
```

TestTypeMatchesReflectType ensures that the name and layout of the unsafeheader types matches the corresponding Header types in the reflect package. 

### <a id="testHeaderMatchesReflect" href="#testHeaderMatchesReflect">func testHeaderMatchesReflect(t *testing.T, header, reflectHeader interface{})</a>

```
searchKey: unsafeheader_test.testHeaderMatchesReflect
```

```Go
func testHeaderMatchesReflect(t *testing.T, header, reflectHeader interface{})
```

### <a id="typeCompatible" href="#typeCompatible">func typeCompatible(t, rt reflect.Type) bool</a>

```
searchKey: unsafeheader_test.typeCompatible
```

```Go
func typeCompatible(t, rt reflect.Type) bool
```

### <a id="TestWriteThroughHeader" href="#TestWriteThroughHeader">func TestWriteThroughHeader(t *testing.T)</a>

```
searchKey: unsafeheader_test.TestWriteThroughHeader
```

```Go
func TestWriteThroughHeader(t *testing.T)
```

TestWriteThroughHeader ensures that the headers in the unsafeheader package can successfully mutate variables of the corresponding built-in types. 

This test is expected to fail under -race (which implicitly enables -d=checkptr) if the runtime views the header types as incompatible with the underlying built-in types. 

