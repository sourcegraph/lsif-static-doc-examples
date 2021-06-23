# Package sysinfo

Package sysinfo implements high level hardware information gathering that can be used for debugging or information purposes. 

## Index

* [Variables](#var)
    * [var CPU](#CPU)
* [Types](#type)
    * [type cpuInfo struct](#cpuInfo)
        * [func (cpu *cpuInfo) Name() string](#cpuInfo.Name)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="CPU" href="#CPU">var CPU</a>

```
searchKey: sysinfo.CPU
```

```Go
var CPU cpuInfo
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="cpuInfo" href="#cpuInfo">type cpuInfo struct</a>

```
searchKey: sysinfo.cpuInfo
tags: [private]
```

```Go
type cpuInfo struct {
	once sync.Once
	name string
}
```

#### <a id="cpuInfo.Name" href="#cpuInfo.Name">func (cpu *cpuInfo) Name() string</a>

```
searchKey: sysinfo.cpuInfo.Name
tags: [private]
```

```Go
func (cpu *cpuInfo) Name() string
```

