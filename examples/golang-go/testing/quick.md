# Package quick

Package quick implements utility functions to help with black box testing. 

The testing/quick package is frozen and is not accepting new features. 

## Index

* [Constants](#const)
    * [const complexSize](#complexSize)
* [Variables](#var)
    * [var defaultMaxCount](#defaultMaxCount)
    * [var defaultConfig](#defaultConfig)
* [Types](#type)
    * [type Generator interface](#Generator)
    * [type Config struct](#Config)
        * [func (c *Config) getRand() *rand.Rand](#Config.getRand)
        * [func (c *Config) getMaxCount() (maxCount int)](#Config.getMaxCount)
    * [type SetupError string](#SetupError)
        * [func (s SetupError) Error() string](#SetupError.Error)
    * [type CheckError struct](#CheckError)
        * [func (s *CheckError) Error() string](#CheckError.Error)
    * [type CheckEqualError struct](#CheckEqualError)
        * [func (s *CheckEqualError) Error() string](#CheckEqualError.Error)
    * [type TestArrayAlias [4]byte](#TestArrayAlias)
        * [func fArrayAlias(a TestArrayAlias) TestArrayAlias](#fArrayAlias)
    * [type TestBoolAlias bool](#TestBoolAlias)
        * [func fBoolAlias(a TestBoolAlias) TestBoolAlias](#fBoolAlias)
    * [type TestFloat32Alias float32](#TestFloat32Alias)
        * [func fFloat32Alias(a TestFloat32Alias) TestFloat32Alias](#fFloat32Alias)
    * [type TestFloat64Alias float64](#TestFloat64Alias)
        * [func fFloat64Alias(a TestFloat64Alias) TestFloat64Alias](#fFloat64Alias)
    * [type TestComplex64Alias complex64](#TestComplex64Alias)
        * [func fComplex64Alias(a TestComplex64Alias) TestComplex64Alias](#fComplex64Alias)
    * [type TestComplex128Alias complex128](#TestComplex128Alias)
        * [func fComplex128Alias(a TestComplex128Alias) TestComplex128Alias](#fComplex128Alias)
    * [type TestInt16Alias int16](#TestInt16Alias)
        * [func fInt16Alias(a TestInt16Alias) TestInt16Alias](#fInt16Alias)
    * [type TestInt32Alias int32](#TestInt32Alias)
        * [func fInt32Alias(a TestInt32Alias) TestInt32Alias](#fInt32Alias)
    * [type TestInt64Alias int64](#TestInt64Alias)
        * [func fInt64Alias(a TestInt64Alias) TestInt64Alias](#fInt64Alias)
    * [type TestInt8Alias int8](#TestInt8Alias)
        * [func fInt8Alias(a TestInt8Alias) TestInt8Alias](#fInt8Alias)
    * [type TestIntAlias int](#TestIntAlias)
        * [func fIntAlias(a TestIntAlias) TestIntAlias](#fIntAlias)
    * [type TestMapAlias map[int]int](#TestMapAlias)
        * [func fMapAlias(a TestMapAlias) TestMapAlias](#fMapAlias)
    * [type TestPtrAlias *int](#TestPtrAlias)
        * [func fPtrAlias(a TestPtrAlias) TestPtrAlias](#fPtrAlias)
    * [type TestSliceAlias []byte](#TestSliceAlias)
        * [func fSliceAlias(a TestSliceAlias) TestSliceAlias](#fSliceAlias)
    * [type TestStringAlias string](#TestStringAlias)
        * [func fStringAlias(a TestStringAlias) TestStringAlias](#fStringAlias)
    * [type TestStruct struct](#TestStruct)
        * [func fStruct(a TestStruct) TestStruct](#fStruct)
    * [type TestStructAlias quick.TestStruct](#TestStructAlias)
        * [func fStructAlias(a TestStructAlias) TestStructAlias](#fStructAlias)
    * [type TestUint16Alias uint16](#TestUint16Alias)
        * [func fUint16Alias(a TestUint16Alias) TestUint16Alias](#fUint16Alias)
    * [type TestUint32Alias uint32](#TestUint32Alias)
        * [func fUint32Alias(a TestUint32Alias) TestUint32Alias](#fUint32Alias)
    * [type TestUint64Alias uint64](#TestUint64Alias)
        * [func fUint64Alias(a TestUint64Alias) TestUint64Alias](#fUint64Alias)
    * [type TestUint8Alias uint8](#TestUint8Alias)
        * [func fUint8Alias(a TestUint8Alias) TestUint8Alias](#fUint8Alias)
    * [type TestUintAlias uint](#TestUintAlias)
        * [func fUintAlias(a TestUintAlias) TestUintAlias](#fUintAlias)
    * [type TestUintptrAlias uintptr](#TestUintptrAlias)
        * [func fUintptrAlias(a TestUintptrAlias) TestUintptrAlias](#fUintptrAlias)
    * [type myStruct struct](#myStruct)
        * [func (m myStruct) Generate(r *rand.Rand, _ int) reflect.Value](#myStruct.Generate)
    * [type A struct](#A)
    * [type B struct](#B)
* [Functions](#func)
    * [func randFloat32(rand *rand.Rand) float32](#randFloat32)
    * [func randFloat64(rand *rand.Rand) float64](#randFloat64)
    * [func randInt64(rand *rand.Rand) int64](#randInt64)
    * [func Value(t reflect.Type, rand *rand.Rand) (value reflect.Value, ok bool)](#Value)
    * [func sizedValue(t reflect.Type, rand *rand.Rand, size int) (value reflect.Value, ok bool)](#sizedValue)
    * [func Check(f interface{}, config *Config) error](#Check)
    * [func CheckEqual(f, g interface{}, config *Config) error](#CheckEqual)
    * [func arbitraryValues(args []reflect.Value, f reflect.Type, config *Config, rand *rand.Rand) (err error)](#arbitraryValues)
    * [func functionAndType(f interface{}) (v reflect.Value, t reflect.Type, ok bool)](#functionAndType)
    * [func toInterfaces(values []reflect.Value) []interface{}](#toInterfaces)
    * [func toString(interfaces []interface{}) string](#toString)
    * [func fArray(a [4]byte) [4]byte](#fArray)
    * [func fBool(a bool) bool](#fBool)
    * [func fFloat32(a float32) float32](#fFloat32)
    * [func fFloat64(a float64) float64](#fFloat64)
    * [func fComplex64(a complex64) complex64](#fComplex64)
    * [func fComplex128(a complex128) complex128](#fComplex128)
    * [func fInt16(a int16) int16](#fInt16)
    * [func fInt32(a int32) int32](#fInt32)
    * [func fInt64(a int64) int64](#fInt64)
    * [func fInt8(a int8) int8](#fInt8)
    * [func fInt(a int) int](#fInt)
    * [func fMap(a map[int]int) map[int]int](#fMap)
    * [func fPtr(a *int) *int](#fPtr)
    * [func fSlice(a []byte) []byte](#fSlice)
    * [func fString(a string) string](#fString)
    * [func fUint16(a uint16) uint16](#fUint16)
    * [func fUint32(a uint32) uint32](#fUint32)
    * [func fUint64(a uint64) uint64](#fUint64)
    * [func fUint8(a uint8) uint8](#fUint8)
    * [func fUint(a uint) uint](#fUint)
    * [func fUintptr(a uintptr) uintptr](#fUintptr)
    * [func reportError(property string, err error, t *testing.T)](#reportError)
    * [func TestCheckEqual(t *testing.T)](#TestCheckEqual)
    * [func myStructProperty(in myStruct) bool](#myStructProperty)
    * [func TestCheckProperty(t *testing.T)](#TestCheckProperty)
    * [func TestFailure(t *testing.T)](#TestFailure)
    * [func TestRecursive(t *testing.T)](#TestRecursive)
    * [func TestEmptyStruct(t *testing.T)](#TestEmptyStruct)
    * [func TestMutuallyRecursive(t *testing.T)](#TestMutuallyRecursive)
    * [func TestNonZeroSliceAndMap(t *testing.T)](#TestNonZeroSliceAndMap)
    * [func TestInt64(t *testing.T)](#TestInt64)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="complexSize" href="#complexSize">const complexSize</a>

```
searchKey: quick.complexSize
```

```Go
const complexSize = 50
```

complexSize is the maximum length of arbitrary values that contain other values. 

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="defaultMaxCount" href="#defaultMaxCount">var defaultMaxCount</a>

```
searchKey: quick.defaultMaxCount
```

```Go
var defaultMaxCount *int = ...
```

### <a id="defaultConfig" href="#defaultConfig">var defaultConfig</a>

```
searchKey: quick.defaultConfig
```

```Go
var defaultConfig Config
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Generator" href="#Generator">type Generator interface</a>

```
searchKey: quick.Generator
tags: [exported]
```

```Go
type Generator interface {
	// Generate returns a random instance of the type on which it is a
	// method using the size as a size hint.
	Generate(rand *rand.Rand, size int) reflect.Value
}
```

A Generator can generate random values of its own type. 

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: quick.Config
tags: [exported]
```

```Go
type Config struct {
	// MaxCount sets the maximum number of iterations.
	// If zero, MaxCountScale is used.
	MaxCount int
	// MaxCountScale is a non-negative scale factor applied to the
	// default maximum.
	// A count of zero implies the default, which is usually 100
	// but can be set by the -quickchecks flag.
	MaxCountScale float64
	// Rand specifies a source of random numbers.
	// If nil, a default pseudo-random source will be used.
	Rand *rand.Rand
	// Values specifies a function to generate a slice of
	// arbitrary reflect.Values that are congruent with the
	// arguments to the function being tested.
	// If nil, the top-level Value function is used to generate them.
	Values func([]reflect.Value, *rand.Rand)
}
```

A Config structure contains options for running a test. 

#### <a id="Config.getRand" href="#Config.getRand">func (c *Config) getRand() *rand.Rand</a>

```
searchKey: quick.Config.getRand
```

```Go
func (c *Config) getRand() *rand.Rand
```

getRand returns the *rand.Rand to use for a given Config. 

#### <a id="Config.getMaxCount" href="#Config.getMaxCount">func (c *Config) getMaxCount() (maxCount int)</a>

```
searchKey: quick.Config.getMaxCount
```

```Go
func (c *Config) getMaxCount() (maxCount int)
```

getMaxCount returns the maximum number of iterations to run for a given Config. 

### <a id="SetupError" href="#SetupError">type SetupError string</a>

```
searchKey: quick.SetupError
tags: [exported]
```

```Go
type SetupError string
```

A SetupError is the result of an error in the way that check is being used, independent of the functions being tested. 

#### <a id="SetupError.Error" href="#SetupError.Error">func (s SetupError) Error() string</a>

```
searchKey: quick.SetupError.Error
tags: [exported]
```

```Go
func (s SetupError) Error() string
```

### <a id="CheckError" href="#CheckError">type CheckError struct</a>

```
searchKey: quick.CheckError
tags: [exported]
```

```Go
type CheckError struct {
	Count int
	In    []interface{}
}
```

A CheckError is the result of Check finding an error. 

#### <a id="CheckError.Error" href="#CheckError.Error">func (s *CheckError) Error() string</a>

```
searchKey: quick.CheckError.Error
tags: [exported]
```

```Go
func (s *CheckError) Error() string
```

### <a id="CheckEqualError" href="#CheckEqualError">type CheckEqualError struct</a>

```
searchKey: quick.CheckEqualError
tags: [exported]
```

```Go
type CheckEqualError struct {
	CheckError
	Out1 []interface{}
	Out2 []interface{}
}
```

A CheckEqualError is the result CheckEqual finding an error. 

#### <a id="CheckEqualError.Error" href="#CheckEqualError.Error">func (s *CheckEqualError) Error() string</a>

```
searchKey: quick.CheckEqualError.Error
tags: [exported]
```

```Go
func (s *CheckEqualError) Error() string
```

### <a id="TestArrayAlias" href="#TestArrayAlias">type TestArrayAlias [4]byte</a>

```
searchKey: quick.TestArrayAlias
```

```Go
type TestArrayAlias [4]byte
```

#### <a id="fArrayAlias" href="#fArrayAlias">func fArrayAlias(a TestArrayAlias) TestArrayAlias</a>

```
searchKey: quick.fArrayAlias
```

```Go
func fArrayAlias(a TestArrayAlias) TestArrayAlias
```

### <a id="TestBoolAlias" href="#TestBoolAlias">type TestBoolAlias bool</a>

```
searchKey: quick.TestBoolAlias
```

```Go
type TestBoolAlias bool
```

#### <a id="fBoolAlias" href="#fBoolAlias">func fBoolAlias(a TestBoolAlias) TestBoolAlias</a>

```
searchKey: quick.fBoolAlias
```

```Go
func fBoolAlias(a TestBoolAlias) TestBoolAlias
```

### <a id="TestFloat32Alias" href="#TestFloat32Alias">type TestFloat32Alias float32</a>

```
searchKey: quick.TestFloat32Alias
```

```Go
type TestFloat32Alias float32
```

#### <a id="fFloat32Alias" href="#fFloat32Alias">func fFloat32Alias(a TestFloat32Alias) TestFloat32Alias</a>

```
searchKey: quick.fFloat32Alias
```

```Go
func fFloat32Alias(a TestFloat32Alias) TestFloat32Alias
```

### <a id="TestFloat64Alias" href="#TestFloat64Alias">type TestFloat64Alias float64</a>

```
searchKey: quick.TestFloat64Alias
```

```Go
type TestFloat64Alias float64
```

#### <a id="fFloat64Alias" href="#fFloat64Alias">func fFloat64Alias(a TestFloat64Alias) TestFloat64Alias</a>

```
searchKey: quick.fFloat64Alias
```

```Go
func fFloat64Alias(a TestFloat64Alias) TestFloat64Alias
```

### <a id="TestComplex64Alias" href="#TestComplex64Alias">type TestComplex64Alias complex64</a>

```
searchKey: quick.TestComplex64Alias
```

```Go
type TestComplex64Alias complex64
```

#### <a id="fComplex64Alias" href="#fComplex64Alias">func fComplex64Alias(a TestComplex64Alias) TestComplex64Alias</a>

```
searchKey: quick.fComplex64Alias
```

```Go
func fComplex64Alias(a TestComplex64Alias) TestComplex64Alias
```

### <a id="TestComplex128Alias" href="#TestComplex128Alias">type TestComplex128Alias complex128</a>

```
searchKey: quick.TestComplex128Alias
```

```Go
type TestComplex128Alias complex128
```

#### <a id="fComplex128Alias" href="#fComplex128Alias">func fComplex128Alias(a TestComplex128Alias) TestComplex128Alias</a>

```
searchKey: quick.fComplex128Alias
```

```Go
func fComplex128Alias(a TestComplex128Alias) TestComplex128Alias
```

### <a id="TestInt16Alias" href="#TestInt16Alias">type TestInt16Alias int16</a>

```
searchKey: quick.TestInt16Alias
```

```Go
type TestInt16Alias int16
```

#### <a id="fInt16Alias" href="#fInt16Alias">func fInt16Alias(a TestInt16Alias) TestInt16Alias</a>

```
searchKey: quick.fInt16Alias
```

```Go
func fInt16Alias(a TestInt16Alias) TestInt16Alias
```

### <a id="TestInt32Alias" href="#TestInt32Alias">type TestInt32Alias int32</a>

```
searchKey: quick.TestInt32Alias
```

```Go
type TestInt32Alias int32
```

#### <a id="fInt32Alias" href="#fInt32Alias">func fInt32Alias(a TestInt32Alias) TestInt32Alias</a>

```
searchKey: quick.fInt32Alias
```

```Go
func fInt32Alias(a TestInt32Alias) TestInt32Alias
```

### <a id="TestInt64Alias" href="#TestInt64Alias">type TestInt64Alias int64</a>

```
searchKey: quick.TestInt64Alias
```

```Go
type TestInt64Alias int64
```

#### <a id="fInt64Alias" href="#fInt64Alias">func fInt64Alias(a TestInt64Alias) TestInt64Alias</a>

```
searchKey: quick.fInt64Alias
```

```Go
func fInt64Alias(a TestInt64Alias) TestInt64Alias
```

### <a id="TestInt8Alias" href="#TestInt8Alias">type TestInt8Alias int8</a>

```
searchKey: quick.TestInt8Alias
```

```Go
type TestInt8Alias int8
```

#### <a id="fInt8Alias" href="#fInt8Alias">func fInt8Alias(a TestInt8Alias) TestInt8Alias</a>

```
searchKey: quick.fInt8Alias
```

```Go
func fInt8Alias(a TestInt8Alias) TestInt8Alias
```

### <a id="TestIntAlias" href="#TestIntAlias">type TestIntAlias int</a>

```
searchKey: quick.TestIntAlias
```

```Go
type TestIntAlias int
```

#### <a id="fIntAlias" href="#fIntAlias">func fIntAlias(a TestIntAlias) TestIntAlias</a>

```
searchKey: quick.fIntAlias
```

```Go
func fIntAlias(a TestIntAlias) TestIntAlias
```

### <a id="TestMapAlias" href="#TestMapAlias">type TestMapAlias map[int]int</a>

```
searchKey: quick.TestMapAlias
```

```Go
type TestMapAlias map[int]int
```

#### <a id="fMapAlias" href="#fMapAlias">func fMapAlias(a TestMapAlias) TestMapAlias</a>

```
searchKey: quick.fMapAlias
```

```Go
func fMapAlias(a TestMapAlias) TestMapAlias
```

### <a id="TestPtrAlias" href="#TestPtrAlias">type TestPtrAlias *int</a>

```
searchKey: quick.TestPtrAlias
```

```Go
type TestPtrAlias *int
```

#### <a id="fPtrAlias" href="#fPtrAlias">func fPtrAlias(a TestPtrAlias) TestPtrAlias</a>

```
searchKey: quick.fPtrAlias
```

```Go
func fPtrAlias(a TestPtrAlias) TestPtrAlias
```

### <a id="TestSliceAlias" href="#TestSliceAlias">type TestSliceAlias []byte</a>

```
searchKey: quick.TestSliceAlias
```

```Go
type TestSliceAlias []byte
```

#### <a id="fSliceAlias" href="#fSliceAlias">func fSliceAlias(a TestSliceAlias) TestSliceAlias</a>

```
searchKey: quick.fSliceAlias
```

```Go
func fSliceAlias(a TestSliceAlias) TestSliceAlias
```

### <a id="TestStringAlias" href="#TestStringAlias">type TestStringAlias string</a>

```
searchKey: quick.TestStringAlias
```

```Go
type TestStringAlias string
```

#### <a id="fStringAlias" href="#fStringAlias">func fStringAlias(a TestStringAlias) TestStringAlias</a>

```
searchKey: quick.fStringAlias
```

```Go
func fStringAlias(a TestStringAlias) TestStringAlias
```

### <a id="TestStruct" href="#TestStruct">type TestStruct struct</a>

```
searchKey: quick.TestStruct
```

```Go
type TestStruct struct {
	A int
	B string
}
```

#### <a id="fStruct" href="#fStruct">func fStruct(a TestStruct) TestStruct</a>

```
searchKey: quick.fStruct
```

```Go
func fStruct(a TestStruct) TestStruct
```

### <a id="TestStructAlias" href="#TestStructAlias">type TestStructAlias quick.TestStruct</a>

```
searchKey: quick.TestStructAlias
```

```Go
type TestStructAlias TestStruct
```

#### <a id="fStructAlias" href="#fStructAlias">func fStructAlias(a TestStructAlias) TestStructAlias</a>

```
searchKey: quick.fStructAlias
```

```Go
func fStructAlias(a TestStructAlias) TestStructAlias
```

### <a id="TestUint16Alias" href="#TestUint16Alias">type TestUint16Alias uint16</a>

```
searchKey: quick.TestUint16Alias
```

```Go
type TestUint16Alias uint16
```

#### <a id="fUint16Alias" href="#fUint16Alias">func fUint16Alias(a TestUint16Alias) TestUint16Alias</a>

```
searchKey: quick.fUint16Alias
```

```Go
func fUint16Alias(a TestUint16Alias) TestUint16Alias
```

### <a id="TestUint32Alias" href="#TestUint32Alias">type TestUint32Alias uint32</a>

```
searchKey: quick.TestUint32Alias
```

```Go
type TestUint32Alias uint32
```

#### <a id="fUint32Alias" href="#fUint32Alias">func fUint32Alias(a TestUint32Alias) TestUint32Alias</a>

```
searchKey: quick.fUint32Alias
```

```Go
func fUint32Alias(a TestUint32Alias) TestUint32Alias
```

### <a id="TestUint64Alias" href="#TestUint64Alias">type TestUint64Alias uint64</a>

```
searchKey: quick.TestUint64Alias
```

```Go
type TestUint64Alias uint64
```

#### <a id="fUint64Alias" href="#fUint64Alias">func fUint64Alias(a TestUint64Alias) TestUint64Alias</a>

```
searchKey: quick.fUint64Alias
```

```Go
func fUint64Alias(a TestUint64Alias) TestUint64Alias
```

### <a id="TestUint8Alias" href="#TestUint8Alias">type TestUint8Alias uint8</a>

```
searchKey: quick.TestUint8Alias
```

```Go
type TestUint8Alias uint8
```

#### <a id="fUint8Alias" href="#fUint8Alias">func fUint8Alias(a TestUint8Alias) TestUint8Alias</a>

```
searchKey: quick.fUint8Alias
```

```Go
func fUint8Alias(a TestUint8Alias) TestUint8Alias
```

### <a id="TestUintAlias" href="#TestUintAlias">type TestUintAlias uint</a>

```
searchKey: quick.TestUintAlias
```

```Go
type TestUintAlias uint
```

#### <a id="fUintAlias" href="#fUintAlias">func fUintAlias(a TestUintAlias) TestUintAlias</a>

```
searchKey: quick.fUintAlias
```

```Go
func fUintAlias(a TestUintAlias) TestUintAlias
```

### <a id="TestUintptrAlias" href="#TestUintptrAlias">type TestUintptrAlias uintptr</a>

```
searchKey: quick.TestUintptrAlias
```

```Go
type TestUintptrAlias uintptr
```

#### <a id="fUintptrAlias" href="#fUintptrAlias">func fUintptrAlias(a TestUintptrAlias) TestUintptrAlias</a>

```
searchKey: quick.fUintptrAlias
```

```Go
func fUintptrAlias(a TestUintptrAlias) TestUintptrAlias
```

### <a id="myStruct" href="#myStruct">type myStruct struct</a>

```
searchKey: quick.myStruct
```

```Go
type myStruct struct {
	x int
}
```

This tests that ArbitraryValue is working by checking that all the arbitrary values of type MyStruct have x = 42. 

#### <a id="myStruct.Generate" href="#myStruct.Generate">func (m myStruct) Generate(r *rand.Rand, _ int) reflect.Value</a>

```
searchKey: quick.myStruct.Generate
```

```Go
func (m myStruct) Generate(r *rand.Rand, _ int) reflect.Value
```

### <a id="A" href="#A">type A struct</a>

```
searchKey: quick.A
```

```Go
type A struct{ B *B }
```

### <a id="B" href="#B">type B struct</a>

```
searchKey: quick.B
```

```Go
type B struct{ A *A }
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="randFloat32" href="#randFloat32">func randFloat32(rand *rand.Rand) float32</a>

```
searchKey: quick.randFloat32
```

```Go
func randFloat32(rand *rand.Rand) float32
```

randFloat32 generates a random float taking the full range of a float32. 

### <a id="randFloat64" href="#randFloat64">func randFloat64(rand *rand.Rand) float64</a>

```
searchKey: quick.randFloat64
```

```Go
func randFloat64(rand *rand.Rand) float64
```

randFloat64 generates a random float taking the full range of a float64. 

### <a id="randInt64" href="#randInt64">func randInt64(rand *rand.Rand) int64</a>

```
searchKey: quick.randInt64
```

```Go
func randInt64(rand *rand.Rand) int64
```

randInt64 returns a random int64. 

### <a id="Value" href="#Value">func Value(t reflect.Type, rand *rand.Rand) (value reflect.Value, ok bool)</a>

```
searchKey: quick.Value
tags: [exported]
```

```Go
func Value(t reflect.Type, rand *rand.Rand) (value reflect.Value, ok bool)
```

Value returns an arbitrary value of the given type. If the type implements the Generator interface, that will be used. Note: To create arbitrary values for structs, all the fields must be exported. 

### <a id="sizedValue" href="#sizedValue">func sizedValue(t reflect.Type, rand *rand.Rand, size int) (value reflect.Value, ok bool)</a>

```
searchKey: quick.sizedValue
```

```Go
func sizedValue(t reflect.Type, rand *rand.Rand, size int) (value reflect.Value, ok bool)
```

sizedValue returns an arbitrary value of the given type. The size hint is used for shrinking as a function of indirection level so that recursive data structures will terminate. 

### <a id="Check" href="#Check">func Check(f interface{}, config *Config) error</a>

```
searchKey: quick.Check
tags: [exported]
```

```Go
func Check(f interface{}, config *Config) error
```

Check looks for an input to f, any function that returns bool, such that f returns false. It calls f repeatedly, with arbitrary values for each argument. If f returns false on a given input, Check returns that input as a *CheckError. For example: 

```
func TestOddMultipleOfThree(t *testing.T) {
	f := func(x int) bool {
		y := OddMultipleOfThree(x)
		return y%2 == 1 && y%3 == 0
	}
	if err := quick.Check(f, nil); err != nil {
		t.Error(err)
	}
}

```
### <a id="CheckEqual" href="#CheckEqual">func CheckEqual(f, g interface{}, config *Config) error</a>

```
searchKey: quick.CheckEqual
tags: [exported]
```

```Go
func CheckEqual(f, g interface{}, config *Config) error
```

CheckEqual looks for an input on which f and g return different results. It calls f and g repeatedly with arbitrary values for each argument. If f and g return different answers, CheckEqual returns a *CheckEqualError describing the input and the outputs. 

### <a id="arbitraryValues" href="#arbitraryValues">func arbitraryValues(args []reflect.Value, f reflect.Type, config *Config, rand *rand.Rand) (err error)</a>

```
searchKey: quick.arbitraryValues
```

```Go
func arbitraryValues(args []reflect.Value, f reflect.Type, config *Config, rand *rand.Rand) (err error)
```

arbitraryValues writes Values to args such that args contains Values suitable for calling f. 

### <a id="functionAndType" href="#functionAndType">func functionAndType(f interface{}) (v reflect.Value, t reflect.Type, ok bool)</a>

```
searchKey: quick.functionAndType
```

```Go
func functionAndType(f interface{}) (v reflect.Value, t reflect.Type, ok bool)
```

### <a id="toInterfaces" href="#toInterfaces">func toInterfaces(values []reflect.Value) []interface{}</a>

```
searchKey: quick.toInterfaces
```

```Go
func toInterfaces(values []reflect.Value) []interface{}
```

### <a id="toString" href="#toString">func toString(interfaces []interface{}) string</a>

```
searchKey: quick.toString
```

```Go
func toString(interfaces []interface{}) string
```

### <a id="fArray" href="#fArray">func fArray(a [4]byte) [4]byte</a>

```
searchKey: quick.fArray
```

```Go
func fArray(a [4]byte) [4]byte
```

### <a id="fBool" href="#fBool">func fBool(a bool) bool</a>

```
searchKey: quick.fBool
```

```Go
func fBool(a bool) bool
```

### <a id="fFloat32" href="#fFloat32">func fFloat32(a float32) float32</a>

```
searchKey: quick.fFloat32
```

```Go
func fFloat32(a float32) float32
```

### <a id="fFloat64" href="#fFloat64">func fFloat64(a float64) float64</a>

```
searchKey: quick.fFloat64
```

```Go
func fFloat64(a float64) float64
```

### <a id="fComplex64" href="#fComplex64">func fComplex64(a complex64) complex64</a>

```
searchKey: quick.fComplex64
```

```Go
func fComplex64(a complex64) complex64
```

### <a id="fComplex128" href="#fComplex128">func fComplex128(a complex128) complex128</a>

```
searchKey: quick.fComplex128
```

```Go
func fComplex128(a complex128) complex128
```

### <a id="fInt16" href="#fInt16">func fInt16(a int16) int16</a>

```
searchKey: quick.fInt16
```

```Go
func fInt16(a int16) int16
```

### <a id="fInt32" href="#fInt32">func fInt32(a int32) int32</a>

```
searchKey: quick.fInt32
```

```Go
func fInt32(a int32) int32
```

### <a id="fInt64" href="#fInt64">func fInt64(a int64) int64</a>

```
searchKey: quick.fInt64
```

```Go
func fInt64(a int64) int64
```

### <a id="fInt8" href="#fInt8">func fInt8(a int8) int8</a>

```
searchKey: quick.fInt8
```

```Go
func fInt8(a int8) int8
```

### <a id="fInt" href="#fInt">func fInt(a int) int</a>

```
searchKey: quick.fInt
```

```Go
func fInt(a int) int
```

### <a id="fMap" href="#fMap">func fMap(a map[int]int) map[int]int</a>

```
searchKey: quick.fMap
```

```Go
func fMap(a map[int]int) map[int]int
```

### <a id="fPtr" href="#fPtr">func fPtr(a *int) *int</a>

```
searchKey: quick.fPtr
```

```Go
func fPtr(a *int) *int
```

### <a id="fSlice" href="#fSlice">func fSlice(a []byte) []byte</a>

```
searchKey: quick.fSlice
```

```Go
func fSlice(a []byte) []byte
```

### <a id="fString" href="#fString">func fString(a string) string</a>

```
searchKey: quick.fString
```

```Go
func fString(a string) string
```

### <a id="fUint16" href="#fUint16">func fUint16(a uint16) uint16</a>

```
searchKey: quick.fUint16
```

```Go
func fUint16(a uint16) uint16
```

### <a id="fUint32" href="#fUint32">func fUint32(a uint32) uint32</a>

```
searchKey: quick.fUint32
```

```Go
func fUint32(a uint32) uint32
```

### <a id="fUint64" href="#fUint64">func fUint64(a uint64) uint64</a>

```
searchKey: quick.fUint64
```

```Go
func fUint64(a uint64) uint64
```

### <a id="fUint8" href="#fUint8">func fUint8(a uint8) uint8</a>

```
searchKey: quick.fUint8
```

```Go
func fUint8(a uint8) uint8
```

### <a id="fUint" href="#fUint">func fUint(a uint) uint</a>

```
searchKey: quick.fUint
```

```Go
func fUint(a uint) uint
```

### <a id="fUintptr" href="#fUintptr">func fUintptr(a uintptr) uintptr</a>

```
searchKey: quick.fUintptr
```

```Go
func fUintptr(a uintptr) uintptr
```

### <a id="reportError" href="#reportError">func reportError(property string, err error, t *testing.T)</a>

```
searchKey: quick.reportError
```

```Go
func reportError(property string, err error, t *testing.T)
```

### <a id="TestCheckEqual" href="#TestCheckEqual">func TestCheckEqual(t *testing.T)</a>

```
searchKey: quick.TestCheckEqual
```

```Go
func TestCheckEqual(t *testing.T)
```

### <a id="myStructProperty" href="#myStructProperty">func myStructProperty(in myStruct) bool</a>

```
searchKey: quick.myStructProperty
```

```Go
func myStructProperty(in myStruct) bool
```

### <a id="TestCheckProperty" href="#TestCheckProperty">func TestCheckProperty(t *testing.T)</a>

```
searchKey: quick.TestCheckProperty
```

```Go
func TestCheckProperty(t *testing.T)
```

### <a id="TestFailure" href="#TestFailure">func TestFailure(t *testing.T)</a>

```
searchKey: quick.TestFailure
```

```Go
func TestFailure(t *testing.T)
```

### <a id="TestRecursive" href="#TestRecursive">func TestRecursive(t *testing.T)</a>

```
searchKey: quick.TestRecursive
```

```Go
func TestRecursive(t *testing.T)
```

Recursive data structures didn't terminate. Issues 8818 and 11148. 

### <a id="TestEmptyStruct" href="#TestEmptyStruct">func TestEmptyStruct(t *testing.T)</a>

```
searchKey: quick.TestEmptyStruct
```

```Go
func TestEmptyStruct(t *testing.T)
```

### <a id="TestMutuallyRecursive" href="#TestMutuallyRecursive">func TestMutuallyRecursive(t *testing.T)</a>

```
searchKey: quick.TestMutuallyRecursive
```

```Go
func TestMutuallyRecursive(t *testing.T)
```

### <a id="TestNonZeroSliceAndMap" href="#TestNonZeroSliceAndMap">func TestNonZeroSliceAndMap(t *testing.T)</a>

```
searchKey: quick.TestNonZeroSliceAndMap
```

```Go
func TestNonZeroSliceAndMap(t *testing.T)
```

Some serialization formats (e.g. encoding/pem) cannot distinguish between a nil and an empty map or slice, so avoid generating the zero value for these. 

### <a id="TestInt64" href="#TestInt64">func TestInt64(t *testing.T)</a>

```
searchKey: quick.TestInt64
```

```Go
func TestInt64(t *testing.T)
```

