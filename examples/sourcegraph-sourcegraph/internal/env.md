# Package env

## Index

* [Variables](#var)
    * [var env](#env)
    * [var environ](#environ)
    * [var locked](#locked)
    * [var MyName](#MyName)
    * [var envVarName](#envVarName)
    * [var LogLevel](#LogLevel)
    * [var LogFormat](#LogFormat)
    * [var InsecureDev](#InsecureDev)
    * [var DebugOut](#DebugOut)
    * [var InfoOut](#InfoOut)
    * [var WarnOut](#WarnOut)
    * [var ErrorOut](#ErrorOut)
    * [var CritOut](#CritOut)
* [Types](#type)
    * [type Config interface](#Config)
    * [type BaseConfig struct](#BaseConfig)
        * [func (c *BaseConfig) Validate() error](#BaseConfig.Validate)
        * [func (c *BaseConfig) Get(name, defaultValue, description string) string](#BaseConfig.Get)
        * [func (c *BaseConfig) GetOptional(name, description string) string](#BaseConfig.GetOptional)
        * [func (c *BaseConfig) GetInt(name, defaultValue, description string) int](#BaseConfig.GetInt)
        * [func (c *BaseConfig) GetPercent(name, defaultValue, description string) int](#BaseConfig.GetPercent)
        * [func (c *BaseConfig) GetInterval(name, defaultValue, description string) time.Duration](#BaseConfig.GetInterval)
        * [func (c *BaseConfig) GetBool(name, defaultValue, description string) bool](#BaseConfig.GetBool)
        * [func (c *BaseConfig) AddError(err error)](#BaseConfig.AddError)
        * [func (c *BaseConfig) get(name, defaultValue, description string) string](#BaseConfig.get)
        * [func (c *BaseConfig) SetMockGetter(getter GetterFunc)](#BaseConfig.SetMockGetter)
    * [type GetterFunc func(name string, defaultValue string, description string) string](#GetterFunc)
    * [type envflag struct](#envflag)
* [Functions](#func)
    * [func findName() (string, string)](#findName)
    * [func Ensure(name, defaultValue, description string) string](#Ensure)
    * [func init()](#init)
    * [func Get(name, defaultValue, description string) string](#Get)
    * [func MustGetDuration(name string, defaultValue time.Duration, description string) time.Duration](#MustGetDuration)
    * [func MustGetInt(name string, defaultValue int, description string) int](#MustGetInt)
    * [func environMap(environ []string) map[string]string](#environMap)
    * [func Lock()](#Lock)
    * [func PrintHelp()](#PrintHelp)
    * [func HandleHelpFlag()](#HandleHelpFlag)
    * [func TestEnvironMap(t *testing.T)](#TestEnvironMap)
    * [func TestLock(t *testing.T)](#TestLock)


## <a id="var" href="#var">Variables</a>

### <a id="env" href="#env">var env</a>

```
searchKey: env.env
```

```Go
var env []envflag
```

### <a id="environ" href="#environ">var environ</a>

```
searchKey: env.environ
```

```Go
var environ map[string]string
```

### <a id="locked" href="#locked">var locked</a>

```
searchKey: env.locked
```

```Go
var locked = false
```

### <a id="MyName" href="#MyName">var MyName</a>

```
searchKey: env.MyName
tags: [exported]
```

```Go
var MyName, envVarName = findName()
```

MyName represents the name of the current process. 

### <a id="envVarName" href="#envVarName">var envVarName</a>

```
searchKey: env.envVarName
```

```Go
var MyName, envVarName = findName()
```

MyName represents the name of the current process. 

### <a id="LogLevel" href="#LogLevel">var LogLevel</a>

```
searchKey: env.LogLevel
tags: [exported]
```

```Go
var LogLevel = ...
```

### <a id="LogFormat" href="#LogFormat">var LogFormat</a>

```
searchKey: env.LogFormat
tags: [exported]
```

```Go
var LogFormat = Get("SRC_LOG_FORMAT", "logfmt", "log format (logfmt, condensed, json)")
```

### <a id="InsecureDev" href="#InsecureDev">var InsecureDev</a>

```
searchKey: env.InsecureDev
tags: [exported]
```

```Go
var InsecureDev, _ = ...
```

### <a id="DebugOut" href="#DebugOut">var DebugOut</a>

```
searchKey: env.DebugOut
tags: [exported]
```

```Go
var DebugOut io.Writer
```

DebugOut is os.Stderr if LogLevel includes dbug 

### <a id="InfoOut" href="#InfoOut">var InfoOut</a>

```
searchKey: env.InfoOut
tags: [exported]
```

```Go
var InfoOut io.Writer
```

InfoOut is os.Stderr if LogLevel includes info 

### <a id="WarnOut" href="#WarnOut">var WarnOut</a>

```
searchKey: env.WarnOut
tags: [exported]
```

```Go
var WarnOut io.Writer
```

WarnOut is os.Stderr if LogLevel includes warn 

### <a id="ErrorOut" href="#ErrorOut">var ErrorOut</a>

```
searchKey: env.ErrorOut
tags: [exported]
```

```Go
var ErrorOut io.Writer
```

ErrorOut is os.Stderr if LogLevel includes error 

### <a id="CritOut" href="#CritOut">var CritOut</a>

```
searchKey: env.CritOut
tags: [exported]
```

```Go
var CritOut io.Writer
```

CritOut is os.Stderr if LogLevel includes crit 

## <a id="type" href="#type">Types</a>

### <a id="Config" href="#Config">type Config interface</a>

```
searchKey: env.Config
tags: [exported]
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

### <a id="BaseConfig" href="#BaseConfig">type BaseConfig struct</a>

```
searchKey: env.BaseConfig
tags: [exported]
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
#### <a id="BaseConfig.Validate" href="#BaseConfig.Validate">func (c *BaseConfig) Validate() error</a>

```
searchKey: env.BaseConfig.Validate
tags: [exported]
```

```Go
func (c *BaseConfig) Validate() error
```

Validate returns any errors constructed from a Get* method after the values have been loaded from the environment. 

#### <a id="BaseConfig.Get" href="#BaseConfig.Get">func (c *BaseConfig) Get(name, defaultValue, description string) string</a>

```
searchKey: env.BaseConfig.Get
tags: [exported]
```

```Go
func (c *BaseConfig) Get(name, defaultValue, description string) string
```

Get returns the value with the given name. If no value was supplied in the environment, the given default is used in its place. If no value is available, an error is added to the validation errors list. 

#### <a id="BaseConfig.GetOptional" href="#BaseConfig.GetOptional">func (c *BaseConfig) GetOptional(name, description string) string</a>

```
searchKey: env.BaseConfig.GetOptional
tags: [exported]
```

```Go
func (c *BaseConfig) GetOptional(name, description string) string
```

GetOptional returns the value with the given name. 

#### <a id="BaseConfig.GetInt" href="#BaseConfig.GetInt">func (c *BaseConfig) GetInt(name, defaultValue, description string) int</a>

```
searchKey: env.BaseConfig.GetInt
tags: [exported]
```

```Go
func (c *BaseConfig) GetInt(name, defaultValue, description string) int
```

GetInt returns the value with the given name interpreted as an integer. If no value was supplied in the environment, the given default is used in its place. If no value is available, or if the given value or default cannot be converted to an integer, an error is added to the validation errors list. 

#### <a id="BaseConfig.GetPercent" href="#BaseConfig.GetPercent">func (c *BaseConfig) GetPercent(name, defaultValue, description string) int</a>

```
searchKey: env.BaseConfig.GetPercent
tags: [exported]
```

```Go
func (c *BaseConfig) GetPercent(name, defaultValue, description string) int
```

GetPercent returns the value with the given name interpreted as an integer between 0 and 100. If no value was supplied in the environment, the given default is used in its place. If no value is available, if the given value or default cannot be converted to an integer, or if the value is out of the expected range, an error is added to the validation errors list. 

#### <a id="BaseConfig.GetInterval" href="#BaseConfig.GetInterval">func (c *BaseConfig) GetInterval(name, defaultValue, description string) time.Duration</a>

```
searchKey: env.BaseConfig.GetInterval
tags: [exported]
```

```Go
func (c *BaseConfig) GetInterval(name, defaultValue, description string) time.Duration
```

#### <a id="BaseConfig.GetBool" href="#BaseConfig.GetBool">func (c *BaseConfig) GetBool(name, defaultValue, description string) bool</a>

```
searchKey: env.BaseConfig.GetBool
tags: [exported]
```

```Go
func (c *BaseConfig) GetBool(name, defaultValue, description string) bool
```

GetBool returns the value with the given name interpreted as a boolean. If no value was supplied in the environment, the given default is used in its place. If no value is available, or if the given value or default cannot be converted to a boolean, an error is added to the validation errors list. 

#### <a id="BaseConfig.AddError" href="#BaseConfig.AddError">func (c *BaseConfig) AddError(err error)</a>

```
searchKey: env.BaseConfig.AddError
tags: [exported]
```

```Go
func (c *BaseConfig) AddError(err error)
```

AddError adds a validation error to the configuration object. This should be called from within the Load method of a decorated configuration object to have any effect. 

#### <a id="BaseConfig.get" href="#BaseConfig.get">func (c *BaseConfig) get(name, defaultValue, description string) string</a>

```
searchKey: env.BaseConfig.get
```

```Go
func (c *BaseConfig) get(name, defaultValue, description string) string
```

#### <a id="BaseConfig.SetMockGetter" href="#BaseConfig.SetMockGetter">func (c *BaseConfig) SetMockGetter(getter GetterFunc)</a>

```
searchKey: env.BaseConfig.SetMockGetter
tags: [exported]
```

```Go
func (c *BaseConfig) SetMockGetter(getter GetterFunc)
```

SetMockGetter sets mock to use in place of this packge's Get function. 

### <a id="GetterFunc" href="#GetterFunc">type GetterFunc func(name string, defaultValue string, description string) string</a>

```
searchKey: env.GetterFunc
tags: [exported]
```

```Go
type GetterFunc func(name, defaultValue, description string) string
```

### <a id="envflag" href="#envflag">type envflag struct</a>

```
searchKey: env.envflag
```

```Go
type envflag struct {
	name        string
	description string
	value       string
}
```

## <a id="func" href="#func">Functions</a>

### <a id="findName" href="#findName">func findName() (string, string)</a>

```
searchKey: env.findName
```

```Go
func findName() (string, string)
```

findName returns the name of the current process, that being the part of argv[0] after the last slash if any, and also the lowercase letters from that, suitable for use as a likely key for lookups in things like shell environment variables which can't contain hyphens. 

### <a id="Ensure" href="#Ensure">func Ensure(name, defaultValue, description string) string</a>

```
searchKey: env.Ensure
tags: [exported]
```

```Go
func Ensure(name, defaultValue, description string) string
```

Ensure behaves like Get except that it sets the environment variable if it doesn't exist. 

### <a id="init" href="#init">func init()</a>

```
searchKey: env.init
```

```Go
func init()
```

### <a id="Get" href="#Get">func Get(name, defaultValue, description string) string</a>

```
searchKey: env.Get
tags: [exported]
```

```Go
func Get(name, defaultValue, description string) string
```

Get returns the value of the given environment variable. It also registers the description for PrintHelp. Calling Get with the same name twice causes a panic. Get should only be called on package initialization. Calls at a later point will cause a panic if Lock was called before. 

This should be used for only *internal* environment values. User-visible configuration should be added to the Config struct in the github.com/sourcegraph/sourcegraph/config package. 

### <a id="MustGetDuration" href="#MustGetDuration">func MustGetDuration(name string, defaultValue time.Duration, description string) time.Duration</a>

```
searchKey: env.MustGetDuration
tags: [exported]
```

```Go
func MustGetDuration(name string, defaultValue time.Duration, description string) time.Duration
```

MustGetDuration is similar to Get but ensures that the value is a valid time.Duration. 

### <a id="MustGetInt" href="#MustGetInt">func MustGetInt(name string, defaultValue int, description string) int</a>

```
searchKey: env.MustGetInt
tags: [exported]
```

```Go
func MustGetInt(name string, defaultValue int, description string) int
```

MustGetInt is similar to Get but ensures that the value is a valid int. 

### <a id="environMap" href="#environMap">func environMap(environ []string) map[string]string</a>

```
searchKey: env.environMap
```

```Go
func environMap(environ []string) map[string]string
```

### <a id="Lock" href="#Lock">func Lock()</a>

```
searchKey: env.Lock
tags: [exported]
```

```Go
func Lock()
```

Lock makes later calls to Get fail with a panic. Call this at the beginning of the main function. 

### <a id="PrintHelp" href="#PrintHelp">func PrintHelp()</a>

```
searchKey: env.PrintHelp
tags: [exported]
```

```Go
func PrintHelp()
```

PrintHelp prints a list of all registered environment variables and their descriptions. 

### <a id="HandleHelpFlag" href="#HandleHelpFlag">func HandleHelpFlag()</a>

```
searchKey: env.HandleHelpFlag
tags: [exported]
```

```Go
func HandleHelpFlag()
```

HandleHelpFlag looks at the first CLI argument. If it is "help", "-h" or "--help", then it calls PrintHelp and exits. 

### <a id="TestEnvironMap" href="#TestEnvironMap">func TestEnvironMap(t *testing.T)</a>

```
searchKey: env.TestEnvironMap
```

```Go
func TestEnvironMap(t *testing.T)
```

### <a id="TestLock" href="#TestLock">func TestLock(t *testing.T)</a>

```
searchKey: env.TestLock
```

```Go
func TestLock(t *testing.T)
```

