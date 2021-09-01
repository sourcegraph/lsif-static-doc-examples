# Package env

## Index

* [Variables](#var)
    * [var CritOut](#CritOut)
    * [var DebugOut](#DebugOut)
    * [var ErrorOut](#ErrorOut)
    * [var InfoOut](#InfoOut)
    * [var InsecureDev](#InsecureDev)
    * [var LogFormat](#LogFormat)
    * [var LogLevel](#LogLevel)
    * [var MyName](#MyName)
    * [var WarnOut](#WarnOut)
    * [var env](#env)
    * [var envVarName](#envVarName)
    * [var environ](#environ)
    * [var locked](#locked)
* [Types](#type)
    * [type BaseConfig struct](#BaseConfig)
        * [func (c *BaseConfig) AddError(err error)](#BaseConfig.AddError)
        * [func (c *BaseConfig) Get(name, defaultValue, description string) string](#BaseConfig.Get)
        * [func (c *BaseConfig) GetBool(name, defaultValue, description string) bool](#BaseConfig.GetBool)
        * [func (c *BaseConfig) GetInt(name, defaultValue, description string) int](#BaseConfig.GetInt)
        * [func (c *BaseConfig) GetInterval(name, defaultValue, description string) time.Duration](#BaseConfig.GetInterval)
        * [func (c *BaseConfig) GetOptional(name, description string) string](#BaseConfig.GetOptional)
        * [func (c *BaseConfig) GetPercent(name, defaultValue, description string) int](#BaseConfig.GetPercent)
        * [func (c *BaseConfig) SetMockGetter(getter GetterFunc)](#BaseConfig.SetMockGetter)
        * [func (c *BaseConfig) Validate() error](#BaseConfig.Validate)
        * [func (c *BaseConfig) get(name, defaultValue, description string) string](#BaseConfig.get)
    * [type Config interface](#Config)
    * [type GetterFunc func(name string, defaultValue string, description string) string](#GetterFunc)
    * [type envflag struct](#envflag)
* [Functions](#func)
    * [func Ensure(name, defaultValue, description string) string](#Ensure)
    * [func Get(name, defaultValue, description string) string](#Get)
    * [func HandleHelpFlag()](#HandleHelpFlag)
    * [func Lock()](#Lock)
    * [func MustGetDuration(name string, defaultValue time.Duration, description string) time.Duration](#MustGetDuration)
    * [func MustGetInt(name string, defaultValue int, description string) int](#MustGetInt)
    * [func PrintHelp()](#PrintHelp)
    * [func TestEnvironMap(t *testing.T)](#TestEnvironMap)
    * [func TestLock(t *testing.T)](#TestLock)
    * [func environMap(environ []string) map[string]string](#environMap)
    * [func findName() (string, string)](#findName)
    * [func init()](#init.env.go)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="CritOut" href="#CritOut">var CritOut</a>

```
searchKey: env.CritOut
tags: [variable interface]
```

```Go
var CritOut io.Writer
```

CritOut is os.Stderr if LogLevel includes crit 

### <a id="DebugOut" href="#DebugOut">var DebugOut</a>

```
searchKey: env.DebugOut
tags: [variable interface]
```

```Go
var DebugOut io.Writer
```

DebugOut is os.Stderr if LogLevel includes dbug 

### <a id="ErrorOut" href="#ErrorOut">var ErrorOut</a>

```
searchKey: env.ErrorOut
tags: [variable interface]
```

```Go
var ErrorOut io.Writer
```

ErrorOut is os.Stderr if LogLevel includes error 

### <a id="InfoOut" href="#InfoOut">var InfoOut</a>

```
searchKey: env.InfoOut
tags: [variable interface]
```

```Go
var InfoOut io.Writer
```

InfoOut is os.Stderr if LogLevel includes info 

### <a id="InsecureDev" href="#InsecureDev">var InsecureDev</a>

```
searchKey: env.InsecureDev
tags: [variable boolean]
```

```Go
var InsecureDev, _ = ...
```

### <a id="LogFormat" href="#LogFormat">var LogFormat</a>

```
searchKey: env.LogFormat
tags: [variable string]
```

```Go
var LogFormat = Get("SRC_LOG_FORMAT", "logfmt", "log format (logfmt, condensed, json)")
```

### <a id="LogLevel" href="#LogLevel">var LogLevel</a>

```
searchKey: env.LogLevel
tags: [variable string]
```

```Go
var LogLevel = ...
```

### <a id="MyName" href="#MyName">var MyName</a>

```
searchKey: env.MyName
tags: [variable string]
```

```Go
var MyName, envVarName = findName()
```

MyName represents the name of the current process. 

### <a id="WarnOut" href="#WarnOut">var WarnOut</a>

```
searchKey: env.WarnOut
tags: [variable interface]
```

```Go
var WarnOut io.Writer
```

WarnOut is os.Stderr if LogLevel includes warn 

### <a id="env" href="#env">var env</a>

```
searchKey: env.env
tags: [variable array struct private]
```

```Go
var env []envflag
```

### <a id="envVarName" href="#envVarName">var envVarName</a>

```
searchKey: env.envVarName
tags: [variable string private]
```

```Go
var MyName, envVarName = findName()
```

MyName represents the name of the current process. 

### <a id="environ" href="#environ">var environ</a>

```
searchKey: env.environ
tags: [variable object private]
```

```Go
var environ map[string]string
```

### <a id="locked" href="#locked">var locked</a>

```
searchKey: env.locked
tags: [variable boolean private]
```

```Go
var locked = false
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="BaseConfig" href="#BaseConfig">type BaseConfig struct</a>

```
searchKey: env.BaseConfig
tags: [struct]
```

```Go
type BaseConfig struct {
	errs []error

	// getter is used to mock the environment in tests
	getter GetterFunc
}
```

BaseConfig is a base struct for configuration objects. The following is a minimal example of declaring, loading, and validating configuration from the environment. 

```
type Config struct {
    env.BaseConfig

    Name   string
    Weight int
    Age    time.Duration
}

func (c *Config) Load() {
    c.Name = c.Get("SRC_NAME", "test", "The service's name (wat).")
    c.Weight = c.GetInt("SRC_WEIGHT", "1m", "The service's weight (wat).")
    c.Age = c.GetInterval("SRC_AGE", "10s", "The service's age (wat).")
}

func applicationInit() {
    config := &Config{}
    config.Load()

    env.Lock()
    env.HandleHelpFlag()

    if err := config.Validate(); err != nil{
        // handle me
    }
}

```
#### <a id="BaseConfig.AddError" href="#BaseConfig.AddError">func (c *BaseConfig) AddError(err error)</a>

```
searchKey: env.BaseConfig.AddError
tags: [method]
```

```Go
func (c *BaseConfig) AddError(err error)
```

AddError adds a validation error to the configuration object. This should be called from within the Load method of a decorated configuration object to have any effect. 

#### <a id="BaseConfig.Get" href="#BaseConfig.Get">func (c *BaseConfig) Get(name, defaultValue, description string) string</a>

```
searchKey: env.BaseConfig.Get
tags: [method]
```

```Go
func (c *BaseConfig) Get(name, defaultValue, description string) string
```

Get returns the value with the given name. If no value was supplied in the environment, the given default is used in its place. If no value is available, an error is added to the validation errors list. 

#### <a id="BaseConfig.GetBool" href="#BaseConfig.GetBool">func (c *BaseConfig) GetBool(name, defaultValue, description string) bool</a>

```
searchKey: env.BaseConfig.GetBool
tags: [method]
```

```Go
func (c *BaseConfig) GetBool(name, defaultValue, description string) bool
```

GetBool returns the value with the given name interpreted as a boolean. If no value was supplied in the environment, the given default is used in its place. If no value is available, or if the given value or default cannot be converted to a boolean, an error is added to the validation errors list. 

#### <a id="BaseConfig.GetInt" href="#BaseConfig.GetInt">func (c *BaseConfig) GetInt(name, defaultValue, description string) int</a>

```
searchKey: env.BaseConfig.GetInt
tags: [method]
```

```Go
func (c *BaseConfig) GetInt(name, defaultValue, description string) int
```

GetInt returns the value with the given name interpreted as an integer. If no value was supplied in the environment, the given default is used in its place. If no value is available, or if the given value or default cannot be converted to an integer, an error is added to the validation errors list. 

#### <a id="BaseConfig.GetInterval" href="#BaseConfig.GetInterval">func (c *BaseConfig) GetInterval(name, defaultValue, description string) time.Duration</a>

```
searchKey: env.BaseConfig.GetInterval
tags: [method]
```

```Go
func (c *BaseConfig) GetInterval(name, defaultValue, description string) time.Duration
```

#### <a id="BaseConfig.GetOptional" href="#BaseConfig.GetOptional">func (c *BaseConfig) GetOptional(name, description string) string</a>

```
searchKey: env.BaseConfig.GetOptional
tags: [method]
```

```Go
func (c *BaseConfig) GetOptional(name, description string) string
```

GetOptional returns the value with the given name. 

#### <a id="BaseConfig.GetPercent" href="#BaseConfig.GetPercent">func (c *BaseConfig) GetPercent(name, defaultValue, description string) int</a>

```
searchKey: env.BaseConfig.GetPercent
tags: [method]
```

```Go
func (c *BaseConfig) GetPercent(name, defaultValue, description string) int
```

GetPercent returns the value with the given name interpreted as an integer between 0 and 100. If no value was supplied in the environment, the given default is used in its place. If no value is available, if the given value or default cannot be converted to an integer, or if the value is out of the expected range, an error is added to the validation errors list. 

#### <a id="BaseConfig.SetMockGetter" href="#BaseConfig.SetMockGetter">func (c *BaseConfig) SetMockGetter(getter GetterFunc)</a>

```
searchKey: env.BaseConfig.SetMockGetter
tags: [method]
```

```Go
func (c *BaseConfig) SetMockGetter(getter GetterFunc)
```

SetMockGetter sets mock to use in place of this packge's Get function. 

#### <a id="BaseConfig.Validate" href="#BaseConfig.Validate">func (c *BaseConfig) Validate() error</a>

```
searchKey: env.BaseConfig.Validate
tags: [method]
```

```Go
func (c *BaseConfig) Validate() error
```

Validate returns any errors constructed from a Get* method after the values have been loaded from the environment. 

#### <a id="BaseConfig.get" href="#BaseConfig.get">func (c *BaseConfig) get(name, defaultValue, description string) string</a>

```
searchKey: env.BaseConfig.get
tags: [method private]
```

```Go
func (c *BaseConfig) get(name, defaultValue, description string) string
```

### <a id="Config" href="#Config">type Config interface</a>

```
searchKey: env.Config
tags: [interface]
```

```Go
type Config interface {
	// Load is called prior to env.Lock an application startup. This method should
	// read the values from the environment and store errors to be reported later.
	Load()

	// Validate performs non-trivial validation and returns any resulting errors.
	// This method should also return errors that occurred while reading values from
	// the environment in Load. This method is called after the environment has been
	// locked, so all environment variable reads must happen in Load.
	Validate() error
}
```

### <a id="GetterFunc" href="#GetterFunc">type GetterFunc func(name string, defaultValue string, description string) string</a>

```
searchKey: env.GetterFunc
tags: [function]
```

```Go
type GetterFunc func(name, defaultValue, description string) string
```

### <a id="envflag" href="#envflag">type envflag struct</a>

```
searchKey: env.envflag
tags: [struct private]
```

```Go
type envflag struct {
	name        string
	description string
	value       string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Ensure" href="#Ensure">func Ensure(name, defaultValue, description string) string</a>

```
searchKey: env.Ensure
tags: [function]
```

```Go
func Ensure(name, defaultValue, description string) string
```

Ensure behaves like Get except that it sets the environment variable if it doesn't exist. 

### <a id="Get" href="#Get">func Get(name, defaultValue, description string) string</a>

```
searchKey: env.Get
tags: [function]
```

```Go
func Get(name, defaultValue, description string) string
```

Get returns the value of the given environment variable. It also registers the description for PrintHelp. Calling Get with the same name twice causes a panic. Get should only be called on package initialization. Calls at a later point will cause a panic if Lock was called before. 

This should be used for only *internal* environment values. User-visible configuration should be added to the Config struct in the github.com/sourcegraph/sourcegraph/config package. 

### <a id="HandleHelpFlag" href="#HandleHelpFlag">func HandleHelpFlag()</a>

```
searchKey: env.HandleHelpFlag
tags: [function]
```

```Go
func HandleHelpFlag()
```

HandleHelpFlag looks at the first CLI argument. If it is "help", "-h" or "--help", then it calls PrintHelp and exits. 

### <a id="Lock" href="#Lock">func Lock()</a>

```
searchKey: env.Lock
tags: [function]
```

```Go
func Lock()
```

Lock makes later calls to Get fail with a panic. Call this at the beginning of the main function. 

### <a id="MustGetDuration" href="#MustGetDuration">func MustGetDuration(name string, defaultValue time.Duration, description string) time.Duration</a>

```
searchKey: env.MustGetDuration
tags: [function]
```

```Go
func MustGetDuration(name string, defaultValue time.Duration, description string) time.Duration
```

MustGetDuration is similar to Get but ensures that the value is a valid time.Duration. 

### <a id="MustGetInt" href="#MustGetInt">func MustGetInt(name string, defaultValue int, description string) int</a>

```
searchKey: env.MustGetInt
tags: [function]
```

```Go
func MustGetInt(name string, defaultValue int, description string) int
```

MustGetInt is similar to Get but ensures that the value is a valid int. 

### <a id="PrintHelp" href="#PrintHelp">func PrintHelp()</a>

```
searchKey: env.PrintHelp
tags: [function]
```

```Go
func PrintHelp()
```

PrintHelp prints a list of all registered environment variables and their descriptions. 

### <a id="TestEnvironMap" href="#TestEnvironMap">func TestEnvironMap(t *testing.T)</a>

```
searchKey: env.TestEnvironMap
tags: [function private test]
```

```Go
func TestEnvironMap(t *testing.T)
```

### <a id="TestLock" href="#TestLock">func TestLock(t *testing.T)</a>

```
searchKey: env.TestLock
tags: [function private test]
```

```Go
func TestLock(t *testing.T)
```

### <a id="environMap" href="#environMap">func environMap(environ []string) map[string]string</a>

```
searchKey: env.environMap
tags: [function private]
```

```Go
func environMap(environ []string) map[string]string
```

### <a id="findName" href="#findName">func findName() (string, string)</a>

```
searchKey: env.findName
tags: [function private]
```

```Go
func findName() (string, string)
```

findName returns the name of the current process, that being the part of argv[0] after the last slash if any, and also the lowercase letters from that, suitable for use as a likely key for lookups in things like shell environment variables which can't contain hyphens. 

### <a id="init.env.go" href="#init.env.go">func init()</a>

```
searchKey: env.init
tags: [function private]
```

```Go
func init()
```

