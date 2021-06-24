# Package main

## Index

* [Variables](#var)
    * [var newVersion](#newVersion)
* [Types](#type)
    * [type changeLog struct](#changeLog)
    * [type changeSet struct](#changeSet)
        * [func parseSet(sec [][]byte, lineCount int) (*changeSet, error)](#parseSet)
        * [func (cs *changeSet) String() string](#changeSet.String)
        * [func (cs *changeSet) any() bool](#changeSet.any)
    * [type changeSubset struct](#changeSubset)
        * [func parseSubset(sec [][]byte, lineCount int) (*changeSubset, error)](#parseSubset)
        * [func (css *changeSubset) String() string](#changeSubset.String)
        * [func (css *changeSubset) any() bool](#changeSubset.any)
* [Functions](#func)
    * [func main()](#main)
    * [func readLines(path string) ([][]byte, error)](#readLines)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="newVersion" href="#newVersion">var newVersion</a>

```
searchKey: main.newVersion
tags: [variable string private]
```

```Go
var newVersion string
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="changeLog" href="#changeLog">type changeLog struct</a>

```
searchKey: main.changeLog
tags: [struct private]
```

```Go
type changeLog struct {
	header     [][]byte
	changeSets []*changeSet
}
```

a representation of a changeLog in the format we use, which is ## headers per release, roughly. 

### <a id="changeSet" href="#changeSet">type changeSet struct</a>

```
searchKey: main.changeSet
tags: [struct private]
```

```Go
type changeSet struct {
	version string
	subSets []*changeSubset
	verbose bool
}
```

#### <a id="parseSet" href="#parseSet">func parseSet(sec [][]byte, lineCount int) (*changeSet, error)</a>

```
searchKey: main.parseSet
tags: [method private]
```

```Go
func parseSet(sec [][]byte, lineCount int) (*changeSet, error)
```

#### <a id="changeSet.String" href="#changeSet.String">func (cs *changeSet) String() string</a>

```
searchKey: main.changeSet.String
tags: [function private]
```

```Go
func (cs *changeSet) String() string
```

#### <a id="changeSet.any" href="#changeSet.any">func (cs *changeSet) any() bool</a>

```
searchKey: main.changeSet.any
tags: [function private]
```

```Go
func (cs *changeSet) any() bool
```

### <a id="changeSubset" href="#changeSubset">type changeSubset struct</a>

```
searchKey: main.changeSubset
tags: [struct private]
```

```Go
type changeSubset struct {
	heading string
	changes [][]byte
}
```

#### <a id="parseSubset" href="#parseSubset">func parseSubset(sec [][]byte, lineCount int) (*changeSubset, error)</a>

```
searchKey: main.parseSubset
tags: [method private]
```

```Go
func parseSubset(sec [][]byte, lineCount int) (*changeSubset, error)
```

parseSubset tries to read a change subset, which is a ### header followed by a list of changes. 

#### <a id="changeSubset.String" href="#changeSubset.String">func (css *changeSubset) String() string</a>

```
searchKey: main.changeSubset.String
tags: [function private]
```

```Go
func (css *changeSubset) String() string
```

#### <a id="changeSubset.any" href="#changeSubset.any">func (css *changeSubset) any() bool</a>

```
searchKey: main.changeSubset.any
tags: [function private]
```

```Go
func (css *changeSubset) any() bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

### <a id="readLines" href="#readLines">func readLines(path string) ([][]byte, error)</a>

```
searchKey: main.readLines
tags: [method private]
```

```Go
func readLines(path string) ([][]byte, error)
```

readLines() yields the lines of the file as a slice of byte-slices 

