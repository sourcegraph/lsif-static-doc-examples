# Package flag

Package flag implements command-line flag parsing. 

### hdr-UsageUsage
Define flags using flag.String(), Bool(), Int(), etc. 

This declares an integer flag, -n, stored in the pointer nFlag, with type *int: 

```
import "flag"
var nFlag = flag.Int("n", 1234, "help message for flag n")

```
If you like, you can bind the flag to a variable using the Var() functions. 

```
var flagvar int
func init() {
	flag.IntVar(&flagvar, "flagname", 1234, "help message for flagname")
}

```
Or you can create custom flags that satisfy the Value interface (with pointer receivers) and couple them to flag parsing by 

```
flag.Var(&flagVal, "name", "help message for flagname")

```
For such flags, the default value is just the initial value of the variable. 

After all flags are defined, call 

```
flag.Parse()

```
to parse the command line into the defined flags. 

Flags may then be used directly. If you're using the flags themselves, they are all pointers; if you bind to variables, they're values. 

```
fmt.Println("ip has value ", *ip)
fmt.Println("flagvar has value ", flagvar)

```
After parsing, the arguments following the flags are available as the slice flag.Args() or individually as flag.Arg(i). The arguments are indexed from 0 through flag.NArg()-1. 

### hdr-Command_line_flag_syntaxCommand line flag syntax
The following forms are permitted: 

```
-flag
-flag=x
-flag x  // non-boolean flags only

```
One or two minus signs may be used; they are equivalent. The last form is not permitted for boolean flags because the meaning of the command 

```
cmd -x *

```
where * is a Unix shell wildcard, will change if there is a file called 0, false, etc. You must use the -flag=false form to turn off a boolean flag. 

Flag parsing stops just before the first non-flag argument ("-" is a non-flag argument) or after the terminator "--". 

Integer flags accept 1234, 0664, 0x1234 and may be negative. Boolean flags may be: 

```
1, 0, t, f, T, F, true, false, TRUE, FALSE, True, False

```
Duration flags accept any input valid for time.ParseDuration. 

The default set of command-line flags is controlled by top-level functions.  The FlagSet type allows one to define independent sets of flags, such as to implement subcommands in a command-line interface. The methods of FlagSet are analogous to the top-level functions for the command-line flag set. 

## Index

