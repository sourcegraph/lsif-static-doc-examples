# Package cgo

Package cgo contains runtime support for code generated by the cgo tool.  See the documentation for the cgo command for details on using cgo. 

## Index

* [Variables](#var)
    * [var x_cgo_init](#x_cgo_init)
    * [var _cgo_init](#_cgo_init)
    * [var x_cgo_thread_start](#x_cgo_thread_start)
    * [var _cgo_thread_start](#_cgo_thread_start)
    * [var x_cgo_sys_thread_create](#x_cgo_sys_thread_create)
    * [var _cgo_sys_thread_create](#_cgo_sys_thread_create)
    * [var x_cgo_notify_runtime_init_done](#x_cgo_notify_runtime_init_done)
    * [var _cgo_notify_runtime_init_done](#_cgo_notify_runtime_init_done)
    * [var x_cgo_set_context_function](#x_cgo_set_context_function)
    * [var _cgo_set_context_function](#_cgo_set_context_function)
    * [var _cgo_yield](#_cgo_yield)
    * [var x_cgo_callers](#x_cgo_callers)
    * [var _cgo_callers](#_cgo_callers)
    * [var handles](#handles)
    * [var handleIdx](#handleIdx)
    * [var _iscgo](#_iscgo)
    * [var x_cgo_setenv](#x_cgo_setenv)
    * [var _cgo_setenv](#_cgo_setenv)
    * [var x_cgo_unsetenv](#x_cgo_unsetenv)
    * [var _cgo_unsetenv](#_cgo_unsetenv)
* [Types](#type)
    * [type Handle uintptr](#Handle)
        * [func NewHandle(v interface{}) Handle](#NewHandle)
        * [func (h Handle) Value() interface{}](#Handle.Value)
        * [func (h Handle) Delete()](#Handle.Delete)
* [Functions](#func)
    * [func _runtime_cgo_panic_internal(p *byte)](#_runtime_cgo_panic_internal)
    * [func _cgo_panic(a *struct{ cstr *byte })](#_cgo_panic)
    * [func TestHandle(t *testing.T)](#TestHandle)
    * [func TestInvalidHandle(t *testing.T)](#TestInvalidHandle)
    * [func BenchmarkHandle(b *testing.B)](#BenchmarkHandle)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="x_cgo_init" href="#x_cgo_init">var x_cgo_init</a>

```
searchKey: cgo.x_cgo_init
```

```Go
var x_cgo_init byte
```

### <a id="_cgo_init" href="#_cgo_init">var _cgo_init</a>

```
searchKey: cgo._cgo_init
```

```Go
var _cgo_init = &x_cgo_init
```

### <a id="x_cgo_thread_start" href="#x_cgo_thread_start">var x_cgo_thread_start</a>

```
searchKey: cgo.x_cgo_thread_start
```

```Go
var x_cgo_thread_start byte
```

### <a id="_cgo_thread_start" href="#_cgo_thread_start">var _cgo_thread_start</a>

```
searchKey: cgo._cgo_thread_start
```

```Go
var _cgo_thread_start = &x_cgo_thread_start
```

### <a id="x_cgo_sys_thread_create" href="#x_cgo_sys_thread_create">var x_cgo_sys_thread_create</a>

```
searchKey: cgo.x_cgo_sys_thread_create
```

```Go
var x_cgo_sys_thread_create byte
```

### <a id="_cgo_sys_thread_create" href="#_cgo_sys_thread_create">var _cgo_sys_thread_create</a>

```
searchKey: cgo._cgo_sys_thread_create
```

```Go
var _cgo_sys_thread_create = &x_cgo_sys_thread_create
```

### <a id="x_cgo_notify_runtime_init_done" href="#x_cgo_notify_runtime_init_done">var x_cgo_notify_runtime_init_done</a>

```
searchKey: cgo.x_cgo_notify_runtime_init_done
```

```Go
var x_cgo_notify_runtime_init_done byte
```

### <a id="_cgo_notify_runtime_init_done" href="#_cgo_notify_runtime_init_done">var _cgo_notify_runtime_init_done</a>

```
searchKey: cgo._cgo_notify_runtime_init_done
```

```Go
var _cgo_notify_runtime_init_done = &x_cgo_notify_runtime_init_done
```

### <a id="x_cgo_set_context_function" href="#x_cgo_set_context_function">var x_cgo_set_context_function</a>

```
searchKey: cgo.x_cgo_set_context_function
```

```Go
var x_cgo_set_context_function byte
```

### <a id="_cgo_set_context_function" href="#_cgo_set_context_function">var _cgo_set_context_function</a>

```
searchKey: cgo._cgo_set_context_function
```

```Go
var _cgo_set_context_function = &x_cgo_set_context_function
```

### <a id="_cgo_yield" href="#_cgo_yield">var _cgo_yield</a>

```
searchKey: cgo._cgo_yield
```

```Go
var _cgo_yield unsafe.Pointer
```

### <a id="x_cgo_callers" href="#x_cgo_callers">var x_cgo_callers</a>

```
searchKey: cgo.x_cgo_callers
```

```Go
var x_cgo_callers byte
```

### <a id="_cgo_callers" href="#_cgo_callers">var _cgo_callers</a>

```
searchKey: cgo._cgo_callers
```

```Go
var _cgo_callers = &x_cgo_callers
```

### <a id="handles" href="#handles">var handles</a>

```
searchKey: cgo.handles
```

```Go
var handles = sync.Map{} // map[Handle]interface{}

```

### <a id="handleIdx" href="#handleIdx">var handleIdx</a>

```
searchKey: cgo.handleIdx
```

```Go
var handleIdx uintptr // atomic

```

### <a id="_iscgo" href="#_iscgo">var _iscgo</a>

```
searchKey: cgo._iscgo
```

```Go
var _iscgo bool = true
```

### <a id="x_cgo_setenv" href="#x_cgo_setenv">var x_cgo_setenv</a>

```
searchKey: cgo.x_cgo_setenv
```

```Go
var x_cgo_setenv byte
```

### <a id="_cgo_setenv" href="#_cgo_setenv">var _cgo_setenv</a>

```
searchKey: cgo._cgo_setenv
```

```Go
var _cgo_setenv = &x_cgo_setenv
```

### <a id="x_cgo_unsetenv" href="#x_cgo_unsetenv">var x_cgo_unsetenv</a>

```
searchKey: cgo.x_cgo_unsetenv
```

```Go
var x_cgo_unsetenv byte
```

### <a id="_cgo_unsetenv" href="#_cgo_unsetenv">var _cgo_unsetenv</a>

```
searchKey: cgo._cgo_unsetenv
```

```Go
var _cgo_unsetenv = &x_cgo_unsetenv
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Handle" href="#Handle">type Handle uintptr</a>

```
searchKey: cgo.Handle
tags: [exported]
```

```Go
type Handle uintptr
```

Handle provides a way to pass values that contain Go pointers (pointers to memory allocated by Go) between Go and C without breaking the cgo pointer passing rules. A Handle is an integer value that can represent any Go value. A Handle can be passed through C and back to Go, and Go code can use the Handle to retrieve the original Go value. 

The underlying type of Handle is guaranteed to fit in an integer type that is large enough to hold the bit pattern of any pointer. The zero value of a Handle is not valid, and thus is safe to use as a sentinel in C APIs. 

For instance, on the Go side: 

```
package main

/*
#include <stdint.h> // for uintptr_t

extern void MyGoPrint(uintptr_t handle);
void myprint(uintptr_t handle);
*/
import "C"
import "runtime/cgo"

//export MyGoPrint
func MyGoPrint(handle C.uintptr_t) {
	h := cgo.Handle(handle)
	val := h.Value().(string)
	println(val)
	h.Delete()
}

func main() {
	val := "hello Go"
	C.myprint(C.uintptr_t(cgo.NewHandle(val)))
	// Output: hello Go
}

```
and on the C side: 

```
#include <stdint.h> // for uintptr_t

// A Go function
extern void MyGoPrint(uintptr_t handle);

// A C function
void myprint(uintptr_t handle) {
    MyGoPrint(handle);
}

```
#### <a id="NewHandle" href="#NewHandle">func NewHandle(v interface{}) Handle</a>

```
searchKey: cgo.NewHandle
tags: [exported]
```

```Go
func NewHandle(v interface{}) Handle
```

NewHandle returns a handle for a given value. 

The handle is valid until the program calls Delete on it. The handle uses resources, and this package assumes that C code may hold on to the handle, so a program must explicitly call Delete when the handle is no longer needed. 

The intended use is to pass the returned handle to C code, which passes it back to Go, which calls Value. 

#### <a id="Handle.Value" href="#Handle.Value">func (h Handle) Value() interface{}</a>

```
searchKey: cgo.Handle.Value
tags: [exported]
```

```Go
func (h Handle) Value() interface{}
```

Value returns the associated Go value for a valid handle. 

The method panics if the handle is invalid. 

#### <a id="Handle.Delete" href="#Handle.Delete">func (h Handle) Delete()</a>

```
searchKey: cgo.Handle.Delete
tags: [exported]
```

```Go
func (h Handle) Delete()
```

Delete invalidates a handle. This method should only be called once the program no longer needs to pass the handle to C and the C code no longer has a copy of the handle value. 

The method panics if the handle is invalid. 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="_runtime_cgo_panic_internal" href="#_runtime_cgo_panic_internal">func _runtime_cgo_panic_internal(p *byte)</a>

```
searchKey: cgo._runtime_cgo_panic_internal
```

```Go
func _runtime_cgo_panic_internal(p *byte)
```

### <a id="_cgo_panic" href="#_cgo_panic">func _cgo_panic(a *struct{ cstr *byte })</a>

```
searchKey: cgo._cgo_panic
```

```Go
func _cgo_panic(a *struct{ cstr *byte })
```

### <a id="TestHandle" href="#TestHandle">func TestHandle(t *testing.T)</a>

```
searchKey: cgo.TestHandle
```

```Go
func TestHandle(t *testing.T)
```

### <a id="TestInvalidHandle" href="#TestInvalidHandle">func TestInvalidHandle(t *testing.T)</a>

```
searchKey: cgo.TestInvalidHandle
```

```Go
func TestInvalidHandle(t *testing.T)
```

### <a id="BenchmarkHandle" href="#BenchmarkHandle">func BenchmarkHandle(b *testing.B)</a>

```
searchKey: cgo.BenchmarkHandle
```

```Go
func BenchmarkHandle(b *testing.B)
```
