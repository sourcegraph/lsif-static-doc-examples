# Package plugin

Package plugin implements loading and symbol resolution of Go plugins. 

A plugin is a Go main package with exported functions and variables that has been built with: 

```
go build -buildmode=plugin

```
When a plugin is first opened, the init functions of all packages not already part of the program are called. The main function is not run. A plugin is only initialized once, and cannot be closed. 

Currently plugins are only supported on Linux, FreeBSD, and macOS. Please report any issues. 

## Index

* [Variables](#var)
    * [var plugins](#plugins)
    * [var pluginsMu](#pluginsMu)
* [Types](#type)
    * [type Plugin struct](#Plugin)
        * [func Open(path string) (*Plugin, error)](#Open)
        * [func open(name string) (*Plugin, error)](#open)
        * [func (p *Plugin) Lookup(symName string) (Symbol, error)](#Plugin.Lookup)
    * [type Symbol interface{}](#Symbol)
        * [func lookup(p *Plugin, symName string) (Symbol, error)](#lookup)
* [Functions](#func)
    * [func doInit(t unsafe.Pointer)](#doInit)
    * [func lastmoduleinit() (pluginpath string, syms map[string]interface{}, errstr string)](#lastmoduleinit)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="plugins" href="#plugins">var plugins</a>

```
searchKey: plugin.plugins
tags: [variable object private]
```

```Go
var plugins map[string]*Plugin
```

### <a id="pluginsMu" href="#pluginsMu">var pluginsMu</a>

```
searchKey: plugin.pluginsMu
tags: [variable struct private]
```

```Go
var pluginsMu sync.Mutex
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Plugin" href="#Plugin">type Plugin struct</a>

```
searchKey: plugin.Plugin
tags: [struct]
```

```Go
type Plugin struct {
	pluginpath string
	err        string        // set if plugin failed to load
	loaded     chan struct{} // closed when loaded
	syms       map[string]interface{}
}
```

Plugin is a loaded Go plugin. 

#### <a id="Open" href="#Open">func Open(path string) (*Plugin, error)</a>

```
searchKey: plugin.Open
tags: [method]
```

```Go
func Open(path string) (*Plugin, error)
```

Open opens a Go plugin. If a path has already been opened, then the existing *Plugin is returned. It is safe for concurrent use by multiple goroutines. 

#### <a id="open" href="#open">func open(name string) (*Plugin, error)</a>

```
searchKey: plugin.open
tags: [method private]
```

```Go
func open(name string) (*Plugin, error)
```

#### <a id="Plugin.Lookup" href="#Plugin.Lookup">func (p *Plugin) Lookup(symName string) (Symbol, error)</a>

```
searchKey: plugin.Plugin.Lookup
tags: [method]
```

```Go
func (p *Plugin) Lookup(symName string) (Symbol, error)
```

Lookup searches for a symbol named symName in plugin p. A symbol is any exported variable or function. It reports an error if the symbol is not found. It is safe for concurrent use by multiple goroutines. 

### <a id="Symbol" href="#Symbol">type Symbol interface{}</a>

```
searchKey: plugin.Symbol
tags: [interface]
```

```Go
type Symbol interface{}
```

A Symbol is a pointer to a variable or function. 

For example, a plugin defined as 

```
package main

import "fmt"

var V int

func F() { fmt.Printf("Hello, number %d\n", V) }

```
may be loaded with the Open function and then the exported package symbols V and F can be accessed 

```
p, err := plugin.Open("plugin_name.so")
if err != nil {
	panic(err)
}
v, err := p.Lookup("V")
if err != nil {
	panic(err)
}
f, err := p.Lookup("F")
if err != nil {
	panic(err)
}
*v.(*int) = 7
f.(func())() // prints "Hello, number 7"

```
#### <a id="lookup" href="#lookup">func lookup(p *Plugin, symName string) (Symbol, error)</a>

```
searchKey: plugin.lookup
tags: [method private]
```

```Go
func lookup(p *Plugin, symName string) (Symbol, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="doInit" href="#doInit">func doInit(t unsafe.Pointer)</a>

```
searchKey: plugin.doInit
tags: [method private]
```

```Go
func doInit(t unsafe.Pointer)
```

doInit is defined in package runtime 

### <a id="lastmoduleinit" href="#lastmoduleinit">func lastmoduleinit() (pluginpath string, syms map[string]interface{}, errstr string)</a>

```
searchKey: plugin.lastmoduleinit
tags: [function private]
```

```Go
func lastmoduleinit() (pluginpath string, syms map[string]interface{}, errstr string)
```

lastmoduleinit is defined in package runtime 