* [Constants](#const)
    * [const ContinueOnError](#ContinueOnError)
    * [const ExitOnError](#ExitOnError)
    * [const PanicOnError](#PanicOnError)
* [Variables](#var)
    * [var CommandLine](#CommandLine)
    * [var DefaultUsage](#DefaultUsage)
    * [var ErrHelp](#ErrHelp)
    * [var Usage](#Usage)
    * [var errParse](#errParse)
    * [var errRange](#errRange)
* [Types](#type)
    * [type ErrorHandling int](#ErrorHandling)
    * [type Flag struct](#Flag)
        * [func Lookup(name string) *Flag](#Lookup)
    * [type FlagSet struct](#FlagSet)
        * [func NewFlagSet(name string, errorHandling ErrorHandling) *FlagSet](#NewFlagSet)
        * [func (f *FlagSet) Arg(i int) string](#FlagSet.Arg)
        * [func (f *FlagSet) Args() []string](#FlagSet.Args)
        * [func (f *FlagSet) Bool(name string, value bool, usage string) *bool](#FlagSet.Bool)
        * [func (f *FlagSet) BoolVar(p *bool, name string, value bool, usage string)](#FlagSet.BoolVar)
        * [func (f *FlagSet) Duration(name string, value time.Duration, usage string) *time.Duration](#FlagSet.Duration)
        * [func (f *FlagSet) DurationVar(p *time.Duration, name string, value time.Duration, usage string)](#FlagSet.DurationVar)
        * [func (f *FlagSet) ErrorHandling() ErrorHandling](#FlagSet.ErrorHandling)
        * [func (f *FlagSet) Float64(name string, value float64, usage string) *float64](#FlagSet.Float64)
        * [func (f *FlagSet) Float64Var(p *float64, name string, value float64, usage string)](#FlagSet.Float64Var)
        * [func (f *FlagSet) Func(name, usage string, fn func(string) error)](#FlagSet.Func)
        * [func (f *FlagSet) Init(name string, errorHandling ErrorHandling)](#FlagSet.Init)
        * [func (f *FlagSet) Int(name string, value int, usage string) *int](#FlagSet.Int)
        * [func (f *FlagSet) Int64(name string, value int64, usage string) *int64](#FlagSet.Int64)
        * [func (f *FlagSet) Int64Var(p *int64, name string, value int64, usage string)](#FlagSet.Int64Var)
        * [func (f *FlagSet) IntVar(p *int, name string, value int, usage string)](#FlagSet.IntVar)
        * [func (f *FlagSet) Lookup(name string) *Flag](#FlagSet.Lookup)
        * [func (f *FlagSet) NArg() int](#FlagSet.NArg)
        * [func (f *FlagSet) NFlag() int](#FlagSet.NFlag)
        * [func (f *FlagSet) Name() string](#FlagSet.Name)
        * [func (f *FlagSet) Output() io.Writer](#FlagSet.Output)
        * [func (f *FlagSet) Parse(arguments []string) error](#FlagSet.Parse)
        * [func (f *FlagSet) Parsed() bool](#FlagSet.Parsed)
        * [func (f *FlagSet) PrintDefaults()](#FlagSet.PrintDefaults)
        * [func (f *FlagSet) Set(name, value string) error](#FlagSet.Set)
        * [func (f *FlagSet) SetOutput(output io.Writer)](#FlagSet.SetOutput)
        * [func (f *FlagSet) String(name string, value string, usage string) *string](#FlagSet.String)
        * [func (f *FlagSet) StringVar(p *string, name string, value string, usage string)](#FlagSet.StringVar)
        * [func (f *FlagSet) Uint(name string, value uint, usage string) *uint](#FlagSet.Uint)
        * [func (f *FlagSet) Uint64(name string, value uint64, usage string) *uint64](#FlagSet.Uint64)
        * [func (f *FlagSet) Uint64Var(p *uint64, name string, value uint64, usage string)](#FlagSet.Uint64Var)
        * [func (f *FlagSet) UintVar(p *uint, name string, value uint, usage string)](#FlagSet.UintVar)
        * [func (f *FlagSet) Var(value Value, name string, usage string)](#FlagSet.Var)
        * [func (f *FlagSet) Visit(fn func(*Flag))](#FlagSet.Visit)
        * [func (f *FlagSet) VisitAll(fn func(*Flag))](#FlagSet.VisitAll)
        * [func (f *FlagSet) defaultUsage()](#FlagSet.defaultUsage)
        * [func (f *FlagSet) failf(format string, a ...interface{}) error](#FlagSet.failf)
        * [func (f *FlagSet) parseOne() (bool, error)](#FlagSet.parseOne)
        * [func (f *FlagSet) sprintf(format string, a ...interface{}) string](#FlagSet.sprintf)
        * [func (f *FlagSet) usage()](#FlagSet.usage)
    * [type Getter interface](#Getter)
    * [type Value interface](#Value)
    * [type boolFlag interface](#boolFlag)
    * [type boolValue bool](#boolValue)
        * [func newBoolValue(val bool, p *bool) *boolValue](#newBoolValue)
        * [func (b *boolValue) Get() interface{}](#boolValue.Get)
        * [func (b *boolValue) IsBoolFlag() bool](#boolValue.IsBoolFlag)
        * [func (b *boolValue) Set(s string) error](#boolValue.Set)
        * [func (b *boolValue) String() string](#boolValue.String)
    * [type durationValue time.Duration](#durationValue)
        * [func newDurationValue(val time.Duration, p *time.Duration) *durationValue](#newDurationValue)
        * [func (d *durationValue) Get() interface{}](#durationValue.Get)
        * [func (d *durationValue) Set(s string) error](#durationValue.Set)
        * [func (d *durationValue) String() string](#durationValue.String)
    * [type float64Value float64](#float64Value)
        * [func newFloat64Value(val float64, p *float64) *float64Value](#newFloat64Value)
        * [func (f *float64Value) Get() interface{}](#float64Value.Get)
        * [func (f *float64Value) Set(s string) error](#float64Value.Set)
        * [func (f *float64Value) String() string](#float64Value.String)
    * [type funcValue func(string) error](#funcValue)
        * [func (f funcValue) Set(s string) error](#funcValue.Set)
        * [func (f funcValue) String() string](#funcValue.String)
    * [type int64Value int64](#int64Value)
        * [func newInt64Value(val int64, p *int64) *int64Value](#newInt64Value)
        * [func (i *int64Value) Get() interface{}](#int64Value.Get)
        * [func (i *int64Value) Set(s string) error](#int64Value.Set)
        * [func (i *int64Value) String() string](#int64Value.String)
    * [type intValue int](#intValue)
        * [func newIntValue(val int, p *int) *intValue](#newIntValue)
        * [func (i *intValue) Get() interface{}](#intValue.Get)
        * [func (i *intValue) Set(s string) error](#intValue.Set)
        * [func (i *intValue) String() string](#intValue.String)
    * [type stringValue string](#stringValue)
        * [func newStringValue(val string, p *string) *stringValue](#newStringValue)
        * [func (s *stringValue) Get() interface{}](#stringValue.Get)
        * [func (s *stringValue) Set(val string) error](#stringValue.Set)
        * [func (s *stringValue) String() string](#stringValue.String)
    * [type uint64Value uint64](#uint64Value)
        * [func newUint64Value(val uint64, p *uint64) *uint64Value](#newUint64Value)
        * [func (i *uint64Value) Get() interface{}](#uint64Value.Get)
        * [func (i *uint64Value) Set(s string) error](#uint64Value.Set)
        * [func (i *uint64Value) String() string](#uint64Value.String)
    * [type uintValue uint](#uintValue)
        * [func newUintValue(val uint, p *uint) *uintValue](#newUintValue)
        * [func (i *uintValue) Get() interface{}](#uintValue.Get)
        * [func (i *uintValue) Set(s string) error](#uintValue.Set)
        * [func (i *uintValue) String() string](#uintValue.String)
* [Functions](#func)
    * [func Arg(i int) string](#Arg)
    * [func Args() []string](#Args)
    * [func Bool(name string, value bool, usage string) *bool](#Bool)
    * [func BoolVar(p *bool, name string, value bool, usage string)](#BoolVar)
    * [func Duration(name string, value time.Duration, usage string) *time.Duration](#Duration)
    * [func DurationVar(p *time.Duration, name string, value time.Duration, usage string)](#DurationVar)
    * [func Float64(name string, value float64, usage string) *float64](#Float64)
    * [func Float64Var(p *float64, name string, value float64, usage string)](#Float64Var)
    * [func Func(name, usage string, fn func(string) error)](#Func)
    * [func Int(name string, value int, usage string) *int](#Int)
    * [func Int64(name string, value int64, usage string) *int64](#Int64)
    * [func Int64Var(p *int64, name string, value int64, usage string)](#Int64Var)
    * [func IntVar(p *int, name string, value int, usage string)](#IntVar)
    * [func NArg() int](#NArg)
    * [func NFlag() int](#NFlag)
    * [func Parse()](#Parse)
    * [func Parsed() bool](#Parsed)
    * [func PrintDefaults()](#PrintDefaults)
    * [func ResetForTesting(usage func())](#ResetForTesting)
    * [func Set(name, value string) error](#Set)
    * [func String(name string, value string, usage string) *string](#String)
    * [func StringVar(p *string, name string, value string, usage string)](#StringVar)
    * [func Uint(name string, value uint, usage string) *uint](#Uint)
    * [func Uint64(name string, value uint64, usage string) *uint64](#Uint64)
    * [func Uint64Var(p *uint64, name string, value uint64, usage string)](#Uint64Var)
    * [func UintVar(p *uint, name string, value uint, usage string)](#UintVar)
    * [func UnquoteUsage(flag *Flag) (name string, usage string)](#UnquoteUsage)
    * [func Var(value Value, name string, usage string)](#Var)
    * [func Visit(fn func(*Flag))](#Visit)
    * [func VisitAll(fn func(*Flag))](#VisitAll)
    * [func commandLineUsage()](#commandLineUsage)
    * [func init()](#init.flag.go)
    * [func isZeroValue(flag *Flag, value string) bool](#isZeroValue)
    * [func numError(err error) error](#numError)
    * [func sortFlags(flags map[string]*Flag) []*Flag](#sortFlags)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="ContinueOnError" href="#ContinueOnError">const ContinueOnError</a>

```
searchKey: flag.ContinueOnError
tags: [constant number]
```

```Go
const ContinueOnError ErrorHandling = iota // Return a descriptive error.

```

These constants cause FlagSet.Parse to behave as described if the parse fails. 

### <a id="ExitOnError" href="#ExitOnError">const ExitOnError</a>

```
searchKey: flag.ExitOnError
tags: [constant number]
```

```Go
const ExitOnError // Call os.Exit(2) or for -h/-help Exit(0).

```

These constants cause FlagSet.Parse to behave as described if the parse fails. 

### <a id="PanicOnError" href="#PanicOnError">const PanicOnError</a>

```
searchKey: flag.PanicOnError
tags: [constant number]
```

```Go
const PanicOnError // Call panic with a descriptive error.

```

These constants cause FlagSet.Parse to behave as described if the parse fails. 

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="CommandLine" href="#CommandLine">var CommandLine</a>

```
searchKey: flag.CommandLine
tags: [variable struct]
```

```Go
var CommandLine = NewFlagSet(os.Args[0], ExitOnError)
```

CommandLine is the default set of command-line flags, parsed from os.Args. The top-level functions such as BoolVar, Arg, and so on are wrappers for the methods of CommandLine. 

### <a id="DefaultUsage" href="#DefaultUsage">var DefaultUsage</a>

```
searchKey: flag.DefaultUsage
tags: [variable function private]
```

```Go
var DefaultUsage = Usage
```

### <a id="ErrHelp" href="#ErrHelp">var ErrHelp</a>

```
searchKey: flag.ErrHelp
tags: [variable interface]
```

```Go
var ErrHelp = errors.New("flag: help requested")
```

ErrHelp is the error returned if the -help or -h flag is invoked but no such flag is defined. 

### <a id="Usage" href="#Usage">var Usage</a>

```
searchKey: flag.Usage
tags: [variable function]
```

```Go
var Usage = ...
```

Usage prints a usage message documenting all defined command-line flags to CommandLine's output, which by default is os.Stderr. It is called when an error occurs while parsing flags. The function is a variable that may be changed to point to a custom function. By default it prints a simple header and calls PrintDefaults; for details about the format of the output and how to control it, see the documentation for PrintDefaults. Custom usage functions may choose to exit the program; by default exiting happens anyway as the command line's error handling strategy is set to ExitOnError. 

### <a id="errParse" href="#errParse">var errParse</a>

```
searchKey: flag.errParse
tags: [variable interface private]
```

```Go
var errParse = errors.New("parse error")
```

errParse is returned by Set if a flag's value fails to parse, such as with an invalid integer for Int. It then gets wrapped through failf to provide more information. 

### <a id="errRange" href="#errRange">var errRange</a>

```
searchKey: flag.errRange
tags: [variable interface private]
```

```Go
var errRange = errors.New("value out of range")
```

errRange is returned by Set if a flag's value is out of range. It then gets wrapped through failf to provide more information. 

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="ErrorHandling" href="#ErrorHandling">type ErrorHandling int</a>

```
searchKey: flag.ErrorHandling
tags: [number]
```

```Go
type ErrorHandling int
```

ErrorHandling defines how FlagSet.Parse behaves if the parse fails. 

### <a id="Flag" href="#Flag">type Flag struct</a>

```
searchKey: flag.Flag
tags: [struct]
```

```Go
type Flag struct {
	Name     string // name as it appears on command line
	Usage    string // help message
	Value    Value  // value as set
	DefValue string // default value (as text); for usage message
}
```

A Flag represents the state of a flag. 

#### <a id="Lookup" href="#Lookup">func Lookup(name string) *Flag</a>

```
searchKey: flag.Lookup
tags: [method]
```

```Go
func Lookup(name string) *Flag
```

Lookup returns the Flag structure of the named command-line flag, returning nil if none exists. 

### <a id="FlagSet" href="#FlagSet">type FlagSet struct</a>

```
searchKey: flag.FlagSet
tags: [struct]
```

```Go
type FlagSet struct {
	// Usage is the function called when an error occurs while parsing flags.
	// The field is a function (not a method) that may be changed to point to
	// a custom error handler. What happens after Usage is called depends
	// on the ErrorHandling setting; for the command line, this defaults
	// to ExitOnError, which exits the program after calling Usage.
	Usage func()

	name          string
	parsed        bool
	actual        map[string]*Flag
	formal        map[string]*Flag
	args          []string // arguments after flags
	errorHandling ErrorHandling
	output        io.Writer // nil means stderr; use Output() accessor
}
```

A FlagSet represents a set of defined flags. The zero value of a FlagSet has no name and has ContinueOnError error handling. 

Flag names must be unique within a FlagSet. An attempt to define a flag whose name is already in use will cause a panic. 

#### <a id="NewFlagSet" href="#NewFlagSet">func NewFlagSet(name string, errorHandling ErrorHandling) *FlagSet</a>

```
searchKey: flag.NewFlagSet
tags: [method]
```

```Go
func NewFlagSet(name string, errorHandling ErrorHandling) *FlagSet
```

NewFlagSet returns a new, empty flag set with the specified name and error handling property. If the name is not empty, it will be printed in the default usage message and in error messages. 

#### <a id="FlagSet.Arg" href="#FlagSet.Arg">func (f *FlagSet) Arg(i int) string</a>

```
searchKey: flag.FlagSet.Arg
tags: [method]
```

```Go
func (f *FlagSet) Arg(i int) string
```

Arg returns the i'th argument. Arg(0) is the first remaining argument after flags have been processed. Arg returns an empty string if the requested element does not exist. 

#### <a id="FlagSet.Args" href="#FlagSet.Args">func (f *FlagSet) Args() []string</a>

```
searchKey: flag.FlagSet.Args
tags: [function]
```

```Go
func (f *FlagSet) Args() []string
```

Args returns the non-flag arguments. 

#### <a id="FlagSet.Bool" href="#FlagSet.Bool">func (f *FlagSet) Bool(name string, value bool, usage string) *bool</a>

```
searchKey: flag.FlagSet.Bool
tags: [method]
```

```Go
func (f *FlagSet) Bool(name string, value bool, usage string) *bool
```

Bool defines a bool flag with specified name, default value, and usage string. The return value is the address of a bool variable that stores the value of the flag. 

#### <a id="FlagSet.BoolVar" href="#FlagSet.BoolVar">func (f *FlagSet) BoolVar(p *bool, name string, value bool, usage string)</a>

```
searchKey: flag.FlagSet.BoolVar
tags: [method]
```

```Go
func (f *FlagSet) BoolVar(p *bool, name string, value bool, usage string)
```

BoolVar defines a bool flag with specified name, default value, and usage string. The argument p points to a bool variable in which to store the value of the flag. 

#### <a id="FlagSet.Duration" href="#FlagSet.Duration">func (f *FlagSet) Duration(name string, value time.Duration, usage string) *time.Duration</a>

```
searchKey: flag.FlagSet.Duration
tags: [method]
```

```Go
func (f *FlagSet) Duration(name string, value time.Duration, usage string) *time.Duration
```

Duration defines a time.Duration flag with specified name, default value, and usage string. The return value is the address of a time.Duration variable that stores the value of the flag. The flag accepts a value acceptable to time.ParseDuration. 

#### <a id="FlagSet.DurationVar" href="#FlagSet.DurationVar">func (f *FlagSet) DurationVar(p *time.Duration, name string, value time.Duration, usage string)</a>

```
searchKey: flag.FlagSet.DurationVar
tags: [method]
```

```Go
func (f *FlagSet) DurationVar(p *time.Duration, name string, value time.Duration, usage string)
```

DurationVar defines a time.Duration flag with specified name, default value, and usage string. The argument p points to a time.Duration variable in which to store the value of the flag. The flag accepts a value acceptable to time.ParseDuration. 

#### <a id="FlagSet.ErrorHandling" href="#FlagSet.ErrorHandling">func (f *FlagSet) ErrorHandling() ErrorHandling</a>

```
searchKey: flag.FlagSet.ErrorHandling
tags: [function]
```

```Go
func (f *FlagSet) ErrorHandling() ErrorHandling
```

ErrorHandling returns the error handling behavior of the flag set. 

#### <a id="FlagSet.Float64" href="#FlagSet.Float64">func (f *FlagSet) Float64(name string, value float64, usage string) *float64</a>

```
searchKey: flag.FlagSet.Float64
tags: [method]
```

```Go
func (f *FlagSet) Float64(name string, value float64, usage string) *float64
```

Float64 defines a float64 flag with specified name, default value, and usage string. The return value is the address of a float64 variable that stores the value of the flag. 

#### <a id="FlagSet.Float64Var" href="#FlagSet.Float64Var">func (f *FlagSet) Float64Var(p *float64, name string, value float64, usage string)</a>

```
searchKey: flag.FlagSet.Float64Var
tags: [method]
```

```Go
func (f *FlagSet) Float64Var(p *float64, name string, value float64, usage string)
```

Float64Var defines a float64 flag with specified name, default value, and usage string. The argument p points to a float64 variable in which to store the value of the flag. 

#### <a id="FlagSet.Func" href="#FlagSet.Func">func (f *FlagSet) Func(name, usage string, fn func(string) error)</a>

```
searchKey: flag.FlagSet.Func
tags: [method]
```

```Go
func (f *FlagSet) Func(name, usage string, fn func(string) error)
```

Func defines a flag with the specified name and usage string. Each time the flag is seen, fn is called with the value of the flag. If fn returns a non-nil error, it will be treated as a flag value parsing error. 

#### <a id="FlagSet.Init" href="#FlagSet.Init">func (f *FlagSet) Init(name string, errorHandling ErrorHandling)</a>

```
searchKey: flag.FlagSet.Init
tags: [method]
```

```Go
func (f *FlagSet) Init(name string, errorHandling ErrorHandling)
```

Init sets the name and error handling property for a flag set. By default, the zero FlagSet uses an empty name and the ContinueOnError error handling policy. 

#### <a id="FlagSet.Int" href="#FlagSet.Int">func (f *FlagSet) Int(name string, value int, usage string) *int</a>

```
searchKey: flag.FlagSet.Int
tags: [method]
```

```Go
func (f *FlagSet) Int(name string, value int, usage string) *int
```

Int defines an int flag with specified name, default value, and usage string. The return value is the address of an int variable that stores the value of the flag. 

#### <a id="FlagSet.Int64" href="#FlagSet.Int64">func (f *FlagSet) Int64(name string, value int64, usage string) *int64</a>

```
searchKey: flag.FlagSet.Int64
tags: [method]
```

```Go
func (f *FlagSet) Int64(name string, value int64, usage string) *int64
```

Int64 defines an int64 flag with specified name, default value, and usage string. The return value is the address of an int64 variable that stores the value of the flag. 

#### <a id="FlagSet.Int64Var" href="#FlagSet.Int64Var">func (f *FlagSet) Int64Var(p *int64, name string, value int64, usage string)</a>

```
searchKey: flag.FlagSet.Int64Var
tags: [method]
```

```Go
func (f *FlagSet) Int64Var(p *int64, name string, value int64, usage string)
```

Int64Var defines an int64 flag with specified name, default value, and usage string. The argument p points to an int64 variable in which to store the value of the flag. 

#### <a id="FlagSet.IntVar" href="#FlagSet.IntVar">func (f *FlagSet) IntVar(p *int, name string, value int, usage string)</a>

```
searchKey: flag.FlagSet.IntVar
tags: [method]
```

```Go
func (f *FlagSet) IntVar(p *int, name string, value int, usage string)
```

IntVar defines an int flag with specified name, default value, and usage string. The argument p points to an int variable in which to store the value of the flag. 

#### <a id="FlagSet.Lookup" href="#FlagSet.Lookup">func (f *FlagSet) Lookup(name string) *Flag</a>

```
searchKey: flag.FlagSet.Lookup
tags: [method]
```

```Go
func (f *FlagSet) Lookup(name string) *Flag
```

Lookup returns the Flag structure of the named flag, returning nil if none exists. 

#### <a id="FlagSet.NArg" href="#FlagSet.NArg">func (f *FlagSet) NArg() int</a>

```
searchKey: flag.FlagSet.NArg
tags: [function]
```

```Go
func (f *FlagSet) NArg() int
```

NArg is the number of arguments remaining after flags have been processed. 

#### <a id="FlagSet.NFlag" href="#FlagSet.NFlag">func (f *FlagSet) NFlag() int</a>

```
searchKey: flag.FlagSet.NFlag
tags: [function]
```

```Go
func (f *FlagSet) NFlag() int
```

NFlag returns the number of flags that have been set. 

#### <a id="FlagSet.Name" href="#FlagSet.Name">func (f *FlagSet) Name() string</a>

```
searchKey: flag.FlagSet.Name
tags: [function]
```

```Go
func (f *FlagSet) Name() string
```

Name returns the name of the flag set. 

#### <a id="FlagSet.Output" href="#FlagSet.Output">func (f *FlagSet) Output() io.Writer</a>

```
searchKey: flag.FlagSet.Output
tags: [function]
```

```Go
func (f *FlagSet) Output() io.Writer
```

Output returns the destination for usage and error messages. os.Stderr is returned if output was not set or was set to nil. 

#### <a id="FlagSet.Parse" href="#FlagSet.Parse">func (f *FlagSet) Parse(arguments []string) error</a>

```
searchKey: flag.FlagSet.Parse
tags: [method]
```

```Go
func (f *FlagSet) Parse(arguments []string) error
```

Parse parses flag definitions from the argument list, which should not include the command name. Must be called after all flags in the FlagSet are defined and before flags are accessed by the program. The return value will be ErrHelp if -help or -h were set but not defined. 

#### <a id="FlagSet.Parsed" href="#FlagSet.Parsed">func (f *FlagSet) Parsed() bool</a>

```
searchKey: flag.FlagSet.Parsed
tags: [function]
```

```Go
func (f *FlagSet) Parsed() bool
```

Parsed reports whether f.Parse has been called. 

#### <a id="FlagSet.PrintDefaults" href="#FlagSet.PrintDefaults">func (f *FlagSet) PrintDefaults()</a>

```
searchKey: flag.FlagSet.PrintDefaults
tags: [function]
```

```Go
func (f *FlagSet) PrintDefaults()
```

PrintDefaults prints, to standard error unless configured otherwise, the default values of all defined command-line flags in the set. See the documentation for the global function PrintDefaults for more information. 

#### <a id="FlagSet.Set" href="#FlagSet.Set">func (f *FlagSet) Set(name, value string) error</a>

```
searchKey: flag.FlagSet.Set
tags: [method]
```

```Go
func (f *FlagSet) Set(name, value string) error
```

Set sets the value of the named flag. 

#### <a id="FlagSet.SetOutput" href="#FlagSet.SetOutput">func (f *FlagSet) SetOutput(output io.Writer)</a>

```
searchKey: flag.FlagSet.SetOutput
tags: [method]
```

```Go
func (f *FlagSet) SetOutput(output io.Writer)
```

SetOutput sets the destination for usage and error messages. If output is nil, os.Stderr is used. 

#### <a id="FlagSet.String" href="#FlagSet.String">func (f *FlagSet) String(name string, value string, usage string) *string</a>

```
searchKey: flag.FlagSet.String
tags: [method]
```

```Go
func (f *FlagSet) String(name string, value string, usage string) *string
```

String defines a string flag with specified name, default value, and usage string. The return value is the address of a string variable that stores the value of the flag. 

#### <a id="FlagSet.StringVar" href="#FlagSet.StringVar">func (f *FlagSet) StringVar(p *string, name string, value string, usage string)</a>

```
searchKey: flag.FlagSet.StringVar
tags: [method]
```

```Go
func (f *FlagSet) StringVar(p *string, name string, value string, usage string)
```

StringVar defines a string flag with specified name, default value, and usage string. The argument p points to a string variable in which to store the value of the flag. 

#### <a id="FlagSet.Uint" href="#FlagSet.Uint">func (f *FlagSet) Uint(name string, value uint, usage string) *uint</a>

```
searchKey: flag.FlagSet.Uint
tags: [method]
```

```Go
func (f *FlagSet) Uint(name string, value uint, usage string) *uint
```

Uint defines a uint flag with specified name, default value, and usage string. The return value is the address of a uint variable that stores the value of the flag. 

#### <a id="FlagSet.Uint64" href="#FlagSet.Uint64">func (f *FlagSet) Uint64(name string, value uint64, usage string) *uint64</a>

```
searchKey: flag.FlagSet.Uint64
tags: [method]
```

```Go
func (f *FlagSet) Uint64(name string, value uint64, usage string) *uint64
```

Uint64 defines a uint64 flag with specified name, default value, and usage string. The return value is the address of a uint64 variable that stores the value of the flag. 

#### <a id="FlagSet.Uint64Var" href="#FlagSet.Uint64Var">func (f *FlagSet) Uint64Var(p *uint64, name string, value uint64, usage string)</a>

```
searchKey: flag.FlagSet.Uint64Var
tags: [method]
```

```Go
func (f *FlagSet) Uint64Var(p *uint64, name string, value uint64, usage string)
```

Uint64Var defines a uint64 flag with specified name, default value, and usage string. The argument p points to a uint64 variable in which to store the value of the flag. 

#### <a id="FlagSet.UintVar" href="#FlagSet.UintVar">func (f *FlagSet) UintVar(p *uint, name string, value uint, usage string)</a>

```
searchKey: flag.FlagSet.UintVar
tags: [method]
```

```Go
func (f *FlagSet) UintVar(p *uint, name string, value uint, usage string)
```

UintVar defines a uint flag with specified name, default value, and usage string. The argument p points to a uint variable in which to store the value of the flag. 

#### <a id="FlagSet.Var" href="#FlagSet.Var">func (f *FlagSet) Var(value Value, name string, usage string)</a>

```
searchKey: flag.FlagSet.Var
tags: [method]
```

```Go
func (f *FlagSet) Var(value Value, name string, usage string)
```

Var defines a flag with the specified name and usage string. The type and value of the flag are represented by the first argument, of type Value, which typically holds a user-defined implementation of Value. For instance, the caller could create a flag that turns a comma-separated string into a slice of strings by giving the slice the methods of Value; in particular, Set would decompose the comma-separated string into the slice. 

#### <a id="FlagSet.Visit" href="#FlagSet.Visit">func (f *FlagSet) Visit(fn func(*Flag))</a>

```
searchKey: flag.FlagSet.Visit
tags: [method]
```

```Go
func (f *FlagSet) Visit(fn func(*Flag))
```

Visit visits the flags in lexicographical order, calling fn for each. It visits only those flags that have been set. 

#### <a id="FlagSet.VisitAll" href="#FlagSet.VisitAll">func (f *FlagSet) VisitAll(fn func(*Flag))</a>

```
searchKey: flag.FlagSet.VisitAll
tags: [method]
```

```Go
func (f *FlagSet) VisitAll(fn func(*Flag))
```

VisitAll visits the flags in lexicographical order, calling fn for each. It visits all flags, even those not set. 

#### <a id="FlagSet.defaultUsage" href="#FlagSet.defaultUsage">func (f *FlagSet) defaultUsage()</a>

```
searchKey: flag.FlagSet.defaultUsage
tags: [function private]
```

```Go
func (f *FlagSet) defaultUsage()
```

defaultUsage is the default function to print a usage message. 

#### <a id="FlagSet.failf" href="#FlagSet.failf">func (f *FlagSet) failf(format string, a ...interface{}) error</a>

```
searchKey: flag.FlagSet.failf
tags: [method private]
```

```Go
func (f *FlagSet) failf(format string, a ...interface{}) error
```

failf prints to standard error a formatted error and usage message and returns the error. 

#### <a id="FlagSet.parseOne" href="#FlagSet.parseOne">func (f *FlagSet) parseOne() (bool, error)</a>

```
searchKey: flag.FlagSet.parseOne
tags: [function private]
```

```Go
func (f *FlagSet) parseOne() (bool, error)
```

parseOne parses one flag. It reports whether a flag was seen. 

#### <a id="FlagSet.sprintf" href="#FlagSet.sprintf">func (f *FlagSet) sprintf(format string, a ...interface{}) string</a>

```
searchKey: flag.FlagSet.sprintf
tags: [method private]
```

```Go
func (f *FlagSet) sprintf(format string, a ...interface{}) string
```

sprintf formats the message, prints it to output, and returns it. 

#### <a id="FlagSet.usage" href="#FlagSet.usage">func (f *FlagSet) usage()</a>

```
searchKey: flag.FlagSet.usage
tags: [function private]
```

```Go
func (f *FlagSet) usage()
```

usage calls the Usage method for the flag set if one is specified, or the appropriate default usage function otherwise. 

### <a id="Getter" href="#Getter">type Getter interface</a>

```
searchKey: flag.Getter
tags: [interface]
```

```Go
type Getter interface {
	Value
	Get() interface{}
}
```

Getter is an interface that allows the contents of a Value to be retrieved. It wraps the Value interface, rather than being part of it, because it appeared after Go 1 and its compatibility rules. All Value types provided by this package satisfy the Getter interface, except the type used by Func. 

### <a id="Value" href="#Value">type Value interface</a>

```
searchKey: flag.Value
tags: [interface]
```

```Go
type Value interface {
	String() string
	Set(string) error
}
```

Value is the interface to the dynamic value stored in a flag. (The default value is represented as a string.) 

If a Value has an IsBoolFlag() bool method returning true, the command-line parser makes -name equivalent to -name=true rather than using the next command-line argument. 

Set is called once, in command line order, for each flag present. The flag package may call the String method with a zero-valued receiver, such as a nil pointer. 

### <a id="boolFlag" href="#boolFlag">type boolFlag interface</a>

```
searchKey: flag.boolFlag
tags: [interface private]
```

```Go
type boolFlag interface {
	Value
	IsBoolFlag() bool
}
```

optional interface to indicate boolean flags that can be supplied without "=value" text 

### <a id="boolValue" href="#boolValue">type boolValue bool</a>

```
searchKey: flag.boolValue
tags: [boolean private]
```

```Go
type boolValue bool
```

-- bool Value 

#### <a id="newBoolValue" href="#newBoolValue">func newBoolValue(val bool, p *bool) *boolValue</a>

```
searchKey: flag.newBoolValue
tags: [method private]
```

```Go
func newBoolValue(val bool, p *bool) *boolValue
```

#### <a id="boolValue.Get" href="#boolValue.Get">func (b *boolValue) Get() interface{}</a>

```
searchKey: flag.boolValue.Get
tags: [function private]
```

```Go
func (b *boolValue) Get() interface{}
```

#### <a id="boolValue.IsBoolFlag" href="#boolValue.IsBoolFlag">func (b *boolValue) IsBoolFlag() bool</a>

```
searchKey: flag.boolValue.IsBoolFlag
tags: [function private]
```

```Go
func (b *boolValue) IsBoolFlag() bool
```

#### <a id="boolValue.Set" href="#boolValue.Set">func (b *boolValue) Set(s string) error</a>

```
searchKey: flag.boolValue.Set
tags: [method private]
```

```Go
func (b *boolValue) Set(s string) error
```

#### <a id="boolValue.String" href="#boolValue.String">func (b *boolValue) String() string</a>

```
searchKey: flag.boolValue.String
tags: [function private]
```

```Go
func (b *boolValue) String() string
```

### <a id="durationValue" href="#durationValue">type durationValue time.Duration</a>

```
searchKey: flag.durationValue
tags: [number private]
```

```Go
type durationValue time.Duration
```

-- time.Duration Value 

#### <a id="newDurationValue" href="#newDurationValue">func newDurationValue(val time.Duration, p *time.Duration) *durationValue</a>

```
searchKey: flag.newDurationValue
tags: [method private]
```

```Go
func newDurationValue(val time.Duration, p *time.Duration) *durationValue
```

#### <a id="durationValue.Get" href="#durationValue.Get">func (d *durationValue) Get() interface{}</a>

```
searchKey: flag.durationValue.Get
tags: [function private]
```

```Go
func (d *durationValue) Get() interface{}
```

#### <a id="durationValue.Set" href="#durationValue.Set">func (d *durationValue) Set(s string) error</a>

```
searchKey: flag.durationValue.Set
tags: [method private]
```

```Go
func (d *durationValue) Set(s string) error
```

#### <a id="durationValue.String" href="#durationValue.String">func (d *durationValue) String() string</a>

```
searchKey: flag.durationValue.String
tags: [function private]
```

```Go
func (d *durationValue) String() string
```

### <a id="float64Value" href="#float64Value">type float64Value float64</a>

```
searchKey: flag.float64Value
tags: [number private]
```

```Go
type float64Value float64
```

-- float64 Value 

#### <a id="newFloat64Value" href="#newFloat64Value">func newFloat64Value(val float64, p *float64) *float64Value</a>

```
searchKey: flag.newFloat64Value
tags: [method private]
```

```Go
func newFloat64Value(val float64, p *float64) *float64Value
```

#### <a id="float64Value.Get" href="#float64Value.Get">func (f *float64Value) Get() interface{}</a>

```
searchKey: flag.float64Value.Get
tags: [function private]
```

```Go
func (f *float64Value) Get() interface{}
```

#### <a id="float64Value.Set" href="#float64Value.Set">func (f *float64Value) Set(s string) error</a>

```
searchKey: flag.float64Value.Set
tags: [method private]
```

```Go
func (f *float64Value) Set(s string) error
```

#### <a id="float64Value.String" href="#float64Value.String">func (f *float64Value) String() string</a>

```
searchKey: flag.float64Value.String
tags: [function private]
```

```Go
func (f *float64Value) String() string
```

### <a id="funcValue" href="#funcValue">type funcValue func(string) error</a>

```
searchKey: flag.funcValue
tags: [function private]
```

```Go
type funcValue func(string) error
```

#### <a id="funcValue.Set" href="#funcValue.Set">func (f funcValue) Set(s string) error</a>

```
searchKey: flag.funcValue.Set
tags: [method private]
```

```Go
func (f funcValue) Set(s string) error
```

#### <a id="funcValue.String" href="#funcValue.String">func (f funcValue) String() string</a>

```
searchKey: flag.funcValue.String
tags: [function private]
```

```Go
func (f funcValue) String() string
```

### <a id="int64Value" href="#int64Value">type int64Value int64</a>

```
searchKey: flag.int64Value
tags: [number private]
```

```Go
type int64Value int64
```

-- int64 Value 

#### <a id="newInt64Value" href="#newInt64Value">func newInt64Value(val int64, p *int64) *int64Value</a>

```
searchKey: flag.newInt64Value
tags: [method private]
```

```Go
func newInt64Value(val int64, p *int64) *int64Value
```

#### <a id="int64Value.Get" href="#int64Value.Get">func (i *int64Value) Get() interface{}</a>

```
searchKey: flag.int64Value.Get
tags: [function private]
```

```Go
func (i *int64Value) Get() interface{}
```

#### <a id="int64Value.Set" href="#int64Value.Set">func (i *int64Value) Set(s string) error</a>

```
searchKey: flag.int64Value.Set
tags: [method private]
```

```Go
func (i *int64Value) Set(s string) error
```

#### <a id="int64Value.String" href="#int64Value.String">func (i *int64Value) String() string</a>

```
searchKey: flag.int64Value.String
tags: [function private]
```

```Go
func (i *int64Value) String() string
```

### <a id="intValue" href="#intValue">type intValue int</a>

```
searchKey: flag.intValue
tags: [number private]
```

```Go
type intValue int
```

-- int Value 

#### <a id="newIntValue" href="#newIntValue">func newIntValue(val int, p *int) *intValue</a>

```
searchKey: flag.newIntValue
tags: [method private]
```

```Go
func newIntValue(val int, p *int) *intValue
```

#### <a id="intValue.Get" href="#intValue.Get">func (i *intValue) Get() interface{}</a>

```
searchKey: flag.intValue.Get
tags: [function private]
```

```Go
func (i *intValue) Get() interface{}
```

#### <a id="intValue.Set" href="#intValue.Set">func (i *intValue) Set(s string) error</a>

```
searchKey: flag.intValue.Set
tags: [method private]
```

```Go
func (i *intValue) Set(s string) error
```

#### <a id="intValue.String" href="#intValue.String">func (i *intValue) String() string</a>

```
searchKey: flag.intValue.String
tags: [function private]
```

```Go
func (i *intValue) String() string
```

### <a id="stringValue" href="#stringValue">type stringValue string</a>

```
searchKey: flag.stringValue
tags: [string private]
```

```Go
type stringValue string
```

-- string Value 

#### <a id="newStringValue" href="#newStringValue">func newStringValue(val string, p *string) *stringValue</a>

```
searchKey: flag.newStringValue
tags: [method private]
```

```Go
func newStringValue(val string, p *string) *stringValue
```

#### <a id="stringValue.Get" href="#stringValue.Get">func (s *stringValue) Get() interface{}</a>

```
searchKey: flag.stringValue.Get
tags: [function private]
```

```Go
func (s *stringValue) Get() interface{}
```

#### <a id="stringValue.Set" href="#stringValue.Set">func (s *stringValue) Set(val string) error</a>

```
searchKey: flag.stringValue.Set
tags: [method private]
```

```Go
func (s *stringValue) Set(val string) error
```

#### <a id="stringValue.String" href="#stringValue.String">func (s *stringValue) String() string</a>

```
searchKey: flag.stringValue.String
tags: [function private]
```

```Go
func (s *stringValue) String() string
```

### <a id="uint64Value" href="#uint64Value">type uint64Value uint64</a>

```
searchKey: flag.uint64Value
tags: [number private]
```

```Go
type uint64Value uint64
```

-- uint64 Value 

#### <a id="newUint64Value" href="#newUint64Value">func newUint64Value(val uint64, p *uint64) *uint64Value</a>

```
searchKey: flag.newUint64Value
tags: [method private]
```

```Go
func newUint64Value(val uint64, p *uint64) *uint64Value
```

#### <a id="uint64Value.Get" href="#uint64Value.Get">func (i *uint64Value) Get() interface{}</a>

```
searchKey: flag.uint64Value.Get
tags: [function private]
```

```Go
func (i *uint64Value) Get() interface{}
```

#### <a id="uint64Value.Set" href="#uint64Value.Set">func (i *uint64Value) Set(s string) error</a>

```
searchKey: flag.uint64Value.Set
tags: [method private]
```

```Go
func (i *uint64Value) Set(s string) error
```

#### <a id="uint64Value.String" href="#uint64Value.String">func (i *uint64Value) String() string</a>

```
searchKey: flag.uint64Value.String
tags: [function private]
```

```Go
func (i *uint64Value) String() string
```

### <a id="uintValue" href="#uintValue">type uintValue uint</a>

```
searchKey: flag.uintValue
tags: [number private]
```

```Go
type uintValue uint
```

-- uint Value 

#### <a id="newUintValue" href="#newUintValue">func newUintValue(val uint, p *uint) *uintValue</a>

```
searchKey: flag.newUintValue
tags: [method private]
```

```Go
func newUintValue(val uint, p *uint) *uintValue
```

#### <a id="uintValue.Get" href="#uintValue.Get">func (i *uintValue) Get() interface{}</a>

```
searchKey: flag.uintValue.Get
tags: [function private]
```

```Go
func (i *uintValue) Get() interface{}
```

#### <a id="uintValue.Set" href="#uintValue.Set">func (i *uintValue) Set(s string) error</a>

```
searchKey: flag.uintValue.Set
tags: [method private]
```

```Go
func (i *uintValue) Set(s string) error
```

#### <a id="uintValue.String" href="#uintValue.String">func (i *uintValue) String() string</a>

```
searchKey: flag.uintValue.String
tags: [function private]
```

```Go
func (i *uintValue) String() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="Arg" href="#Arg">func Arg(i int) string</a>

```
searchKey: flag.Arg
tags: [method]
```

```Go
func Arg(i int) string
```

Arg returns the i'th command-line argument. Arg(0) is the first remaining argument after flags have been processed. Arg returns an empty string if the requested element does not exist. 

### <a id="Args" href="#Args">func Args() []string</a>

```
searchKey: flag.Args
tags: [function]
```

```Go
func Args() []string
```

Args returns the non-flag command-line arguments. 

### <a id="Bool" href="#Bool">func Bool(name string, value bool, usage string) *bool</a>

```
searchKey: flag.Bool
tags: [method]
```

```Go
func Bool(name string, value bool, usage string) *bool
```

Bool defines a bool flag with specified name, default value, and usage string. The return value is the address of a bool variable that stores the value of the flag. 

### <a id="BoolVar" href="#BoolVar">func BoolVar(p *bool, name string, value bool, usage string)</a>

```
searchKey: flag.BoolVar
tags: [method]
```

```Go
func BoolVar(p *bool, name string, value bool, usage string)
```

BoolVar defines a bool flag with specified name, default value, and usage string. The argument p points to a bool variable in which to store the value of the flag. 

### <a id="Duration" href="#Duration">func Duration(name string, value time.Duration, usage string) *time.Duration</a>

```
searchKey: flag.Duration
tags: [method]
```

```Go
func Duration(name string, value time.Duration, usage string) *time.Duration
```

Duration defines a time.Duration flag with specified name, default value, and usage string. The return value is the address of a time.Duration variable that stores the value of the flag. The flag accepts a value acceptable to time.ParseDuration. 

### <a id="DurationVar" href="#DurationVar">func DurationVar(p *time.Duration, name string, value time.Duration, usage string)</a>

```
searchKey: flag.DurationVar
tags: [method]
```

```Go
func DurationVar(p *time.Duration, name string, value time.Duration, usage string)
```

DurationVar defines a time.Duration flag with specified name, default value, and usage string. The argument p points to a time.Duration variable in which to store the value of the flag. The flag accepts a value acceptable to time.ParseDuration. 

### <a id="Float64" href="#Float64">func Float64(name string, value float64, usage string) *float64</a>

```
searchKey: flag.Float64
tags: [method]
```

```Go
func Float64(name string, value float64, usage string) *float64
```

Float64 defines a float64 flag with specified name, default value, and usage string. The return value is the address of a float64 variable that stores the value of the flag. 

### <a id="Float64Var" href="#Float64Var">func Float64Var(p *float64, name string, value float64, usage string)</a>

```
searchKey: flag.Float64Var
tags: [method]
```

```Go
func Float64Var(p *float64, name string, value float64, usage string)
```

Float64Var defines a float64 flag with specified name, default value, and usage string. The argument p points to a float64 variable in which to store the value of the flag. 

### <a id="Func" href="#Func">func Func(name, usage string, fn func(string) error)</a>

```
searchKey: flag.Func
tags: [method]
```

```Go
func Func(name, usage string, fn func(string) error)
```

Func defines a flag with the specified name and usage string. Each time the flag is seen, fn is called with the value of the flag. If fn returns a non-nil error, it will be treated as a flag value parsing error. 

### <a id="Int" href="#Int">func Int(name string, value int, usage string) *int</a>

```
searchKey: flag.Int
tags: [method]
```

```Go
func Int(name string, value int, usage string) *int
```

Int defines an int flag with specified name, default value, and usage string. The return value is the address of an int variable that stores the value of the flag. 

### <a id="Int64" href="#Int64">func Int64(name string, value int64, usage string) *int64</a>

```
searchKey: flag.Int64
tags: [method]
```

```Go
func Int64(name string, value int64, usage string) *int64
```

Int64 defines an int64 flag with specified name, default value, and usage string. The return value is the address of an int64 variable that stores the value of the flag. 

### <a id="Int64Var" href="#Int64Var">func Int64Var(p *int64, name string, value int64, usage string)</a>

```
searchKey: flag.Int64Var
tags: [method]
```

```Go
func Int64Var(p *int64, name string, value int64, usage string)
```

Int64Var defines an int64 flag with specified name, default value, and usage string. The argument p points to an int64 variable in which to store the value of the flag. 

### <a id="IntVar" href="#IntVar">func IntVar(p *int, name string, value int, usage string)</a>

```
searchKey: flag.IntVar
tags: [method]
```

```Go
func IntVar(p *int, name string, value int, usage string)
```

IntVar defines an int flag with specified name, default value, and usage string. The argument p points to an int variable in which to store the value of the flag. 

### <a id="NArg" href="#NArg">func NArg() int</a>

```
searchKey: flag.NArg
tags: [function]
```

```Go
func NArg() int
```

NArg is the number of arguments remaining after flags have been processed. 

### <a id="NFlag" href="#NFlag">func NFlag() int</a>

```
searchKey: flag.NFlag
tags: [function]
```

```Go
func NFlag() int
```

NFlag returns the number of command-line flags that have been set. 

### <a id="Parse" href="#Parse">func Parse()</a>

```
searchKey: flag.Parse
tags: [function]
```

```Go
func Parse()
```

Parse parses the command-line flags from os.Args[1:]. Must be called after all flags are defined and before flags are accessed by the program. 

### <a id="Parsed" href="#Parsed">func Parsed() bool</a>

```
searchKey: flag.Parsed
tags: [function]
```

```Go
func Parsed() bool
```

Parsed reports whether the command-line flags have been parsed. 

### <a id="PrintDefaults" href="#PrintDefaults">func PrintDefaults()</a>

```
searchKey: flag.PrintDefaults
tags: [function]
```

```Go
func PrintDefaults()
```

PrintDefaults prints, to standard error unless configured otherwise, a usage message showing the default settings of all defined command-line flags. For an integer valued flag x, the default output has the form 

```
-x int
	usage-message-for-x (default 7)

```
The usage message will appear on a separate line for anything but a bool flag with a one-byte name. For bool flags, the type is omitted and if the flag name is one byte the usage message appears on the same line. The parenthetical default is omitted if the default is the zero value for the type. The listed type, here int, can be changed by placing a back-quoted name in the flag's usage string; the first such item in the message is taken to be a parameter name to show in the message and the back quotes are stripped from the message when displayed. For instance, given 

```
flag.String("I", "", "search `directory` for include files")

```
the output will be 

```
-I directory
	search directory for include files.

```
To change the destination for flag messages, call CommandLine.SetOutput. 

### <a id="ResetForTesting" href="#ResetForTesting">func ResetForTesting(usage func())</a>

```
searchKey: flag.ResetForTesting
tags: [method private]
```

```Go
func ResetForTesting(usage func())
```

ResetForTesting clears all flag state and sets the usage function as directed. After calling ResetForTesting, parse errors in flag handling will not exit the program. 

### <a id="Set" href="#Set">func Set(name, value string) error</a>

```
searchKey: flag.Set
tags: [method]
```

```Go
func Set(name, value string) error
```

Set sets the value of the named command-line flag. 

### <a id="String" href="#String">func String(name string, value string, usage string) *string</a>

```
searchKey: flag.String
tags: [method]
```

```Go
func String(name string, value string, usage string) *string
```

String defines a string flag with specified name, default value, and usage string. The return value is the address of a string variable that stores the value of the flag. 

### <a id="StringVar" href="#StringVar">func StringVar(p *string, name string, value string, usage string)</a>

```
searchKey: flag.StringVar
tags: [method]
```

```Go
func StringVar(p *string, name string, value string, usage string)
```

StringVar defines a string flag with specified name, default value, and usage string. The argument p points to a string variable in which to store the value of the flag. 

### <a id="Uint" href="#Uint">func Uint(name string, value uint, usage string) *uint</a>

```
searchKey: flag.Uint
tags: [method]
```

```Go
func Uint(name string, value uint, usage string) *uint
```

Uint defines a uint flag with specified name, default value, and usage string. The return value is the address of a uint variable that stores the value of the flag. 

### <a id="Uint64" href="#Uint64">func Uint64(name string, value uint64, usage string) *uint64</a>

```
searchKey: flag.Uint64
tags: [method]
```

```Go
func Uint64(name string, value uint64, usage string) *uint64
```

Uint64 defines a uint64 flag with specified name, default value, and usage string. The return value is the address of a uint64 variable that stores the value of the flag. 

### <a id="Uint64Var" href="#Uint64Var">func Uint64Var(p *uint64, name string, value uint64, usage string)</a>

```
searchKey: flag.Uint64Var
tags: [method]
```

```Go
func Uint64Var(p *uint64, name string, value uint64, usage string)
```

Uint64Var defines a uint64 flag with specified name, default value, and usage string. The argument p points to a uint64 variable in which to store the value of the flag. 

### <a id="UintVar" href="#UintVar">func UintVar(p *uint, name string, value uint, usage string)</a>

```
searchKey: flag.UintVar
tags: [method]
```

```Go
func UintVar(p *uint, name string, value uint, usage string)
```

UintVar defines a uint flag with specified name, default value, and usage string. The argument p points to a uint variable in which to store the value of the flag. 

### <a id="UnquoteUsage" href="#UnquoteUsage">func UnquoteUsage(flag *Flag) (name string, usage string)</a>

```
searchKey: flag.UnquoteUsage
tags: [method]
```

```Go
func UnquoteUsage(flag *Flag) (name string, usage string)
```

UnquoteUsage extracts a back-quoted name from the usage string for a flag and returns it and the un-quoted usage. Given "a `name` to show" it returns ("name", "a name to show"). If there are no back quotes, the name is an educated guess of the type of the flag's value, or the empty string if the flag is boolean. 

### <a id="Var" href="#Var">func Var(value Value, name string, usage string)</a>

```
searchKey: flag.Var
tags: [method]
```

```Go
func Var(value Value, name string, usage string)
```

Var defines a flag with the specified name and usage string. The type and value of the flag are represented by the first argument, of type Value, which typically holds a user-defined implementation of Value. For instance, the caller could create a flag that turns a comma-separated string into a slice of strings by giving the slice the methods of Value; in particular, Set would decompose the comma-separated string into the slice. 

### <a id="Visit" href="#Visit">func Visit(fn func(*Flag))</a>

```
searchKey: flag.Visit
tags: [method]
```

```Go
func Visit(fn func(*Flag))
```

Visit visits the command-line flags in lexicographical order, calling fn for each. It visits only those flags that have been set. 

### <a id="VisitAll" href="#VisitAll">func VisitAll(fn func(*Flag))</a>

```
searchKey: flag.VisitAll
tags: [method]
```

```Go
func VisitAll(fn func(*Flag))
```

VisitAll visits the command-line flags in lexicographical order, calling fn for each. It visits all flags, even those not set. 

### <a id="commandLineUsage" href="#commandLineUsage">func commandLineUsage()</a>

```
searchKey: flag.commandLineUsage
tags: [function private]
```

```Go
func commandLineUsage()
```

### <a id="init.flag.go" href="#init.flag.go">func init()</a>

```
searchKey: flag.init
tags: [function private]
```

```Go
func init()
```

### <a id="isZeroValue" href="#isZeroValue">func isZeroValue(flag *Flag, value string) bool</a>

```
searchKey: flag.isZeroValue
tags: [method private]
```

```Go
func isZeroValue(flag *Flag, value string) bool
```

isZeroValue determines whether the string represents the zero value for a flag. 

### <a id="numError" href="#numError">func numError(err error) error</a>

```
searchKey: flag.numError
tags: [method private]
```

```Go
func numError(err error) error
```

### <a id="sortFlags" href="#sortFlags">func sortFlags(flags map[string]*Flag) []*Flag</a>

```
searchKey: flag.sortFlags
tags: [method private]
```

```Go
func sortFlags(flags map[string]*Flag) []*Flag
```

sortFlags returns the flags as a slice in lexicographical sorted order. 

