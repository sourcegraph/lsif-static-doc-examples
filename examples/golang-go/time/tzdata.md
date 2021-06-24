# Package tzdata

Package tzdata provides an embedded copy of the timezone database. If this package is imported anywhere in the program, then if the time package cannot find tzdata files on the system, it will use this embedded information. 

Importing this package will increase the size of a program by about 450 KB. 

This package should normally be imported by a program's main package, not by a library. Libraries normally shouldn't decide whether to include the timezone database in a program. 

This package will be automatically imported if you build with -tags timetzdata. 

## Index

* [Constants](#const)
    * [const zipdata](#zipdata)
* [Functions](#func)
    * [func get2s(s string) int](#get2s)
    * [func get4s(s string) int](#get4s)
    * [func init()](#init.tzdata.go)
    * [func loadFromEmbeddedTZData(name string) (string, error)](#loadFromEmbeddedTZData)
    * [func registerLoadFromEmbeddedTZData(func(string) (string, error))](#registerLoadFromEmbeddedTZData)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="zipdata" href="#zipdata">const zipdata</a>

```
searchKey: tzdata.zipdata
tags: [constant string private]
```

```Go
const zipdata = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="get2s" href="#get2s">func get2s(s string) int</a>

```
searchKey: tzdata.get2s
tags: [method private]
```

```Go
func get2s(s string) int
```

get2s returns the little-endian 16-bit value at the start of s. 

### <a id="get4s" href="#get4s">func get4s(s string) int</a>

```
searchKey: tzdata.get4s
tags: [method private]
```

```Go
func get4s(s string) int
```

get4s returns the little-endian 32-bit value at the start of s. 

### <a id="init.tzdata.go" href="#init.tzdata.go">func init()</a>

```
searchKey: tzdata.init
tags: [function private]
```

```Go
func init()
```

### <a id="loadFromEmbeddedTZData" href="#loadFromEmbeddedTZData">func loadFromEmbeddedTZData(name string) (string, error)</a>

```
searchKey: tzdata.loadFromEmbeddedTZData
tags: [method private]
```

```Go
func loadFromEmbeddedTZData(name string) (string, error)
```

loadFromEmbeddedTZData returns the contents of the file with the given name in an uncompressed zip file, where the contents of the file can be found in embeddedTzdata. This is similar to time.loadTzinfoFromZip. 

### <a id="registerLoadFromEmbeddedTZData" href="#registerLoadFromEmbeddedTZData">func registerLoadFromEmbeddedTZData(func(string) (string, error))</a>

```
searchKey: tzdata.registerLoadFromEmbeddedTZData
tags: [method private]
```

```Go
func registerLoadFromEmbeddedTZData(func(string) (string, error))
```

registerLoadFromEmbeddedTZData is defined in package time. 

