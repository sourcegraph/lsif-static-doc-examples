# Package flag_test

These examples demonstrate more intricate uses of the flag package. 

## Index

* [Constants](#const)
    * [const defaultOutput](#defaultOutput)
* [Variables](#var)
    * [var species](#species)
    * [var gopherType](#gopherType)
    * [var intervalFlag](#intervalFlag)
    * [var u](#u)
* [Types](#type)
    * [type interval []time.Duration](#interval)
        * [func (i *interval) String() string](#interval.String)
        * [func (i *interval) Set(value string) error](#interval.Set)
    * [type URLValue struct](#URLValue)
        * [func (v URLValue) String() string](#URLValue.String)
        * [func (v URLValue) Set(s string) error](#URLValue.Set)
    * [type flagVar []string](#flagVar)
        * [func (f *flagVar) String() string](#flagVar.String)
        * [func (f *flagVar) Set(value string) error](#flagVar.Set)
    * [type boolFlagVar struct](#boolFlagVar)
        * [func (b *boolFlagVar) String() string](#boolFlagVar.String)
        * [func (b *boolFlagVar) Set(value string) error](#boolFlagVar.Set)
        * [func (b *boolFlagVar) IsBoolFlag() bool](#boolFlagVar.IsBoolFlag)
* [Functions](#func)
    * [func ExampleFunc()](#ExampleFunc)
    * [func init()](#init.example_test.go)
    * [func init()](#init.example_test.go.0xc056cbfbc8)
    * [func Example()](#Example)
    * [func ExampleValue()](#ExampleValue)
    * [func boolString(s string) string](#boolString)
    * [func TestEverything(t *testing.T)](#TestEverything)
    * [func TestGet(t *testing.T)](#TestGet)
    * [func TestUsage(t *testing.T)](#TestUsage)
    * [func testParse(f *FlagSet, t *testing.T)](#testParse)
    * [func TestParse(t *testing.T)](#TestParse)
    * [func TestFlagSetParse(t *testing.T)](#TestFlagSetParse)
    * [func TestUserDefined(t *testing.T)](#TestUserDefined)
    * [func TestUserDefinedFunc(t *testing.T)](#TestUserDefinedFunc)
    * [func TestUserDefinedForCommandLine(t *testing.T)](#TestUserDefinedForCommandLine)
    * [func TestUserDefinedBool(t *testing.T)](#TestUserDefinedBool)
    * [func TestSetOutput(t *testing.T)](#TestSetOutput)
    * [func TestChangingArgs(t *testing.T)](#TestChangingArgs)
    * [func TestHelp(t *testing.T)](#TestHelp)
    * [func TestPrintDefaults(t *testing.T)](#TestPrintDefaults)
    * [func TestIntFlagOverflow(t *testing.T)](#TestIntFlagOverflow)
    * [func TestUsageOutput(t *testing.T)](#TestUsageOutput)
    * [func TestGetters(t *testing.T)](#TestGetters)
    * [func TestParseError(t *testing.T)](#TestParseError)
    * [func TestRangeError(t *testing.T)](#TestRangeError)
    * [func TestExitCode(t *testing.T)](#TestExitCode)
    * [func mustPanic(t *testing.T, testName string, expected string, f func())](#mustPanic)
    * [func TestInvalidFlags(t *testing.T)](#TestInvalidFlags)
    * [func TestRedefinedFlags(t *testing.T)](#TestRedefinedFlags)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="defaultOutput" href="#defaultOutput">const defaultOutput</a>

```
searchKey: flag_test.defaultOutput
tags: [private]
```

```Go
const defaultOutput = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="species" href="#species">var species</a>

```
searchKey: flag_test.species
tags: [private]
```

```Go
var species = flag.String("species", "gopher", "the species we are studying")
```

Example 1: A single string flag called "species" with default value "gopher". 

### <a id="gopherType" href="#gopherType">var gopherType</a>

```
searchKey: flag_test.gopherType
tags: [private]
```

```Go
var gopherType string
```

Example 2: Two flags sharing a variable, so we can have a shorthand. The order of initialization is undefined, so make sure both use the same default value. They must be set up with an init function. 

### <a id="intervalFlag" href="#intervalFlag">var intervalFlag</a>

```
searchKey: flag_test.intervalFlag
tags: [private]
```

```Go
var intervalFlag interval
```

### <a id="u" href="#u">var u</a>

```
searchKey: flag_test.u
tags: [private]
```

```Go
var u = &url.URL{}
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="interval" href="#interval">type interval []time.Duration</a>

```
searchKey: flag_test.interval
tags: [private]
```

```Go
type interval []time.Duration
```

Example 3: A user-defined flag type, a slice of durations. 

#### <a id="interval.String" href="#interval.String">func (i *interval) String() string</a>

```
searchKey: flag_test.interval.String
tags: [private]
```

```Go
func (i *interval) String() string
```

String is the method to format the flag's value, part of the flag.Value interface. The String method's output will be used in diagnostics. 

#### <a id="interval.Set" href="#interval.Set">func (i *interval) Set(value string) error</a>

```
searchKey: flag_test.interval.Set
tags: [private]
```

```Go
func (i *interval) Set(value string) error
```

Set is the method to set the flag value, part of the flag.Value interface. Set's argument is a string to be parsed to set the flag. It's a comma-separated list, so we split it. 

### <a id="URLValue" href="#URLValue">type URLValue struct</a>

```
searchKey: flag_test.URLValue
tags: [private]
```

```Go
type URLValue struct {
	URL *url.URL
}
```

#### <a id="URLValue.String" href="#URLValue.String">func (v URLValue) String() string</a>

```
searchKey: flag_test.URLValue.String
tags: [private]
```

```Go
func (v URLValue) String() string
```

#### <a id="URLValue.Set" href="#URLValue.Set">func (v URLValue) Set(s string) error</a>

```
searchKey: flag_test.URLValue.Set
tags: [private]
```

```Go
func (v URLValue) Set(s string) error
```

### <a id="flagVar" href="#flagVar">type flagVar []string</a>

```
searchKey: flag_test.flagVar
tags: [private]
```

```Go
type flagVar []string
```

Declare a user-defined flag type. 

#### <a id="flagVar.String" href="#flagVar.String">func (f *flagVar) String() string</a>

```
searchKey: flag_test.flagVar.String
tags: [private]
```

```Go
func (f *flagVar) String() string
```

#### <a id="flagVar.Set" href="#flagVar.Set">func (f *flagVar) Set(value string) error</a>

```
searchKey: flag_test.flagVar.Set
tags: [private]
```

```Go
func (f *flagVar) Set(value string) error
```

### <a id="boolFlagVar" href="#boolFlagVar">type boolFlagVar struct</a>

```
searchKey: flag_test.boolFlagVar
tags: [private]
```

```Go
type boolFlagVar struct {
	count int
}
```

Declare a user-defined boolean flag type. 

#### <a id="boolFlagVar.String" href="#boolFlagVar.String">func (b *boolFlagVar) String() string</a>

```
searchKey: flag_test.boolFlagVar.String
tags: [private]
```

```Go
func (b *boolFlagVar) String() string
```

#### <a id="boolFlagVar.Set" href="#boolFlagVar.Set">func (b *boolFlagVar) Set(value string) error</a>

```
searchKey: flag_test.boolFlagVar.Set
tags: [private]
```

```Go
func (b *boolFlagVar) Set(value string) error
```

#### <a id="boolFlagVar.IsBoolFlag" href="#boolFlagVar.IsBoolFlag">func (b *boolFlagVar) IsBoolFlag() bool</a>

```
searchKey: flag_test.boolFlagVar.IsBoolFlag
tags: [private]
```

```Go
func (b *boolFlagVar) IsBoolFlag() bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleFunc" href="#ExampleFunc">func ExampleFunc()</a>

```
searchKey: flag_test.ExampleFunc
tags: [private]
```

```Go
func ExampleFunc()
```

### <a id="init.example_test.go" href="#init.example_test.go">func init()</a>

```
searchKey: flag_test.init
tags: [private]
```

```Go
func init()
```

### <a id="init.example_test.go.0xc056cbfbc8" href="#init.example_test.go.0xc056cbfbc8">func init()</a>

```
searchKey: flag_test.init
tags: [private]
```

```Go
func init()
```

### <a id="Example" href="#Example">func Example()</a>

```
searchKey: flag_test.Example
tags: [private]
```

```Go
func Example()
```

### <a id="ExampleValue" href="#ExampleValue">func ExampleValue()</a>

```
searchKey: flag_test.ExampleValue
tags: [private]
```

```Go
func ExampleValue()
```

### <a id="boolString" href="#boolString">func boolString(s string) string</a>

```
searchKey: flag_test.boolString
tags: [private]
```

```Go
func boolString(s string) string
```

### <a id="TestEverything" href="#TestEverything">func TestEverything(t *testing.T)</a>

```
searchKey: flag_test.TestEverything
tags: [private]
```

```Go
func TestEverything(t *testing.T)
```

### <a id="TestGet" href="#TestGet">func TestGet(t *testing.T)</a>

```
searchKey: flag_test.TestGet
tags: [private]
```

```Go
func TestGet(t *testing.T)
```

### <a id="TestUsage" href="#TestUsage">func TestUsage(t *testing.T)</a>

```
searchKey: flag_test.TestUsage
tags: [private]
```

```Go
func TestUsage(t *testing.T)
```

### <a id="testParse" href="#testParse">func testParse(f *FlagSet, t *testing.T)</a>

```
searchKey: flag_test.testParse
tags: [private]
```

```Go
func testParse(f *FlagSet, t *testing.T)
```

### <a id="TestParse" href="#TestParse">func TestParse(t *testing.T)</a>

```
searchKey: flag_test.TestParse
tags: [private]
```

```Go
func TestParse(t *testing.T)
```

### <a id="TestFlagSetParse" href="#TestFlagSetParse">func TestFlagSetParse(t *testing.T)</a>

```
searchKey: flag_test.TestFlagSetParse
tags: [private]
```

```Go
func TestFlagSetParse(t *testing.T)
```

### <a id="TestUserDefined" href="#TestUserDefined">func TestUserDefined(t *testing.T)</a>

```
searchKey: flag_test.TestUserDefined
tags: [private]
```

```Go
func TestUserDefined(t *testing.T)
```

### <a id="TestUserDefinedFunc" href="#TestUserDefinedFunc">func TestUserDefinedFunc(t *testing.T)</a>

```
searchKey: flag_test.TestUserDefinedFunc
tags: [private]
```

```Go
func TestUserDefinedFunc(t *testing.T)
```

### <a id="TestUserDefinedForCommandLine" href="#TestUserDefinedForCommandLine">func TestUserDefinedForCommandLine(t *testing.T)</a>

```
searchKey: flag_test.TestUserDefinedForCommandLine
tags: [private]
```

```Go
func TestUserDefinedForCommandLine(t *testing.T)
```

### <a id="TestUserDefinedBool" href="#TestUserDefinedBool">func TestUserDefinedBool(t *testing.T)</a>

```
searchKey: flag_test.TestUserDefinedBool
tags: [private]
```

```Go
func TestUserDefinedBool(t *testing.T)
```

### <a id="TestSetOutput" href="#TestSetOutput">func TestSetOutput(t *testing.T)</a>

```
searchKey: flag_test.TestSetOutput
tags: [private]
```

```Go
func TestSetOutput(t *testing.T)
```

### <a id="TestChangingArgs" href="#TestChangingArgs">func TestChangingArgs(t *testing.T)</a>

```
searchKey: flag_test.TestChangingArgs
tags: [private]
```

```Go
func TestChangingArgs(t *testing.T)
```

This tests that one can reset the flags. This still works but not well, and is superseded by FlagSet. 

### <a id="TestHelp" href="#TestHelp">func TestHelp(t *testing.T)</a>

```
searchKey: flag_test.TestHelp
tags: [private]
```

```Go
func TestHelp(t *testing.T)
```

Test that -help invokes the usage message and returns ErrHelp. 

### <a id="TestPrintDefaults" href="#TestPrintDefaults">func TestPrintDefaults(t *testing.T)</a>

```
searchKey: flag_test.TestPrintDefaults
tags: [private]
```

```Go
func TestPrintDefaults(t *testing.T)
```

### <a id="TestIntFlagOverflow" href="#TestIntFlagOverflow">func TestIntFlagOverflow(t *testing.T)</a>

```
searchKey: flag_test.TestIntFlagOverflow
tags: [private]
```

```Go
func TestIntFlagOverflow(t *testing.T)
```

Issue 19230: validate range of Int and Uint flag values. 

### <a id="TestUsageOutput" href="#TestUsageOutput">func TestUsageOutput(t *testing.T)</a>

```
searchKey: flag_test.TestUsageOutput
tags: [private]
```

```Go
func TestUsageOutput(t *testing.T)
```

Issue 20998: Usage should respect CommandLine.output. 

### <a id="TestGetters" href="#TestGetters">func TestGetters(t *testing.T)</a>

```
searchKey: flag_test.TestGetters
tags: [private]
```

```Go
func TestGetters(t *testing.T)
```

### <a id="TestParseError" href="#TestParseError">func TestParseError(t *testing.T)</a>

```
searchKey: flag_test.TestParseError
tags: [private]
```

```Go
func TestParseError(t *testing.T)
```

### <a id="TestRangeError" href="#TestRangeError">func TestRangeError(t *testing.T)</a>

```
searchKey: flag_test.TestRangeError
tags: [private]
```

```Go
func TestRangeError(t *testing.T)
```

### <a id="TestExitCode" href="#TestExitCode">func TestExitCode(t *testing.T)</a>

```
searchKey: flag_test.TestExitCode
tags: [private]
```

```Go
func TestExitCode(t *testing.T)
```

### <a id="mustPanic" href="#mustPanic">func mustPanic(t *testing.T, testName string, expected string, f func())</a>

```
searchKey: flag_test.mustPanic
tags: [private]
```

```Go
func mustPanic(t *testing.T, testName string, expected string, f func())
```

### <a id="TestInvalidFlags" href="#TestInvalidFlags">func TestInvalidFlags(t *testing.T)</a>

```
searchKey: flag_test.TestInvalidFlags
tags: [private]
```

```Go
func TestInvalidFlags(t *testing.T)
```

### <a id="TestRedefinedFlags" href="#TestRedefinedFlags">func TestRedefinedFlags(t *testing.T)</a>

```
searchKey: flag_test.TestRedefinedFlags
tags: [private]
```

```Go
func TestRedefinedFlags(t *testing.T)
```

