# Package goroot

## Index

* [Variables](#var)
    * [var gccgoSearch](#gccgoSearch)
* [Types](#type)
    * [type gccgoDirs struct](#gccgoDirs)
        * [func (gd *gccgoDirs) init()](#gccgoDirs.init.gc.go)
        * [func (gd *gccgoDirs) isStandard(path string) bool](#gccgoDirs.isStandard)
* [Functions](#func)
    * [func IsStandardPackage(goroot, compiler, path string) bool](#IsStandardPackage)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="gccgoSearch" href="#gccgoSearch">var gccgoSearch</a>

```
searchKey: goroot.gccgoSearch
tags: [private]
```

```Go
var gccgoSearch gccgoDirs
```

gccgoSearch is used to check whether a gccgo package exists in the standard library. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="gccgoDirs" href="#gccgoDirs">type gccgoDirs struct</a>

```
searchKey: goroot.gccgoDirs
tags: [private]
```

```Go
type gccgoDirs struct {
	once sync.Once
	dirs []string
}
```

gccgoSearch holds the gccgo search directories. 

#### <a id="gccgoDirs.init.gc.go" href="#gccgoDirs.init.gc.go">func (gd *gccgoDirs) init()</a>

```
searchKey: goroot.gccgoDirs.init
tags: [private]
```

```Go
func (gd *gccgoDirs) init()
```

init finds the gccgo search directories. If this fails it leaves dirs == nil. 

#### <a id="gccgoDirs.isStandard" href="#gccgoDirs.isStandard">func (gd *gccgoDirs) isStandard(path string) bool</a>

```
searchKey: goroot.gccgoDirs.isStandard
tags: [private]
```

```Go
func (gd *gccgoDirs) isStandard(path string) bool
```

isStandard reports whether path is a standard library for gccgo. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="IsStandardPackage" href="#IsStandardPackage">func IsStandardPackage(goroot, compiler, path string) bool</a>

```
searchKey: goroot.IsStandardPackage
```

```Go
func IsStandardPackage(goroot, compiler, path string) bool
```

IsStandardPackage reports whether path is a standard package, given goroot and compiler. 

