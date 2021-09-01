# Package builtin

Package builtin provides documentation for Go's predeclared identifiers. The items documented here are not actually in package builtin but their descriptions here allow godoc to present documentation for the language's special identifiers. 

## Index

* [Constants](#const)
    * [const false](#false)
    * [const iota](#iota)
    * [const true](#true)
* [Variables](#var)
    * [var nil](#nil)
* [Types](#type)
    * [type ComplexType builtin.complex64](#ComplexType)
        * [func complex(r, i FloatType) ComplexType](#complex)
    * [type FloatType builtin.float32](#FloatType)
        * [func imag(c ComplexType) FloatType](#imag)
        * [func real(c ComplexType) FloatType](#real)
    * [type IntegerType builtin.int](#IntegerType)
    * [type Type builtin.int](#Type)
        * [func make(t Type, size ...IntegerType) Type](#make)
        * [func new(Type) *Type](#new)
    * [type Type1 builtin.int](#Type1)
    * [type bool builtin.bool](#bool)
    * [type byte builtin.uint8](#byte)
    * [type complex128 builtin.complex128](#complex128)
    * [type complex64 builtin.complex64](#complex64)
    * [type error interface](#error)
    * [type float32 builtin.float32](#float32)
    * [type float64 builtin.float64](#float64)
    * [type int builtin.int](#int)
        * [func cap(v Type) int](#cap)
        * [func copy(dst, src []Type) int](#copy)
        * [func len(v Type) int](#len)
    * [type int16 builtin.int16](#int16)
    * [type int32 builtin.int32](#int32)
    * [type int64 builtin.int64](#int64)
    * [type int8 builtin.int8](#int8)
    * [type rune builtin.int32](#rune)
    * [type string builtin.string](#string)
    * [type uint builtin.uint](#uint)
    * [type uint16 builtin.uint16](#uint16)
    * [type uint32 builtin.uint32](#uint32)
    * [type uint64 builtin.uint64](#uint64)
    * [type uint8 builtin.uint8](#uint8)
    * [type uintptr builtin.uintptr](#uintptr)
* [Functions](#func)
    * [func append(slice []Type, elems ...Type) []Type](#append)
    * [func close(c chan<- Type)](#close)
    * [func delete(m map[Type]Type1, key Type)](#delete)
    * [func panic(v interface{})](#panic)
    * [func print(args ...Type)](#print)
    * [func println(args ...Type)](#println)
    * [func recover() interface{}](#recover)


## <a id="const" href="#const">Constants</a>

### <a id="false" href="#false">const false</a>

```
searchKey: builtin.false
tags: [constant boolean private]
```

```Go
const false = 0 != 0 // Untyped bool.

```

true and false are the two untyped boolean values. 

### <a id="iota" href="#iota">const iota</a>

```
searchKey: builtin.iota
tags: [constant number private]
```

```Go
const iota = 0 // Untyped int.

```

iota is a predeclared identifier representing the untyped integer ordinal number of the current const specification in a (usually parenthesized) const declaration. It is zero-indexed. 

### <a id="true" href="#true">const true</a>

```
searchKey: builtin.true
tags: [constant boolean private]
```

```Go
const true = 0 == 0 // Untyped bool.

```

true and false are the two untyped boolean values. 

## <a id="var" href="#var">Variables</a>

### <a id="nil" href="#nil">var nil</a>

```
searchKey: builtin.nil
tags: [variable private]
```

```Go
var nil Type // Type must be a pointer, channel, func, interface, map, or slice type

```

nil is a predeclared identifier representing the zero value for a pointer, channel, func, interface, map, or slice type. 

## <a id="type" href="#type">Types</a>

### <a id="ComplexType" href="#ComplexType">type ComplexType builtin.complex64</a>

```
searchKey: builtin.ComplexType
```

```Go
type ComplexType complex64
```

ComplexType is here for the purposes of documentation only. It is a stand-in for either complex type: complex64 or complex128. 

#### <a id="complex" href="#complex">func complex(r, i FloatType) ComplexType</a>

```
searchKey: builtin.complex
tags: [function private]
```

```Go
func complex(r, i FloatType) ComplexType
```

The complex built-in function constructs a complex value from two floating-point values. The real and imaginary parts must be of the same size, either float32 or float64 (or assignable to them), and the return value will be the corresponding complex type (complex64 for float32, complex128 for float64). 

### <a id="FloatType" href="#FloatType">type FloatType builtin.float32</a>

```
searchKey: builtin.FloatType
```

```Go
type FloatType float32
```

FloatType is here for the purposes of documentation only. It is a stand-in for either float type: float32 or float64. 

#### <a id="imag" href="#imag">func imag(c ComplexType) FloatType</a>

```
searchKey: builtin.imag
tags: [function private]
```

```Go
func imag(c ComplexType) FloatType
```

The imag built-in function returns the imaginary part of the complex number c. The return value will be floating point type corresponding to the type of c. 

#### <a id="real" href="#real">func real(c ComplexType) FloatType</a>

```
searchKey: builtin.real
tags: [function private]
```

```Go
func real(c ComplexType) FloatType
```

The real built-in function returns the real part of the complex number c. The return value will be floating point type corresponding to the type of c. 

### <a id="IntegerType" href="#IntegerType">type IntegerType builtin.int</a>

```
searchKey: builtin.IntegerType
```

```Go
type IntegerType int
```

IntegerType is here for the purposes of documentation only. It is a stand-in for any integer type: int, uint, int8 etc. 

### <a id="Type" href="#Type">type Type builtin.int</a>

```
searchKey: builtin.Type
```

```Go
type Type int
```

Type is here for the purposes of documentation only. It is a stand-in for any Go type, but represents the same type for any given function invocation. 

#### <a id="make" href="#make">func make(t Type, size ...IntegerType) Type</a>

```
searchKey: builtin.make
tags: [function private]
```

```Go
func make(t Type, size ...IntegerType) Type
```

The make built-in function allocates and initializes an object of type slice, map, or chan (only). Like new, the first argument is a type, not a value. Unlike new, make's return type is the same as the type of its argument, not a pointer to it. The specification of the result depends on the type: 

```
Slice: The size specifies the length. The capacity of the slice is
equal to its length. A second integer argument may be provided to
specify a different capacity; it must be no smaller than the
length. For example, make([]int, 0, 10) allocates an underlying array
of size 10 and returns a slice of length 0 and capacity 10 that is
backed by this underlying array.
Map: An empty map is allocated with enough space to hold the
specified number of elements. The size may be omitted, in which case
a small starting size is allocated.
Channel: The channel's buffer is initialized with the specified
buffer capacity. If zero, or the size is omitted, the channel is
unbuffered.

```
#### <a id="new" href="#new">func new(Type) *Type</a>

```
searchKey: builtin.new
tags: [function private]
```

```Go
func new(Type) *Type
```

The new built-in function allocates memory. The first argument is a type, not a value, and the value returned is a pointer to a newly allocated zero value of that type. 

### <a id="Type1" href="#Type1">type Type1 builtin.int</a>

```
searchKey: builtin.Type1
```

```Go
type Type1 int
```

Type1 is here for the purposes of documentation only. It is a stand-in for any Go type, but represents the same type for any given function invocation. 

### <a id="bool" href="#bool">type bool builtin.bool</a>

```
searchKey: builtin.bool
tags: [private]
```

```Go
type bool bool
```

bool is the set of boolean values, true and false. 

### <a id="byte" href="#byte">type byte builtin.uint8</a>

```
searchKey: builtin.byte
tags: [private]
```

```Go
type byte = uint8
```

byte is an alias for uint8 and is equivalent to uint8 in all ways. It is used, by convention, to distinguish byte values from 8-bit unsigned integer values. 

### <a id="complex128" href="#complex128">type complex128 builtin.complex128</a>

```
searchKey: builtin.complex128
tags: [private]
```

```Go
type complex128 complex128
```

complex128 is the set of all complex numbers with float64 real and imaginary parts. 

### <a id="complex64" href="#complex64">type complex64 builtin.complex64</a>

```
searchKey: builtin.complex64
tags: [private]
```

```Go
type complex64 complex64
```

complex64 is the set of all complex numbers with float32 real and imaginary parts. 

### <a id="error" href="#error">type error interface</a>

```
searchKey: builtin.error
tags: [interface private]
```

```Go
type error interface {
	Error() string
}
```

The error built-in interface type is the conventional interface for representing an error condition, with the nil value representing no error. 

### <a id="float32" href="#float32">type float32 builtin.float32</a>

```
searchKey: builtin.float32
tags: [private]
```

```Go
type float32 float32
```

float32 is the set of all IEEE-754 32-bit floating-point numbers. 

### <a id="float64" href="#float64">type float64 builtin.float64</a>

```
searchKey: builtin.float64
tags: [private]
```

```Go
type float64 float64
```

float64 is the set of all IEEE-754 64-bit floating-point numbers. 

### <a id="int" href="#int">type int builtin.int</a>

```
searchKey: builtin.int
tags: [private]
```

```Go
type int int
```

int is a signed integer type that is at least 32 bits in size. It is a distinct type, however, and not an alias for, say, int32. 

#### <a id="cap" href="#cap">func cap(v Type) int</a>

```
searchKey: builtin.cap
tags: [function private]
```

```Go
func cap(v Type) int
```

The cap built-in function returns the capacity of v, according to its type: 

```
Array: the number of elements in v (same as len(v)).
Pointer to array: the number of elements in *v (same as len(v)).
Slice: the maximum length the slice can reach when resliced;
if v is nil, cap(v) is zero.
Channel: the channel buffer capacity, in units of elements;
if v is nil, cap(v) is zero.

```
For some arguments, such as a simple array expression, the result can be a constant. See the Go language specification's "Length and capacity" section for details. 

#### <a id="copy" href="#copy">func copy(dst, src []Type) int</a>

```
searchKey: builtin.copy
tags: [function private]
```

```Go
func copy(dst, src []Type) int
```

The copy built-in function copies elements from a source slice into a destination slice. (As a special case, it also will copy bytes from a string to a slice of bytes.) The source and destination may overlap. Copy returns the number of elements copied, which will be the minimum of len(src) and len(dst). 

#### <a id="len" href="#len">func len(v Type) int</a>

```
searchKey: builtin.len
tags: [function private]
```

```Go
func len(v Type) int
```

The len built-in function returns the length of v, according to its type: 

```
Array: the number of elements in v.
Pointer to array: the number of elements in *v (even if v is nil).
Slice, or map: the number of elements in v; if v is nil, len(v) is zero.
String: the number of bytes in v.
Channel: the number of elements queued (unread) in the channel buffer;
         if v is nil, len(v) is zero.

```
For some arguments, such as a string literal or a simple array expression, the result can be a constant. See the Go language specification's "Length and capacity" section for details. 

### <a id="int16" href="#int16">type int16 builtin.int16</a>

```
searchKey: builtin.int16
tags: [private]
```

```Go
type int16 int16
```

int16 is the set of all signed 16-bit integers. Range: -32768 through 32767. 

### <a id="int32" href="#int32">type int32 builtin.int32</a>

```
searchKey: builtin.int32
tags: [private]
```

```Go
type int32 int32
```

int32 is the set of all signed 32-bit integers. Range: -2147483648 through 2147483647. 

### <a id="int64" href="#int64">type int64 builtin.int64</a>

```
searchKey: builtin.int64
tags: [private]
```

```Go
type int64 int64
```

int64 is the set of all signed 64-bit integers. Range: -9223372036854775808 through 9223372036854775807. 

### <a id="int8" href="#int8">type int8 builtin.int8</a>

```
searchKey: builtin.int8
tags: [private]
```

```Go
type int8 int8
```

int8 is the set of all signed 8-bit integers. Range: -128 through 127. 

### <a id="rune" href="#rune">type rune builtin.int32</a>

```
searchKey: builtin.rune
tags: [private]
```

```Go
type rune = int32
```

rune is an alias for int32 and is equivalent to int32 in all ways. It is used, by convention, to distinguish character values from integer values. 

### <a id="string" href="#string">type string builtin.string</a>

```
searchKey: builtin.string
tags: [private]
```

```Go
type string string
```

string is the set of all strings of 8-bit bytes, conventionally but not necessarily representing UTF-8-encoded text. A string may be empty, but not nil. Values of string type are immutable. 

### <a id="uint" href="#uint">type uint builtin.uint</a>

```
searchKey: builtin.uint
tags: [private]
```

```Go
type uint uint
```

uint is an unsigned integer type that is at least 32 bits in size. It is a distinct type, however, and not an alias for, say, uint32. 

### <a id="uint16" href="#uint16">type uint16 builtin.uint16</a>

```
searchKey: builtin.uint16
tags: [private]
```

```Go
type uint16 uint16
```

uint16 is the set of all unsigned 16-bit integers. Range: 0 through 65535. 

### <a id="uint32" href="#uint32">type uint32 builtin.uint32</a>

```
searchKey: builtin.uint32
tags: [private]
```

```Go
type uint32 uint32
```

uint32 is the set of all unsigned 32-bit integers. Range: 0 through 4294967295. 

### <a id="uint64" href="#uint64">type uint64 builtin.uint64</a>

```
searchKey: builtin.uint64
tags: [private]
```

```Go
type uint64 uint64
```

uint64 is the set of all unsigned 64-bit integers. Range: 0 through 18446744073709551615. 

### <a id="uint8" href="#uint8">type uint8 builtin.uint8</a>

```
searchKey: builtin.uint8
tags: [private]
```

```Go
type uint8 uint8
```

uint8 is the set of all unsigned 8-bit integers. Range: 0 through 255. 

### <a id="uintptr" href="#uintptr">type uintptr builtin.uintptr</a>

```
searchKey: builtin.uintptr
tags: [private]
```

```Go
type uintptr uintptr
```

uintptr is an integer type that is large enough to hold the bit pattern of any pointer. 

## <a id="func" href="#func">Functions</a>

### <a id="append" href="#append">func append(slice []Type, elems ...Type) []Type</a>

```
searchKey: builtin.append
tags: [function private]
```

```Go
func append(slice []Type, elems ...Type) []Type
```

The append built-in function appends elements to the end of a slice. If it has sufficient capacity, the destination is resliced to accommodate the new elements. If it does not, a new underlying array will be allocated. Append returns the updated slice. It is therefore necessary to store the result of append, often in the variable holding the slice itself: 

```
slice = append(slice, elem1, elem2)
slice = append(slice, anotherSlice...)

```
As a special case, it is legal to append a string to a byte slice, like this: 

```
slice = append([]byte("hello "), "world"...)

```
### <a id="close" href="#close">func close(c chan<- Type)</a>

```
searchKey: builtin.close
tags: [function private]
```

```Go
func close(c chan<- Type)
```

The close built-in function closes a channel, which must be either bidirectional or send-only. It should be executed only by the sender, never the receiver, and has the effect of shutting down the channel after the last sent value is received. After the last value has been received from a closed channel c, any receive from c will succeed without blocking, returning the zero value for the channel element. The form 

```
x, ok := <-c

```
will also set ok to false for a closed channel. 

### <a id="delete" href="#delete">func delete(m map[Type]Type1, key Type)</a>

```
searchKey: builtin.delete
tags: [function private]
```

```Go
func delete(m map[Type]Type1, key Type)
```

The delete built-in function deletes the element with the specified key (m[key]) from the map. If m is nil or there is no such element, delete is a no-op. 

### <a id="panic" href="#panic">func panic(v interface{})</a>

```
searchKey: builtin.panic
tags: [function private]
```

```Go
func panic(v interface{})
```

The panic built-in function stops normal execution of the current goroutine. When a function F calls panic, normal execution of F stops immediately. Any functions whose execution was deferred by F are run in the usual way, and then F returns to its caller. To the caller G, the invocation of F then behaves like a call to panic, terminating G's execution and running any deferred functions. This continues until all functions in the executing goroutine have stopped, in reverse order. At that point, the program is terminated with a non-zero exit code. This termination sequence is called panicking and can be controlled by the built-in function recover. 

### <a id="print" href="#print">func print(args ...Type)</a>

```
searchKey: builtin.print
tags: [function private]
```

```Go
func print(args ...Type)
```

The print built-in function formats its arguments in an implementation-specific way and writes the result to standard error. Print is useful for bootstrapping and debugging; it is not guaranteed to stay in the language. 

### <a id="println" href="#println">func println(args ...Type)</a>

```
searchKey: builtin.println
tags: [function private]
```

```Go
func println(args ...Type)
```

The println built-in function formats its arguments in an implementation-specific way and writes the result to standard error. Spaces are always added between arguments and a newline is appended. Println is useful for bootstrapping and debugging; it is not guaranteed to stay in the language. 

### <a id="recover" href="#recover">func recover() interface{}</a>

```
searchKey: builtin.recover
tags: [function private]
```

```Go
func recover() interface{}
```

The recover built-in function allows a program to manage behavior of a panicking goroutine. Executing a call to recover inside a deferred function (but not any function called by it) stops the panicking sequence by restoring normal execution and retrieves the error value passed to the call of panic. If recover is called outside the deferred function it will not stop a panicking sequence. In this case, or when the goroutine is not panicking, or if the argument supplied to panic was nil, recover returns nil. Thus the return value from recover reports whether the goroutine is panicking. 

