# Package strings

Package strings implements simple functions to manipulate UTF-8 encoded strings. 

For information about UTF-8 strings in Go, see [https://blog.golang.org/strings](https://blog.golang.org/strings). 

## Index

* [Constants](#const)
    * [const countCutOff](#countCutOff)
* [Variables](#var)
    * [var asciiSpace](#asciiSpace)
* [Types](#type)
    * [type Builder struct](#Builder)
        * [func (b *Builder) copyCheck()](#Builder.copyCheck)
        * [func (b *Builder) String() string](#Builder.String)
        * [func (b *Builder) Len() int](#Builder.Len)
        * [func (b *Builder) Cap() int](#Builder.Cap)
        * [func (b *Builder) Reset()](#Builder.Reset)
        * [func (b *Builder) grow(n int)](#Builder.grow)
        * [func (b *Builder) Grow(n int)](#Builder.Grow)
        * [func (b *Builder) Write(p []byte) (int, error)](#Builder.Write)
        * [func (b *Builder) WriteByte(c byte) error](#Builder.WriteByte)
        * [func (b *Builder) WriteRune(r rune) (int, error)](#Builder.WriteRune)
        * [func (b *Builder) WriteString(s string) (int, error)](#Builder.WriteString)
    * [type Reader struct](#Reader)
        * [func NewReader(s string) *Reader](#NewReader)
        * [func (r *Reader) Len() int](#Reader.Len)
        * [func (r *Reader) Size() int64](#Reader.Size)
        * [func (r *Reader) Read(b []byte) (n int, err error)](#Reader.Read)
        * [func (r *Reader) ReadAt(b []byte, off int64) (n int, err error)](#Reader.ReadAt)
        * [func (r *Reader) ReadByte() (byte, error)](#Reader.ReadByte)
        * [func (r *Reader) UnreadByte() error](#Reader.UnreadByte)
        * [func (r *Reader) ReadRune() (ch rune, size int, err error)](#Reader.ReadRune)
        * [func (r *Reader) UnreadRune() error](#Reader.UnreadRune)
        * [func (r *Reader) Seek(offset int64, whence int) (int64, error)](#Reader.Seek)
        * [func (r *Reader) WriteTo(w io.Writer) (n int64, err error)](#Reader.WriteTo)
        * [func (r *Reader) Reset(s string)](#Reader.Reset)
    * [type Replacer struct](#Replacer)
        * [func NewReplacer(oldnew ...string) *Replacer](#NewReplacer)
        * [func (r *Replacer) buildOnce()](#Replacer.buildOnce)
        * [func (b *Replacer) build() replacer](#Replacer.build)
        * [func (r *Replacer) Replace(s string) string](#Replacer.Replace)
        * [func (r *Replacer) WriteString(w io.Writer, s string) (n int, err error)](#Replacer.WriteString)
        * [func (r *Replacer) Replacer() interface{}](#Replacer.Replacer)
        * [func (r *Replacer) PrintTrie() string](#Replacer.PrintTrie)
    * [type replacer interface](#replacer)
    * [type trieNode struct](#trieNode)
        * [func (t *trieNode) add(key, val string, priority int, r *genericReplacer)](#trieNode.add)
    * [type genericReplacer struct](#genericReplacer)
        * [func makeGenericReplacer(oldnew []string) *genericReplacer](#makeGenericReplacer)
        * [func (r *genericReplacer) lookup(s string, ignoreRoot bool) (val string, keylen int, found bool)](#genericReplacer.lookup)
        * [func (r *genericReplacer) Replace(s string) string](#genericReplacer.Replace)
        * [func (r *genericReplacer) WriteString(w io.Writer, s string) (n int, err error)](#genericReplacer.WriteString)
        * [func (r *genericReplacer) printNode(t *trieNode, depth int) (s string)](#genericReplacer.printNode)
    * [type appendSliceWriter []byte](#appendSliceWriter)
        * [func (w *appendSliceWriter) Write(p []byte) (int, error)](#appendSliceWriter.Write)
        * [func (w *appendSliceWriter) WriteString(s string) (int, error)](#appendSliceWriter.WriteString)
    * [type stringWriter struct](#stringWriter)
        * [func (w stringWriter) WriteString(s string) (int, error)](#stringWriter.WriteString)
    * [type singleStringReplacer struct](#singleStringReplacer)
        * [func makeSingleStringReplacer(pattern string, value string) *singleStringReplacer](#makeSingleStringReplacer)
        * [func (r *singleStringReplacer) Replace(s string) string](#singleStringReplacer.Replace)
        * [func (r *singleStringReplacer) WriteString(w io.Writer, s string) (n int, err error)](#singleStringReplacer.WriteString)
    * [type byteReplacer [256]byte](#byteReplacer)
        * [func (r *byteReplacer) Replace(s string) string](#byteReplacer.Replace)
        * [func (r *byteReplacer) WriteString(w io.Writer, s string) (n int, err error)](#byteReplacer.WriteString)
    * [type byteStringReplacer struct](#byteStringReplacer)
        * [func (r *byteStringReplacer) Replace(s string) string](#byteStringReplacer.Replace)
        * [func (r *byteStringReplacer) WriteString(w io.Writer, s string) (n int, err error)](#byteStringReplacer.WriteString)
    * [type stringFinder struct](#stringFinder)
        * [func makeStringFinder(pattern string) *stringFinder](#makeStringFinder)
        * [func (f *stringFinder) next(text string) int](#stringFinder.next)
    * [type asciiSet [8]uint32](#asciiSet)
        * [func makeASCIISet(chars string) (as asciiSet, ok bool)](#makeASCIISet)
        * [func (as *asciiSet) contains(c byte) bool](#asciiSet.contains)
* [Functions](#func)
    * [func noescape(p unsafe.Pointer) unsafe.Pointer](#noescape)
    * [func Compare(a, b string) int](#Compare)
    * [func getStringWriter(w io.Writer) io.StringWriter](#getStringWriter)
    * [func longestCommonSuffix(a, b string) (i int)](#longestCommonSuffix)
    * [func max(a, b int) int](#max)
    * [func explode(s string, n int) []string](#explode)
    * [func Count(s, substr string) int](#Count)
    * [func Contains(s, substr string) bool](#Contains)
    * [func ContainsAny(s, chars string) bool](#ContainsAny)
    * [func ContainsRune(s string, r rune) bool](#ContainsRune)
    * [func LastIndex(s, substr string) int](#LastIndex)
    * [func IndexByte(s string, c byte) int](#IndexByte)
    * [func IndexRune(s string, r rune) int](#IndexRune)
    * [func IndexAny(s, chars string) int](#IndexAny)
    * [func LastIndexAny(s, chars string) int](#LastIndexAny)
    * [func LastIndexByte(s string, c byte) int](#LastIndexByte)
    * [func genSplit(s, sep string, sepSave, n int) []string](#genSplit)
    * [func SplitN(s, sep string, n int) []string](#SplitN)
    * [func SplitAfterN(s, sep string, n int) []string](#SplitAfterN)
    * [func Split(s, sep string) []string](#Split)
    * [func SplitAfter(s, sep string) []string](#SplitAfter)
    * [func Fields(s string) []string](#Fields)
    * [func FieldsFunc(s string, f func(rune) bool) []string](#FieldsFunc)
    * [func Join(elems []string, sep string) string](#Join)
    * [func HasPrefix(s, prefix string) bool](#HasPrefix)
    * [func HasSuffix(s, suffix string) bool](#HasSuffix)
    * [func Map(mapping func(rune) rune, s string) string](#Map)
    * [func Repeat(s string, count int) string](#Repeat)
    * [func ToUpper(s string) string](#ToUpper)
    * [func ToLower(s string) string](#ToLower)
    * [func ToTitle(s string) string](#ToTitle)
    * [func ToUpperSpecial(c unicode.SpecialCase, s string) string](#ToUpperSpecial)
    * [func ToLowerSpecial(c unicode.SpecialCase, s string) string](#ToLowerSpecial)
    * [func ToTitleSpecial(c unicode.SpecialCase, s string) string](#ToTitleSpecial)
    * [func ToValidUTF8(s, replacement string) string](#ToValidUTF8)
    * [func isSeparator(r rune) bool](#isSeparator)
    * [func Title(s string) string](#Title)
    * [func TrimLeftFunc(s string, f func(rune) bool) string](#TrimLeftFunc)
    * [func TrimRightFunc(s string, f func(rune) bool) string](#TrimRightFunc)
    * [func TrimFunc(s string, f func(rune) bool) string](#TrimFunc)
    * [func IndexFunc(s string, f func(rune) bool) int](#IndexFunc)
    * [func LastIndexFunc(s string, f func(rune) bool) int](#LastIndexFunc)
    * [func indexFunc(s string, f func(rune) bool, truth bool) int](#indexFunc)
    * [func lastIndexFunc(s string, f func(rune) bool, truth bool) int](#lastIndexFunc)
    * [func makeCutsetFunc(cutset string) func(rune) bool](#makeCutsetFunc)
    * [func Trim(s, cutset string) string](#Trim)
    * [func TrimLeft(s, cutset string) string](#TrimLeft)
    * [func TrimRight(s, cutset string) string](#TrimRight)
    * [func TrimSpace(s string) string](#TrimSpace)
    * [func TrimPrefix(s, prefix string) string](#TrimPrefix)
    * [func TrimSuffix(s, suffix string) string](#TrimSuffix)
    * [func Replace(s, old, new string, n int) string](#Replace)
    * [func ReplaceAll(s, old, new string) string](#ReplaceAll)
    * [func EqualFold(s, t string) bool](#EqualFold)
    * [func Index(s, substr string) int](#Index)
    * [func StringFind(pattern, text string) int](#StringFind)
    * [func DumpTables(pattern string) ([]int, []int)](#DumpTables)


## <a id="const" href="#const">Constants</a>

### <a id="countCutOff" href="#countCutOff">const countCutOff</a>

```
searchKey: strings.countCutOff
tags: [private]
```

```Go
const countCutOff = 8
```

countCutOff controls the ratio of a string length to a number of replacements at which (*byteStringReplacer).Replace switches algorithms. For strings with higher ration of length to replacements than that value, we call Count, for each replacement from toReplace. For strings, with a lower ratio we use simple loop, because of Count overhead. countCutOff is an empirically determined overhead multiplier. TODO(tocarip) revisit once we have register-based abi/mid-stack inlining. 

## <a id="var" href="#var">Variables</a>

### <a id="asciiSpace" href="#asciiSpace">var asciiSpace</a>

```
searchKey: strings.asciiSpace
tags: [private]
```

```Go
var asciiSpace = [256]uint8{'\t': 1, '\n': 1, '\v': 1, '\f': 1, '\r': 1, ' ': 1}
```

## <a id="type" href="#type">Types</a>

### <a id="Builder" href="#Builder">type Builder struct</a>

```
searchKey: strings.Builder
```

```Go
type Builder struct {
	addr *Builder // of receiver, to detect copies by value
	buf  []byte
}
```

A Builder is used to efficiently build a string using Write methods. It minimizes memory copying. The zero value is ready to use. Do not copy a non-zero Builder. 

#### <a id="Builder.copyCheck" href="#Builder.copyCheck">func (b *Builder) copyCheck()</a>

```
searchKey: strings.Builder.copyCheck
tags: [private]
```

```Go
func (b *Builder) copyCheck()
```

#### <a id="Builder.String" href="#Builder.String">func (b *Builder) String() string</a>

```
searchKey: strings.Builder.String
```

```Go
func (b *Builder) String() string
```

String returns the accumulated string. 

#### <a id="Builder.Len" href="#Builder.Len">func (b *Builder) Len() int</a>

```
searchKey: strings.Builder.Len
```

```Go
func (b *Builder) Len() int
```

Len returns the number of accumulated bytes; b.Len() == len(b.String()). 

#### <a id="Builder.Cap" href="#Builder.Cap">func (b *Builder) Cap() int</a>

```
searchKey: strings.Builder.Cap
```

```Go
func (b *Builder) Cap() int
```

Cap returns the capacity of the builder's underlying byte slice. It is the total space allocated for the string being built and includes any bytes already written. 

#### <a id="Builder.Reset" href="#Builder.Reset">func (b *Builder) Reset()</a>

```
searchKey: strings.Builder.Reset
```

```Go
func (b *Builder) Reset()
```

Reset resets the Builder to be empty. 

#### <a id="Builder.grow" href="#Builder.grow">func (b *Builder) grow(n int)</a>

```
searchKey: strings.Builder.grow
tags: [private]
```

```Go
func (b *Builder) grow(n int)
```

grow copies the buffer to a new, larger buffer so that there are at least n bytes of capacity beyond len(b.buf). 

#### <a id="Builder.Grow" href="#Builder.Grow">func (b *Builder) Grow(n int)</a>

```
searchKey: strings.Builder.Grow
```

```Go
func (b *Builder) Grow(n int)
```

Grow grows b's capacity, if necessary, to guarantee space for another n bytes. After Grow(n), at least n bytes can be written to b without another allocation. If n is negative, Grow panics. 

#### <a id="Builder.Write" href="#Builder.Write">func (b *Builder) Write(p []byte) (int, error)</a>

```
searchKey: strings.Builder.Write
```

```Go
func (b *Builder) Write(p []byte) (int, error)
```

Write appends the contents of p to b's buffer. Write always returns len(p), nil. 

#### <a id="Builder.WriteByte" href="#Builder.WriteByte">func (b *Builder) WriteByte(c byte) error</a>

```
searchKey: strings.Builder.WriteByte
```

```Go
func (b *Builder) WriteByte(c byte) error
```

WriteByte appends the byte c to b's buffer. The returned error is always nil. 

#### <a id="Builder.WriteRune" href="#Builder.WriteRune">func (b *Builder) WriteRune(r rune) (int, error)</a>

```
searchKey: strings.Builder.WriteRune
```

```Go
func (b *Builder) WriteRune(r rune) (int, error)
```

WriteRune appends the UTF-8 encoding of Unicode code point r to b's buffer. It returns the length of r and a nil error. 

#### <a id="Builder.WriteString" href="#Builder.WriteString">func (b *Builder) WriteString(s string) (int, error)</a>

```
searchKey: strings.Builder.WriteString
```

```Go
func (b *Builder) WriteString(s string) (int, error)
```

WriteString appends the contents of s to b's buffer. It returns the length of s and a nil error. 

### <a id="Reader" href="#Reader">type Reader struct</a>

```
searchKey: strings.Reader
```

```Go
type Reader struct {
	s        string
	i        int64 // current reading index
	prevRune int   // index of previous rune; or < 0
}
```

A Reader implements the io.Reader, io.ReaderAt, io.ByteReader, io.ByteScanner, io.RuneReader, io.RuneScanner, io.Seeker, and io.WriterTo interfaces by reading from a string. The zero value for Reader operates like a Reader of an empty string. 

#### <a id="NewReader" href="#NewReader">func NewReader(s string) *Reader</a>

```
searchKey: strings.NewReader
```

```Go
func NewReader(s string) *Reader
```

NewReader returns a new Reader reading from s. It is similar to bytes.NewBufferString but more efficient and read-only. 

#### <a id="Reader.Len" href="#Reader.Len">func (r *Reader) Len() int</a>

```
searchKey: strings.Reader.Len
```

```Go
func (r *Reader) Len() int
```

Len returns the number of bytes of the unread portion of the string. 

#### <a id="Reader.Size" href="#Reader.Size">func (r *Reader) Size() int64</a>

```
searchKey: strings.Reader.Size
```

```Go
func (r *Reader) Size() int64
```

Size returns the original length of the underlying string. Size is the number of bytes available for reading via ReadAt. The returned value is always the same and is not affected by calls to any other method. 

#### <a id="Reader.Read" href="#Reader.Read">func (r *Reader) Read(b []byte) (n int, err error)</a>

```
searchKey: strings.Reader.Read
```

```Go
func (r *Reader) Read(b []byte) (n int, err error)
```

Read implements the io.Reader interface. 

#### <a id="Reader.ReadAt" href="#Reader.ReadAt">func (r *Reader) ReadAt(b []byte, off int64) (n int, err error)</a>

```
searchKey: strings.Reader.ReadAt
```

```Go
func (r *Reader) ReadAt(b []byte, off int64) (n int, err error)
```

ReadAt implements the io.ReaderAt interface. 

#### <a id="Reader.ReadByte" href="#Reader.ReadByte">func (r *Reader) ReadByte() (byte, error)</a>

```
searchKey: strings.Reader.ReadByte
```

```Go
func (r *Reader) ReadByte() (byte, error)
```

ReadByte implements the io.ByteReader interface. 

#### <a id="Reader.UnreadByte" href="#Reader.UnreadByte">func (r *Reader) UnreadByte() error</a>

```
searchKey: strings.Reader.UnreadByte
```

```Go
func (r *Reader) UnreadByte() error
```

UnreadByte implements the io.ByteScanner interface. 

#### <a id="Reader.ReadRune" href="#Reader.ReadRune">func (r *Reader) ReadRune() (ch rune, size int, err error)</a>

```
searchKey: strings.Reader.ReadRune
```

```Go
func (r *Reader) ReadRune() (ch rune, size int, err error)
```

ReadRune implements the io.RuneReader interface. 

#### <a id="Reader.UnreadRune" href="#Reader.UnreadRune">func (r *Reader) UnreadRune() error</a>

```
searchKey: strings.Reader.UnreadRune
```

```Go
func (r *Reader) UnreadRune() error
```

UnreadRune implements the io.RuneScanner interface. 

#### <a id="Reader.Seek" href="#Reader.Seek">func (r *Reader) Seek(offset int64, whence int) (int64, error)</a>

```
searchKey: strings.Reader.Seek
```

```Go
func (r *Reader) Seek(offset int64, whence int) (int64, error)
```

Seek implements the io.Seeker interface. 

#### <a id="Reader.WriteTo" href="#Reader.WriteTo">func (r *Reader) WriteTo(w io.Writer) (n int64, err error)</a>

```
searchKey: strings.Reader.WriteTo
```

```Go
func (r *Reader) WriteTo(w io.Writer) (n int64, err error)
```

WriteTo implements the io.WriterTo interface. 

#### <a id="Reader.Reset" href="#Reader.Reset">func (r *Reader) Reset(s string)</a>

```
searchKey: strings.Reader.Reset
```

```Go
func (r *Reader) Reset(s string)
```

Reset resets the Reader to be reading from s. 

### <a id="Replacer" href="#Replacer">type Replacer struct</a>

```
searchKey: strings.Replacer
```

```Go
type Replacer struct {
	once   sync.Once // guards buildOnce method
	r      replacer
	oldnew []string
}
```

Replacer replaces a list of strings with replacements. It is safe for concurrent use by multiple goroutines. 

#### <a id="NewReplacer" href="#NewReplacer">func NewReplacer(oldnew ...string) *Replacer</a>

```
searchKey: strings.NewReplacer
```

```Go
func NewReplacer(oldnew ...string) *Replacer
```

NewReplacer returns a new Replacer from a list of old, new string pairs. Replacements are performed in the order they appear in the target string, without overlapping matches. The old string comparisons are done in argument order. 

NewReplacer panics if given an odd number of arguments. 

#### <a id="Replacer.buildOnce" href="#Replacer.buildOnce">func (r *Replacer) buildOnce()</a>

```
searchKey: strings.Replacer.buildOnce
tags: [private]
```

```Go
func (r *Replacer) buildOnce()
```

#### <a id="Replacer.build" href="#Replacer.build">func (b *Replacer) build() replacer</a>

```
searchKey: strings.Replacer.build
tags: [private]
```

```Go
func (b *Replacer) build() replacer
```

#### <a id="Replacer.Replace" href="#Replacer.Replace">func (r *Replacer) Replace(s string) string</a>

```
searchKey: strings.Replacer.Replace
```

```Go
func (r *Replacer) Replace(s string) string
```

Replace returns a copy of s with all replacements performed. 

#### <a id="Replacer.WriteString" href="#Replacer.WriteString">func (r *Replacer) WriteString(w io.Writer, s string) (n int, err error)</a>

```
searchKey: strings.Replacer.WriteString
```

```Go
func (r *Replacer) WriteString(w io.Writer, s string) (n int, err error)
```

WriteString writes s to w with all replacements performed. 

#### <a id="Replacer.Replacer" href="#Replacer.Replacer">func (r *Replacer) Replacer() interface{}</a>

```
searchKey: strings.Replacer.Replacer
tags: [private]
```

```Go
func (r *Replacer) Replacer() interface{}
```

#### <a id="Replacer.PrintTrie" href="#Replacer.PrintTrie">func (r *Replacer) PrintTrie() string</a>

```
searchKey: strings.Replacer.PrintTrie
tags: [private]
```

```Go
func (r *Replacer) PrintTrie() string
```

### <a id="replacer" href="#replacer">type replacer interface</a>

```
searchKey: strings.replacer
tags: [private]
```

```Go
type replacer interface {
	Replace(s string) string
	WriteString(w io.Writer, s string) (n int, err error)
}
```

replacer is the interface that a replacement algorithm needs to implement. 

### <a id="trieNode" href="#trieNode">type trieNode struct</a>

```
searchKey: strings.trieNode
tags: [private]
```

```Go
type trieNode struct {
	// value is the value of the trie node's key/value pair. It is empty if
	// this node is not a complete key.
	value string
	// priority is the priority (higher is more important) of the trie node's
	// key/value pair; keys are not necessarily matched shortest- or longest-
	// first. Priority is positive if this node is a complete key, and zero
	// otherwise. In the example above, positive/zero priorities are marked
	// with a trailing "+" or "-".
	priority int

	// prefix is the difference in keys between this trie node and the next.
	// In the example above, node n4 has prefix "cbc" and n4's next node is n5.
	// Node n5 has no children and so has zero prefix, next and table fields.
	prefix string
	next   *trieNode

	// table is a lookup table indexed by the next byte in the key, after
	// remapping that byte through genericReplacer.mapping to create a dense
	// index. In the example above, the keys only use 'a', 'b', 'c', 'x' and
	// 'y', which remap to 0, 1, 2, 3 and 4. All other bytes remap to 5, and
	// genericReplacer.tableSize will be 5. Node n0's table will be
	// []*trieNode{ 0:n1, 1:n4, 3:n6 }, where the 0, 1 and 3 are the remapped
	// 'a', 'b' and 'x'.
	table []*trieNode
}
```

trieNode is a node in a lookup trie for prioritized key/value pairs. Keys and values may be empty. For example, the trie containing keys "ax", "ay", "bcbc", "x" and "xy" could have eight nodes: 

```
n0  -
n1  a-
n2  .x+
n3  .y+
n4  b-
n5  .cbc+
n6  x+
n7  .y+

```
n0 is the root node, and its children are n1, n4 and n6; n1's children are n2 and n3; n4's child is n5; n6's child is n7. Nodes n0, n1 and n4 (marked with a trailing "-") are partial keys, and nodes n2, n3, n5, n6 and n7 (marked with a trailing "+") are complete keys. 

#### <a id="trieNode.add" href="#trieNode.add">func (t *trieNode) add(key, val string, priority int, r *genericReplacer)</a>

```
searchKey: strings.trieNode.add
tags: [private]
```

```Go
func (t *trieNode) add(key, val string, priority int, r *genericReplacer)
```

### <a id="genericReplacer" href="#genericReplacer">type genericReplacer struct</a>

```
searchKey: strings.genericReplacer
tags: [private]
```

```Go
type genericReplacer struct {
	root trieNode
	// tableSize is the size of a trie node's lookup table. It is the number
	// of unique key bytes.
	tableSize int
	// mapping maps from key bytes to a dense index for trieNode.table.
	mapping [256]byte
}
```

genericReplacer is the fully generic algorithm. It's used as a fallback when nothing faster can be used. 

#### <a id="makeGenericReplacer" href="#makeGenericReplacer">func makeGenericReplacer(oldnew []string) *genericReplacer</a>

```
searchKey: strings.makeGenericReplacer
tags: [private]
```

```Go
func makeGenericReplacer(oldnew []string) *genericReplacer
```

#### <a id="genericReplacer.lookup" href="#genericReplacer.lookup">func (r *genericReplacer) lookup(s string, ignoreRoot bool) (val string, keylen int, found bool)</a>

```
searchKey: strings.genericReplacer.lookup
tags: [private]
```

```Go
func (r *genericReplacer) lookup(s string, ignoreRoot bool) (val string, keylen int, found bool)
```

#### <a id="genericReplacer.Replace" href="#genericReplacer.Replace">func (r *genericReplacer) Replace(s string) string</a>

```
searchKey: strings.genericReplacer.Replace
tags: [private]
```

```Go
func (r *genericReplacer) Replace(s string) string
```

#### <a id="genericReplacer.WriteString" href="#genericReplacer.WriteString">func (r *genericReplacer) WriteString(w io.Writer, s string) (n int, err error)</a>

```
searchKey: strings.genericReplacer.WriteString
tags: [private]
```

```Go
func (r *genericReplacer) WriteString(w io.Writer, s string) (n int, err error)
```

#### <a id="genericReplacer.printNode" href="#genericReplacer.printNode">func (r *genericReplacer) printNode(t *trieNode, depth int) (s string)</a>

```
searchKey: strings.genericReplacer.printNode
tags: [private]
```

```Go
func (r *genericReplacer) printNode(t *trieNode, depth int) (s string)
```

### <a id="appendSliceWriter" href="#appendSliceWriter">type appendSliceWriter []byte</a>

```
searchKey: strings.appendSliceWriter
tags: [private]
```

```Go
type appendSliceWriter []byte
```

#### <a id="appendSliceWriter.Write" href="#appendSliceWriter.Write">func (w *appendSliceWriter) Write(p []byte) (int, error)</a>

```
searchKey: strings.appendSliceWriter.Write
tags: [private]
```

```Go
func (w *appendSliceWriter) Write(p []byte) (int, error)
```

Write writes to the buffer to satisfy io.Writer. 

#### <a id="appendSliceWriter.WriteString" href="#appendSliceWriter.WriteString">func (w *appendSliceWriter) WriteString(s string) (int, error)</a>

```
searchKey: strings.appendSliceWriter.WriteString
tags: [private]
```

```Go
func (w *appendSliceWriter) WriteString(s string) (int, error)
```

WriteString writes to the buffer without string->[]byte->string allocations. 

### <a id="stringWriter" href="#stringWriter">type stringWriter struct</a>

```
searchKey: strings.stringWriter
tags: [private]
```

```Go
type stringWriter struct {
	w io.Writer
}
```

#### <a id="stringWriter.WriteString" href="#stringWriter.WriteString">func (w stringWriter) WriteString(s string) (int, error)</a>

```
searchKey: strings.stringWriter.WriteString
tags: [private]
```

```Go
func (w stringWriter) WriteString(s string) (int, error)
```

### <a id="singleStringReplacer" href="#singleStringReplacer">type singleStringReplacer struct</a>

```
searchKey: strings.singleStringReplacer
tags: [private]
```

```Go
type singleStringReplacer struct {
	finder *stringFinder
	// value is the new string that replaces that pattern when it's found.
	value string
}
```

singleStringReplacer is the implementation that's used when there is only one string to replace (and that string has more than one byte). 

#### <a id="makeSingleStringReplacer" href="#makeSingleStringReplacer">func makeSingleStringReplacer(pattern string, value string) *singleStringReplacer</a>

```
searchKey: strings.makeSingleStringReplacer
tags: [private]
```

```Go
func makeSingleStringReplacer(pattern string, value string) *singleStringReplacer
```

#### <a id="singleStringReplacer.Replace" href="#singleStringReplacer.Replace">func (r *singleStringReplacer) Replace(s string) string</a>

```
searchKey: strings.singleStringReplacer.Replace
tags: [private]
```

```Go
func (r *singleStringReplacer) Replace(s string) string
```

#### <a id="singleStringReplacer.WriteString" href="#singleStringReplacer.WriteString">func (r *singleStringReplacer) WriteString(w io.Writer, s string) (n int, err error)</a>

```
searchKey: strings.singleStringReplacer.WriteString
tags: [private]
```

```Go
func (r *singleStringReplacer) WriteString(w io.Writer, s string) (n int, err error)
```

### <a id="byteReplacer" href="#byteReplacer">type byteReplacer [256]byte</a>

```
searchKey: strings.byteReplacer
tags: [private]
```

```Go
type byteReplacer [256]byte
```

byteReplacer is the implementation that's used when all the "old" and "new" values are single ASCII bytes. The array contains replacement bytes indexed by old byte. 

#### <a id="byteReplacer.Replace" href="#byteReplacer.Replace">func (r *byteReplacer) Replace(s string) string</a>

```
searchKey: strings.byteReplacer.Replace
tags: [private]
```

```Go
func (r *byteReplacer) Replace(s string) string
```

#### <a id="byteReplacer.WriteString" href="#byteReplacer.WriteString">func (r *byteReplacer) WriteString(w io.Writer, s string) (n int, err error)</a>

```
searchKey: strings.byteReplacer.WriteString
tags: [private]
```

```Go
func (r *byteReplacer) WriteString(w io.Writer, s string) (n int, err error)
```

### <a id="byteStringReplacer" href="#byteStringReplacer">type byteStringReplacer struct</a>

```
searchKey: strings.byteStringReplacer
tags: [private]
```

```Go
type byteStringReplacer struct {
	// replacements contains replacement byte slices indexed by old byte.
	// A nil []byte means that the old byte should not be replaced.
	replacements [256][]byte
	// toReplace keeps a list of bytes to replace. Depending on length of toReplace
	// and length of target string it may be faster to use Count, or a plain loop.
	// We store single byte as a string, because Count takes a string.
	toReplace []string
}
```

byteStringReplacer is the implementation that's used when all the "old" values are single ASCII bytes but the "new" values vary in size. 

#### <a id="byteStringReplacer.Replace" href="#byteStringReplacer.Replace">func (r *byteStringReplacer) Replace(s string) string</a>

```
searchKey: strings.byteStringReplacer.Replace
tags: [private]
```

```Go
func (r *byteStringReplacer) Replace(s string) string
```

#### <a id="byteStringReplacer.WriteString" href="#byteStringReplacer.WriteString">func (r *byteStringReplacer) WriteString(w io.Writer, s string) (n int, err error)</a>

```
searchKey: strings.byteStringReplacer.WriteString
tags: [private]
```

```Go
func (r *byteStringReplacer) WriteString(w io.Writer, s string) (n int, err error)
```

### <a id="stringFinder" href="#stringFinder">type stringFinder struct</a>

```
searchKey: strings.stringFinder
tags: [private]
```

```Go
type stringFinder struct {
	// pattern is the string that we are searching for in the text.
	pattern string

	// badCharSkip[b] contains the distance between the last byte of pattern
	// and the rightmost occurrence of b in pattern. If b is not in pattern,
	// badCharSkip[b] is len(pattern).
	//
	// Whenever a mismatch is found with byte b in the text, we can safely
	// shift the matching frame at least badCharSkip[b] until the next time
	// the matching char could be in alignment.
	badCharSkip [256]int

	// goodSuffixSkip[i] defines how far we can shift the matching frame given
	// that the suffix pattern[i+1:] matches, but the byte pattern[i] does
	// not. There are two cases to consider:
	//
	// 1. The matched suffix occurs elsewhere in pattern (with a different
	// byte preceding it that we might possibly match). In this case, we can
	// shift the matching frame to align with the next suffix chunk. For
	// example, the pattern "mississi" has the suffix "issi" next occurring
	// (in right-to-left order) at index 1, so goodSuffixSkip[3] ==
	// shift+len(suffix) == 3+4 == 7.
	//
	// 2. If the matched suffix does not occur elsewhere in pattern, then the
	// matching frame may share part of its prefix with the end of the
	// matching suffix. In this case, goodSuffixSkip[i] will contain how far
	// to shift the frame to align this portion of the prefix to the
	// suffix. For example, in the pattern "abcxxxabc", when the first
	// mismatch from the back is found to be in position 3, the matching
	// suffix "xxabc" is not found elsewhere in the pattern. However, its
	// rightmost "abc" (at position 6) is a prefix of the whole pattern, so
	// goodSuffixSkip[3] == shift+len(suffix) == 6+5 == 11.
	goodSuffixSkip []int
}
```

stringFinder efficiently finds strings in a source text. It's implemented using the Boyer-Moore string search algorithm: [https://en.wikipedia.org/wiki/Boyer-Moore_string_search_algorithm](https://en.wikipedia.org/wiki/Boyer-Moore_string_search_algorithm) [https://www.cs.utexas.edu/~moore/publications/fstrpos.pdf](https://www.cs.utexas.edu/~moore/publications/fstrpos.pdf) (note: this aged document uses 1-based indexing) 

#### <a id="makeStringFinder" href="#makeStringFinder">func makeStringFinder(pattern string) *stringFinder</a>

```
searchKey: strings.makeStringFinder
tags: [private]
```

```Go
func makeStringFinder(pattern string) *stringFinder
```

#### <a id="stringFinder.next" href="#stringFinder.next">func (f *stringFinder) next(text string) int</a>

```
searchKey: strings.stringFinder.next
tags: [private]
```

```Go
func (f *stringFinder) next(text string) int
```

next returns the index in text of the first occurrence of the pattern. If the pattern is not found, it returns -1. 

### <a id="asciiSet" href="#asciiSet">type asciiSet [8]uint32</a>

```
searchKey: strings.asciiSet
tags: [private]
```

```Go
type asciiSet [8]uint32
```

asciiSet is a 32-byte value, where each bit represents the presence of a given ASCII character in the set. The 128-bits of the lower 16 bytes, starting with the least-significant bit of the lowest word to the most-significant bit of the highest word, map to the full range of all 128 ASCII characters. The 128-bits of the upper 16 bytes will be zeroed, ensuring that any non-ASCII character will be reported as not in the set. 

#### <a id="makeASCIISet" href="#makeASCIISet">func makeASCIISet(chars string) (as asciiSet, ok bool)</a>

```
searchKey: strings.makeASCIISet
tags: [private]
```

```Go
func makeASCIISet(chars string) (as asciiSet, ok bool)
```

makeASCIISet creates a set of ASCII characters and reports whether all characters in chars are ASCII. 

#### <a id="asciiSet.contains" href="#asciiSet.contains">func (as *asciiSet) contains(c byte) bool</a>

```
searchKey: strings.asciiSet.contains
tags: [private]
```

```Go
func (as *asciiSet) contains(c byte) bool
```

contains reports whether c is inside the set. 

## <a id="func" href="#func">Functions</a>

### <a id="noescape" href="#noescape">func noescape(p unsafe.Pointer) unsafe.Pointer</a>

```
searchKey: strings.noescape
tags: [private]
```

```Go
func noescape(p unsafe.Pointer) unsafe.Pointer
```

noescape hides a pointer from escape analysis.  noescape is the identity function but escape analysis doesn't think the output depends on the input. noescape is inlined and currently compiles down to zero instructions. USE CAREFULLY! This was copied from the runtime; see issues 23382 and 7921. 

### <a id="Compare" href="#Compare">func Compare(a, b string) int</a>

```
searchKey: strings.Compare
```

```Go
func Compare(a, b string) int
```

Compare returns an integer comparing two strings lexicographically. The result will be 0 if a==b, -1 if a < b, and +1 if a > b. 

Compare is included only for symmetry with package bytes. It is usually clearer and always faster to use the built-in string comparison operators ==, <, >, and so on. 

### <a id="getStringWriter" href="#getStringWriter">func getStringWriter(w io.Writer) io.StringWriter</a>

```
searchKey: strings.getStringWriter
tags: [private]
```

```Go
func getStringWriter(w io.Writer) io.StringWriter
```

### <a id="longestCommonSuffix" href="#longestCommonSuffix">func longestCommonSuffix(a, b string) (i int)</a>

```
searchKey: strings.longestCommonSuffix
tags: [private]
```

```Go
func longestCommonSuffix(a, b string) (i int)
```

### <a id="max" href="#max">func max(a, b int) int</a>

```
searchKey: strings.max
tags: [private]
```

```Go
func max(a, b int) int
```

### <a id="explode" href="#explode">func explode(s string, n int) []string</a>

```
searchKey: strings.explode
tags: [private]
```

```Go
func explode(s string, n int) []string
```

explode splits s into a slice of UTF-8 strings, one string per Unicode character up to a maximum of n (n < 0 means no limit). Invalid UTF-8 sequences become correct encodings of U+FFFD. 

### <a id="Count" href="#Count">func Count(s, substr string) int</a>

```
searchKey: strings.Count
```

```Go
func Count(s, substr string) int
```

Count counts the number of non-overlapping instances of substr in s. If substr is an empty string, Count returns 1 + the number of Unicode code points in s. 

### <a id="Contains" href="#Contains">func Contains(s, substr string) bool</a>

```
searchKey: strings.Contains
```

```Go
func Contains(s, substr string) bool
```

Contains reports whether substr is within s. 

### <a id="ContainsAny" href="#ContainsAny">func ContainsAny(s, chars string) bool</a>

```
searchKey: strings.ContainsAny
```

```Go
func ContainsAny(s, chars string) bool
```

ContainsAny reports whether any Unicode code points in chars are within s. 

### <a id="ContainsRune" href="#ContainsRune">func ContainsRune(s string, r rune) bool</a>

```
searchKey: strings.ContainsRune
```

```Go
func ContainsRune(s string, r rune) bool
```

ContainsRune reports whether the Unicode code point r is within s. 

### <a id="LastIndex" href="#LastIndex">func LastIndex(s, substr string) int</a>

```
searchKey: strings.LastIndex
```

```Go
func LastIndex(s, substr string) int
```

LastIndex returns the index of the last instance of substr in s, or -1 if substr is not present in s. 

### <a id="IndexByte" href="#IndexByte">func IndexByte(s string, c byte) int</a>

```
searchKey: strings.IndexByte
```

```Go
func IndexByte(s string, c byte) int
```

IndexByte returns the index of the first instance of c in s, or -1 if c is not present in s. 

### <a id="IndexRune" href="#IndexRune">func IndexRune(s string, r rune) int</a>

```
searchKey: strings.IndexRune
```

```Go
func IndexRune(s string, r rune) int
```

IndexRune returns the index of the first instance of the Unicode code point r, or -1 if rune is not present in s. If r is utf8.RuneError, it returns the first instance of any invalid UTF-8 byte sequence. 

### <a id="IndexAny" href="#IndexAny">func IndexAny(s, chars string) int</a>

```
searchKey: strings.IndexAny
```

```Go
func IndexAny(s, chars string) int
```

IndexAny returns the index of the first instance of any Unicode code point from chars in s, or -1 if no Unicode code point from chars is present in s. 

### <a id="LastIndexAny" href="#LastIndexAny">func LastIndexAny(s, chars string) int</a>

```
searchKey: strings.LastIndexAny
```

```Go
func LastIndexAny(s, chars string) int
```

LastIndexAny returns the index of the last instance of any Unicode code point from chars in s, or -1 if no Unicode code point from chars is present in s. 

### <a id="LastIndexByte" href="#LastIndexByte">func LastIndexByte(s string, c byte) int</a>

```
searchKey: strings.LastIndexByte
```

```Go
func LastIndexByte(s string, c byte) int
```

LastIndexByte returns the index of the last instance of c in s, or -1 if c is not present in s. 

### <a id="genSplit" href="#genSplit">func genSplit(s, sep string, sepSave, n int) []string</a>

```
searchKey: strings.genSplit
tags: [private]
```

```Go
func genSplit(s, sep string, sepSave, n int) []string
```

Generic split: splits after each instance of sep, including sepSave bytes of sep in the subarrays. 

### <a id="SplitN" href="#SplitN">func SplitN(s, sep string, n int) []string</a>

```
searchKey: strings.SplitN
```

```Go
func SplitN(s, sep string, n int) []string
```

SplitN slices s into substrings separated by sep and returns a slice of the substrings between those separators. 

The count determines the number of substrings to return: 

```
n > 0: at most n substrings; the last substring will be the unsplit remainder.
n == 0: the result is nil (zero substrings)
n < 0: all substrings

```
Edge cases for s and sep (for example, empty strings) are handled as described in the documentation for Split. 

### <a id="SplitAfterN" href="#SplitAfterN">func SplitAfterN(s, sep string, n int) []string</a>

```
searchKey: strings.SplitAfterN
```

```Go
func SplitAfterN(s, sep string, n int) []string
```

SplitAfterN slices s into substrings after each instance of sep and returns a slice of those substrings. 

The count determines the number of substrings to return: 

```
n > 0: at most n substrings; the last substring will be the unsplit remainder.
n == 0: the result is nil (zero substrings)
n < 0: all substrings

```
Edge cases for s and sep (for example, empty strings) are handled as described in the documentation for SplitAfter. 

### <a id="Split" href="#Split">func Split(s, sep string) []string</a>

```
searchKey: strings.Split
```

```Go
func Split(s, sep string) []string
```

Split slices s into all substrings separated by sep and returns a slice of the substrings between those separators. 

If s does not contain sep and sep is not empty, Split returns a slice of length 1 whose only element is s. 

If sep is empty, Split splits after each UTF-8 sequence. If both s and sep are empty, Split returns an empty slice. 

It is equivalent to SplitN with a count of -1. 

### <a id="SplitAfter" href="#SplitAfter">func SplitAfter(s, sep string) []string</a>

```
searchKey: strings.SplitAfter
```

```Go
func SplitAfter(s, sep string) []string
```

SplitAfter slices s into all substrings after each instance of sep and returns a slice of those substrings. 

If s does not contain sep and sep is not empty, SplitAfter returns a slice of length 1 whose only element is s. 

If sep is empty, SplitAfter splits after each UTF-8 sequence. If both s and sep are empty, SplitAfter returns an empty slice. 

It is equivalent to SplitAfterN with a count of -1. 

### <a id="Fields" href="#Fields">func Fields(s string) []string</a>

```
searchKey: strings.Fields
```

```Go
func Fields(s string) []string
```

Fields splits the string s around each instance of one or more consecutive white space characters, as defined by unicode.IsSpace, returning a slice of substrings of s or an empty slice if s contains only white space. 

### <a id="FieldsFunc" href="#FieldsFunc">func FieldsFunc(s string, f func(rune) bool) []string</a>

```
searchKey: strings.FieldsFunc
```

```Go
func FieldsFunc(s string, f func(rune) bool) []string
```

FieldsFunc splits the string s at each run of Unicode code points c satisfying f(c) and returns an array of slices of s. If all code points in s satisfy f(c) or the string is empty, an empty slice is returned. 

FieldsFunc makes no guarantees about the order in which it calls f(c) and assumes that f always returns the same value for a given c. 

### <a id="Join" href="#Join">func Join(elems []string, sep string) string</a>

```
searchKey: strings.Join
```

```Go
func Join(elems []string, sep string) string
```

Join concatenates the elements of its first argument to create a single string. The separator string sep is placed between elements in the resulting string. 

### <a id="HasPrefix" href="#HasPrefix">func HasPrefix(s, prefix string) bool</a>

```
searchKey: strings.HasPrefix
```

```Go
func HasPrefix(s, prefix string) bool
```

HasPrefix tests whether the string s begins with prefix. 

### <a id="HasSuffix" href="#HasSuffix">func HasSuffix(s, suffix string) bool</a>

```
searchKey: strings.HasSuffix
```

```Go
func HasSuffix(s, suffix string) bool
```

HasSuffix tests whether the string s ends with suffix. 

### <a id="Map" href="#Map">func Map(mapping func(rune) rune, s string) string</a>

```
searchKey: strings.Map
```

```Go
func Map(mapping func(rune) rune, s string) string
```

Map returns a copy of the string s with all its characters modified according to the mapping function. If mapping returns a negative value, the character is dropped from the string with no replacement. 

### <a id="Repeat" href="#Repeat">func Repeat(s string, count int) string</a>

```
searchKey: strings.Repeat
```

```Go
func Repeat(s string, count int) string
```

Repeat returns a new string consisting of count copies of the string s. 

It panics if count is negative or if the result of (len(s) * count) overflows. 

### <a id="ToUpper" href="#ToUpper">func ToUpper(s string) string</a>

```
searchKey: strings.ToUpper
```

```Go
func ToUpper(s string) string
```

ToUpper returns s with all Unicode letters mapped to their upper case. 

### <a id="ToLower" href="#ToLower">func ToLower(s string) string</a>

```
searchKey: strings.ToLower
```

```Go
func ToLower(s string) string
```

ToLower returns s with all Unicode letters mapped to their lower case. 

### <a id="ToTitle" href="#ToTitle">func ToTitle(s string) string</a>

```
searchKey: strings.ToTitle
```

```Go
func ToTitle(s string) string
```

ToTitle returns a copy of the string s with all Unicode letters mapped to their Unicode title case. 

### <a id="ToUpperSpecial" href="#ToUpperSpecial">func ToUpperSpecial(c unicode.SpecialCase, s string) string</a>

```
searchKey: strings.ToUpperSpecial
```

```Go
func ToUpperSpecial(c unicode.SpecialCase, s string) string
```

ToUpperSpecial returns a copy of the string s with all Unicode letters mapped to their upper case using the case mapping specified by c. 

### <a id="ToLowerSpecial" href="#ToLowerSpecial">func ToLowerSpecial(c unicode.SpecialCase, s string) string</a>

```
searchKey: strings.ToLowerSpecial
```

```Go
func ToLowerSpecial(c unicode.SpecialCase, s string) string
```

ToLowerSpecial returns a copy of the string s with all Unicode letters mapped to their lower case using the case mapping specified by c. 

### <a id="ToTitleSpecial" href="#ToTitleSpecial">func ToTitleSpecial(c unicode.SpecialCase, s string) string</a>

```
searchKey: strings.ToTitleSpecial
```

```Go
func ToTitleSpecial(c unicode.SpecialCase, s string) string
```

ToTitleSpecial returns a copy of the string s with all Unicode letters mapped to their Unicode title case, giving priority to the special casing rules. 

### <a id="ToValidUTF8" href="#ToValidUTF8">func ToValidUTF8(s, replacement string) string</a>

```
searchKey: strings.ToValidUTF8
```

```Go
func ToValidUTF8(s, replacement string) string
```

ToValidUTF8 returns a copy of the string s with each run of invalid UTF-8 byte sequences replaced by the replacement string, which may be empty. 

### <a id="isSeparator" href="#isSeparator">func isSeparator(r rune) bool</a>

```
searchKey: strings.isSeparator
tags: [private]
```

```Go
func isSeparator(r rune) bool
```

isSeparator reports whether the rune could mark a word boundary. TODO: update when package unicode captures more of the properties. 

### <a id="Title" href="#Title">func Title(s string) string</a>

```
searchKey: strings.Title
```

```Go
func Title(s string) string
```

Title returns a copy of the string s with all Unicode letters that begin words mapped to their Unicode title case. 

BUG(rsc): The rule Title uses for word boundaries does not handle Unicode punctuation properly. 

### <a id="TrimLeftFunc" href="#TrimLeftFunc">func TrimLeftFunc(s string, f func(rune) bool) string</a>

```
searchKey: strings.TrimLeftFunc
```

```Go
func TrimLeftFunc(s string, f func(rune) bool) string
```

TrimLeftFunc returns a slice of the string s with all leading Unicode code points c satisfying f(c) removed. 

### <a id="TrimRightFunc" href="#TrimRightFunc">func TrimRightFunc(s string, f func(rune) bool) string</a>

```
searchKey: strings.TrimRightFunc
```

```Go
func TrimRightFunc(s string, f func(rune) bool) string
```

TrimRightFunc returns a slice of the string s with all trailing Unicode code points c satisfying f(c) removed. 

### <a id="TrimFunc" href="#TrimFunc">func TrimFunc(s string, f func(rune) bool) string</a>

```
searchKey: strings.TrimFunc
```

```Go
func TrimFunc(s string, f func(rune) bool) string
```

TrimFunc returns a slice of the string s with all leading and trailing Unicode code points c satisfying f(c) removed. 

### <a id="IndexFunc" href="#IndexFunc">func IndexFunc(s string, f func(rune) bool) int</a>

```
searchKey: strings.IndexFunc
```

```Go
func IndexFunc(s string, f func(rune) bool) int
```

IndexFunc returns the index into s of the first Unicode code point satisfying f(c), or -1 if none do. 

### <a id="LastIndexFunc" href="#LastIndexFunc">func LastIndexFunc(s string, f func(rune) bool) int</a>

```
searchKey: strings.LastIndexFunc
```

```Go
func LastIndexFunc(s string, f func(rune) bool) int
```

LastIndexFunc returns the index into s of the last Unicode code point satisfying f(c), or -1 if none do. 

### <a id="indexFunc" href="#indexFunc">func indexFunc(s string, f func(rune) bool, truth bool) int</a>

```
searchKey: strings.indexFunc
tags: [private]
```

```Go
func indexFunc(s string, f func(rune) bool, truth bool) int
```

indexFunc is the same as IndexFunc except that if truth==false, the sense of the predicate function is inverted. 

### <a id="lastIndexFunc" href="#lastIndexFunc">func lastIndexFunc(s string, f func(rune) bool, truth bool) int</a>

```
searchKey: strings.lastIndexFunc
tags: [private]
```

```Go
func lastIndexFunc(s string, f func(rune) bool, truth bool) int
```

lastIndexFunc is the same as LastIndexFunc except that if truth==false, the sense of the predicate function is inverted. 

### <a id="makeCutsetFunc" href="#makeCutsetFunc">func makeCutsetFunc(cutset string) func(rune) bool</a>

```
searchKey: strings.makeCutsetFunc
tags: [private]
```

```Go
func makeCutsetFunc(cutset string) func(rune) bool
```

### <a id="Trim" href="#Trim">func Trim(s, cutset string) string</a>

```
searchKey: strings.Trim
```

```Go
func Trim(s, cutset string) string
```

Trim returns a slice of the string s with all leading and trailing Unicode code points contained in cutset removed. 

### <a id="TrimLeft" href="#TrimLeft">func TrimLeft(s, cutset string) string</a>

```
searchKey: strings.TrimLeft
```

```Go
func TrimLeft(s, cutset string) string
```

TrimLeft returns a slice of the string s with all leading Unicode code points contained in cutset removed. 

To remove a prefix, use TrimPrefix instead. 

### <a id="TrimRight" href="#TrimRight">func TrimRight(s, cutset string) string</a>

```
searchKey: strings.TrimRight
```

```Go
func TrimRight(s, cutset string) string
```

TrimRight returns a slice of the string s, with all trailing Unicode code points contained in cutset removed. 

To remove a suffix, use TrimSuffix instead. 

### <a id="TrimSpace" href="#TrimSpace">func TrimSpace(s string) string</a>

```
searchKey: strings.TrimSpace
```

```Go
func TrimSpace(s string) string
```

TrimSpace returns a slice of the string s, with all leading and trailing white space removed, as defined by Unicode. 

### <a id="TrimPrefix" href="#TrimPrefix">func TrimPrefix(s, prefix string) string</a>

```
searchKey: strings.TrimPrefix
```

```Go
func TrimPrefix(s, prefix string) string
```

TrimPrefix returns s without the provided leading prefix string. If s doesn't start with prefix, s is returned unchanged. 

### <a id="TrimSuffix" href="#TrimSuffix">func TrimSuffix(s, suffix string) string</a>

```
searchKey: strings.TrimSuffix
```

```Go
func TrimSuffix(s, suffix string) string
```

TrimSuffix returns s without the provided trailing suffix string. If s doesn't end with suffix, s is returned unchanged. 

### <a id="Replace" href="#Replace">func Replace(s, old, new string, n int) string</a>

```
searchKey: strings.Replace
```

```Go
func Replace(s, old, new string, n int) string
```

Replace returns a copy of the string s with the first n non-overlapping instances of old replaced by new. If old is empty, it matches at the beginning of the string and after each UTF-8 sequence, yielding up to k+1 replacements for a k-rune string. If n < 0, there is no limit on the number of replacements. 

### <a id="ReplaceAll" href="#ReplaceAll">func ReplaceAll(s, old, new string) string</a>

```
searchKey: strings.ReplaceAll
```

```Go
func ReplaceAll(s, old, new string) string
```

ReplaceAll returns a copy of the string s with all non-overlapping instances of old replaced by new. If old is empty, it matches at the beginning of the string and after each UTF-8 sequence, yielding up to k+1 replacements for a k-rune string. 

### <a id="EqualFold" href="#EqualFold">func EqualFold(s, t string) bool</a>

```
searchKey: strings.EqualFold
```

```Go
func EqualFold(s, t string) bool
```

EqualFold reports whether s and t, interpreted as UTF-8 strings, are equal under Unicode case-folding, which is a more general form of case-insensitivity. 

### <a id="Index" href="#Index">func Index(s, substr string) int</a>

```
searchKey: strings.Index
```

```Go
func Index(s, substr string) int
```

Index returns the index of the first instance of substr in s, or -1 if substr is not present in s. 

### <a id="StringFind" href="#StringFind">func StringFind(pattern, text string) int</a>

```
searchKey: strings.StringFind
tags: [private]
```

```Go
func StringFind(pattern, text string) int
```

### <a id="DumpTables" href="#DumpTables">func DumpTables(pattern string) ([]int, []int)</a>

```
searchKey: strings.DumpTables
tags: [private]
```

```Go
func DumpTables(pattern string) ([]int, []int)
```

