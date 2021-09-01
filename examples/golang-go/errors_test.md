# Package errors_test

## Index

* [Variables](#var)
    * [var poserPathErr](#poserPathErr)
* [Types](#type)
    * [type MyError struct](#MyError)
        * [func (e MyError) Error() string](#MyError.Error)
    * [type errorT struct](#errorT)
        * [func (e errorT) Error() string](#errorT.Error)
    * [type errorUncomparable struct](#errorUncomparable)
        * [func (errorUncomparable) Error() string](#errorUncomparable.Error)
        * [func (errorUncomparable) Is(target error) bool](#errorUncomparable.Is)
    * [type poser struct](#poser)
        * [func (p *poser) As(err interface{}) bool](#poser.As)
        * [func (p *poser) Error() string](#poser.Error)
        * [func (p *poser) Is(err error) bool](#poser.Is)
    * [type wrapped struct](#wrapped)
        * [func (e wrapped) Error() string](#wrapped.Error)
        * [func (e wrapped) Unwrap() error](#wrapped.Unwrap)
* [Functions](#func)
    * [func Example()](#Example)
    * [func ExampleAs()](#ExampleAs)
    * [func ExampleIs()](#ExampleIs)
    * [func ExampleNew()](#ExampleNew)
    * [func ExampleNew_errorf()](#ExampleNew_errorf)
    * [func TestAs(t *testing.T)](#TestAs)
    * [func TestAsValidation(t *testing.T)](#TestAsValidation)
    * [func TestErrorMethod(t *testing.T)](#TestErrorMethod)
    * [func TestIs(t *testing.T)](#TestIs)
    * [func TestNewEqual(t *testing.T)](#TestNewEqual)
    * [func TestUnwrap(t *testing.T)](#TestUnwrap)
    * [func oops() error](#oops)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="poserPathErr" href="#poserPathErr">var poserPathErr</a>

```
searchKey: errors_test.poserPathErr
tags: [variable struct private]
```

```Go
var poserPathErr = &fs.PathError{Op: "poser"}
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="MyError" href="#MyError">type MyError struct</a>

```
searchKey: errors_test.MyError
tags: [struct private]
```

```Go
type MyError struct {
	When time.Time
	What string
}
```

MyError is an error implementation that includes a time and message. 

#### <a id="MyError.Error" href="#MyError.Error">func (e MyError) Error() string</a>

```
searchKey: errors_test.MyError.Error
tags: [method private]
```

```Go
func (e MyError) Error() string
```

### <a id="errorT" href="#errorT">type errorT struct</a>

```
searchKey: errors_test.errorT
tags: [struct private]
```

```Go
type errorT struct{ s string }
```

#### <a id="errorT.Error" href="#errorT.Error">func (e errorT) Error() string</a>

```
searchKey: errors_test.errorT.Error
tags: [method private]
```

```Go
func (e errorT) Error() string
```

### <a id="errorUncomparable" href="#errorUncomparable">type errorUncomparable struct</a>

```
searchKey: errors_test.errorUncomparable
tags: [struct private]
```

```Go
type errorUncomparable struct {
	f []string
}
```

#### <a id="errorUncomparable.Error" href="#errorUncomparable.Error">func (errorUncomparable) Error() string</a>

```
searchKey: errors_test.errorUncomparable.Error
tags: [method private]
```

```Go
func (errorUncomparable) Error() string
```

#### <a id="errorUncomparable.Is" href="#errorUncomparable.Is">func (errorUncomparable) Is(target error) bool</a>

```
searchKey: errors_test.errorUncomparable.Is
tags: [method private]
```

```Go
func (errorUncomparable) Is(target error) bool
```

### <a id="poser" href="#poser">type poser struct</a>

```
searchKey: errors_test.poser
tags: [struct private]
```

```Go
type poser struct {
	msg string
	f   func(error) bool
}
```

#### <a id="poser.As" href="#poser.As">func (p *poser) As(err interface{}) bool</a>

```
searchKey: errors_test.poser.As
tags: [method private]
```

```Go
func (p *poser) As(err interface{}) bool
```

#### <a id="poser.Error" href="#poser.Error">func (p *poser) Error() string</a>

```
searchKey: errors_test.poser.Error
tags: [method private]
```

```Go
func (p *poser) Error() string
```

#### <a id="poser.Is" href="#poser.Is">func (p *poser) Is(err error) bool</a>

```
searchKey: errors_test.poser.Is
tags: [method private]
```

```Go
func (p *poser) Is(err error) bool
```

### <a id="wrapped" href="#wrapped">type wrapped struct</a>

```
searchKey: errors_test.wrapped
tags: [struct private]
```

```Go
type wrapped struct {
	msg string
	err error
}
```

#### <a id="wrapped.Error" href="#wrapped.Error">func (e wrapped) Error() string</a>

```
searchKey: errors_test.wrapped.Error
tags: [method private]
```

```Go
func (e wrapped) Error() string
```

#### <a id="wrapped.Unwrap" href="#wrapped.Unwrap">func (e wrapped) Unwrap() error</a>

```
searchKey: errors_test.wrapped.Unwrap
tags: [method private]
```

```Go
func (e wrapped) Unwrap() error
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Example" href="#Example">func Example()</a>

```
searchKey: errors_test.Example
tags: [function private]
```

```Go
func Example()
```

### <a id="ExampleAs" href="#ExampleAs">func ExampleAs()</a>

```
searchKey: errors_test.ExampleAs
tags: [function private]
```

```Go
func ExampleAs()
```

### <a id="ExampleIs" href="#ExampleIs">func ExampleIs()</a>

```
searchKey: errors_test.ExampleIs
tags: [function private]
```

```Go
func ExampleIs()
```

### <a id="ExampleNew" href="#ExampleNew">func ExampleNew()</a>

```
searchKey: errors_test.ExampleNew
tags: [function private]
```

```Go
func ExampleNew()
```

### <a id="ExampleNew_errorf" href="#ExampleNew_errorf">func ExampleNew_errorf()</a>

```
searchKey: errors_test.ExampleNew_errorf
tags: [function private]
```

```Go
func ExampleNew_errorf()
```

The fmt package's Errorf function lets us use the package's formatting features to create descriptive error messages. 

### <a id="TestAs" href="#TestAs">func TestAs(t *testing.T)</a>

```
searchKey: errors_test.TestAs
tags: [function private test]
```

```Go
func TestAs(t *testing.T)
```

### <a id="TestAsValidation" href="#TestAsValidation">func TestAsValidation(t *testing.T)</a>

```
searchKey: errors_test.TestAsValidation
tags: [function private test]
```

```Go
func TestAsValidation(t *testing.T)
```

### <a id="TestErrorMethod" href="#TestErrorMethod">func TestErrorMethod(t *testing.T)</a>

```
searchKey: errors_test.TestErrorMethod
tags: [function private test]
```

```Go
func TestErrorMethod(t *testing.T)
```

### <a id="TestIs" href="#TestIs">func TestIs(t *testing.T)</a>

```
searchKey: errors_test.TestIs
tags: [function private test]
```

```Go
func TestIs(t *testing.T)
```

### <a id="TestNewEqual" href="#TestNewEqual">func TestNewEqual(t *testing.T)</a>

```
searchKey: errors_test.TestNewEqual
tags: [function private test]
```

```Go
func TestNewEqual(t *testing.T)
```

### <a id="TestUnwrap" href="#TestUnwrap">func TestUnwrap(t *testing.T)</a>

```
searchKey: errors_test.TestUnwrap
tags: [function private test]
```

```Go
func TestUnwrap(t *testing.T)
```

### <a id="oops" href="#oops">func oops() error</a>

```
searchKey: errors_test.oops
tags: [function private]
```

```Go
func oops() error
```

