# Package search_test

## Index

* [Types](#type)
    * [type sortByLineNumber []protocol.LineMatch](#sortByLineNumber)
        * [func (m sortByLineNumber) Len() int](#sortByLineNumber.Len)
        * [func (m sortByLineNumber) Less(i, j int) bool](#sortByLineNumber.Less)
        * [func (m sortByLineNumber) Swap(i, j int)](#sortByLineNumber.Swap)
    * [type sortByPath []protocol.FileMatch](#sortByPath)
        * [func (m sortByPath) Len() int](#sortByPath.Len)
        * [func (m sortByPath) Less(i, j int) bool](#sortByPath.Less)
        * [func (m sortByPath) Swap(i, j int)](#sortByPath.Swap)
* [Functions](#func)
    * [func TestSearch(t *testing.T)](#TestSearch)
    * [func TestSearch_badrequest(t *testing.T)](#TestSearch_badrequest)
    * [func addpaxheader(w *tar.Writer, body string) error](#addpaxheader)
    * [func doSearch(u string, p *protocol.Request) ([]protocol.FileMatch, error)](#doSearch)
    * [func newStore(files map[string]string) (*store.Store, func(), error)](#newStore)
    * [func sanityCheckSorted(m []protocol.FileMatch) error](#sanityCheckSorted)
    * [func toString(m []protocol.FileMatch) string](#toString)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="sortByLineNumber" href="#sortByLineNumber">type sortByLineNumber []protocol.LineMatch</a>

```
searchKey: search_test.sortByLineNumber
tags: [array struct private]
```

```Go
type sortByLineNumber []protocol.LineMatch
```

#### <a id="sortByLineNumber.Len" href="#sortByLineNumber.Len">func (m sortByLineNumber) Len() int</a>

```
searchKey: search_test.sortByLineNumber.Len
tags: [function private]
```

```Go
func (m sortByLineNumber) Len() int
```

#### <a id="sortByLineNumber.Less" href="#sortByLineNumber.Less">func (m sortByLineNumber) Less(i, j int) bool</a>

```
searchKey: search_test.sortByLineNumber.Less
tags: [method private]
```

```Go
func (m sortByLineNumber) Less(i, j int) bool
```

#### <a id="sortByLineNumber.Swap" href="#sortByLineNumber.Swap">func (m sortByLineNumber) Swap(i, j int)</a>

```
searchKey: search_test.sortByLineNumber.Swap
tags: [method private]
```

```Go
func (m sortByLineNumber) Swap(i, j int)
```

### <a id="sortByPath" href="#sortByPath">type sortByPath []protocol.FileMatch</a>

```
searchKey: search_test.sortByPath
tags: [array struct private]
```

```Go
type sortByPath []protocol.FileMatch
```

#### <a id="sortByPath.Len" href="#sortByPath.Len">func (m sortByPath) Len() int</a>

```
searchKey: search_test.sortByPath.Len
tags: [function private]
```

```Go
func (m sortByPath) Len() int
```

#### <a id="sortByPath.Less" href="#sortByPath.Less">func (m sortByPath) Less(i, j int) bool</a>

```
searchKey: search_test.sortByPath.Less
tags: [method private]
```

```Go
func (m sortByPath) Less(i, j int) bool
```

#### <a id="sortByPath.Swap" href="#sortByPath.Swap">func (m sortByPath) Swap(i, j int)</a>

```
searchKey: search_test.sortByPath.Swap
tags: [method private]
```

```Go
func (m sortByPath) Swap(i, j int)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="TestSearch" href="#TestSearch">func TestSearch(t *testing.T)</a>

```
searchKey: search_test.TestSearch
tags: [method private test]
```

```Go
func TestSearch(t *testing.T)
```

### <a id="TestSearch_badrequest" href="#TestSearch_badrequest">func TestSearch_badrequest(t *testing.T)</a>

```
searchKey: search_test.TestSearch_badrequest
tags: [method private test]
```

```Go
func TestSearch_badrequest(t *testing.T)
```

### <a id="addpaxheader" href="#addpaxheader">func addpaxheader(w *tar.Writer, body string) error</a>

```
searchKey: search_test.addpaxheader
tags: [method private]
```

```Go
func addpaxheader(w *tar.Writer, body string) error
```

### <a id="doSearch" href="#doSearch">func doSearch(u string, p *protocol.Request) ([]protocol.FileMatch, error)</a>

```
searchKey: search_test.doSearch
tags: [method private]
```

```Go
func doSearch(u string, p *protocol.Request) ([]protocol.FileMatch, error)
```

### <a id="newStore" href="#newStore">func newStore(files map[string]string) (*store.Store, func(), error)</a>

```
searchKey: search_test.newStore
tags: [method private]
```

```Go
func newStore(files map[string]string) (*store.Store, func(), error)
```

### <a id="sanityCheckSorted" href="#sanityCheckSorted">func sanityCheckSorted(m []protocol.FileMatch) error</a>

```
searchKey: search_test.sanityCheckSorted
tags: [method private]
```

```Go
func sanityCheckSorted(m []protocol.FileMatch) error
```

### <a id="toString" href="#toString">func toString(m []protocol.FileMatch) string</a>

```
searchKey: search_test.toString
tags: [method private]
```

```Go
func toString(m []protocol.FileMatch) string
```

