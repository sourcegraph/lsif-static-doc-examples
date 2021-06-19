# Package search_test

## Index

* [Types](#type)
    * [type sortByPath []protocol.FileMatch](#sortByPath)
        * [func (m sortByPath) Len() int](#sortByPath.Len)
        * [func (m sortByPath) Less(i, j int) bool](#sortByPath.Less)
        * [func (m sortByPath) Swap(i, j int)](#sortByPath.Swap)
    * [type sortByLineNumber []protocol.LineMatch](#sortByLineNumber)
        * [func (m sortByLineNumber) Len() int](#sortByLineNumber.Len)
        * [func (m sortByLineNumber) Less(i, j int) bool](#sortByLineNumber.Less)
        * [func (m sortByLineNumber) Swap(i, j int)](#sortByLineNumber.Swap)
* [Functions](#func)
    * [func addpaxheader(w *tar.Writer, body string) error](#addpaxheader)
    * [func TestSearch(t *testing.T)](#TestSearch)
    * [func TestSearch_badrequest(t *testing.T)](#TestSearch_badrequest)
    * [func doSearch(u string, p *protocol.Request) ([]protocol.FileMatch, error)](#doSearch)
    * [func newStore(files map[string]string) (*store.Store, func(), error)](#newStore)
    * [func toString(m []protocol.FileMatch) string](#toString)
    * [func sanityCheckSorted(m []protocol.FileMatch) error](#sanityCheckSorted)


## <a id="type" href="#type">Types</a>

### <a id="sortByPath" href="#sortByPath">type sortByPath []protocol.FileMatch</a>

```
searchKey: search_test.sortByPath
```

```Go
type sortByPath []protocol.FileMatch
```

#### <a id="sortByPath.Len" href="#sortByPath.Len">func (m sortByPath) Len() int</a>

```
searchKey: search_test.sortByPath.Len
```

```Go
func (m sortByPath) Len() int
```

#### <a id="sortByPath.Less" href="#sortByPath.Less">func (m sortByPath) Less(i, j int) bool</a>

```
searchKey: search_test.sortByPath.Less
```

```Go
func (m sortByPath) Less(i, j int) bool
```

#### <a id="sortByPath.Swap" href="#sortByPath.Swap">func (m sortByPath) Swap(i, j int)</a>

```
searchKey: search_test.sortByPath.Swap
```

```Go
func (m sortByPath) Swap(i, j int)
```

### <a id="sortByLineNumber" href="#sortByLineNumber">type sortByLineNumber []protocol.LineMatch</a>

```
searchKey: search_test.sortByLineNumber
```

```Go
type sortByLineNumber []protocol.LineMatch
```

#### <a id="sortByLineNumber.Len" href="#sortByLineNumber.Len">func (m sortByLineNumber) Len() int</a>

```
searchKey: search_test.sortByLineNumber.Len
```

```Go
func (m sortByLineNumber) Len() int
```

#### <a id="sortByLineNumber.Less" href="#sortByLineNumber.Less">func (m sortByLineNumber) Less(i, j int) bool</a>

```
searchKey: search_test.sortByLineNumber.Less
```

```Go
func (m sortByLineNumber) Less(i, j int) bool
```

#### <a id="sortByLineNumber.Swap" href="#sortByLineNumber.Swap">func (m sortByLineNumber) Swap(i, j int)</a>

```
searchKey: search_test.sortByLineNumber.Swap
```

```Go
func (m sortByLineNumber) Swap(i, j int)
```

## <a id="func" href="#func">Functions</a>

### <a id="addpaxheader" href="#addpaxheader">func addpaxheader(w *tar.Writer, body string) error</a>

```
searchKey: search_test.addpaxheader
```

```Go
func addpaxheader(w *tar.Writer, body string) error
```

### <a id="TestSearch" href="#TestSearch">func TestSearch(t *testing.T)</a>

```
searchKey: search_test.TestSearch
```

```Go
func TestSearch(t *testing.T)
```

### <a id="TestSearch_badrequest" href="#TestSearch_badrequest">func TestSearch_badrequest(t *testing.T)</a>

```
searchKey: search_test.TestSearch_badrequest
```

```Go
func TestSearch_badrequest(t *testing.T)
```

### <a id="doSearch" href="#doSearch">func doSearch(u string, p *protocol.Request) ([]protocol.FileMatch, error)</a>

```
searchKey: search_test.doSearch
```

```Go
func doSearch(u string, p *protocol.Request) ([]protocol.FileMatch, error)
```

### <a id="newStore" href="#newStore">func newStore(files map[string]string) (*store.Store, func(), error)</a>

```
searchKey: search_test.newStore
```

```Go
func newStore(files map[string]string) (*store.Store, func(), error)
```

### <a id="toString" href="#toString">func toString(m []protocol.FileMatch) string</a>

```
searchKey: search_test.toString
```

```Go
func toString(m []protocol.FileMatch) string
```

### <a id="sanityCheckSorted" href="#sanityCheckSorted">func sanityCheckSorted(m []protocol.FileMatch) error</a>

```
searchKey: search_test.sanityCheckSorted
```

```Go
func sanityCheckSorted(m []protocol.FileMatch) error
```

