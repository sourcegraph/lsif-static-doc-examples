# Package unsafeheader_test

## Index

* [Variables](#var)
    * [var uintptrType](#uintptrType)
    * [var unsafePointerType](#unsafePointerType)
* [Functions](#func)
    * [func TestTypeMatchesReflectType(t *testing.T)](#TestTypeMatchesReflectType)
    * [func TestWriteThroughHeader(t *testing.T)](#TestWriteThroughHeader)
    * [func testHeaderMatchesReflect(t *testing.T, header, reflectHeader interface{})](#testHeaderMatchesReflect)
    * [func typeCompatible(t, rt reflect.Type) bool](#typeCompatible)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="uintptrType" href="#uintptrType">var uintptrType</a>

```
searchKey: unsafeheader_test.uintptrType
tags: [variable interface private]
```

```Go
var uintptrType = reflect.TypeOf(uintptr(0))
```

### <a id="unsafePointerType" href="#unsafePointerType">var unsafePointerType</a>

```
searchKey: unsafeheader_test.unsafePointerType
tags: [variable interface private]
```

```Go
var unsafePointerType = reflect.TypeOf(unsafe.Pointer(nil))
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestTypeMatchesReflectType" href="#TestTypeMatchesReflectType">func TestTypeMatchesReflectType(t *testing.T)</a>

```
searchKey: unsafeheader_test.TestTypeMatchesReflectType
tags: [function private test]
```

```Go
func TestTypeMatchesReflectType(t *testing.T)
```

TestTypeMatchesReflectType ensures that the name and layout of the unsafeheader types matches the corresponding Header types in the reflect package. 

### <a id="TestWriteThroughHeader" href="#TestWriteThroughHeader">func TestWriteThroughHeader(t *testing.T)</a>

```
searchKey: unsafeheader_test.TestWriteThroughHeader
tags: [function private test]
```

```Go
func TestWriteThroughHeader(t *testing.T)
```

TestWriteThroughHeader ensures that the headers in the unsafeheader package can successfully mutate variables of the corresponding built-in types. 

This test is expected to fail under -race (which implicitly enables -d=checkptr) if the runtime views the header types as incompatible with the underlying built-in types. 

### <a id="testHeaderMatchesReflect" href="#testHeaderMatchesReflect">func testHeaderMatchesReflect(t *testing.T, header, reflectHeader interface{})</a>

```
searchKey: unsafeheader_test.testHeaderMatchesReflect
tags: [function private]
```

```Go
func testHeaderMatchesReflect(t *testing.T, header, reflectHeader interface{})
```

### <a id="typeCompatible" href="#typeCompatible">func typeCompatible(t, rt reflect.Type) bool</a>

```
searchKey: unsafeheader_test.typeCompatible
tags: [function private]
```

```Go
func typeCompatible(t, rt reflect.Type) bool
```

