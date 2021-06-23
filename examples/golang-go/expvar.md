# Package expvar

Package expvar provides a standardized interface to public variables, such as operation counters in servers. It exposes these variables via HTTP at /debug/vars in JSON format. 

Operations to set or modify these public variables are atomic. 

In addition to adding the HTTP handler, this package registers the following variables: 

```
cmdline   os.Args
memstats  runtime.Memstats

```
The package is sometimes only imported for the side effect of registering its HTTP handler and the above variables. To use it this way, link this package into your program: 

```
import _ "expvar"

```
## Index

* [Variables](#var)
    * [var vars](#vars)
    * [var varKeysMu](#varKeysMu)
    * [var varKeys](#varKeys)
* [Types](#type)
    * [type Var interface](#Var)
        * [func Get(name string) Var](#Get)
    * [type Int struct](#Int)
        * [func NewInt(name string) *Int](#NewInt)
        * [func (v *Int) Value() int64](#Int.Value)
        * [func (v *Int) String() string](#Int.String)
        * [func (v *Int) Add(delta int64)](#Int.Add)
        * [func (v *Int) Set(value int64)](#Int.Set)
    * [type Float struct](#Float)
        * [func NewFloat(name string) *Float](#NewFloat)
        * [func (v *Float) Value() float64](#Float.Value)
        * [func (v *Float) String() string](#Float.String)
        * [func (v *Float) Add(delta float64)](#Float.Add)
        * [func (v *Float) Set(value float64)](#Float.Set)
    * [type Map struct](#Map)
        * [func NewMap(name string) *Map](#NewMap)
        * [func (v *Map) String() string](#Map.String)
        * [func (v *Map) Init() *Map](#Map.Init)
        * [func (v *Map) addKey(key string)](#Map.addKey)
        * [func (v *Map) Get(key string) Var](#Map.Get)
        * [func (v *Map) Set(key string, av Var)](#Map.Set)
        * [func (v *Map) Add(key string, delta int64)](#Map.Add)
        * [func (v *Map) AddFloat(key string, delta float64)](#Map.AddFloat)
        * [func (v *Map) Delete(key string)](#Map.Delete)
        * [func (v *Map) Do(f func(KeyValue))](#Map.Do)
    * [type KeyValue struct](#KeyValue)
    * [type String struct](#String)
        * [func NewString(name string) *String](#NewString)
        * [func (v *String) Value() string](#String.Value)
        * [func (v *String) String() string](#String.String)
        * [func (v *String) Set(value string)](#String.Set)
    * [type Func func() interface{}](#Func)
        * [func (f Func) Value() interface{}](#Func.Value)
        * [func (f Func) String() string](#Func.String)
* [Functions](#func)
    * [func Publish(name string, v Var)](#Publish)
    * [func Do(f func(KeyValue))](#Do)
    * [func expvarHandler(w http.ResponseWriter, r *http.Request)](#expvarHandler)
    * [func Handler() http.Handler](#Handler)
    * [func cmdline() interface{}](#cmdline)
    * [func memstats() interface{}](#memstats)
    * [func init()](#init.expvar.go)
    * [func RemoveAll()](#RemoveAll)
    * [func TestNil(t *testing.T)](#TestNil)
    * [func TestInt(t *testing.T)](#TestInt)
    * [func BenchmarkIntAdd(b *testing.B)](#BenchmarkIntAdd)
    * [func BenchmarkIntSet(b *testing.B)](#BenchmarkIntSet)
    * [func TestFloat(t *testing.T)](#TestFloat)
    * [func BenchmarkFloatAdd(b *testing.B)](#BenchmarkFloatAdd)
    * [func BenchmarkFloatSet(b *testing.B)](#BenchmarkFloatSet)
    * [func TestString(t *testing.T)](#TestString)
    * [func BenchmarkStringSet(b *testing.B)](#BenchmarkStringSet)
    * [func TestMapInit(t *testing.T)](#TestMapInit)
    * [func TestMapDelete(t *testing.T)](#TestMapDelete)
    * [func TestMapCounter(t *testing.T)](#TestMapCounter)
    * [func BenchmarkMapSet(b *testing.B)](#BenchmarkMapSet)
    * [func BenchmarkMapSetDifferent(b *testing.B)](#BenchmarkMapSetDifferent)
    * [func BenchmarkMapSetDifferentRandom(b *testing.B)](#BenchmarkMapSetDifferentRandom)
    * [func BenchmarkMapSetString(b *testing.B)](#BenchmarkMapSetString)
    * [func BenchmarkMapAddSame(b *testing.B)](#BenchmarkMapAddSame)
    * [func BenchmarkMapAddDifferent(b *testing.B)](#BenchmarkMapAddDifferent)
    * [func BenchmarkMapAddDifferentRandom(b *testing.B)](#BenchmarkMapAddDifferentRandom)
    * [func BenchmarkMapAddSameSteadyState(b *testing.B)](#BenchmarkMapAddSameSteadyState)
    * [func BenchmarkMapAddDifferentSteadyState(b *testing.B)](#BenchmarkMapAddDifferentSteadyState)
    * [func TestFunc(t *testing.T)](#TestFunc)
    * [func TestHandler(t *testing.T)](#TestHandler)
    * [func BenchmarkRealworldExpvarUsage(b *testing.B)](#BenchmarkRealworldExpvarUsage)


## <a id="var" href="#var">Variables</a>

### <a id="vars" href="#vars">var vars</a>

```
searchKey: expvar.vars
tags: [private]
```

```Go
var vars sync.Map // map[string]Var

```

All published variables. 

### <a id="varKeysMu" href="#varKeysMu">var varKeysMu</a>

```
searchKey: expvar.varKeysMu
tags: [private]
```

```Go
var varKeysMu sync.RWMutex
```

All published variables. 

### <a id="varKeys" href="#varKeys">var varKeys</a>

```
searchKey: expvar.varKeys
tags: [private]
```

```Go
var varKeys []string // sorted

```

All published variables. 

## <a id="type" href="#type">Types</a>

### <a id="Var" href="#Var">type Var interface</a>

```
searchKey: expvar.Var
```

```Go
type Var interface {
	// String returns a valid JSON value for the variable.
	// Types with String methods that do not return valid JSON
	// (such as time.Time) must not be used as a Var.
	String() string
}
```

Var is an abstract type for all exported variables. 

#### <a id="Get" href="#Get">func Get(name string) Var</a>

```
searchKey: expvar.Get
```

```Go
func Get(name string) Var
```

Get retrieves a named exported variable. It returns nil if the name has not been registered. 

### <a id="Int" href="#Int">type Int struct</a>

```
searchKey: expvar.Int
```

```Go
type Int struct {
	i int64
}
```

Int is a 64-bit integer variable that satisfies the Var interface. 

#### <a id="NewInt" href="#NewInt">func NewInt(name string) *Int</a>

```
searchKey: expvar.NewInt
```

```Go
func NewInt(name string) *Int
```

#### <a id="Int.Value" href="#Int.Value">func (v *Int) Value() int64</a>

```
searchKey: expvar.Int.Value
```

```Go
func (v *Int) Value() int64
```

#### <a id="Int.String" href="#Int.String">func (v *Int) String() string</a>

```
searchKey: expvar.Int.String
```

```Go
func (v *Int) String() string
```

#### <a id="Int.Add" href="#Int.Add">func (v *Int) Add(delta int64)</a>

```
searchKey: expvar.Int.Add
```

```Go
func (v *Int) Add(delta int64)
```

#### <a id="Int.Set" href="#Int.Set">func (v *Int) Set(value int64)</a>

```
searchKey: expvar.Int.Set
```

```Go
func (v *Int) Set(value int64)
```

### <a id="Float" href="#Float">type Float struct</a>

```
searchKey: expvar.Float
```

```Go
type Float struct {
	f uint64
}
```

Float is a 64-bit float variable that satisfies the Var interface. 

#### <a id="NewFloat" href="#NewFloat">func NewFloat(name string) *Float</a>

```
searchKey: expvar.NewFloat
```

```Go
func NewFloat(name string) *Float
```

#### <a id="Float.Value" href="#Float.Value">func (v *Float) Value() float64</a>

```
searchKey: expvar.Float.Value
```

```Go
func (v *Float) Value() float64
```

#### <a id="Float.String" href="#Float.String">func (v *Float) String() string</a>

```
searchKey: expvar.Float.String
```

```Go
func (v *Float) String() string
```

#### <a id="Float.Add" href="#Float.Add">func (v *Float) Add(delta float64)</a>

```
searchKey: expvar.Float.Add
```

```Go
func (v *Float) Add(delta float64)
```

Add adds delta to v. 

#### <a id="Float.Set" href="#Float.Set">func (v *Float) Set(value float64)</a>

```
searchKey: expvar.Float.Set
```

```Go
func (v *Float) Set(value float64)
```

Set sets v to value. 

### <a id="Map" href="#Map">type Map struct</a>

```
searchKey: expvar.Map
```

```Go
type Map struct {
	m      sync.Map // map[string]Var
	keysMu sync.RWMutex
	keys   []string // sorted
}
```

Map is a string-to-Var map variable that satisfies the Var interface. 

#### <a id="NewMap" href="#NewMap">func NewMap(name string) *Map</a>

```
searchKey: expvar.NewMap
```

```Go
func NewMap(name string) *Map
```

#### <a id="Map.String" href="#Map.String">func (v *Map) String() string</a>

```
searchKey: expvar.Map.String
```

```Go
func (v *Map) String() string
```

#### <a id="Map.Init" href="#Map.Init">func (v *Map) Init() *Map</a>

```
searchKey: expvar.Map.Init
```

```Go
func (v *Map) Init() *Map
```

Init removes all keys from the map. 

#### <a id="Map.addKey" href="#Map.addKey">func (v *Map) addKey(key string)</a>

```
searchKey: expvar.Map.addKey
tags: [private]
```

```Go
func (v *Map) addKey(key string)
```

addKey updates the sorted list of keys in v.keys. 

#### <a id="Map.Get" href="#Map.Get">func (v *Map) Get(key string) Var</a>

```
searchKey: expvar.Map.Get
```

```Go
func (v *Map) Get(key string) Var
```

#### <a id="Map.Set" href="#Map.Set">func (v *Map) Set(key string, av Var)</a>

```
searchKey: expvar.Map.Set
```

```Go
func (v *Map) Set(key string, av Var)
```

#### <a id="Map.Add" href="#Map.Add">func (v *Map) Add(key string, delta int64)</a>

```
searchKey: expvar.Map.Add
```

```Go
func (v *Map) Add(key string, delta int64)
```

Add adds delta to the *Int value stored under the given map key. 

#### <a id="Map.AddFloat" href="#Map.AddFloat">func (v *Map) AddFloat(key string, delta float64)</a>

```
searchKey: expvar.Map.AddFloat
```

```Go
func (v *Map) AddFloat(key string, delta float64)
```

AddFloat adds delta to the *Float value stored under the given map key. 

#### <a id="Map.Delete" href="#Map.Delete">func (v *Map) Delete(key string)</a>

```
searchKey: expvar.Map.Delete
```

```Go
func (v *Map) Delete(key string)
```

Delete deletes the given key from the map. 

#### <a id="Map.Do" href="#Map.Do">func (v *Map) Do(f func(KeyValue))</a>

```
searchKey: expvar.Map.Do
```

```Go
func (v *Map) Do(f func(KeyValue))
```

Do calls f for each entry in the map. The map is locked during the iteration, but existing entries may be concurrently updated. 

### <a id="KeyValue" href="#KeyValue">type KeyValue struct</a>

```
searchKey: expvar.KeyValue
```

```Go
type KeyValue struct {
	Key   string
	Value Var
}
```

KeyValue represents a single entry in a Map. 

### <a id="String" href="#String">type String struct</a>

```
searchKey: expvar.String
```

```Go
type String struct {
	s atomic.Value // string
}
```

String is a string variable, and satisfies the Var interface. 

#### <a id="NewString" href="#NewString">func NewString(name string) *String</a>

```
searchKey: expvar.NewString
```

```Go
func NewString(name string) *String
```

#### <a id="String.Value" href="#String.Value">func (v *String) Value() string</a>

```
searchKey: expvar.String.Value
```

```Go
func (v *String) Value() string
```

#### <a id="String.String" href="#String.String">func (v *String) String() string</a>

```
searchKey: expvar.String.String
```

```Go
func (v *String) String() string
```

String implements the Var interface. To get the unquoted string use Value. 

#### <a id="String.Set" href="#String.Set">func (v *String) Set(value string)</a>

```
searchKey: expvar.String.Set
```

```Go
func (v *String) Set(value string)
```

### <a id="Func" href="#Func">type Func func() interface{}</a>

```
searchKey: expvar.Func
```

```Go
type Func func() interface{}
```

Func implements Var by calling the function and formatting the returned value using JSON. 

#### <a id="Func.Value" href="#Func.Value">func (f Func) Value() interface{}</a>

```
searchKey: expvar.Func.Value
```

```Go
func (f Func) Value() interface{}
```

#### <a id="Func.String" href="#Func.String">func (f Func) String() string</a>

```
searchKey: expvar.Func.String
```

```Go
func (f Func) String() string
```

## <a id="func" href="#func">Functions</a>

### <a id="Publish" href="#Publish">func Publish(name string, v Var)</a>

```
searchKey: expvar.Publish
```

```Go
func Publish(name string, v Var)
```

Publish declares a named exported variable. This should be called from a package's init function when it creates its Vars. If the name is already registered then this will log.Panic. 

### <a id="Do" href="#Do">func Do(f func(KeyValue))</a>

```
searchKey: expvar.Do
```

```Go
func Do(f func(KeyValue))
```

Do calls f for each exported variable. The global variable map is locked during the iteration, but existing entries may be concurrently updated. 

### <a id="expvarHandler" href="#expvarHandler">func expvarHandler(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: expvar.expvarHandler
tags: [private]
```

```Go
func expvarHandler(w http.ResponseWriter, r *http.Request)
```

### <a id="Handler" href="#Handler">func Handler() http.Handler</a>

```
searchKey: expvar.Handler
```

```Go
func Handler() http.Handler
```

Handler returns the expvar HTTP Handler. 

This is only needed to install the handler in a non-standard location. 

### <a id="cmdline" href="#cmdline">func cmdline() interface{}</a>

```
searchKey: expvar.cmdline
tags: [private]
```

```Go
func cmdline() interface{}
```

### <a id="memstats" href="#memstats">func memstats() interface{}</a>

```
searchKey: expvar.memstats
tags: [private]
```

```Go
func memstats() interface{}
```

### <a id="init.expvar.go" href="#init.expvar.go">func init()</a>

```
searchKey: expvar.init
tags: [private]
```

```Go
func init()
```

### <a id="RemoveAll" href="#RemoveAll">func RemoveAll()</a>

```
searchKey: expvar.RemoveAll
tags: [private]
```

```Go
func RemoveAll()
```

RemoveAll removes all exported variables. This is for tests only. 

### <a id="TestNil" href="#TestNil">func TestNil(t *testing.T)</a>

```
searchKey: expvar.TestNil
tags: [private]
```

```Go
func TestNil(t *testing.T)
```

### <a id="TestInt" href="#TestInt">func TestInt(t *testing.T)</a>

```
searchKey: expvar.TestInt
tags: [private]
```

```Go
func TestInt(t *testing.T)
```

### <a id="BenchmarkIntAdd" href="#BenchmarkIntAdd">func BenchmarkIntAdd(b *testing.B)</a>

```
searchKey: expvar.BenchmarkIntAdd
tags: [private]
```

```Go
func BenchmarkIntAdd(b *testing.B)
```

### <a id="BenchmarkIntSet" href="#BenchmarkIntSet">func BenchmarkIntSet(b *testing.B)</a>

```
searchKey: expvar.BenchmarkIntSet
tags: [private]
```

```Go
func BenchmarkIntSet(b *testing.B)
```

### <a id="TestFloat" href="#TestFloat">func TestFloat(t *testing.T)</a>

```
searchKey: expvar.TestFloat
tags: [private]
```

```Go
func TestFloat(t *testing.T)
```

### <a id="BenchmarkFloatAdd" href="#BenchmarkFloatAdd">func BenchmarkFloatAdd(b *testing.B)</a>

```
searchKey: expvar.BenchmarkFloatAdd
tags: [private]
```

```Go
func BenchmarkFloatAdd(b *testing.B)
```

### <a id="BenchmarkFloatSet" href="#BenchmarkFloatSet">func BenchmarkFloatSet(b *testing.B)</a>

```
searchKey: expvar.BenchmarkFloatSet
tags: [private]
```

```Go
func BenchmarkFloatSet(b *testing.B)
```

### <a id="TestString" href="#TestString">func TestString(t *testing.T)</a>

```
searchKey: expvar.TestString
tags: [private]
```

```Go
func TestString(t *testing.T)
```

### <a id="BenchmarkStringSet" href="#BenchmarkStringSet">func BenchmarkStringSet(b *testing.B)</a>

```
searchKey: expvar.BenchmarkStringSet
tags: [private]
```

```Go
func BenchmarkStringSet(b *testing.B)
```

### <a id="TestMapInit" href="#TestMapInit">func TestMapInit(t *testing.T)</a>

```
searchKey: expvar.TestMapInit
tags: [private]
```

```Go
func TestMapInit(t *testing.T)
```

### <a id="TestMapDelete" href="#TestMapDelete">func TestMapDelete(t *testing.T)</a>

```
searchKey: expvar.TestMapDelete
tags: [private]
```

```Go
func TestMapDelete(t *testing.T)
```

### <a id="TestMapCounter" href="#TestMapCounter">func TestMapCounter(t *testing.T)</a>

```
searchKey: expvar.TestMapCounter
tags: [private]
```

```Go
func TestMapCounter(t *testing.T)
```

### <a id="BenchmarkMapSet" href="#BenchmarkMapSet">func BenchmarkMapSet(b *testing.B)</a>

```
searchKey: expvar.BenchmarkMapSet
tags: [private]
```

```Go
func BenchmarkMapSet(b *testing.B)
```

### <a id="BenchmarkMapSetDifferent" href="#BenchmarkMapSetDifferent">func BenchmarkMapSetDifferent(b *testing.B)</a>

```
searchKey: expvar.BenchmarkMapSetDifferent
tags: [private]
```

```Go
func BenchmarkMapSetDifferent(b *testing.B)
```

### <a id="BenchmarkMapSetDifferentRandom" href="#BenchmarkMapSetDifferentRandom">func BenchmarkMapSetDifferentRandom(b *testing.B)</a>

```
searchKey: expvar.BenchmarkMapSetDifferentRandom
tags: [private]
```

```Go
func BenchmarkMapSetDifferentRandom(b *testing.B)
```

BenchmarkMapSetDifferentRandom simulates such a case where the concerned keys of Map.Set are generated dynamically and as a result insertion is out of order and the number of the keys may be large. 

### <a id="BenchmarkMapSetString" href="#BenchmarkMapSetString">func BenchmarkMapSetString(b *testing.B)</a>

```
searchKey: expvar.BenchmarkMapSetString
tags: [private]
```

```Go
func BenchmarkMapSetString(b *testing.B)
```

### <a id="BenchmarkMapAddSame" href="#BenchmarkMapAddSame">func BenchmarkMapAddSame(b *testing.B)</a>

```
searchKey: expvar.BenchmarkMapAddSame
tags: [private]
```

```Go
func BenchmarkMapAddSame(b *testing.B)
```

### <a id="BenchmarkMapAddDifferent" href="#BenchmarkMapAddDifferent">func BenchmarkMapAddDifferent(b *testing.B)</a>

```
searchKey: expvar.BenchmarkMapAddDifferent
tags: [private]
```

```Go
func BenchmarkMapAddDifferent(b *testing.B)
```

### <a id="BenchmarkMapAddDifferentRandom" href="#BenchmarkMapAddDifferentRandom">func BenchmarkMapAddDifferentRandom(b *testing.B)</a>

```
searchKey: expvar.BenchmarkMapAddDifferentRandom
tags: [private]
```

```Go
func BenchmarkMapAddDifferentRandom(b *testing.B)
```

BenchmarkMapAddDifferentRandom simulates such a case where that the concerned keys of Map.Add are generated dynamically and as a result insertion is out of order and the number of the keys may be large. 

### <a id="BenchmarkMapAddSameSteadyState" href="#BenchmarkMapAddSameSteadyState">func BenchmarkMapAddSameSteadyState(b *testing.B)</a>

```
searchKey: expvar.BenchmarkMapAddSameSteadyState
tags: [private]
```

```Go
func BenchmarkMapAddSameSteadyState(b *testing.B)
```

### <a id="BenchmarkMapAddDifferentSteadyState" href="#BenchmarkMapAddDifferentSteadyState">func BenchmarkMapAddDifferentSteadyState(b *testing.B)</a>

```
searchKey: expvar.BenchmarkMapAddDifferentSteadyState
tags: [private]
```

```Go
func BenchmarkMapAddDifferentSteadyState(b *testing.B)
```

### <a id="TestFunc" href="#TestFunc">func TestFunc(t *testing.T)</a>

```
searchKey: expvar.TestFunc
tags: [private]
```

```Go
func TestFunc(t *testing.T)
```

### <a id="TestHandler" href="#TestHandler">func TestHandler(t *testing.T)</a>

```
searchKey: expvar.TestHandler
tags: [private]
```

```Go
func TestHandler(t *testing.T)
```

### <a id="BenchmarkRealworldExpvarUsage" href="#BenchmarkRealworldExpvarUsage">func BenchmarkRealworldExpvarUsage(b *testing.B)</a>

```
searchKey: expvar.BenchmarkRealworldExpvarUsage
tags: [private]
```

```Go
func BenchmarkRealworldExpvarUsage(b *testing.B)
```

