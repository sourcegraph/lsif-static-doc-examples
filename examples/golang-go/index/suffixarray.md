# Package suffixarray

Package suffixarray implements substring search in logarithmic time using an in-memory suffix array. 

Example use: 

```
// create index for some data
index := suffixarray.New(data)

// lookup byte slice s
offsets1 := index.Lookup(s, -1) // the list of all indices where s occurs in data
offsets2 := index.Lookup(s, 3)  // the list of at most 3 indices where s occurs in data

```
## Index

* [Constants](#const)
    * [const bufSize](#bufSize)
    * [const realMaxData32](#realMaxData32)
* [Variables](#var)
    * [var benchdata](#benchdata)
    * [var benchrand](#benchrand)
    * [var errTooBig](#errTooBig)
    * [var maxData32](#maxData32)
    * [var testCases](#testCases)
* [Types](#type)
    * [type Index struct](#Index)
        * [func New(data []byte) *Index](#New)
        * [func (x *Index) Bytes() []byte](#Index.Bytes)
        * [func (x *Index) FindAllIndex(r *regexp.Regexp, n int) (result [][]int)](#Index.FindAllIndex)
        * [func (x *Index) Lookup(s []byte, n int) (result []int)](#Index.Lookup)
        * [func (x *Index) Read(r io.Reader) error](#Index.Read)
        * [func (x *Index) Write(w io.Writer) error](#Index.Write)
        * [func (x *Index) at(i int) []byte](#Index.at)
        * [func (x *Index) lookupAll(s []byte) ints](#Index.lookupAll)
    * [type index suffixarray.Index](#index)
        * [func (x *index) Len() int](#index.Len)
        * [func (x *index) Less(i, j int) bool](#index.Less)
        * [func (x *index) Swap(i, j int)](#index.Swap)
        * [func (x *index) at(i int) []byte](#index.at)
    * [type ints struct](#ints)
        * [func (a *ints) get(i int) int64](#ints.get)
        * [func (a *ints) len() int](#ints.len)
        * [func (a *ints) set(i int, v int64)](#ints.set)
        * [func (a *ints) slice(i, j int) ints](#ints.slice)
    * [type testCase struct](#testCase)
* [Functions](#func)
    * [func BenchmarkNew(b *testing.B)](#BenchmarkNew)
    * [func BenchmarkSaveRestore(b *testing.B)](#BenchmarkSaveRestore)
    * [func TestIndex32(t *testing.T)](#TestIndex32)
    * [func TestIndex64(t *testing.T)](#TestIndex64)
    * [func TestNew32(t *testing.T)](#TestNew32)
    * [func TestNew64(t *testing.T)](#TestNew64)
    * [func assignID_32(text []int32, sa []int32, numLMS int) int](#assignID_32)
    * [func assignID_64(text []int64, sa []int64, numLMS int) int](#assignID_64)
    * [func assignID_8_32(text []byte, sa []int32, numLMS int) int](#assignID_8_32)
    * [func assignID_8_64(text []byte, sa []int64, numLMS int) int](#assignID_8_64)
    * [func benchmarkNew(b *testing.B, random bool)](#benchmarkNew)
    * [func bucketMax_32(text []int32, freq, bucket []int32)](#bucketMax_32)
    * [func bucketMax_64(text []int64, freq, bucket []int64)](#bucketMax_64)
    * [func bucketMax_8_32(text []byte, freq, bucket []int32)](#bucketMax_8_32)
    * [func bucketMax_8_64(text []byte, freq, bucket []int64)](#bucketMax_8_64)
    * [func bucketMin_32(text []int32, freq, bucket []int32)](#bucketMin_32)
    * [func bucketMin_64(text []int64, freq, bucket []int64)](#bucketMin_64)
    * [func bucketMin_8_32(text []byte, freq, bucket []int32)](#bucketMin_8_32)
    * [func bucketMin_8_64(text []byte, freq, bucket []int64)](#bucketMin_8_64)
    * [func equal(x, y *Index) bool](#equal)
    * [func expand_32(text []int32, freq, bucket, sa []int32, numLMS int)](#expand_32)
    * [func expand_64(text []int64, freq, bucket, sa []int64, numLMS int)](#expand_64)
    * [func expand_8_32(text []byte, freq, bucket, sa []int32, numLMS int)](#expand_8_32)
    * [func expand_8_64(text []byte, freq, bucket, sa []int64, numLMS int)](#expand_8_64)
    * [func find(src, s string, n int) []int](#find)
    * [func freq_32(text []int32, freq, bucket []int32) []int32](#freq_32)
    * [func freq_64(text []int64, freq, bucket []int64) []int64](#freq_64)
    * [func freq_8_32(text []byte, freq, bucket []int32) []int32](#freq_8_32)
    * [func freq_8_64(text []byte, freq, bucket []int64) []int64](#freq_8_64)
    * [func induceL_32(text []int32, sa, freq, bucket []int32)](#induceL_32)
    * [func induceL_64(text []int64, sa, freq, bucket []int64)](#induceL_64)
    * [func induceL_8_32(text []byte, sa, freq, bucket []int32)](#induceL_8_32)
    * [func induceL_8_64(text []byte, sa, freq, bucket []int64)](#induceL_8_64)
    * [func induceS_32(text []int32, sa, freq, bucket []int32)](#induceS_32)
    * [func induceS_64(text []int64, sa, freq, bucket []int64)](#induceS_64)
    * [func induceS_8_32(text []byte, sa, freq, bucket []int32)](#induceS_8_32)
    * [func induceS_8_64(text []byte, sa, freq, bucket []int64)](#induceS_8_64)
    * [func induceSubL_32(text []int32, sa, freq, bucket []int32)](#induceSubL_32)
    * [func induceSubL_64(text []int64, sa, freq, bucket []int64)](#induceSubL_64)
    * [func induceSubL_8_32(text []byte, sa, freq, bucket []int32)](#induceSubL_8_32)
    * [func induceSubL_8_64(text []byte, sa, freq, bucket []int64)](#induceSubL_8_64)
    * [func induceSubS_32(text []int32, sa, freq, bucket []int32)](#induceSubS_32)
    * [func induceSubS_64(text []int64, sa, freq, bucket []int64)](#induceSubS_64)
    * [func induceSubS_8_32(text []byte, sa, freq, bucket []int32)](#induceSubS_8_32)
    * [func induceSubS_8_64(text []byte, sa, freq, bucket []int64)](#induceSubS_8_64)
    * [func length_32(text []int32, sa []int32, numLMS int)](#length_32)
    * [func length_64(text []int64, sa []int64, numLMS int)](#length_64)
    * [func length_8_32(text []byte, sa []int32, numLMS int)](#length_8_32)
    * [func length_8_64(text []byte, sa []int64, numLMS int)](#length_8_64)
    * [func makeText(name string) ([]byte, error)](#makeText)
    * [func map_32(sa []int32, numLMS int)](#map_32)
    * [func map_64(sa []int64, numLMS int)](#map_64)
    * [func placeLMS_32(text []int32, sa, freq, bucket []int32) int](#placeLMS_32)
    * [func placeLMS_64(text []int64, sa, freq, bucket []int64) int](#placeLMS_64)
    * [func placeLMS_8_32(text []byte, sa, freq, bucket []int32) int](#placeLMS_8_32)
    * [func placeLMS_8_64(text []byte, sa, freq, bucket []int64) int](#placeLMS_8_64)
    * [func readInt(r io.Reader, buf []byte) (int64, error)](#readInt)
    * [func readSlice(r io.Reader, buf []byte, data ints) (n int, err error)](#readSlice)
    * [func recurse_32(sa, oldTmp []int32, numLMS, maxID int)](#recurse_32)
    * [func recurse_64(sa, oldTmp []int64, numLMS, maxID int)](#recurse_64)
    * [func sais_32(text []int32, textMax int, sa, tmp []int32)](#sais_32)
    * [func sais_64(text []int64, textMax int, sa, tmp []int64)](#sais_64)
    * [func sais_8_32(text []byte, textMax int, sa, tmp []int32)](#sais_8_32)
    * [func sais_8_64(text []byte, textMax int, sa, tmp []int64)](#sais_8_64)
    * [func setBits(bits int) (cleanup func())](#setBits)
    * [func test(t *testing.T, build func([]byte) []int)](#test)
    * [func testConstruction(t *testing.T, tc *testCase, x *Index)](#testConstruction)
    * [func testFindAllIndex(t *testing.T, tc *testCase, x *Index, rx *regexp.Regexp, n int)](#testFindAllIndex)
    * [func testIndex(t *testing.T)](#testIndex)
    * [func testLookup(t *testing.T, tc *testCase, x *Index, s string, n int)](#testLookup)
    * [func testLookups(t *testing.T, tc *testCase, x *Index, n int)](#testLookups)
    * [func testRec(t *testing.T, x []byte, i, max int, numFail *int, build func([]byte) []int)](#testRec)
    * [func testSA(t *testing.T, x []byte, build func([]byte) []int) bool](#testSA)
    * [func testSaveRestore(t *testing.T, tc *testCase, x *Index) int](#testSaveRestore)
    * [func text_32(text []byte, sa []int32)](#text_32)
    * [func text_64(text []byte, sa []int64)](#text_64)
    * [func unmap_32(text []int32, sa []int32, numLMS int)](#unmap_32)
    * [func unmap_64(text []int64, sa []int64, numLMS int)](#unmap_64)
    * [func unmap_8_32(text []byte, sa []int32, numLMS int)](#unmap_8_32)
    * [func unmap_8_64(text []byte, sa []int64, numLMS int)](#unmap_8_64)
    * [func writeInt(w io.Writer, buf []byte, x int) error](#writeInt)
    * [func writeSlice(w io.Writer, buf []byte, data ints) (n int, err error)](#writeSlice)


## <a id="const" href="#const">Constants</a>

### <a id="bufSize" href="#bufSize">const bufSize</a>

```
searchKey: suffixarray.bufSize
tags: [constant number private]
```

```Go
const bufSize = 16 << 10 // reasonable for BenchmarkSaveRestore

```

### <a id="realMaxData32" href="#realMaxData32">const realMaxData32</a>

```
searchKey: suffixarray.realMaxData32
tags: [constant number private]
```

```Go
const realMaxData32 = math.MaxInt32
```

## <a id="var" href="#var">Variables</a>

### <a id="benchdata" href="#benchdata">var benchdata</a>

```
searchKey: suffixarray.benchdata
tags: [variable array number private]
```

```Go
var benchdata = make([]byte, 1e6)
```

### <a id="benchrand" href="#benchrand">var benchrand</a>

```
searchKey: suffixarray.benchrand
tags: [variable array number private]
```

```Go
var benchrand = make([]byte, 1e6)
```

### <a id="errTooBig" href="#errTooBig">var errTooBig</a>

```
searchKey: suffixarray.errTooBig
tags: [variable interface private]
```

```Go
var errTooBig = errors.New("suffixarray: data too large")
```

### <a id="maxData32" href="#maxData32">var maxData32</a>

```
searchKey: suffixarray.maxData32
tags: [variable number private]
```

```Go
var maxData32 int = realMaxData32
```

Can change for testing 

### <a id="testCases" href="#testCases">var testCases</a>

```
searchKey: suffixarray.testCases
tags: [variable array struct private]
```

```Go
var testCases = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Index" href="#Index">type Index struct</a>

```
searchKey: suffixarray.Index
tags: [struct]
```

```Go
type Index struct {
	data []byte
	sa   ints // suffix array for data; sa.len() == len(data)
}
```

Index implements a suffix array for fast substring search. 

#### <a id="New" href="#New">func New(data []byte) *Index</a>

```
searchKey: suffixarray.New
tags: [function]
```

```Go
func New(data []byte) *Index
```

New creates a new Index for data. Index creation time is O(N) for N = len(data). 

#### <a id="Index.Bytes" href="#Index.Bytes">func (x *Index) Bytes() []byte</a>

```
searchKey: suffixarray.Index.Bytes
tags: [method]
```

```Go
func (x *Index) Bytes() []byte
```

Bytes returns the data over which the index was created. It must not be modified. 

#### <a id="Index.FindAllIndex" href="#Index.FindAllIndex">func (x *Index) FindAllIndex(r *regexp.Regexp, n int) (result [][]int)</a>

```
searchKey: suffixarray.Index.FindAllIndex
tags: [method]
```

```Go
func (x *Index) FindAllIndex(r *regexp.Regexp, n int) (result [][]int)
```

FindAllIndex returns a sorted list of non-overlapping matches of the regular expression r, where a match is a pair of indices specifying the matched slice of x.Bytes(). If n < 0, all matches are returned in successive order. Otherwise, at most n matches are returned and they may not be successive. The result is nil if there are no matches, or if n == 0. 

#### <a id="Index.Lookup" href="#Index.Lookup">func (x *Index) Lookup(s []byte, n int) (result []int)</a>

```
searchKey: suffixarray.Index.Lookup
tags: [method]
```

```Go
func (x *Index) Lookup(s []byte, n int) (result []int)
```

Lookup returns an unsorted list of at most n indices where the byte string s occurs in the indexed data. If n < 0, all occurrences are returned. The result is nil if s is empty, s is not found, or n == 0. Lookup time is O(log(N)*len(s) + len(result)) where N is the size of the indexed data. 

#### <a id="Index.Read" href="#Index.Read">func (x *Index) Read(r io.Reader) error</a>

```
searchKey: suffixarray.Index.Read
tags: [method]
```

```Go
func (x *Index) Read(r io.Reader) error
```

Read reads the index from r into x; x must not be nil. 

#### <a id="Index.Write" href="#Index.Write">func (x *Index) Write(w io.Writer) error</a>

```
searchKey: suffixarray.Index.Write
tags: [method]
```

```Go
func (x *Index) Write(w io.Writer) error
```

Write writes the index x to w. 

#### <a id="Index.at" href="#Index.at">func (x *Index) at(i int) []byte</a>

```
searchKey: suffixarray.Index.at
tags: [method private]
```

```Go
func (x *Index) at(i int) []byte
```

#### <a id="Index.lookupAll" href="#Index.lookupAll">func (x *Index) lookupAll(s []byte) ints</a>

```
searchKey: suffixarray.Index.lookupAll
tags: [method private]
```

```Go
func (x *Index) lookupAll(s []byte) ints
```

lookupAll returns a slice into the matching region of the index. The runtime is O(log(N)*len(s)). 

### <a id="index" href="#index">type index suffixarray.Index</a>

```
searchKey: suffixarray.index
tags: [struct private]
```

```Go
type index Index
```

index is used to hide the sort.Interface 

#### <a id="index.Len" href="#index.Len">func (x *index) Len() int</a>

```
searchKey: suffixarray.index.Len
tags: [method private]
```

```Go
func (x *index) Len() int
```

#### <a id="index.Less" href="#index.Less">func (x *index) Less(i, j int) bool</a>

```
searchKey: suffixarray.index.Less
tags: [method private]
```

```Go
func (x *index) Less(i, j int) bool
```

#### <a id="index.Swap" href="#index.Swap">func (x *index) Swap(i, j int)</a>

```
searchKey: suffixarray.index.Swap
tags: [method private]
```

```Go
func (x *index) Swap(i, j int)
```

#### <a id="index.at" href="#index.at">func (x *index) at(i int) []byte</a>

```
searchKey: suffixarray.index.at
tags: [method private]
```

```Go
func (x *index) at(i int) []byte
```

### <a id="ints" href="#ints">type ints struct</a>

```
searchKey: suffixarray.ints
tags: [struct private]
```

```Go
type ints struct {
	int32 []int32
	int64 []int64
}
```

An ints is either an []int32 or an []int64. That is, one of them is empty, and one is the real data. The int64 form is used when len(data) > maxData32 

#### <a id="ints.get" href="#ints.get">func (a *ints) get(i int) int64</a>

```
searchKey: suffixarray.ints.get
tags: [method private]
```

```Go
func (a *ints) get(i int) int64
```

#### <a id="ints.len" href="#ints.len">func (a *ints) len() int</a>

```
searchKey: suffixarray.ints.len
tags: [method private]
```

```Go
func (a *ints) len() int
```

#### <a id="ints.set" href="#ints.set">func (a *ints) set(i int, v int64)</a>

```
searchKey: suffixarray.ints.set
tags: [method private]
```

```Go
func (a *ints) set(i int, v int64)
```

#### <a id="ints.slice" href="#ints.slice">func (a *ints) slice(i, j int) ints</a>

```
searchKey: suffixarray.ints.slice
tags: [method private]
```

```Go
func (a *ints) slice(i, j int) ints
```

### <a id="testCase" href="#testCase">type testCase struct</a>

```
searchKey: suffixarray.testCase
tags: [struct private]
```

```Go
type testCase struct {
	name     string   // name of test case
	source   string   // source to index
	patterns []string // patterns to lookup
}
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkNew" href="#BenchmarkNew">func BenchmarkNew(b *testing.B)</a>

```
searchKey: suffixarray.BenchmarkNew
tags: [function private benchmark]
```

```Go
func BenchmarkNew(b *testing.B)
```

### <a id="BenchmarkSaveRestore" href="#BenchmarkSaveRestore">func BenchmarkSaveRestore(b *testing.B)</a>

```
searchKey: suffixarray.BenchmarkSaveRestore
tags: [function private benchmark]
```

```Go
func BenchmarkSaveRestore(b *testing.B)
```

### <a id="TestIndex32" href="#TestIndex32">func TestIndex32(t *testing.T)</a>

```
searchKey: suffixarray.TestIndex32
tags: [function private test]
```

```Go
func TestIndex32(t *testing.T)
```

### <a id="TestIndex64" href="#TestIndex64">func TestIndex64(t *testing.T)</a>

```
searchKey: suffixarray.TestIndex64
tags: [function private test]
```

```Go
func TestIndex64(t *testing.T)
```

### <a id="TestNew32" href="#TestNew32">func TestNew32(t *testing.T)</a>

```
searchKey: suffixarray.TestNew32
tags: [function private test]
```

```Go
func TestNew32(t *testing.T)
```

### <a id="TestNew64" href="#TestNew64">func TestNew64(t *testing.T)</a>

```
searchKey: suffixarray.TestNew64
tags: [function private test]
```

```Go
func TestNew64(t *testing.T)
```

### <a id="assignID_32" href="#assignID_32">func assignID_32(text []int32, sa []int32, numLMS int) int</a>

```
searchKey: suffixarray.assignID_32
tags: [function private]
```

```Go
func assignID_32(text []int32, sa []int32, numLMS int) int
```

### <a id="assignID_64" href="#assignID_64">func assignID_64(text []int64, sa []int64, numLMS int) int</a>

```
searchKey: suffixarray.assignID_64
tags: [function private]
```

```Go
func assignID_64(text []int64, sa []int64, numLMS int) int
```

### <a id="assignID_8_32" href="#assignID_8_32">func assignID_8_32(text []byte, sa []int32, numLMS int) int</a>

```
searchKey: suffixarray.assignID_8_32
tags: [function private]
```

```Go
func assignID_8_32(text []byte, sa []int32, numLMS int) int
```

assignID_8_32 assigns a dense ID numbering to the set of LMS-substrings respecting string ordering and equality, returning the maximum assigned ID. For example given the input "ababab", the LMS-substrings are "aba", "aba", and "ab", renumbered as 2 2 1. sa[len(sa)-numLMS:] holds the LMS-substring indexes sorted in string order, so to assign numbers we can consider each in turn, removing adjacent duplicates. The new ID for the LMS-substring at index j is written to sa[j/2], overwriting the length previously stored there (by length_8_32 above). 

### <a id="assignID_8_64" href="#assignID_8_64">func assignID_8_64(text []byte, sa []int64, numLMS int) int</a>

```
searchKey: suffixarray.assignID_8_64
tags: [function private]
```

```Go
func assignID_8_64(text []byte, sa []int64, numLMS int) int
```

### <a id="benchmarkNew" href="#benchmarkNew">func benchmarkNew(b *testing.B, random bool)</a>

```
searchKey: suffixarray.benchmarkNew
tags: [function private]
```

```Go
func benchmarkNew(b *testing.B, random bool)
```

Of all possible inputs, the random bytes have the least amount of substring repetition, and the repeated bytes have the most. For most algorithms, the running time of every input will be between these two. 

### <a id="bucketMax_32" href="#bucketMax_32">func bucketMax_32(text []int32, freq, bucket []int32)</a>

```
searchKey: suffixarray.bucketMax_32
tags: [function private]
```

```Go
func bucketMax_32(text []int32, freq, bucket []int32)
```

### <a id="bucketMax_64" href="#bucketMax_64">func bucketMax_64(text []int64, freq, bucket []int64)</a>

```
searchKey: suffixarray.bucketMax_64
tags: [function private]
```

```Go
func bucketMax_64(text []int64, freq, bucket []int64)
```

### <a id="bucketMax_8_32" href="#bucketMax_8_32">func bucketMax_8_32(text []byte, freq, bucket []int32)</a>

```
searchKey: suffixarray.bucketMax_8_32
tags: [function private]
```

```Go
func bucketMax_8_32(text []byte, freq, bucket []int32)
```

bucketMax_8_32 stores into bucket[c] the maximum index in the bucket for character c in a bucket-sort of text. The bucket indexes for c are [min, max). That is, max is one past the final index in that bucket. 

### <a id="bucketMax_8_64" href="#bucketMax_8_64">func bucketMax_8_64(text []byte, freq, bucket []int64)</a>

```
searchKey: suffixarray.bucketMax_8_64
tags: [function private]
```

```Go
func bucketMax_8_64(text []byte, freq, bucket []int64)
```

### <a id="bucketMin_32" href="#bucketMin_32">func bucketMin_32(text []int32, freq, bucket []int32)</a>

```
searchKey: suffixarray.bucketMin_32
tags: [function private]
```

```Go
func bucketMin_32(text []int32, freq, bucket []int32)
```

### <a id="bucketMin_64" href="#bucketMin_64">func bucketMin_64(text []int64, freq, bucket []int64)</a>

```
searchKey: suffixarray.bucketMin_64
tags: [function private]
```

```Go
func bucketMin_64(text []int64, freq, bucket []int64)
```

### <a id="bucketMin_8_32" href="#bucketMin_8_32">func bucketMin_8_32(text []byte, freq, bucket []int32)</a>

```
searchKey: suffixarray.bucketMin_8_32
tags: [function private]
```

```Go
func bucketMin_8_32(text []byte, freq, bucket []int32)
```

bucketMin_8_32 stores into bucket[c] the minimum index in the bucket for character c in a bucket-sort of text. 

### <a id="bucketMin_8_64" href="#bucketMin_8_64">func bucketMin_8_64(text []byte, freq, bucket []int64)</a>

```
searchKey: suffixarray.bucketMin_8_64
tags: [function private]
```

```Go
func bucketMin_8_64(text []byte, freq, bucket []int64)
```

### <a id="equal" href="#equal">func equal(x, y *Index) bool</a>

```
searchKey: suffixarray.equal
tags: [function private]
```

```Go
func equal(x, y *Index) bool
```

### <a id="expand_32" href="#expand_32">func expand_32(text []int32, freq, bucket, sa []int32, numLMS int)</a>

```
searchKey: suffixarray.expand_32
tags: [function private]
```

```Go
func expand_32(text []int32, freq, bucket, sa []int32, numLMS int)
```

### <a id="expand_64" href="#expand_64">func expand_64(text []int64, freq, bucket, sa []int64, numLMS int)</a>

```
searchKey: suffixarray.expand_64
tags: [function private]
```

```Go
func expand_64(text []int64, freq, bucket, sa []int64, numLMS int)
```

### <a id="expand_8_32" href="#expand_8_32">func expand_8_32(text []byte, freq, bucket, sa []int32, numLMS int)</a>

```
searchKey: suffixarray.expand_8_32
tags: [function private]
```

```Go
func expand_8_32(text []byte, freq, bucket, sa []int32, numLMS int)
```

expand_8_32 distributes the compacted, sorted LMS-suffix indexes from sa[:numLMS] into the tops of the appropriate buckets in sa, preserving the sorted order and making room for the L-type indexes to be slotted into the sorted sequence by induceL_8_32. 

### <a id="expand_8_64" href="#expand_8_64">func expand_8_64(text []byte, freq, bucket, sa []int64, numLMS int)</a>

```
searchKey: suffixarray.expand_8_64
tags: [function private]
```

```Go
func expand_8_64(text []byte, freq, bucket, sa []int64, numLMS int)
```

### <a id="find" href="#find">func find(src, s string, n int) []int</a>

```
searchKey: suffixarray.find
tags: [function private]
```

```Go
func find(src, s string, n int) []int
```

find all occurrences of s in source; report at most n occurrences 

### <a id="freq_32" href="#freq_32">func freq_32(text []int32, freq, bucket []int32) []int32</a>

```
searchKey: suffixarray.freq_32
tags: [function private]
```

```Go
func freq_32(text []int32, freq, bucket []int32) []int32
```

### <a id="freq_64" href="#freq_64">func freq_64(text []int64, freq, bucket []int64) []int64</a>

```
searchKey: suffixarray.freq_64
tags: [function private]
```

```Go
func freq_64(text []int64, freq, bucket []int64) []int64
```

### <a id="freq_8_32" href="#freq_8_32">func freq_8_32(text []byte, freq, bucket []int32) []int32</a>

```
searchKey: suffixarray.freq_8_32
tags: [function private]
```

```Go
func freq_8_32(text []byte, freq, bucket []int32) []int32
```

freq_8_32 returns the character frequencies for text, as a slice indexed by character value. If freq is nil, freq_8_32 uses and returns bucket. If freq is non-nil, freq_8_32 assumes that freq[0] >= 0 means the frequencies are already computed. If the frequency data is overwritten or uninitialized, the caller must set freq[0] = -1 to force recomputation the next time it is needed. 

### <a id="freq_8_64" href="#freq_8_64">func freq_8_64(text []byte, freq, bucket []int64) []int64</a>

```
searchKey: suffixarray.freq_8_64
tags: [function private]
```

```Go
func freq_8_64(text []byte, freq, bucket []int64) []int64
```

### <a id="induceL_32" href="#induceL_32">func induceL_32(text []int32, sa, freq, bucket []int32)</a>

```
searchKey: suffixarray.induceL_32
tags: [function private]
```

```Go
func induceL_32(text []int32, sa, freq, bucket []int32)
```

### <a id="induceL_64" href="#induceL_64">func induceL_64(text []int64, sa, freq, bucket []int64)</a>

```
searchKey: suffixarray.induceL_64
tags: [function private]
```

```Go
func induceL_64(text []int64, sa, freq, bucket []int64)
```

### <a id="induceL_8_32" href="#induceL_8_32">func induceL_8_32(text []byte, sa, freq, bucket []int32)</a>

```
searchKey: suffixarray.induceL_8_32
tags: [function private]
```

```Go
func induceL_8_32(text []byte, sa, freq, bucket []int32)
```

induceL_8_32 inserts L-type text indexes into sa, assuming that the leftmost S-type indexes are inserted into sa, in sorted order, in the right bucket halves. It leaves all the L-type indexes in sa, but the leftmost L-type indexes are negated, to mark them for processing by induceS_8_32. 

### <a id="induceL_8_64" href="#induceL_8_64">func induceL_8_64(text []byte, sa, freq, bucket []int64)</a>

```
searchKey: suffixarray.induceL_8_64
tags: [function private]
```

```Go
func induceL_8_64(text []byte, sa, freq, bucket []int64)
```

### <a id="induceS_32" href="#induceS_32">func induceS_32(text []int32, sa, freq, bucket []int32)</a>

```
searchKey: suffixarray.induceS_32
tags: [function private]
```

```Go
func induceS_32(text []int32, sa, freq, bucket []int32)
```

### <a id="induceS_64" href="#induceS_64">func induceS_64(text []int64, sa, freq, bucket []int64)</a>

```
searchKey: suffixarray.induceS_64
tags: [function private]
```

```Go
func induceS_64(text []int64, sa, freq, bucket []int64)
```

### <a id="induceS_8_32" href="#induceS_8_32">func induceS_8_32(text []byte, sa, freq, bucket []int32)</a>

```
searchKey: suffixarray.induceS_8_32
tags: [function private]
```

```Go
func induceS_8_32(text []byte, sa, freq, bucket []int32)
```

### <a id="induceS_8_64" href="#induceS_8_64">func induceS_8_64(text []byte, sa, freq, bucket []int64)</a>

```
searchKey: suffixarray.induceS_8_64
tags: [function private]
```

```Go
func induceS_8_64(text []byte, sa, freq, bucket []int64)
```

### <a id="induceSubL_32" href="#induceSubL_32">func induceSubL_32(text []int32, sa, freq, bucket []int32)</a>

```
searchKey: suffixarray.induceSubL_32
tags: [function private]
```

```Go
func induceSubL_32(text []int32, sa, freq, bucket []int32)
```

### <a id="induceSubL_64" href="#induceSubL_64">func induceSubL_64(text []int64, sa, freq, bucket []int64)</a>

```
searchKey: suffixarray.induceSubL_64
tags: [function private]
```

```Go
func induceSubL_64(text []int64, sa, freq, bucket []int64)
```

### <a id="induceSubL_8_32" href="#induceSubL_8_32">func induceSubL_8_32(text []byte, sa, freq, bucket []int32)</a>

```
searchKey: suffixarray.induceSubL_8_32
tags: [function private]
```

```Go
func induceSubL_8_32(text []byte, sa, freq, bucket []int32)
```

induceSubL_8_32 inserts the L-type text indexes of LMS-substrings into sa, assuming that the final characters of the LMS-substrings are already inserted into sa, sorted by final character, and at the right (not left) end of the corresponding character bucket. Each LMS-substring has the form (as a regexp) /S+L+S/: one or more S-type, one or more L-type, final S-type. induceSubL_8_32 leaves behind only the leftmost L-type text index for each LMS-substring. That is, it removes the final S-type indexes that are present on entry, and it inserts but then removes the interior L-type indexes too. (Only the leftmost L-type index is needed by induceSubS_8_32.) 

### <a id="induceSubL_8_64" href="#induceSubL_8_64">func induceSubL_8_64(text []byte, sa, freq, bucket []int64)</a>

```
searchKey: suffixarray.induceSubL_8_64
tags: [function private]
```

```Go
func induceSubL_8_64(text []byte, sa, freq, bucket []int64)
```

### <a id="induceSubS_32" href="#induceSubS_32">func induceSubS_32(text []int32, sa, freq, bucket []int32)</a>

```
searchKey: suffixarray.induceSubS_32
tags: [function private]
```

```Go
func induceSubS_32(text []int32, sa, freq, bucket []int32)
```

### <a id="induceSubS_64" href="#induceSubS_64">func induceSubS_64(text []int64, sa, freq, bucket []int64)</a>

```
searchKey: suffixarray.induceSubS_64
tags: [function private]
```

```Go
func induceSubS_64(text []int64, sa, freq, bucket []int64)
```

### <a id="induceSubS_8_32" href="#induceSubS_8_32">func induceSubS_8_32(text []byte, sa, freq, bucket []int32)</a>

```
searchKey: suffixarray.induceSubS_8_32
tags: [function private]
```

```Go
func induceSubS_8_32(text []byte, sa, freq, bucket []int32)
```

induceSubS_8_32 inserts the S-type text indexes of LMS-substrings into sa, assuming that the leftmost L-type text indexes are already inserted into sa, sorted by LMS-substring suffix, and at the left end of the corresponding character bucket. Each LMS-substring has the form (as a regexp) /S+L+S/: one or more S-type, one or more L-type, final S-type. induceSubS_8_32 leaves behind only the leftmost S-type text index for each LMS-substring, in sorted order, at the right end of sa. That is, it removes the L-type indexes that are present on entry, and it inserts but then removes the interior S-type indexes too, leaving the LMS-substring start indexes packed into sa[len(sa)-numLMS:]. (Only the LMS-substring start indexes are processed by the recursion.) 

### <a id="induceSubS_8_64" href="#induceSubS_8_64">func induceSubS_8_64(text []byte, sa, freq, bucket []int64)</a>

```
searchKey: suffixarray.induceSubS_8_64
tags: [function private]
```

```Go
func induceSubS_8_64(text []byte, sa, freq, bucket []int64)
```

### <a id="length_32" href="#length_32">func length_32(text []int32, sa []int32, numLMS int)</a>

```
searchKey: suffixarray.length_32
tags: [function private]
```

```Go
func length_32(text []int32, sa []int32, numLMS int)
```

### <a id="length_64" href="#length_64">func length_64(text []int64, sa []int64, numLMS int)</a>

```
searchKey: suffixarray.length_64
tags: [function private]
```

```Go
func length_64(text []int64, sa []int64, numLMS int)
```

### <a id="length_8_32" href="#length_8_32">func length_8_32(text []byte, sa []int32, numLMS int)</a>

```
searchKey: suffixarray.length_8_32
tags: [function private]
```

```Go
func length_8_32(text []byte, sa []int32, numLMS int)
```

length_8_32 computes and records the length of each LMS-substring in text. The length of the LMS-substring at index j is stored at sa[j/2], avoiding the LMS-substring indexes already stored in the top half of sa. (If index j is an LMS-substring start, then index j-1 is type L and cannot be.) There are two exceptions, made for optimizations in name_8_32 below. 

First, the final LMS-substring is recorded as having length 0, which is otherwise impossible, instead of giving it a length that includes the implicit sentinel. This ensures the final LMS-substring has length unequal to all others and therefore can be detected as different without text comparison (it is unequal because it is the only one that ends in the implicit sentinel, and the text comparison would be problematic since the implicit sentinel is not actually present at text[len(text)]). 

Second, to avoid text comparison entirely, if an LMS-substring is very short, sa[j/2] records its actual text instead of its length, so that if two such substrings have matching “length,” the text need not be read at all. The definition of “very short” is that the text bytes must pack into an uint32, and the unsigned encoding e must be ≥ len(text), so that it can be distinguished from a valid length. 

### <a id="length_8_64" href="#length_8_64">func length_8_64(text []byte, sa []int64, numLMS int)</a>

```
searchKey: suffixarray.length_8_64
tags: [function private]
```

```Go
func length_8_64(text []byte, sa []int64, numLMS int)
```

### <a id="makeText" href="#makeText">func makeText(name string) ([]byte, error)</a>

```
searchKey: suffixarray.makeText
tags: [function private]
```

```Go
func makeText(name string) ([]byte, error)
```

### <a id="map_32" href="#map_32">func map_32(sa []int32, numLMS int)</a>

```
searchKey: suffixarray.map_32
tags: [function private]
```

```Go
func map_32(sa []int32, numLMS int)
```

map_32 maps the LMS-substrings in text to their new IDs, producing the subproblem for the recursion. The mapping itself was mostly applied by assignID_8_32: sa[i] is either 0, the ID for the LMS-substring at index 2*i, or the ID for the LMS-substring at index 2*i+1. To produce the subproblem we need only remove the zeros and change ID into ID-1 (our IDs start at 1, but text chars start at 0). 

map_32 packs the result, which is the input to the recursion, into the top of sa, so that the recursion result can be stored in the bottom of sa, which sets up for expand_8_32 well. 

### <a id="map_64" href="#map_64">func map_64(sa []int64, numLMS int)</a>

```
searchKey: suffixarray.map_64
tags: [function private]
```

```Go
func map_64(sa []int64, numLMS int)
```

### <a id="placeLMS_32" href="#placeLMS_32">func placeLMS_32(text []int32, sa, freq, bucket []int32) int</a>

```
searchKey: suffixarray.placeLMS_32
tags: [function private]
```

```Go
func placeLMS_32(text []int32, sa, freq, bucket []int32) int
```

### <a id="placeLMS_64" href="#placeLMS_64">func placeLMS_64(text []int64, sa, freq, bucket []int64) int</a>

```
searchKey: suffixarray.placeLMS_64
tags: [function private]
```

```Go
func placeLMS_64(text []int64, sa, freq, bucket []int64) int
```

### <a id="placeLMS_8_32" href="#placeLMS_8_32">func placeLMS_8_32(text []byte, sa, freq, bucket []int32) int</a>

```
searchKey: suffixarray.placeLMS_8_32
tags: [function private]
```

```Go
func placeLMS_8_32(text []byte, sa, freq, bucket []int32) int
```

placeLMS_8_32 places into sa the indexes of the final characters of the LMS substrings of text, sorted into the rightmost ends of their correct buckets in the suffix array. 

The imaginary sentinel character at the end of the text is the final character of the final LMS substring, but there is no bucket for the imaginary sentinel character, which has a smaller value than any real character. The caller must therefore pretend that sa[-1] == len(text). 

The text indexes of LMS-substring characters are always ≥ 1 (the first LMS-substring must be preceded by one or more L-type characters that are not part of any LMS-substring), so using 0 as a “not present” suffix array entry is safe, both in this function and in most later functions (until induceL_8_32 below). 

### <a id="placeLMS_8_64" href="#placeLMS_8_64">func placeLMS_8_64(text []byte, sa, freq, bucket []int64) int</a>

```
searchKey: suffixarray.placeLMS_8_64
tags: [function private]
```

```Go
func placeLMS_8_64(text []byte, sa, freq, bucket []int64) int
```

### <a id="readInt" href="#readInt">func readInt(r io.Reader, buf []byte) (int64, error)</a>

```
searchKey: suffixarray.readInt
tags: [function private]
```

```Go
func readInt(r io.Reader, buf []byte) (int64, error)
```

readInt reads an int x from r using buf to buffer the read and returns x. 

### <a id="readSlice" href="#readSlice">func readSlice(r io.Reader, buf []byte, data ints) (n int, err error)</a>

```
searchKey: suffixarray.readSlice
tags: [function private]
```

```Go
func readSlice(r io.Reader, buf []byte, data ints) (n int, err error)
```

readSlice reads data[:n] from r and returns n. It uses buf to buffer the read. 

### <a id="recurse_32" href="#recurse_32">func recurse_32(sa, oldTmp []int32, numLMS, maxID int)</a>

```
searchKey: suffixarray.recurse_32
tags: [function private]
```

```Go
func recurse_32(sa, oldTmp []int32, numLMS, maxID int)
```

recurse_32 calls sais_32 recursively to solve the subproblem we've built. The subproblem is at the right end of sa, the suffix array result will be written at the left end of sa, and the middle of sa is available for use as temporary frequency and bucket storage. 

### <a id="recurse_64" href="#recurse_64">func recurse_64(sa, oldTmp []int64, numLMS, maxID int)</a>

```
searchKey: suffixarray.recurse_64
tags: [function private]
```

```Go
func recurse_64(sa, oldTmp []int64, numLMS, maxID int)
```

### <a id="sais_32" href="#sais_32">func sais_32(text []int32, textMax int, sa, tmp []int32)</a>

```
searchKey: suffixarray.sais_32
tags: [function private]
```

```Go
func sais_32(text []int32, textMax int, sa, tmp []int32)
```

### <a id="sais_64" href="#sais_64">func sais_64(text []int64, textMax int, sa, tmp []int64)</a>

```
searchKey: suffixarray.sais_64
tags: [function private]
```

```Go
func sais_64(text []int64, textMax int, sa, tmp []int64)
```

### <a id="sais_8_32" href="#sais_8_32">func sais_8_32(text []byte, textMax int, sa, tmp []int32)</a>

```
searchKey: suffixarray.sais_8_32
tags: [function private]
```

```Go
func sais_8_32(text []byte, textMax int, sa, tmp []int32)
```

sais_8_32 computes the suffix array of text. The text must contain only values in [0, textMax). The suffix array is stored in sa, which the caller must ensure is already zeroed. The caller must also provide temporary space tmp with len(tmp) ≥ textMax. If len(tmp) ≥ 2*textMax then the algorithm runs a little faster. If sais_8_32 modifies tmp, it sets tmp[0] = -1 on return. 

### <a id="sais_8_64" href="#sais_8_64">func sais_8_64(text []byte, textMax int, sa, tmp []int64)</a>

```
searchKey: suffixarray.sais_8_64
tags: [function private]
```

```Go
func sais_8_64(text []byte, textMax int, sa, tmp []int64)
```

### <a id="setBits" href="#setBits">func setBits(bits int) (cleanup func())</a>

```
searchKey: suffixarray.setBits
tags: [function private]
```

```Go
func setBits(bits int) (cleanup func())
```

### <a id="test" href="#test">func test(t *testing.T, build func([]byte) []int)</a>

```
searchKey: suffixarray.test
tags: [function private]
```

```Go
func test(t *testing.T, build func([]byte) []int)
```

test tests an arbitrary suffix array construction function. Generates many inputs, builds and checks suffix arrays. 

### <a id="testConstruction" href="#testConstruction">func testConstruction(t *testing.T, tc *testCase, x *Index)</a>

```
searchKey: suffixarray.testConstruction
tags: [function private]
```

```Go
func testConstruction(t *testing.T, tc *testCase, x *Index)
```

### <a id="testFindAllIndex" href="#testFindAllIndex">func testFindAllIndex(t *testing.T, tc *testCase, x *Index, rx *regexp.Regexp, n int)</a>

```
searchKey: suffixarray.testFindAllIndex
tags: [function private]
```

```Go
func testFindAllIndex(t *testing.T, tc *testCase, x *Index, rx *regexp.Regexp, n int)
```

### <a id="testIndex" href="#testIndex">func testIndex(t *testing.T)</a>

```
searchKey: suffixarray.testIndex
tags: [function private]
```

```Go
func testIndex(t *testing.T)
```

### <a id="testLookup" href="#testLookup">func testLookup(t *testing.T, tc *testCase, x *Index, s string, n int)</a>

```
searchKey: suffixarray.testLookup
tags: [function private]
```

```Go
func testLookup(t *testing.T, tc *testCase, x *Index, s string, n int)
```

### <a id="testLookups" href="#testLookups">func testLookups(t *testing.T, tc *testCase, x *Index, n int)</a>

```
searchKey: suffixarray.testLookups
tags: [function private]
```

```Go
func testLookups(t *testing.T, tc *testCase, x *Index, n int)
```

### <a id="testRec" href="#testRec">func testRec(t *testing.T, x []byte, i, max int, numFail *int, build func([]byte) []int)</a>

```
searchKey: suffixarray.testRec
tags: [function private]
```

```Go
func testRec(t *testing.T, x []byte, i, max int, numFail *int, build func([]byte) []int)
```

testRec fills x[i:] with all possible combinations of values in [1,max] and then calls testSA(t, x, build) for each one. 

### <a id="testSA" href="#testSA">func testSA(t *testing.T, x []byte, build func([]byte) []int) bool</a>

```
searchKey: suffixarray.testSA
tags: [function private]
```

```Go
func testSA(t *testing.T, x []byte, build func([]byte) []int) bool
```

testSA tests the suffix array build function on the input x. It constructs the suffix array and then checks that it is correct. 

### <a id="testSaveRestore" href="#testSaveRestore">func testSaveRestore(t *testing.T, tc *testCase, x *Index) int</a>

```
searchKey: suffixarray.testSaveRestore
tags: [function private]
```

```Go
func testSaveRestore(t *testing.T, tc *testCase, x *Index) int
```

returns the serialized index size 

### <a id="text_32" href="#text_32">func text_32(text []byte, sa []int32)</a>

```
searchKey: suffixarray.text_32
tags: [function private]
```

```Go
func text_32(text []byte, sa []int32)
```

text_32 returns the suffix array for the input text. It requires that len(text) fit in an int32 and that the caller zero sa. 

### <a id="text_64" href="#text_64">func text_64(text []byte, sa []int64)</a>

```
searchKey: suffixarray.text_64
tags: [function private]
```

```Go
func text_64(text []byte, sa []int64)
```

### <a id="unmap_32" href="#unmap_32">func unmap_32(text []int32, sa []int32, numLMS int)</a>

```
searchKey: suffixarray.unmap_32
tags: [function private]
```

```Go
func unmap_32(text []int32, sa []int32, numLMS int)
```

### <a id="unmap_64" href="#unmap_64">func unmap_64(text []int64, sa []int64, numLMS int)</a>

```
searchKey: suffixarray.unmap_64
tags: [function private]
```

```Go
func unmap_64(text []int64, sa []int64, numLMS int)
```

### <a id="unmap_8_32" href="#unmap_8_32">func unmap_8_32(text []byte, sa []int32, numLMS int)</a>

```
searchKey: suffixarray.unmap_8_32
tags: [function private]
```

```Go
func unmap_8_32(text []byte, sa []int32, numLMS int)
```

unmap_8_32 unmaps the subproblem back to the original. sa[:numLMS] is the LMS-substring numbers, which don't matter much anymore. sa[len(sa)-numLMS:] is the sorted list of those LMS-substring numbers. The key part is that if the list says K that means the K'th substring. We can replace sa[:numLMS] with the indexes of the LMS-substrings. Then if the list says K it really means sa[K]. Having mapped the list back to LMS-substring indexes, we can place those into the right buckets. 

### <a id="unmap_8_64" href="#unmap_8_64">func unmap_8_64(text []byte, sa []int64, numLMS int)</a>

```
searchKey: suffixarray.unmap_8_64
tags: [function private]
```

```Go
func unmap_8_64(text []byte, sa []int64, numLMS int)
```

### <a id="writeInt" href="#writeInt">func writeInt(w io.Writer, buf []byte, x int) error</a>

```
searchKey: suffixarray.writeInt
tags: [function private]
```

```Go
func writeInt(w io.Writer, buf []byte, x int) error
```

writeInt writes an int x to w using buf to buffer the write. 

### <a id="writeSlice" href="#writeSlice">func writeSlice(w io.Writer, buf []byte, data ints) (n int, err error)</a>

```
searchKey: suffixarray.writeSlice
tags: [function private]
```

```Go
func writeSlice(w io.Writer, buf []byte, data ints) (n int, err error)
```

writeSlice writes data[:n] to w and returns n. It uses buf to buffer the write. 

