# Package errors_test

## Index

* [Variables](#var)
    * [var poserPathErr](#poserPathErr)
* [Types](#type)
    * [type MyError struct](#MyError)
        * [func (e MyError) Error() string](#MyError.Error)
    * [type poser struct](#poser)
        * [func (p *poser) Error() string](#poser.Error)
        * [func (p *poser) Is(err error) bool](#poser.Is)
        * [func (p *poser) As(err interface{}) bool](#poser.As)
    * [type errorT struct](#errorT)
        * [func (e errorT) Error() string](#errorT.Error)
    * [type wrapped struct](#wrapped)
        * [func (e wrapped) Error() string](#wrapped.Error)
        * [func (e wrapped) Unwrap() error](#wrapped.Unwrap)
    * [type errorUncomparable struct](#errorUncomparable)
        * [func (errorUncomparable) Error() string](#errorUncomparable.Error)
        * [func (errorUncomparable) Is(target error) bool](#errorUncomparable.Is)
* [Functions](#func)
    * [func TestNewEqual(t *testing.T)](#TestNewEqual)
    * [func TestErrorMethod(t *testing.T)](#TestErrorMethod)
    * [func ExampleNew()](#ExampleNew)
    * [func ExampleNew_errorf()](#ExampleNew_errorf)
    * [func oops() error](#oops)
    * [func Example()](#Example)
    * [func TestIs(t *testing.T)](#TestIs)
    * [func TestAs(t *testing.T)](#TestAs)
    * [func TestAsValidation(t *testing.T)](#TestAsValidation)
    * [func TestUnwrap(t *testing.T)](#TestUnwrap)
    * [func ExampleIs()](#ExampleIs)
    * [func ExampleAs()](#ExampleAs)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="poserPathErr" href="#poserPathErr">var poserPathErr</a>

```
searchKey: errors_test.poserPathErr
tags: [private]
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
tags: [private]
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
tags: [private]
```

```Go
func (e MyError) Error() string
```

### <a id="poser" href="#poser">type poser struct</a>

```
searchKey: errors_test.poser
tags: [private]
```

```Go
type poser struct {
	msg string
	f   func(error) bool
}
```

#### <a id="poser.Error" href="#poser.Error">func (p *poser) Error() string</a>

```
searchKey: errors_test.poser.Error
tags: [private]
```

```Go
func (p *poser) Error() string
```

#### <a id="poser.Is" href="#poser.Is">func (p *poser) Is(err error) bool</a>

```
searchKey: errors_test.poser.Is
tags: [private]
```

```Go
func (p *poser) Is(err error) bool
```

#### <a id="poser.As" href="#poser.As">func (p *poser) As(err interface{}) bool</a>

```
searchKey: errors_test.poser.As
tags: [private]
```

```Go
func (p *poser) As(err interface{}) bool
```

### <a id="errorT" href="#errorT">type errorT struct</a>

```
searchKey: errors_test.errorT
tags: [private]
```

```Go
type errorT struct{ s string }
```

#### <a id="errorT.Error" href="#errorT.Error">func (e errorT) Error() string</a>

```
searchKey: errors_test.errorT.Error
tags: [private]
```

```Go
func (e errorT) Error() string
```

### <a id="wrapped" href="#wrapped">type wrapped struct</a>

```
searchKey: errors_test.wrapped
tags: [private]
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
tags: [private]
```

```Go
func (e wrapped) Error() string
```

#### <a id="wrapped.Unwrap" href="#wrapped.Unwrap">func (e wrapped) Unwrap() error</a>

```
searchKey: errors_test.wrapped.Unwrap
tags: [private]
```

```Go
func (e wrapped) Unwrap() error
```

### <a id="errorUncomparable" href="#errorUncomparable">type errorUncomparable struct</a>

```
searchKey: errors_test.errorUncomparable
tags: [private]
```

```Go
type errorUncomparable struct {
	f []string
}
```

#### <a id="errorUncomparable.Error" href="#errorUncomparable.Error">func (errorUncomparable) Error() string</a>

```
searchKey: errors_test.errorUncomparable.Error
tags: [private]
```

```Go
func (errorUncomparable) Error() string
```

#### <a id="errorUncomparable.Is" href="#errorUncomparable.Is">func (errorUncomparable) Is(target error) bool</a>

```
searchKey: errors_test.errorUncomparable.Is
tags: [private]
```

```Go
func (errorUncomparable) Is(target error) bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestNewEqual" href="#TestNewEqual">func TestNewEqual(t *testing.T)</a>

```
searchKey: errors_test.TestNewEqual
tags: [private]
```

```Go
func TestNewEqual(t *testing.T)
```

### <a id="TestErrorMethod" href="#TestErrorMethod">func TestErrorMethod(t *testing.T)</a>

```
searchKey: errors_test.TestErrorMethod
tags: [private]
```

```Go
func TestErrorMethod(t *testing.T)
```

### <a id="ExampleNew" href="#ExampleNew">func ExampleNew()</a>

```
searchKey: errors_test.ExampleNew
tags: [private]
```

```Go
func ExampleNew()
```

### <a id="ExampleNew_errorf" href="#ExampleNew_errorf">func ExampleNew_errorf()</a>

```
searchKey: errors_test.ExampleNew_errorf
tags: [private]
```

```Go
func ExampleNew_errorf()
```

The fmt package's Errorf function lets us use the package's formatting features to create descriptive error messages. 

### <a id="oops" href="#oops">func oops() error</a>

```
searchKey: errors_test.oops
tags: [private]
```

```Go
func oops() error
```

### <a id="Example" href="#Example">func Example()</a>

```
searchKey: errors_test.Example
tags: [private]
```

```Go
func Example()
```

### <a id="TestIs" href="#TestIs">func TestIs(t *testing.T)</a>

```
searchKey: errors_test.TestIs
tags: [private]
```

```Go
func TestIs(t *testing.T)
```

### <a id="TestAs" href="#TestAs">func TestAs(t *testing.T)</a>

```
searchKey: errors_test.TestAs
tags: [private]
```

```Go
func TestAs(t *testing.T)
```

### <a id="TestAsValidation" href="#TestAsValidation">func TestAsValidation(t *testing.T)</a>

```
searchKey: errors_test.TestAsValidation
tags: [private]
```

```Go
func TestAsValidation(t *testing.T)
```

### <a id="TestUnwrap" href="#TestUnwrap">func TestUnwrap(t *testing.T)</a>

```
searchKey: errors_test.TestUnwrap
tags: [private]
```

```Go
func TestUnwrap(t *testing.T)
```

### <a id="ExampleIs" href="#ExampleIs">func ExampleIs()</a>

```
searchKey: errors_test.ExampleIs
tags: [private]
```

```Go
func ExampleIs()
```

### <a id="ExampleAs" href="#ExampleAs">func ExampleAs()</a>

```
searchKey: errors_test.ExampleAs
tags: [private]
```

```Go
func ExampleAs()
```

