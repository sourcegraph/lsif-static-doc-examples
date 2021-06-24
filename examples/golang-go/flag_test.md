# Package flag_test

These examples demonstrate more intricate uses of the flag package. 

## Index

* [Constants](#const)
    * [const defaultOutput](#defaultOutput)
* [Variables](#var)
    * [var gopherType](#gopherType)
    * [var intervalFlag](#intervalFlag)
    * [var species](#species)
    * [var u](#u)
* [Types](#type)
    * [type URLValue struct](#URLValue)
        * [func (v URLValue) Set(s string) error](#URLValue.Set)
        * [func (v URLValue) String() string](#URLValue.String)
    * [type boolFlagVar struct](#boolFlagVar)
        * [func (b *boolFlagVar) IsBoolFlag() bool](#boolFlagVar.IsBoolFlag)
        * [func (b *boolFlagVar) Set(value string) error](#boolFlagVar.Set)
        * [func (b *boolFlagVar) String() string](#boolFlagVar.String)
    * [type flagVar []string](#flagVar)
        * [func (f *flagVar) Set(value string) error](#flagVar.Set)
        * [func (f *flagVar) String() string](#flagVar.String)
    * [type interval []time.Duration](#interval)
        * [func (i *interval) Set(value string) error](#interval.Set)
        * [func (i *interval) String() string](#interval.String)
* [Functions](#func)
    * [func Example()](#Example)
    * [func ExampleFunc()](#ExampleFunc)
    * [func ExampleValue()](#ExampleValue)
    * [func TestChangingArgs(t *testing.T)](#TestChangingArgs)
    * [func TestEverything(t *testing.T)](#TestEverything)
    * [func TestExitCode(t *testing.T)](#TestExitCode)
    * [func TestFlagSetParse(t *testing.T)](#TestFlagSetParse)
    * [func TestGet(t *testing.T)](#TestGet)
    * [func TestGetters(t *testing.T)](#TestGetters)
    * [func TestHelp(t *testing.T)](#TestHelp)
    * [func TestIntFlagOverflow(t *testing.T)](#TestIntFlagOverflow)
    * [func TestInvalidFlags(t *testing.T)](#TestInvalidFlags)
    * [func TestParse(t *testing.T)](#TestParse)
    * [func TestParseError(t *testing.T)](#TestParseError)
    * [func TestPrintDefaults(t *testing.T)](#TestPrintDefaults)
    * [func TestRangeError(t *testing.T)](#TestRangeError)
    * [func TestRedefinedFlags(t *testing.T)](#TestRedefinedFlags)
    * [func TestSetOutput(t *testing.T)](#TestSetOutput)
    * [func TestUsage(t *testing.T)](#TestUsage)
    * [func TestUsageOutput(t *testing.T)](#TestUsageOutput)
    * [func TestUserDefined(t *testing.T)](#TestUserDefined)
    * [func TestUserDefinedBool(t *testing.T)](#TestUserDefinedBool)
    * [func TestUserDefinedForCommandLine(t *testing.T)](#TestUserDefinedForCommandLine)
    * [func TestUserDefinedFunc(t *testing.T)](#TestUserDefinedFunc)
    * [func boolString(s string) string](#boolString)
    * [func init()](#init.example_test.go)
    * [func init()](#init.example_test.go.0xc0297a6eb8)
    * [func mustPanic(t *testing.T, testName string, expected string, f func())](#mustPanic)
    * [func testParse(f *FlagSet, t *testing.T)](#testParse)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="defaultOutput" href="#defaultOutput">const defaultOutput</a>

```
searchKey: flag_test.defaultOutput
tags: [constant string private]
```

```Go
const defaultOutput = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="gopherType" href="#gopherType">var gopherType</a>

```
searchKey: flag_test.gopherType
tags: [variable string private]
```

```Go
var gopherType string
```

Example 2: Two flags sharing a variable, so we can have a shorthand. The order of initialization is undefined, so make sure both use the same default value. They must be set up with an init function. 

### <a id="intervalFlag" href="#intervalFlag">var intervalFlag</a>

```
searchKey: flag_test.intervalFlag
tags: [variable array number private]
```

```Go
var intervalFlag interval
```

### <a id="species" href="#species">var species</a>

```
searchKey: flag_test.species
tags: [variable string private]
```

```Go
var species = flag.String("species", "gopher", "the species we are studying")
```

Example 1: A single string flag called "species" with default value "gopher". 

### <a id="u" href="#u">var u</a>

```
searchKey: flag_test.u
tags: [variable struct private]
```

```Go
var u = &url.URL{}
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="URLValue" href="#URLValue">type URLValue struct</a>

```
searchKey: flag_test.URLValue
tags: [struct private]
```

```Go
type URLValue struct {
	URL *url.URL
}
```

#### <a id="URLValue.Set" href="#URLValue.Set">func (v URLValue) Set(s string) error</a>

```
searchKey: flag_test.URLValue.Set
tags: [method private]
```

```Go
func (v URLValue) Set(s string) error
```

#### <a id="URLValue.String" href="#URLValue.String">func (v URLValue) String() string</a>

```
searchKey: flag_test.URLValue.String
tags: [function private]
```

```Go
func (v URLValue) String() string
```

### <a id="boolFlagVar" href="#boolFlagVar">type boolFlagVar struct</a>

```
searchKey: flag_test.boolFlagVar
tags: [struct private]
```

```Go
type boolFlagVar struct {
	count int
}
```

Declare a user-defined boolean flag type. 

#### <a id="boolFlagVar.IsBoolFlag" href="#boolFlagVar.IsBoolFlag">func (b *boolFlagVar) IsBoolFlag() bool</a>

```
searchKey: flag_test.boolFlagVar.IsBoolFlag
tags: [function private]
```

```Go
func (b *boolFlagVar) IsBoolFlag() bool
```

#### <a id="boolFlagVar.Set" href="#boolFlagVar.Set">func (b *boolFlagVar) Set(value string) error</a>

```
searchKey: flag_test.boolFlagVar.Set
tags: [method private]
```

```Go
func (b *boolFlagVar) Set(value string) error
```

#### <a id="boolFlagVar.String" href="#boolFlagVar.String">func (b *boolFlagVar) String() string</a>

```
searchKey: flag_test.boolFlagVar.String
tags: [function private]
```

```Go
func (b *boolFlagVar) String() string
```

### <a id="flagVar" href="#flagVar">type flagVar []string</a>

```
searchKey: flag_test.flagVar
tags: [array string private]
```

```Go
type flagVar []string
```

Declare a user-defined flag type. 

#### <a id="flagVar.Set" href="#flagVar.Set">func (f *flagVar) Set(value string) error</a>

```
searchKey: flag_test.flagVar.Set
tags: [method private]
```

```Go
func (f *flagVar) Set(value string) error
```

#### <a id="flagVar.String" href="#flagVar.String">func (f *flagVar) String() string</a>

```
searchKey: flag_test.flagVar.String
tags: [function private]
```

```Go
func (f *flagVar) String() string
```

### <a id="interval" href="#interval">type interval []time.Duration</a>

```
searchKey: flag_test.interval
tags: [array number private]
```

```Go
type interval []time.Duration
```

Example 3: A user-defined flag type, a slice of durations. 

#### <a id="interval.Set" href="#interval.Set">func (i *interval) Set(value string) error</a>

```
searchKey: flag_test.interval.Set
tags: [method private]
```

```Go
func (i *interval) Set(value string) error
```

Set is the method to set the flag value, part of the flag.Value interface. Set's argument is a string to be parsed to set the flag. It's a comma-separated list, so we split it. 

#### <a id="interval.String" href="#interval.String">func (i *interval) String() string</a>

```
searchKey: flag_test.interval.String
tags: [function private]
```

```Go
func (i *interval) String() string
```

String is the method to format the flag's value, part of the flag.Value interface. The String method's output will be used in diagnostics. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Example" href="#Example">func Example()</a>

```
searchKey: flag_test.Example
tags: [function private]
```

```Go
func Example()
```

### <a id="ExampleFunc" href="#ExampleFunc">func ExampleFunc()</a>

```
searchKey: flag_test.ExampleFunc
tags: [function private]
```

```Go
func ExampleFunc()
```

### <a id="ExampleValue" href="#ExampleValue">func ExampleValue()</a>

```
searchKey: flag_test.ExampleValue
tags: [function private]
```

```Go
func ExampleValue()
```

### <a id="TestChangingArgs" href="#TestChangingArgs">func TestChangingArgs(t *testing.T)</a>

```
searchKey: flag_test.TestChangingArgs
tags: [method private test]
```

```Go
func TestChangingArgs(t *testing.T)
```

This tests that one can reset the flags. This still works but not well, and is superseded by FlagSet. 

### <a id="TestEverything" href="#TestEverything">func TestEverything(t *testing.T)</a>

```
searchKey: flag_test.TestEverything
tags: [method private test]
```

```Go
func TestEverything(t *testing.T)
```

### <a id="TestExitCode" href="#TestExitCode">func TestExitCode(t *testing.T)</a>

```
searchKey: flag_test.TestExitCode
tags: [method private test]
```

```Go
func TestExitCode(t *testing.T)
```

### <a id="TestFlagSetParse" href="#TestFlagSetParse">func TestFlagSetParse(t *testing.T)</a>

```
searchKey: flag_test.TestFlagSetParse
tags: [method private test]
```

```Go
func TestFlagSetParse(t *testing.T)
```

### <a id="TestGet" href="#TestGet">func TestGet(t *testing.T)</a>

```
searchKey: flag_test.TestGet
tags: [method private test]
```

```Go
func TestGet(t *testing.T)
```

### <a id="TestGetters" href="#TestGetters">func TestGetters(t *testing.T)</a>

```
searchKey: flag_test.TestGetters
tags: [method private test]
```

```Go
func TestGetters(t *testing.T)
```

### <a id="TestHelp" href="#TestHelp">func TestHelp(t *testing.T)</a>

```
searchKey: flag_test.TestHelp
tags: [method private test]
```

```Go
func TestHelp(t *testing.T)
```

Test that -help invokes the usage message and returns ErrHelp. 

### <a id="TestIntFlagOverflow" href="#TestIntFlagOverflow">func TestIntFlagOverflow(t *testing.T)</a>

```
searchKey: flag_test.TestIntFlagOverflow
tags: [method private test]
```

```Go
func TestIntFlagOverflow(t *testing.T)
```

Issue 19230: validate range of Int and Uint flag values. 

### <a id="TestInvalidFlags" href="#TestInvalidFlags">func TestInvalidFlags(t *testing.T)</a>

```
searchKey: flag_test.TestInvalidFlags
tags: [method private test]
```

```Go
func TestInvalidFlags(t *testing.T)
```

### <a id="TestParse" href="#TestParse">func TestParse(t *testing.T)</a>

```
searchKey: flag_test.TestParse
tags: [method private test]
```

```Go
func TestParse(t *testing.T)
```

### <a id="TestParseError" href="#TestParseError">func TestParseError(t *testing.T)</a>

```
searchKey: flag_test.TestParseError
tags: [method private test]
```

```Go
func TestParseError(t *testing.T)
```

### <a id="TestPrintDefaults" href="#TestPrintDefaults">func TestPrintDefaults(t *testing.T)</a>

```
searchKey: flag_test.TestPrintDefaults
tags: [method private test]
```

```Go
func TestPrintDefaults(t *testing.T)
```

### <a id="TestRangeError" href="#TestRangeError">func TestRangeError(t *testing.T)</a>

```
searchKey: flag_test.TestRangeError
tags: [method private test]
```

```Go
func TestRangeError(t *testing.T)
```

### <a id="TestRedefinedFlags" href="#TestRedefinedFlags">func TestRedefinedFlags(t *testing.T)</a>

```
searchKey: flag_test.TestRedefinedFlags
tags: [method private test]
```

```Go
func TestRedefinedFlags(t *testing.T)
```

### <a id="TestSetOutput" href="#TestSetOutput">func TestSetOutput(t *testing.T)</a>

```
searchKey: flag_test.TestSetOutput
tags: [method private test]
```

```Go
func TestSetOutput(t *testing.T)
```

### <a id="TestUsage" href="#TestUsage">func TestUsage(t *testing.T)</a>

```
searchKey: flag_test.TestUsage
tags: [method private test]
```

```Go
func TestUsage(t *testing.T)
```

### <a id="TestUsageOutput" href="#TestUsageOutput">func TestUsageOutput(t *testing.T)</a>

```
searchKey: flag_test.TestUsageOutput
tags: [method private test]
```

```Go
func TestUsageOutput(t *testing.T)
```

Issue 20998: Usage should respect CommandLine.output. 

### <a id="TestUserDefined" href="#TestUserDefined">func TestUserDefined(t *testing.T)</a>

```
searchKey: flag_test.TestUserDefined
tags: [method private test]
```

```Go
func TestUserDefined(t *testing.T)
```

### <a id="TestUserDefinedBool" href="#TestUserDefinedBool">func TestUserDefinedBool(t *testing.T)</a>

```
searchKey: flag_test.TestUserDefinedBool
tags: [method private test]
```

```Go
func TestUserDefinedBool(t *testing.T)
```

### <a id="TestUserDefinedForCommandLine" href="#TestUserDefinedForCommandLine">func TestUserDefinedForCommandLine(t *testing.T)</a>

```
searchKey: flag_test.TestUserDefinedForCommandLine
tags: [method private test]
```

```Go
func TestUserDefinedForCommandLine(t *testing.T)
```

### <a id="TestUserDefinedFunc" href="#TestUserDefinedFunc">func TestUserDefinedFunc(t *testing.T)</a>

```
searchKey: flag_test.TestUserDefinedFunc
tags: [method private test]
```

```Go
func TestUserDefinedFunc(t *testing.T)
```

### <a id="boolString" href="#boolString">func boolString(s string) string</a>

```
searchKey: flag_test.boolString
tags: [method private]
```

```Go
func boolString(s string) string
```

### <a id="init.example_test.go" href="#init.example_test.go">func init()</a>

```
searchKey: flag_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.example_test.go.0xc0297a6eb8" href="#init.example_test.go.0xc0297a6eb8">func init()</a>

```
searchKey: flag_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="mustPanic" href="#mustPanic">func mustPanic(t *testing.T, testName string, expected string, f func())</a>

```
searchKey: flag_test.mustPanic
tags: [method private]
```

```Go
func mustPanic(t *testing.T, testName string, expected string, f func())
```

### <a id="testParse" href="#testParse">func testParse(f *FlagSet, t *testing.T)</a>

```
searchKey: flag_test.testParse
tags: [method private]
```

```Go
func testParse(f *FlagSet, t *testing.T)
```

